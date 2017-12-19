From: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH] libxl/pvh: force PVH guests to use the xenstore
	shutdown
Date: Tue, 19 Dec 2017 14:17:52 +0000
Message-ID: <20171219141752.81060-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=u91z=dp=citrix.com=prvs=519ad8697=roger.pau@srs-us1.protection.inumbo.net>)
 id 1eRIik-0005Rp-4q
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2017 14:18:14 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhlcmUncyBubyBvdGhlciB3YXkgdG8gc2h1dGRvd24gYSBQVkggZ3Vlc3QgYXQgdGhlIG1vbWVu
dC4KClNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29t
PgotLS0KQ2M6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgpDYzogV2Vp
IExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KLS0tCiB0b29scy9saWJ4bC9saWJ4bF9kb21haW4u
YyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoK
ZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhsL2xpYnhsX2RvbWFpbi5jIGIvdG9vbHMvbGlieGwvbGli
eGxfZG9tYWluLmMKaW5kZXggODE0ZjgxMjhhMS4uYWFhMjJlZjU3NiAxMDA2NDQKLS0tIGEvdG9v
bHMvbGlieGwvbGlieGxfZG9tYWluLmMKKysrIGIvdG9vbHMvbGlieGwvbGlieGxfZG9tYWluLmMK
QEAgLTU5OSw3ICs1OTksNyBAQCBpbnQgbGlieGxfX2RvbWFpbl9wdmNvbnRyb2xfYXZhaWxhYmxl
KGxpYnhsX19nYyAqZ2MsIHVpbnQzMl90IGRvbWlkKQogICAgIGlmIChkb210eXBlID09IExJQlhM
X0RPTUFJTl9UWVBFX0lOVkFMSUQpCiAgICAgICAgIHJldHVybiBFUlJPUl9GQUlMOwogCi0gICAg
aWYgKGRvbXR5cGUgPT0gTElCWExfRE9NQUlOX1RZUEVfUFYpCisgICAgaWYgKGRvbXR5cGUgIT0g
TElCWExfRE9NQUlOX1RZUEVfSFZNKQogICAgICAgICByZXR1cm4gMTsKIAogICAgIHJldCA9IHhj
X2h2bV9wYXJhbV9nZXQoY3R4LT54Y2gsIGRvbWlkLCBIVk1fUEFSQU1fQ0FMTEJBQ0tfSVJRLCAm
cHZkcml2ZXIpOwotLSAKMi4xNC4zIChBcHBsZSBHaXQtOTgpCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
