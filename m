From: Olaf Hering <olaf@aepfle.de>
Subject: [PATCH v1] libxl: fix return code in
 qmp_synchronous_send
Date: Thu, 17 May 2018 16:29:57 +0200
Message-ID: <20180517142957.2963-1-olaf@aepfle.de>
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
Cc: Wei Liu <wei.liu2@citrix.com>, Olaf Hering <olaf@aepfle.de>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

VXNlIGVycm9yIGNvZGUgZnJvbSBsaWJ4bCBuYW1lc3BhY2UsIGEgcGxhaW4gLTEgaXMgbm90IHZh
bGlkIGluIHRoaXMgY29udGV4dC4KClNpZ25lZC1vZmYtYnk6IE9sYWYgSGVyaW5nIDxvbGFmQGFl
cGZsZS5kZT4KLS0tCiB0b29scy9saWJ4bC9saWJ4bF9xbXAuYyB8IDIgKy0KIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL2xp
YnhsL2xpYnhsX3FtcC5jIGIvdG9vbHMvbGlieGwvbGlieGxfcW1wLmMKaW5kZXggYmUxZmRhMThi
YS4uMGZlNDI4MTNiZiAxMDA2NDQKLS0tIGEvdG9vbHMvbGlieGwvbGlieGxfcW1wLmMKKysrIGIv
dG9vbHMvbGlieGwvbGlieGxfcW1wLmMKQEAgLTYyNyw3ICs2MjcsNyBAQCBzdGF0aWMgaW50IHFt
cF9zeW5jaHJvbm91c19zZW5kKGxpYnhsX19xbXBfaGFuZGxlciAqcW1wLCBjb25zdCBjaGFyICpj
bWQsCiAKICAgICBpZCA9IHFtcF9zZW5kKHFtcCwgY21kLCBhcmdzLCBjYWxsYmFjaywgb3BhcXVl
LCAmY29udGV4dCk7CiAgICAgaWYgKGlkIDw9IDApIHsKLSAgICAgICAgcmV0dXJuIC0xOworICAg
ICAgICByZXR1cm4gRVJST1JfRkFJTDsKICAgICB9CiAgICAgcW1wLT53YWl0X2Zvcl9pZCA9IGlk
OwogCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
