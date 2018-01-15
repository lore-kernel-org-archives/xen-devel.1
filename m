From: Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH] docs: note default for timer_mode in xl.cfg man
Date: Sun, 14 Jan 2018 23:28:15 -0600
Message-ID: <20180115052815.19255-1-cardoe@cardoe.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=s3nm=ek=cardoe.com=cardoe@srs-us1.protection.inumbo.net>)
 id 1eaxJn-0008Fx-7d
 for xen-devel@lists.xenproject.org; Mon, 15 Jan 2018 05:28:23 +0000
Received: by mail-yb0-x234.google.com with SMTP id c66so4529036ybf.0
 for <xen-devel@lists.xenproject.org>; Sun, 14 Jan 2018 21:28:21 -0800 (PST)
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, Doug Goldstein <cardoe@cardoe.com>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhlcmUgd2FzIG5vIGRlZmF1bHQgZG9jdW1lbnRlZCBidXQgdGhlIGhlYWRlciBhdAp4ZW4vaW5j
bHVkZS9wdWJsaWMvaHZtL3BhcmFtcy5oIHN0YXRlZCB3aGljaCB0aGUgZGVmYXVsdCB3YXMsIHNv
IGFkZCBpdAp0byB0aGUgZG9jcy4KClNpZ25lZC1vZmYtYnk6IERvdWcgR29sZHN0ZWluIDxjYXJk
b2VAY2FyZG9lLmNvbT4KLS0tCkNDOiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgpDQzog
SWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+CiMgR2VvcmdlIGZvciB0aGUg
NC44IGFuZCA0LjkgYmFja3BvcnQKQ0M6IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAZXUu
Y2l0cml4LmNvbT4KLS0tCiBkb2NzL21hbi94bC5jZmcucG9kLjUuaW4gfCAzICsrLQogMSBmaWxl
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2Rv
Y3MvbWFuL3hsLmNmZy5wb2QuNS5pbiBiL2RvY3MvbWFuL3hsLmNmZy5wb2QuNS5pbgppbmRleCBi
N2I5MWQ4NjI3Li4zNThhMzc4ZTFlIDEwMDY0NAotLS0gYS9kb2NzL21hbi94bC5jZmcucG9kLjUu
aW4KKysrIGIvZG9jcy9tYW4veGwuY2ZnLnBvZC41LmluCkBAIC0yMzQ4LDcgKzIzNDgsOCBAQCBT
cGVjaWZpZXMgdGhlIG1vZGUgZm9yIFZpcnR1YWwgVGltZXJzLiBUaGUgdmFsaWQgdmFsdWVzIGFy
ZSBhcyBmb2xsb3dzOgogRGVsYXkgZm9yIG1pc3NlZCB0aWNrcy4gRG8gbm90IGFkdmFuY2UgYSB2
Q1BVJ3MgdGltZSBiZXlvbmQgdGhlCiBjb3JyZWN0IGRlbGl2ZXJ5IHRpbWUgZm9yIGludGVycnVw
dHMgdGhhdCBoYXZlIGJlZW4gbWlzc2VkIGR1ZSB0bwogcHJlZW1wdGlvbi4gRGVsaXZlciBtaXNz
ZWQgaW50ZXJydXB0cyB3aGVuIHRoZSB2Q1BVIGlzIHJlc2NoZWR1bGVkIGFuZAotYWR2YW5jZSB0
aGUgdkNQVSdzIHZpcnR1YWwgdGltZSBzdGVwd2lzZSBmb3IgZWFjaCBvbmUuCithZHZhbmNlIHRo
ZSB2Q1BVJ3MgdmlydHVhbCB0aW1lIHN0ZXB3aXNlIGZvciBlYWNoIG9uZS4gVGhpcyBpcyB0aGUK
K2RlZmF1bHQuCiAKID1pdGVtIEI8bm9fZGVsYXlfZm9yX21pc3NlZF90aWNrcz4KIAotLSAKMi4x
My42CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
