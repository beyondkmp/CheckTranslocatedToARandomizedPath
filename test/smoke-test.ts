import { checkTranslocatedToARandomizedPath } from '../lib/'

describe('checkTranslocatedToARandomizedPath', () => {
  it('works', () => {
      const pid = process.pid
      const result = checkTranslocatedToARandomizedPath(pid)
      expect(result).not.toBeUndefined()
      console.log(result)
      expect(typeof result).toBe('boolean')
  })
})
