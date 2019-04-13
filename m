From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 0/3] x86: Fix boot time detection of SMT settings
Date: Sat, 13 Apr 2019 17:22:09 +0100
Message-ID: <1555172532-23814-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lqlW=SP=citrix.com=prvs=9997e3fe6=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hFLRI-0005Ex-1X
 for xen-devel@lists.xenproject.org; Sat, 13 Apr 2019 16:23:36 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SXQgdHVybnMgb3V0IHRoYXQgb24gSW50ZWwgaGFyZHdhcmUsIENQVUlELjB4Yi5zbXRfc2hpZnQg
cmVwcmVzZW50cyB0aGUKaGFyZHdhcmUgY2FwYWJpbGl0eSwgbm90IHRoZSBjdXJyZW50IGNvbmZp
Z3VyYXRpb24uICBUaGVyZWZvcmUsIHRoZSBMMVRGCm5hZ2dpbmcgd2FybmluZyB0cmlnZ2VycyBl
dmVuIHdoZW4gdGhlIGFkbWluIGhhcyBkaXNhYmxlZCBoeXBlcnRocmVhZGluZyBpbgp0aGUgZmly
bXdhcmUuCgpUaGUgd2F5IHRvIGZpeCB0aGlzIGlzIHVzaW5nIHRoZSBNU1JfSU5URUxfQ09SRV9U
SFJFQURfQ09VTlQuICBTZXZlcmFsIHVwZGF0ZXMKdG8gdGhlIEludGVsIE1TUiBkb2N1bWVudGF0
aW9uIGFyZSBleHBlY3RlZCB0byBiZSBmb3J0aGNvbWluZy4KClNlZSBpbmRpdmlkdWFsIHBhdGNo
ZXMgZm9yIGRldGFpbHMuCgpBbmRyZXcgQ29vcGVyICgzKToKICB4ODYvc3BlYy1jdHJsOiBSZXBv
c2l0aW9uIHRoZSBYUFRJIGNvbW1hbmQgbGluZSBwYXJzaW5nIGxvZ2ljCiAgeDg2L21zcjogRGVm
aW5pdGlvbnMgZm9yIE1TUl9JTlRFTF9DT1JFX1RIUkVBRF9DT1VOVAogIHg4Ni9ib290OiBEZXRl
Y3QgdGhlIGZpcm13YXJlIFNNVCBzZXR0aW5nIGNvcnJlY3RseSBvbiBJbnRlbCBoYXJkd2FyZQoK
IHhlbi9hcmNoL3g4Ni9jcHUvYW1kLmMgICAgICAgICAgfCAgIDIgKy0KIHhlbi9hcmNoL3g4Ni9t
c3IuYyAgICAgICAgICAgICAgfCAgIDIgKwogeGVuL2FyY2gveDg2L3NwZWNfY3RybC5jICAgICAg
ICB8IDE4MiArKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tCiB4ZW4vaW5j
bHVkZS9hc20teDg2L21zci1pbmRleC5oIHwgICA0ICsKIDQgZmlsZXMgY2hhbmdlZCwgMTE5IGlu
c2VydGlvbnMoKyksIDcxIGRlbGV0aW9ucygtKQoKLS0gCjIuMS40CgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
