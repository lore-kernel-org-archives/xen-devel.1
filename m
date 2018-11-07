From: Paul Durrant <paul.durrant@citrix.com>
Subject: [PATCH v3 0/5] (remainder of) viridian cleanup
Date: Wed, 7 Nov 2018 10:52:18 +0000
Message-ID: <20181107105223.27013-1-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=9ib7=ns=citrix.com=prvs=842bfaeda=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1gKLRl-0002PV-Lm
 for xen-devel@lists.xenproject.org; Wed, 07 Nov 2018 10:52:29 +0000
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

SSBwbGFuIHRvIGFkZCBpbXBsZW1lbnRhdGlvbnMgZm9yIG1vcmUgdmlyaWRpYW4gZW5saWdodGVu
bWVudHMgaW4gdGhlIG5lYXIKZnV0dXJlLiBUaGlzIHNlcmllcyBpcyB0aGUgcmVtYWluZGVyLCBz
aW5jZSB2Miwgb2YgdGhlIGNsZWFudXAgSSd2ZSBiZWVuCmRvaW5nIGluIHByZXBhcmF0aW9uLgoK
UGF1bCBEdXJyYW50ICg1KToKICB2aXJpZGlhbjogc2VwYXJhdGUgaW50ZXJydXB0IHJlbGF0ZWQg
ZW5saWdodGVubWVudCBpbXBsZW1lbnRhdGlvbnMuLi4KICB2aXJpZGlhbjogc2VwYXJhdGUgdGlt
ZSByZWxhdGVkIGVubGlnaHRlbm1lbnQgaW1wbGVtZW50YXRpb25zLi4uCiAgdmlyaWRpYW46IGRl
ZmluZSB0eXBlIGZvciB0aGUgJ3ZpcnR1YWwgVlAgYXNzaXN0IHBhZ2UnCiAgdG9vbHMvbWlzYzog
Zml4IGhhcmQgdGFicyBpbiB4ZW4taHZtY3R4LmMKICB2aXJpZGlhbjogaW50cm9kdWNlIHN0cnVj
dCB2aXJpZGlhbl9wYWdlCgogdG9vbHMvbWlzYy94ZW4taHZtY3R4LmMgICAgICAgICAgICAgICAg
fCAgMTggKy0KIHhlbi9hcmNoL3g4Ni9odm0vdmlyaWRpYW4vTWFrZWZpbGUgICAgIHwgICAyICsK
IHhlbi9hcmNoL3g4Ni9odm0vdmlyaWRpYW4vcHJpdmF0ZS5oICAgIHwgMTA1ICsrKysrKysrCiB4
ZW4vYXJjaC94ODYvaHZtL3ZpcmlkaWFuL3N5bmljLmMgICAgICB8IDE3NiArKysrKysrKysrKysr
CiB4ZW4vYXJjaC94ODYvaHZtL3ZpcmlkaWFuL3RpbWUuYyAgICAgICB8IDI0NCArKysrKysrKysr
KysrKysrKwogeGVuL2FyY2gveDg2L2h2bS92aXJpZGlhbi92aXJpZGlhbi5jICAgfCA0NjAgKysr
KysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiB4ZW4vaW5jbHVkZS9hc20teDg2L2h2bS92
aXJpZGlhbi5oICAgICB8ICAyMiArLQogeGVuL2luY2x1ZGUvcHVibGljL2FyY2gteDg2L2h2bS9z
YXZlLmggfCAgIDIgKy0KIDggZmlsZXMgY2hhbmdlZCwgNjI1IGluc2VydGlvbnMoKyksIDQwNCBk
ZWxldGlvbnMoLSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCB4ZW4vYXJjaC94ODYvaHZtL3ZpcmlkaWFu
L3ByaXZhdGUuaAogY3JlYXRlIG1vZGUgMTAwNjQ0IHhlbi9hcmNoL3g4Ni9odm0vdmlyaWRpYW4v
c3luaWMuYwogY3JlYXRlIG1vZGUgMTAwNjQ0IHhlbi9hcmNoL3g4Ni9odm0vdmlyaWRpYW4vdGlt
ZS5jCgotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
