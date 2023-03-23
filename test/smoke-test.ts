import { checkTranslocatedToARandomizedPath } from '../lib/'

describe('checkTranslocatedToARandomizedPath', () => {
  it('works', () => {
      const result = checkTranslocatedToARandomizedPath()
      expect(result).not.toBeUndefined()
      console.log(result)
      expect(typeof result).toBe('boolean')
  })
})
