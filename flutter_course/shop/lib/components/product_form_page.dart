import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/product.dart';
import 'package:shop/models/product_list.dart';

class ProductFormPage extends StatefulWidget {
  const ProductFormPage({Key? key}) : super(key: key);

  @override
  State<ProductFormPage> createState() => _ProductFormPageState();
}

class _ProductFormPageState extends State<ProductFormPage> {
  final _priceFocus = FocusNode();
  final _descriptionFocus = FocusNode();
  final _urlImageFocus = FocusNode();
  final _urlImageController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _formData = <String, Object>{};

  bool _isLoding = false;

  @override
  void initState() {
    super.initState();
    _urlImageFocus.addListener(_updateImage);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_formData.isEmpty) {
      final arg = ModalRoute.of(context)?.settings.arguments;
      if (arg != null) {
        final product = arg as Product;
        _formData['id'] = product.id;
        _formData['name'] = product.name;
        _formData['price'] = product.price;
        _formData['description'] = product.description;
        _formData['imageUrl'] = product.imageUrl;

        _urlImageController.text = product.imageUrl;
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    _priceFocus.dispose();
    _descriptionFocus.dispose();
    _urlImageFocus.dispose();
    _urlImageController.removeListener(_updateImage);
  }

  void _updateImage() {
    setState(() {});
  }

  bool _isValidImageUrl(String url) {
    bool isValidUrl = Uri.tryParse(url)?.hasAbsolutePath ?? false;
    bool endWithFile = url.toLowerCase().endsWith('.png') ||
        url.toLowerCase().endsWith('.jpg') ||
        url.toLowerCase().endsWith('.jpeg');
    return isValidUrl && endWithFile;
  }

  void _submit() async {
    var isValid = _formKey.currentState?.validate() ?? false;
    if (!isValid) {
      return;
    }
    _formKey.currentState?.save();
    setState(() {
      _isLoding = true;
    });
    try {
      await context.read<ProductList>().save(_formData);
    } catch (err) {
      await showDialog<void>(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Ocorreu um erro !"),
          content: const Text('Merda sempre acontece !!! '),
          actions: [
            TextButton(
              child: const Text("OK"),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      );
    } finally {
      setState(() {
        _isLoding = false;
      });
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        actions: [
          IconButton(
              onPressed: _submit,
              icon: const Icon(
                Icons.save,
              ))
        ],
      ),
      body: _isLoding
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(15),
              child: Form(
                key: _formKey,
                child: ListView(
                  children: [
                    TextFormField(
                      initialValue: _formData['name']?.toString(),
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        labelText: 'name',
                      ),
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(_priceFocus);
                      },
                      onSaved: (value) {
                        _formData['name'] = value ?? '';
                      },
                      validator: (value) {
                        value = value ?? '';
                        if (value.trim().isEmpty) {
                          return 'Name is required';
                        }
                        if (value.trim().length < 3) {
                          return 'Name must be three or more characters';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      initialValue: _formData['price']?.toString(),
                      textInputAction: TextInputAction.next,
                      focusNode: _priceFocus,
                      decoration: const InputDecoration(
                        labelText: 'price',
                      ),
                      keyboardType: const TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(_descriptionFocus);
                      },
                      onSaved: (value) {
                        _formData['price'] = double.parse(value ?? '0');
                      },
                      validator: (value) {
                        value = value ?? '';
                        final price = double.tryParse(value) ?? -1;
                        if (price <= 0) {
                          return 'This price is not valid';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      initialValue: _formData['description']?.toString(),
                      focusNode: _descriptionFocus,
                      keyboardType: TextInputType.multiline,
                      maxLines: 3,
                      decoration: const InputDecoration(
                        labelText: 'description',
                      ),
                      onSaved: (value) {
                        _formData['description'] = value ?? '';
                      },
                      validator: (value) {
                        value = value ?? '';
                        if (value.trim().isEmpty) {
                          return 'Description is required';
                        }
                        if (value.trim().length < 10) {
                          return 'Description must be ten or more characters';
                        }
                        return null;
                      },
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: TextFormField(
                            focusNode: _urlImageFocus,
                            controller: _urlImageController,
                            keyboardType: TextInputType.url,
                            textInputAction: TextInputAction.done,
                            decoration: const InputDecoration(
                              labelText: 'url of image',
                            ),
                            onFieldSubmitted: (_) => _submit(),
                            onSaved: (value) {
                              _formData['imageUrl'] = value ?? '';
                            },
                            validator: (value) {
                              value = value ?? '';
                              if (!_isValidImageUrl(value)) {
                                return "Give the a valid URL";
                              }
                              return null;
                            },
                          ),
                        ),
                        Container(
                          height: 100,
                          width: 100,
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(
                            top: 10,
                            left: 10,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                              width: 1,
                            ),
                          ),
                          child: _urlImageController.text.isEmpty
                              ? const Text('get the url')
                              : FittedBox(
                                  fit: BoxFit.cover,
                                  child:
                                      Image.network(_urlImageController.text),
                                ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
