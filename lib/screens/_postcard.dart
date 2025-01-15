// import 'package:flutter/material.dart';
// import 'package:shahayak/models/post.dart';

// class _PostCard extends StatefulWidget {
//   final Post post;
//   const _PostCard({Key? key, required this.post}) : super(key: key);

//   @override
//   State<_PostCard> createState() => _PostCardState();
// }

// class _PostCardState extends State<_PostCard> {
//   TextEditingController commentController = TextEditingController();

//   void _likePost() {
//     setState(() {
//       widget.post.likePost();
//     });
//   }

//   void _addComment() {
//     if (commentController.text.isNotEmpty) {
//       setState(() {
//         widget.post.addComment(commentController.text);
//         commentController.clear();
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: const EdgeInsets.all(10),
//       elevation: 5,
//       child: Padding(
//         padding: const EdgeInsets.all(10),
//         child: Row(
//           children: [
//             CircleAvatar(
//               backgroundImage: NetworkImage(widget.post.userProfilePic),
//               radius: 30,
//             ),
//             const SizedBox(width: 10),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(widget.post.username,
//                       style: const TextStyle(fontWeight: FontWeight.bold)),
//                   Text(widget.post.productName),
//                   Image.network(widget.post.imageUrl),
//                   Text(widget.post.caption),
//                   Row(
//                     children: [
//                       IconButton(
//                         icon: const Icon(Icons.thumb_up),
//                         onPressed: _likePost,
//                       ),
//                       Text(widget.post.likes.toString()),
//                       IconButton(
//                         icon: const Icon(Icons.comment),
//                         onPressed: () {
//                           showDialog(
//                             context: context,
//                             builder: (BuildContext context) {
//                               return AlertDialog(
//                                 title: const Text('Add Comment'),
//                                 content: TextField(
//                                   controller: commentController,
//                                   decoration: const InputDecoration(
//                                     hintText: 'Enter your comment',
//                                   ),
//                                 ),
//                                 actions: <Widget>[
//                                   TextButton(
//                                     onPressed: () {
//                                       Navigator.pop(context);
//                                     },
//                                     child: const Text('Cancel'),
//                                   ),
//                                   TextButton(
//                                     onPressed: () {
//                                       _addComment();
//                                       Navigator.pop(context);
//                                     },
//                                     child: const Text('Add'),
//                                   ),
//                                 ],
//                               );
//                             },
//                           );
//                         },
//                       ),
//                       Text(widget.post.comments.length.toString()),
//                     ],
//                   ),
//                   if (widget.post.comments.isNotEmpty) ...[
//                     const SizedBox(height: 10),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: widget.post.comments.map((comment) {
//                         return Text('• $comment');
//                       }).toList(),
//                     ),
//                   ],
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
