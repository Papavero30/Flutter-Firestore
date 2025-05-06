import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final CollectionReference notesCollection = 
      FirebaseFirestore.instance.collection('notes');

  Future<String> addNote({required String title, required String content}) async {
    try {
      debugPrint('Adding note: Title: $title, Content: $content');
      
      final data = {
        'title': title,
        'content': content,
        'timestamp': FieldValue.serverTimestamp(), 
      };
      
      DocumentReference docRef = await notesCollection.add(data);
      
      debugPrint('Note added with ID: ${docRef.id}');
      return docRef.id;
    } catch (e) {
      debugPrint('Error adding note: $e');
      throw Exception('Failed to add note: $e');
    }
  }

  Stream<QuerySnapshot> getNotes() {
    try {
      debugPrint('Getting notes stream from Firestore');
      return notesCollection
          .orderBy('timestamp', descending: true)
          .snapshots();
    } catch (e) {
      debugPrint('Error getting notes: $e');
      rethrow;
    }
  }

  Future<void> updateNote({
    required String docId, 
    required String title, 
    required String content
  }) async {
    try {
      debugPrint('Updating note with ID: $docId');
      
      await notesCollection.doc(docId).update({
        'title': title,
        'content': content,
        'timestamp': FieldValue.serverTimestamp(),
      });
      
      debugPrint('Note updated successfully');
    } catch (e) {
      debugPrint('Error updating note: $e');
      throw Exception('Failed to update note: $e');
    }
  }

  Future<void> deleteNote(String docId) async {
    try {
      debugPrint('Deleting note with ID: $docId');
      await notesCollection.doc(docId).delete();
      debugPrint('Note deleted successfully');
    } catch (e) {
      debugPrint('Error deleting note: $e');
      throw Exception('Failed to delete note: $e');
    }
  }
  
  Future<bool> testConnection() async {
    try {
      final testDoc = await _firestore.collection('_test_connection').add({
        'timestamp': FieldValue.serverTimestamp(),
      });
      await testDoc.delete();
      debugPrint('Firebase connection successful');
      return true;
    } catch (e) {
      debugPrint('Firebase connection failed: $e');
      return false;
    }
  }
}