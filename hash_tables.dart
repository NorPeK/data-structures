class Node<K, V> {
  K key;
  V value;
  Node<K, V>? next;

  Node(this.key, this.value);
}

class HashTable<K, V> {
  final int _size;
  late List<Node<K, V>?> _buckets;

  HashTable(this._size) {
    _buckets = List<Node<K, V>?>.filled(_size, null);
  }

  int _hash(K key) {
    return key.hashCode % _size;
  }

  void put(K key, V value) {
    int index = _hash(key);
    Node<K, V>? currentNode = _buckets[index];

    // If the bucket is empty, create a new node
    if (currentNode == null) {
      _buckets[index] = Node(key, value);
      return;
    }

    // Traverse the linked list to find the right place to insert or update
    while (currentNode != null) {
      if (currentNode.key == key) {
        // Update the value if key already exists
        currentNode.value = value;
        return;
      }
      if (currentNode.next == null) {
        break;
      }
      currentNode = currentNode.next;
    }

    // Insert the new node at the end of the linked list
    currentNode!.next = Node(key, value);
  }

  V? get(K key) {
    int index = _hash(key);
    Node<K, V>? currentNode = _buckets[index];

    while (currentNode != null) {
      if (currentNode.key == key) {
        return currentNode.value;
      }
      currentNode = currentNode.next;
    }

    return null; // Key not found
  }

  void remove(K key) {
    int index = _hash(key);
    Node<K, V>? currentNode = _buckets[index];
    Node<K, V>? previousNode;

    while (currentNode != null) {
      if (currentNode.key == key) {
        if (previousNode == null) {
          // Removing the first node in the list
          _buckets[index] = currentNode.next;
        } else {
          // Removing a node from the middle or end of the list
          previousNode.next = currentNode.next;
        }
        return;
      }
      previousNode = currentNode;
      currentNode = currentNode.next;
    }
  }

  void display() {
    for (int i = 0; i < _size; i++) {
      Node<K, V>? currentNode = _buckets[i];
      print('Bucket $i:');
      while (currentNode != null) {
        print('  ${currentNode.key} -> ${currentNode.value}');
        currentNode = currentNode.next;
      }
    }
  }
}

void main() {
  HashTable<int, String> hashTable = HashTable(10);

  hashTable.put(10, 'Ten');
  hashTable.put(20, 'Twenty');
  hashTable.put(15, 'Fifteen');
  hashTable.put(25, 'Twenty-five');
  hashTable.put(30, 'Thirty');

  print('Hash Table after inserting some values:');
  hashTable.display();

  print('\nGet value for key 15: ${hashTable.get(15)}');

  hashTable.remove(20);
  print('\nHash Table after removing key 20:');
  hashTable.display();
}
