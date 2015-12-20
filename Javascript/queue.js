function Queue() {
	// body...
	this.queue = [];
	this._length = 0;
	this.dummy = [];
}

Queue.prototype.enqueue = function(element) {
	// body...
	if(this.queue.length > 1){
		this.dummy[0] = element;
		this.dummy.concat(this.queue);
		this.queue = this.dummy;
	}else{
		this.queue[0] = element;
	}
	this.dummy = [];
	this._length++;
	return true;
};

Queue.prototype.dequeue = function() {
	// body...
	var element = null;
	if(this.queue.length > 1){
		element = this.queue[this.queue.length-1];
		this.queue.splice(this.queue.length-1);
	}else{
		this.queue[0] = element;
		this.queue = [];
	}
	this._length--;
	return element;
};

Queue.prototype.flip = function() {
	// body...
	if(this.queue.length > 1){
		var j = 0;
		for (var i = this.queue.length - 1; i >= 0; i--) {
			this.dummy[j] = this.queue[i];
			j++;
		};
		this.queue = this.dummy;
		this.dummy = [];
	}
};

Queue.prototype.clear = function() {
	// body...
	this.queue = [];
	return true;
};

Queue.prototype.lenght = function() {
	// body...
	return this._length;
};

