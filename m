From: Norbert Manthey <nmanthey@amazon.com>
Subject: [Makefile] asm: handle comments when creating header
	file
Date: Wed, 10 Jan 2018 16:14:36 +0100
Message-ID: <1515597276-8279-1-git-send-email-nmanthey@amazon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=x2ay=ef=amazon.com=prvs=541a60d03=nmanthey@srs-us1.protection.inumbo.net>)
 id 1eZI61-0008PS-FB
 for xen-devel@lists.xenproject.org; Wed, 10 Jan 2018 15:15:17 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>
Cc: Michael Tautschnig <tautschn@amazon.co.uk>, Norbert Manthey <nmanthey@amazon.com>, Norbert Manthey <nmanthey@amazon.de>
List-Id: xen-devel@lists.xenproject.org

SW4gdGhlIGVhcmx5IHN0ZXBzIG9mIGNvbXBpbGF0aW9uLCB0aGUgYXNtIGhlYWRlciBmaWxlcyBh
cmUgY3JlYXRlZCwgc3VjaAphcyBpbmNsdWRlL2FzbS0kKFRBUkdFVF9BUkNIKS9hc20tb2Zmc2V0
cy5oLiBUaGVzZSBmaWxlcyBkZXBlbmQgb24gdGhlCmFzc2VtYmx5IGZpbGUgYXJjaC8kKFRBUkdF
VF9BUkNIKS9hc20tb2Zmc2V0cy5zLCB3aGljaCBpcyBnZW5lcmF0ZWQKYmVmb3JlLiBEZXBlbmRp
bmcgb24gdGhlIHVzZWQgYXNzZW1ibGVyLCB0aGVyZSBtaWdodCBiZSBjb21tZW50cyBpbiB0aGUK
YXNzZW1ibHkgZmlsZXMuCgpUaGlzIGNvbW1pdCBhZGRzIGhhbmRsaW5nIGNvbW1lbnRzIGluIHRo
ZSBhc3NlbWJsZXIgZHVyaW5nIHRoZSBjcmVhdGlvbiBvZgp0aGUgYXNtIGhlYWRlciBmaWxlcy4K
ClNpZ25lZC1vZmYtYnk6IE5vcmJlcnQgTWFudGhleSA8bm1hbnRoZXlAYW1hem9uLmRlPgpTaWdu
ZWQtb2ZmLWJ5OiBNaWNoYWVsIFRhdXRzY2huaWcgPHRhdXRzY2huQGFtYXpvbi5jby51az4KUmV2
aWV3ZWQtYnk6IFBhd2VsIFdpZWN6b3JraWV3aWN6IDx3aXBhd2VsQGFtYXpvbi5kZT4KUmV2aWV3
ZWQtYnk6IEJqb2VybiBEb2ViZWwgPGRvZWJlbEBhbWF6b24uZGU+Ci0tLQogeGVuL01ha2VmaWxl
IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpk
aWZmIC0tZ2l0IGEveGVuL01ha2VmaWxlIGIveGVuL01ha2VmaWxlCmluZGV4IDA0NGU3YzguLjg0
MWE5ZTUgMTAwNjQ0Ci0tLSBhL3hlbi9NYWtlZmlsZQorKysgYi94ZW4vTWFrZWZpbGUKQEAgLTE4
OSw3ICsxODksNyBAQCBpbmNsdWRlL2FzbS0kKFRBUkdFVF9BUkNIKS9hc20tb2Zmc2V0cy5oOiBh
cmNoLyQoVEFSR0VUX0FSQ0gpL2FzbS1vZmZzZXRzLnMKIAkgIGVjaG8gIiNpZm5kZWYgX19BU01f
T0ZGU0VUU19IX18iOyBcCiAJICBlY2hvICIjZGVmaW5lIF9fQVNNX09GRlNFVFNfSF9fIjsgXAog
CSAgZWNobyAiIjsgXAotCSAgc2VkIC1ybmUgIi89PT4ve3M6Lio9PT4oLiopPD09Lio6XDE6OyBz
OiBbXCQkI106IDo7IHA7fSI7IFwKKwkgIHNlZCAtcm5lICIvXlteI10uKj09Pi97czouKj09Pigu
Kik8PT0uKjpcMTo7IHM6IFtcJCQjXTogOjsgcDt9IjsgXAogCSAgZWNobyAiIjsgXAogCSAgZWNo
byAiI2VuZGlmIikgPCQ8ID4kQAogCi0tIAoyLjcuNAoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
