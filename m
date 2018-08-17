From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH 34/34] RFC x86: introduce directio virt cap
Date: Fri, 17 Aug 2018 16:12:52 +0100
Message-ID: <84f9dde9a5f6253653fc267fd8f874d21e4f4a58.1534518694.git-series.wei.liu2@citrix.com>
References: <cover.f5351150954129956fcf53a7781206b6295df78d.1534518694.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=v/z7=la=citrix.com=prvs=760f4e3ef=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fqggG-0001fd-Ga
 for xen-devel@lists.xenproject.org; Fri, 17 Aug 2018 15:28:52 +0000
In-Reply-To: <cover.f5351150954129956fcf53a7781206b6295df78d.1534518694.git-series.wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

aHZtX2RpcmVjdGlvIGlzIHNldCB3aGVuIGlvbW11IGlzIGVuYWJsZWQsIGJ1dCBpbiBmYWN0IGlv
bW11IGlzIG5vdAp0aWVkIHRvIEhWTS4gSW4gb3JkZXIgdG8gbm90IGJyZWFrIGV4aXN0aW5nIHRv
b2xzLCBleHBvc2UgYSBuZXcgZmxhZwpkaXJlY3RpbyBmb3IgKGlvbW11X2VuYWJsZWQgJiYgIWh2
bV9lbmFibGVkKS4KClJGQyBUaGlzIGRvZXNuJ3QgYnVpbGQgYXQgdGhlIG1vbWVudC4gRG8gd2Ug
Y2FyZSBhYm91dCB0aGF0IGZsYWcgYmVpbmcKaW5hY2N1cmF0ZT8KClNpZ25lZC1vZmYtYnk6IFdl
aSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Ci0tLQogeGVuL2FyY2gveDg2L3N5c2N0bC5jIHwg
NCArKystCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpk
aWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L3N5c2N0bC5jIGIveGVuL2FyY2gveDg2L3N5c2N0bC5j
CmluZGV4IGU3MDRlZDcuLmE4ZDY0YzUgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9zeXNjdGwu
YworKysgYi94ZW4vYXJjaC94ODYvc3lzY3RsLmMKQEAgLTkyLDggKzkyLDEwIEBAIHZvaWQgYXJj
aF9kb19waHlzaW5mbyhzdHJ1Y3QgeGVuX3N5c2N0bF9waHlzaW5mbyAqcGkpCiAgICAgICAgICAg
IG1pbihzaXplb2YocGktPmh3X2NhcCksIHNpemVvZihib290X2NwdV9kYXRhLng4Nl9jYXBhYmls
aXR5KSkpOwogICAgIGlmICggaHZtX2VuYWJsZWQgKQogICAgICAgICBwaS0+Y2FwYWJpbGl0aWVz
IHw9IFhFTl9TWVNDVExfUEhZU0NBUF9odm07Ci0gICAgaWYgKCBpb21tdV9lbmFibGVkICkKKyAg
ICBpZiAoIGh2bV9lbmFibGVkICYmIGlvbW11X2VuYWJsZWQgKQogICAgICAgICBwaS0+Y2FwYWJp
bGl0aWVzIHw9IFhFTl9TWVNDVExfUEhZU0NBUF9odm1fZGlyZWN0aW87CisgICAgZWxzZSBpZiAo
IGlvbW11X2VuYWJsZWQgKQorICAgICAgICBwaS0+Y2FwYWJpbGl0aWVzIHw9IFhFTl9TWVNDVExf
UEhZU0NBUF9kaXJlY3RpbzsKIH0KIAogbG9uZyBhcmNoX2RvX3N5c2N0bCgKLS0gCmdpdC1zZXJp
ZXMgMC45LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
