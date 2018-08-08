From: Paul Durrant <paul.durrant@citrix.com>
Subject: [PATCH v22 0/2] guest resource mapping (reprise)
Date: Wed, 8 Aug 2018 15:16:18 +0100
Message-ID: <20180808141620.25471-1-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=l0mo=kx=citrix.com=prvs=7519e8870=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1fnPGD-00072H-Vn
 for xen-devel@lists.xenproject.org; Wed, 08 Aug 2018 14:16:26 +0000
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
eGNfZG9tLmggICAgICAgIHwgIDEyICstLQogdG9vbHMvbGlieGMveGNfZG9tX2Jvb3QuYyAgICAg
ICAgICAgfCAxNjYgKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tCiB0b29scy9s
aWJ4Yy94Y19zcl9yZXN0b3JlX3g4Nl9odm0uYyB8ICAxMCArLS0KIHRvb2xzL2xpYnhjL3hjX3Ny
X3Jlc3RvcmVfeDg2X3B2LmMgIHwgICAyICstCiB0b29scy9saWJ4bC9saWJ4bF9kb20uYyAgICAg
ICAgICAgICB8ICAgMSAtCiB0b29scy9weXRob24veGVuL2xvd2xldmVsL3hjL3hjLmMgICB8ICAg
NiArLQogeGVuL2NvbW1vbi9ncmFudF90YWJsZS5jICAgICAgICAgICAgfCAxMTUgKysrKysrKysr
KysrKysrKysrKysrKy0tLQogeGVuL2NvbW1vbi9tZW1vcnkuYyAgICAgICAgICAgICAgICAgfCAg
NTYgKysrKysrKysrKystCiB4ZW4vaW5jbHVkZS9wdWJsaWMvbWVtb3J5LmggICAgICAgICB8ICAg
NiArKwogeGVuL2luY2x1ZGUveGVuL2dyYW50X3RhYmxlLmggICAgICAgfCAgIDQgKwogMTAgZmls
ZXMgY2hhbmdlZCwgMjg2IGluc2VydGlvbnMoKyksIDkyIGRlbGV0aW9ucygtKQoKLS0gCjIuMTEu
MAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
