From: Paul Durrant <paul.durrant@citrix.com>
Subject: [PATCH v21 0/2] guest resource mapping (reprise)
Date: Wed, 8 Aug 2018 10:00:30 +0100
Message-ID: <20180808090032.2713-1-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=l0mo=kx=citrix.com=prvs=7519e8870=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1fnKKb-0004Qr-Ix
 for xen-devel@lists.xenproject.org; Wed, 08 Aug 2018 09:00:37 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <paul.durrant@citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhlc2UgcGF0Y2hlcyBhcmUgdGhlIHBhdGNoZXMgZnJvbSBteSBvcmlnaW5hbCByZXNvdXJjZSBt
YXBwaW5nIHNlcmllcwp0aGF0IGRpZCBub3QgbWFrZSBpdCBpbnRvIDQuMTEuCgpQYXVsIER1cnJh
bnQgKDIpOgogIGNvbW1vbjogYWRkIGEgbmV3IG1hcHBhYmxlIHJlc291cmNlIHR5cGU6IFhFTk1F
TV9yZXNvdXJjZV9ncmFudF90YWJsZQogIHRvb2xzL2xpYnhlbmN0cmw6IHVzZSBuZXcgeGVuZm9y
ZWlnbm1lbW9yeSBBUEkgdG8gc2VlZCBncmFudCB0YWJsZQoKIHRvb2xzL2xpYnhjL2luY2x1ZGUv
eGNfZG9tLmggICAgICAgIHwgICA4ICstLQogdG9vbHMvbGlieGMveGNfZG9tX2Jvb3QuYyAgICAg
ICAgICAgfCAxMTQgKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tCiB0b29scy9s
aWJ4Yy94Y19zcl9yZXN0b3JlX3g4Nl9odm0uYyB8ICAxMCArKy0tCiB0b29scy9saWJ4Yy94Y19z
cl9yZXN0b3JlX3g4Nl9wdi5jICB8ICAgMiArLQogdG9vbHMvbGlieGwvbGlieGxfZG9tLmMgICAg
ICAgICAgICAgfCAgIDEgLQogdG9vbHMvcHl0aG9uL3hlbi9sb3dsZXZlbC94Yy94Yy5jICAgfCAg
IDYgKy0KIHhlbi9jb21tb24vZ3JhbnRfdGFibGUuYyAgICAgICAgICAgIHwgIDk1ICsrKysrKysr
KysrKysrKysrKysrKysrKysrLS0tLQogeGVuL2NvbW1vbi9tZW1vcnkuYyAgICAgICAgICAgICAg
ICAgfCAgNTUgKysrKysrKysrKysrKysrKy0KIHhlbi9pbmNsdWRlL3B1YmxpYy9tZW1vcnkuaCAg
ICAgICAgIHwgICA2ICsrCiB4ZW4vaW5jbHVkZS94ZW4vZ3JhbnRfdGFibGUuaCAgICAgICB8ICAg
NCArKwogMTAgZmlsZXMgY2hhbmdlZCwgMjM4IGluc2VydGlvbnMoKyksIDYzIGRlbGV0aW9ucygt
KQoKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
