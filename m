From: Julien Grall <julien.grall@arm.com>
Subject: [PATCH 0/2] Fixup for booting Xen on Thunder-X using
	Grub
Date: Tue,  6 Feb 2018 19:56:53 +0000
Message-ID: <20180206195655.7097-1-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xen.org
Cc: andre.przywara@arm.com, Julien Grall <julien.grall@arm.com>, sstabellini@kernel.org, ian.jackson@eu.citrix.com, mjaggi@caviumnetworks.com
List-Id: xen-devel@lists.xenproject.org

SGkgYWxsLAoKVGhpcyBzbWFsbCBzZXJpZXMgd2lsbCBoZWxwIHRvIGJvb3QgWGVuIG9uIFRodW5k
ZXItWCB1c2luZyBHcnViLiBUaGlzIHBhcnQKb2YgbXkgd29yayB0byB1c2UgVGh1bmRlci1YIGlu
IE9zc3Rlc3QKCkNoZWVycywKCkp1bGllbiBHcmFsbCAoMik6CiAgeGVuL2FybTogRXh0ZW5kIHRo
ZSBudW1iZXIgb2YgbWVtb3J5IGJhbmtzIHN1cHBvcnRlZAogIHhlbi9hcm06IEJsYWNrbGlzdCBT
TU1VIG9uIFRodW5kZXItWAoKIHhlbi9hcmNoL2FybS9wbGF0Zm9ybXMvTWFrZWZpbGUgICB8ICAx
ICsKIHhlbi9hcmNoL2FybS9wbGF0Zm9ybXMvdGh1bmRlcnguYyB8IDM5ICsrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKwogeGVuL2luY2x1ZGUvYXNtLWFybS9zZXR1cC5oICAg
ICAgIHwgIDIgKy0KIDMgZmlsZXMgY2hhbmdlZCwgNDEgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlv
bigtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IHhlbi9hcmNoL2FybS9wbGF0Zm9ybXMvdGh1bmRlcngu
YwoKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
