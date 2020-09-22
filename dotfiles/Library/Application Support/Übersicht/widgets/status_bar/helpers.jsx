export const parse = input => {
  try {
    return JSON.parse(input);
  } catch (e) {
    return undefined;
  }
};
