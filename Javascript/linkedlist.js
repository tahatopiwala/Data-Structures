// Node Class

function Node(data){
	this.data = data;
	this.next = null;
}

function SinglyList(){
	this._length = 0;
	this.head = null;
	console.log("Class initiated");
}

SinglyList.prototype.add = function(value) {
	
	var node = new Node(value);
	var currentNode = this.head;

	if (!currentNode){
		this.head = node;
		this._length++;
		return node;
	}

	while(currentNode.next){
		currentNode = currentNode.next;
	}

	currentNode.next = node;

	this._length++;

	return node;
};

SinglyList.prototype.searchNodeAt = function(position) {
	var currentNode = this.head;
	var length = this._length;
	var count = 1;
	var message = {failure: 'Failure: non-existent node in this list.'};

	if (length == 0 || position < 1 || position > length){
		throw new Error(message.failure);
	}

	while (count < position){
		currentNode = currentNode.next;
		count++;
	}

	return currentNode;
};

SinglyList.prototype.removeAtPostion = function(position) {
	
	var currentNode = this.head;
	var length = this._length;
	var count = 1;
	var NodeToDelete = null;
	var PreviousNode = null;
	var DeletedNode = null;

	var message = {failure: 'Failure: non-existent node in this list.'};

	if (length == 0 || position < 1 || position > length){
		throw new Error(message.failure);
	}

	if (position == 1){
		this.head = currentNode.next;
		DeletedNode = currentNode;
		currentNode = null;
		this._length--;
		return DeletedNode;
	}

	while(count < position){
		NodeToDelete = currentNode;
		currentNode = currentNode.next;
		count++;
	}

	DeletedNode = NodeToDelete;
	PreviousNode = NodeToDelete.next;
	NodeToDelete = null;
	this._length--;

	return DeletedNode;
};

var list = new SinglyList();