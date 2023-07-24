package internal_test

import (
	. "github.com/onsi/ginkgo/v2"
	. "github.com/onsi/gomega"

	"github.com/wesdotcool/goilerplate/internal"
)

var _ = Describe("Example", func() {
	It("Says Hello World!", func() {
		expected := "Hello World!"
		Expect(internal.Example()).To(Equal(expected))
	})
})
