From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH] x86: assert MBI is large enough in pvh-boot.c
Date: Wed, 26 Sep 2018 12:00:00 +0100
Message-ID: <20180926110000.9764-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=avo5=mi=citrix.com=prvs=80087d113=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1g57YR-0001ra-T6
 for xen-devel@lists.xenproject.org; Wed, 26 Sep 2018 11:00:27 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhlIHJlbG9jYXRpb24gY29kZSBpbiBfX3N0YXJ0X3hlbiByZXF1aXJlcyBvbmUgZXh0cmEgZWxl
bWVudCBpbiB0aGUKTUJJIHN0cnVjdHVyZS4gQnkgdGhlIGxvb2tzIG9mIGl0IHRoZSB0ZW1wb3Jh
cnkgTUJJIGFycmF5IGlzIGFscmVhZHkKbGFyZ2UgZW5vdWdoLiBBZGQgYW4gYXNzZXJ0aW9uIHRv
IGNhdGNoIGFueSBpc3N1ZSBpbiB0aGUgZnV0dXJlLgoKU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8
d2VpLmxpdTJAY2l0cml4LmNvbT4KLS0tCiB4ZW4vYXJjaC94ODYvZ3Vlc3QvcHZoLWJvb3QuYyB8
IDcgKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBh
L3hlbi9hcmNoL3g4Ni9ndWVzdC9wdmgtYm9vdC5jIGIveGVuL2FyY2gveDg2L2d1ZXN0L3B2aC1i
b290LmMKaW5kZXggMGU5ZTViZmRmNi4uN2UxM2U3NjA0YiAxMDA2NDQKLS0tIGEveGVuL2FyY2gv
eDg2L2d1ZXN0L3B2aC1ib290LmMKKysrIGIveGVuL2FyY2gveDg2L2d1ZXN0L3B2aC1ib290LmMK
QEAgLTQ0LDYgKzQ0LDEzIEBAIHN0YXRpYyB2b2lkIF9faW5pdCBjb252ZXJ0X3B2aF9pbmZvKHZv
aWQpCiAKICAgICBBU1NFUlQocHZoX2luZm8tPm1hZ2ljID09IFhFTl9IVk1fU1RBUlRfTUFHSUNf
VkFMVUUpOwogCisgICAgLyoKKyAgICAgKiBUZW1wb3JhcnkgTUJJIGFycmF5IG5lZWRzIHRvIGJl
IGF0IGxlYXN0IG9uZSBlbGVtZW50IGJpZ2dlciB0aGFuCisgICAgICogcmVxdWlyZWQuIFRoZSBl
eHRyYSBlbGVtZW50IGlzIHVzZWQgdG8gYWlkIHJlbG9jYXRpb24uIFNlZQorICAgICAqIGFyY2gv
eDg2L3NldHVwLmM6X19zdGFydF94ZW4oKS4KKyAgICAgKi8KKyAgICBBU1NFUlQoQVJSQVlfU0la
RShwdmhfbWJpX21vZHMpID4gcHZoX2luZm8tPm5yX21vZHVsZXMpOworCiAgICAgLyoKICAgICAg
KiBUdXJuIGh2bV9zdGFydF9pbmZvIGludG8gbWJpLiBMdWNraWx5IGFsbCBtb2R1bGVzIGFyZSBw
bGFjZWQgdW5kZXIgNEdCCiAgICAgICogYm91bmRhcnkgb24geDg2LgotLSAKMi4xMS4wCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
