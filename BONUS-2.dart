bool isBalanced(String input) {
  // hold opening brackets
  List<String> stack = [];

  // map to match closing brackets with corresponding opening brackets
  final Map<String, String> matchingBrackets = {
    ')': '(',
    ']': '[',
    '}': '{'
  };

  // iterate the character in the string
  for (var char in input.split('')) {
    // If it's an opening bracket, push it onto the stack
    if (char == '(' || char == '{' || char == '[') {
      stack.add(char);
    }
    // if it's a closing bracket, check if it matches the last opening bracket
    else if (char == ')' || char == '}' || char == ']') {
      // if stack is empty or the top of the stack does not match, it's not balanced
      if (stack.isEmpty || stack.removeLast() != matchingBrackets[char]) {
        return false;
      }
    }
  }
  return stack.isEmpty;
}
void main() {
  List<String> inputs = [
    '{what is (42)}?',
    '[text}',
    '{[[(a)b]c]d}'
  ];
  for (var input in inputs) {
    if (isBalanced(input)) {
      print('$input it balanced');
    } else {
      print('$input it did not balance');
    }
  }
}
