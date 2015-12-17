// Node class

function Node(data){
	this.data = data;
	this.next = null;
	this.previous = null;
}

function DoubleLinkedList(){
	this.head = null;
	this.tail = null;
	this._length = 0;
}

DoubleLinkedList.prototype.add = function(data) {
	// body...
	var node = new Node(data);
	if(this.head == null){
		this.head = node;
		this.tail = node;
		return node;
	}else{
		this.tail.next = node;
		node.previous = this.tail;
		this.tail = node;
	}

	this._length++;
	return node;
};

DoubleLinkedList.prototype.searchAtPosition = function(position) {
	// body...
	var message = {failure: 'Failure: non-existent node in this list.'};

	if(this._length == 0 || position > this._length || position < 1){
		throw new Error(message.failure);
	}

	var currentNode = this.head;
	var count = 1;
	while(count < position){
		currentNode = currentNode.next;
		count++;
	}

	return currentNode;
};

DoubleLinkedList.prototype.removeAtPosition = function(position) {
	// body...
	var message = {failure: 'Failure: non-existent node in this list.'};

	if(this._length == 0 || position > this._length || position < 1){
		throw new Error(message.failure);
	}

	var count = 1;
	var beforeNodeToDelete = null;
	var nodeToDelete = null;
	var afterNodeToDelete = null;
	var currentNode = this.head;

	if (position === 1){
		this.head = currentNode.next;
		
		if(!this.head){
			this.head.previous = null;
		}else{
			this.tail = null;
		}

	}else if (position === this._length){
		this.tail = this.tail.previous;
		this.tail.next = null;
	}else{
		while(count < position){
			currentNode = currentNode.next;
			count++;
		}

		beforeNodeToDelete = currentNode.previous;
		nodeToDelete = currentNode;
		afterNodeToDelete = currentNode.next;

		beforeNodeToDelete.next = afterNodeToDelete;
		afterNodeToDelete.previous = beforeNodeToDelete;
		var deletedNode = nodeToDelete;
		nodeToDelete = null;

		this._length--;
	}

    return deletedNode;
};