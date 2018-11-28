From: Juergen Gross <jgross@suse.com>
Subject: [PATCH] xen/x86: fix paging_max_paddr_bits()
Date: Wed, 28 Nov 2018 08:52:24 +0100
Message-ID: <20181128075224.30765-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=+lgq=oh=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1gRue6-0000Gl-3G
 for xen-devel@lists.xenproject.org; Wed, 28 Nov 2018 07:52:30 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, andrew.cooper3@citrix.com, wei.liu2@citrix.com, jbeulich@suse.com, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

cGFnaW5nX21heF9wYWRkcl9iaXRzKCkgaGFzIGFuIGludmFsaWQgdXNlIG9mIElTX0VOQUJMRUQo
KTogaW5zdGVhZCBvZgpJU19FTkFCTEVEKENPTkZJR19CSUdNRU0pIGl0IGlzIHVzaW5nIElTX0VO
QUJMRUQoQklHTUVNKS4gRml4IHRoYXQuCgpTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxq
Z3Jvc3NAc3VzZS5jb20+Ci0tLQogeGVuL2luY2x1ZGUvYXNtLXg4Ni9wYWdpbmcuaCB8IDMgKyst
CiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0t
Z2l0IGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9wYWdpbmcuaCBiL3hlbi9pbmNsdWRlL2FzbS14ODYv
cGFnaW5nLmgKaW5kZXggZGQwZDZiNTE1OS4uZmRjYzIyODQ0YiAxMDA2NDQKLS0tIGEveGVuL2lu
Y2x1ZGUvYXNtLXg4Ni9wYWdpbmcuaAorKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L3BhZ2luZy5o
CkBAIC0zNzEsNyArMzcxLDggQEAgc3RhdGljIGlubGluZSB1bnNpZ25lZCBpbnQgcGFnaW5nX21h
eF9wYWRkcl9iaXRzKGNvbnN0IHN0cnVjdCBkb21haW4gKmQpCiB7CiAgICAgdW5zaWduZWQgaW50
IGJpdHMgPSBwYWdpbmdfbW9kZV9oYXAoZCkgPyBoYXBfcGFkZHJfYml0cyA6IHBhZGRyX2JpdHM7
CiAKLSAgICBpZiAoICFJU19FTkFCTEVEKEJJR01FTSkgJiYgcGFnaW5nX21vZGVfc2hhZG93KGQp
ICYmICFpc19wdl9kb21haW4oZCkgKQorICAgIGlmICggIUlTX0VOQUJMRUQoQ09ORklHX0JJR01F
TSkgJiYgcGFnaW5nX21vZGVfc2hhZG93KGQpICYmCisgICAgICAgICAhaXNfcHZfZG9tYWluKGQp
ICkKICAgICB7CiAgICAgICAgIC8qIFNoYWRvd2VkIHN1cGVycGFnZXMgc3RvcmUgR0ZOcyBpbiAz
Mi1iaXQgcGFnZV9pbmZvIGZpZWxkcy4gKi8KICAgICAgICAgYml0cyA9IG1pbihiaXRzLCAzMlUg
KyBQQUdFX1NISUZUKTsKLS0gCjIuMTYuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
