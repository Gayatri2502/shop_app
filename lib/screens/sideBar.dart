import 'package:flutter/material.dart';
import 'package:shop_app/screens/Profile_Page.dart';
import 'package:shop_app/screens/manage_products.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text('Gayatri Samal'),
            accountEmail: const Text('8956784586'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTTOkHm3_mPQ5PPRvGtU6Si7FJg8DVDtZ47rw&usqp=CAU',
                  fit: BoxFit.cover,
                  width: 90,
                  height: 90,
                ),
              ),
            ),
            decoration: const BoxDecoration(
              color: Colors.black,
              image: DecorationImage(fit: BoxFit.fill, image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS0_2v3E3wLjjfGbJ0U7DtBU9OSHE9Hr0NBaQ&usqp=CAU')),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.favorite),
            title: const Text('Favorites'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('My Account'),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const ProfileScreen()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.share),
            title: const Text('Share'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text('Notifications'),
            onTap: (){},
            trailing: ClipOval(
              child: Container(
                color: Colors.red,
                width: 20,
                height: 20,
                child: const Center(
                  child: Text(
                    '8',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () => (){},
          ),
          ListTile(
            leading: const Icon(Icons.description),
            title: const Text('Manage Products'),
            onTap: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) {
              return   ManageProducts();
            })),
          ),
          const Divider(),
          ListTile(
            title: const Text('LogOut'),
            leading: const Icon(Icons.exit_to_app),
            onTap: (){},
          ),
        ],
      ),
    );
  }
}
