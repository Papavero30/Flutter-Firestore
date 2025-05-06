import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class FirestoreService {
  // Using Firestore Database for CRUD operations
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final CollectionReference notesCollection = 
      FirebaseFirestore.instance.collection('notes');

  // Create
  Future<String> addNote({required String title, required String content}) async {
    try {
      // Print for debugging
      debugPrint('Adding note: Title: $title, Content: $content');
      
      // Add document with timestamp
      final data = {
        'title': title,
        'content': content,
        'timestamp': FieldValue.serverTimestamp(), // Use server timestamp
      };
      
      DocumentReference docRef = await notesCollection.add(data);
      
      // Confirm data was added
      debugPrint('Note added with ID: ${docRef.id}');
      return docRef.id;
    } catch (e) {
      // Better error logging
      debugPrint('Error adding note: $e');
      throw Exception('Failed to add note: $e');
    }
  }

  // Read
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

  // Update
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

  // Delete
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
  
  // Test connection to Firestore
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