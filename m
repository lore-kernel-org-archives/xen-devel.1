From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v1] libxl: fix return code in
 qmp_synchronous_send
Date: Fri, 18 May 2018 09:59:18 +0100
Message-ID: <20180518085917.6wplrtzy6dxrel2u@citrix.com>
References: <20180517142957.2963-1-olaf@aepfle.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <20180517142957.2963-1-olaf@aepfle.de>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Olaf Hering <olaf@aepfle.de>
Cc: Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBNYXkgMTcsIDIwMTggYXQgMDQ6Mjk6NTdQTSArMDIwMCwgT2xhZiBIZXJpbmcgd3Jv
dGU6Cj4gVXNlIGVycm9yIGNvZGUgZnJvbSBsaWJ4bCBuYW1lc3BhY2UsIGEgcGxhaW4gLTEgaXMg
bm90IHZhbGlkIGluIHRoaXMgY29udGV4dC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBPbGFmIEhlcmlu
ZyA8b2xhZkBhZXBmbGUuZGU+CgpXaGlsZSB0aGlzIGZ1bmN0aW9uIGRvZXNuJ3QgaGF2ZSBsaWJ4
bCBwcmVmaXgsIGl0cyByZXR1cm4gdmFsdWUgZG9lcyBnZXQKcmV0dXJuZWQgZGlyZWN0bHkgYnkg
dmFyaW91cyBsaWJ4bCBmdW5jdGlvbnMuIEluc3RlYWQgb2YgZml4aW5nIGFsbCB0aGUKY2FsbGVy
cywgSSdtIGZpbmUgd2l0aCB0aGlzIGNoYW5nZS4KCkFja2VkLWJ5OiBXZWkgTGl1IDx3ZWkubGl1
MkBjaXRyaXguY29tPgoKPiAtLS0KPiAgdG9vbHMvbGlieGwvbGlieGxfcW1wLmMgfCAyICstCj4g
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYg
LS1naXQgYS90b29scy9saWJ4bC9saWJ4bF9xbXAuYyBiL3Rvb2xzL2xpYnhsL2xpYnhsX3FtcC5j
Cj4gaW5kZXggYmUxZmRhMThiYS4uMGZlNDI4MTNiZiAxMDA2NDQKPiAtLS0gYS90b29scy9saWJ4
bC9saWJ4bF9xbXAuYwo+ICsrKyBiL3Rvb2xzL2xpYnhsL2xpYnhsX3FtcC5jCj4gQEAgLTYyNyw3
ICs2MjcsNyBAQCBzdGF0aWMgaW50IHFtcF9zeW5jaHJvbm91c19zZW5kKGxpYnhsX19xbXBfaGFu
ZGxlciAqcW1wLCBjb25zdCBjaGFyICpjbWQsCj4gIAo+ICAgICAgaWQgPSBxbXBfc2VuZChxbXAs
IGNtZCwgYXJncywgY2FsbGJhY2ssIG9wYXF1ZSwgJmNvbnRleHQpOwo+ICAgICAgaWYgKGlkIDw9
IDApIHsKPiAtICAgICAgICByZXR1cm4gLTE7Cj4gKyAgICAgICAgcmV0dXJuIEVSUk9SX0ZBSUw7
Cj4gICAgICB9Cj4gICAgICBxbXAtPndhaXRfZm9yX2lkID0gaWQ7Cj4gIAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
