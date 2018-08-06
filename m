From: Paul Durrant <paul.durrant@citrix.com>
Subject: [PATCH v20 0/2] guest resource mapping (reprise)
Date: Mon, 6 Aug 2018 13:54:47 +0100
Message-ID: <20180806125449.2829-1-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=cgzd=kv=citrix.com=prvs=749486379=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1fmf2D-00086e-AP
 for xen-devel@lists.xenproject.org; Mon, 06 Aug 2018 12:54:53 +0000
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
IDYgKy0KIHhlbi9jb21tb24vZ3JhbnRfdGFibGUuYyAgICAgICAgICAgIHwgIDc0ICsrKysrKysr
KysrKysrKysrKystLS0tCiB4ZW4vY29tbW9uL21lbW9yeS5jICAgICAgICAgICAgICAgICB8ICA1
NiArKysrKysrKysrKysrKysrKy0KIHhlbi9pbmNsdWRlL3B1YmxpYy9tZW1vcnkuaCAgICAgICAg
IHwgICA5ICsrLQogeGVuL2luY2x1ZGUveGVuL2dyYW50X3RhYmxlLmggICAgICAgfCAgIDQgKysK
IDEwIGZpbGVzIGNoYW5nZWQsIDIxOSBpbnNlcnRpb25zKCspLCA2NSBkZWxldGlvbnMoLSkKCi0t
IAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
