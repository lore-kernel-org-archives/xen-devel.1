From: Pu Wen <puwen@hygon.cn>
Subject: [PATCH 12/15] x86/traps: Add Hygon Dhyana support
Date: Thu, 20 Dec 2018 21:15:29 +0800
Message-ID: <ae89c14abbb1468e3c428ff04ef442eccd190184.1545284932.git.puwen@hygon.cn>
References: <cover.1545284932.git.puwen@hygon.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=VrHp=O5=hygon.cn=puwen@srs-us1.protection.inumbo.net>)
 id 1gZyBE-0002YL-NI
 for xen-devel@lists.xenproject.org; Thu, 20 Dec 2018 13:16:00 +0000
In-Reply-To: <cover.1545284932.git.puwen@hygon.cn>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Pu Wen <puwen@hygon.cn>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhlIEh5Z29uIERoeWFuYSBwcm9jZXNzb3IgaGFzIHRoZSBtZXRob2xkIHRvIGdldCB0aGUgbGFz
dCBleGNlcHRpb24Kc291cmNlIElQIGZyb20gTVNSMDAwMF8wMURELiBTbyBhZGQgc3VwcG9ydCBm
b3IgaXQgaWYgdGhlIGJvb3QgcGFyYW0KbGVyIGlzIHRydWUuCgpTaWduZWQtb2ZmLWJ5OiBQdSBX
ZW4gPHB1d2VuQGh5Z29uLmNuPgotLS0KIHhlbi9hcmNoL3g4Ni90cmFwcy5jIHwgMiArKwogMSBm
aWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni90
cmFwcy5jIGIveGVuL2FyY2gveDg2L3RyYXBzLmMKaW5kZXggMDVkZGMzOS4uYmQ1YzE2ZSAxMDA2
NDQKLS0tIGEveGVuL2FyY2gveDg2L3RyYXBzLmMKKysrIGIveGVuL2FyY2gveDg2L3RyYXBzLmMK
QEAgLTE5NzMsNiArMTk3Myw4IEBAIHN0YXRpYyB1bnNpZ25lZCBpbnQgY2FsY19sZXJfbXNyKHZv
aWQpCiAgICAgICAgICAgICByZXR1cm4gTVNSX0lBMzJfTEFTVElOVEZST01JUDsKICAgICAgICAg
fQogICAgICAgICBicmVhazsKKyAgICBjYXNlIFg4Nl9WRU5ET1JfSFlHT046CisgICAgICAgIHJl
dHVybiBNU1JfSUEzMl9MQVNUSU5URlJPTUlQOwogICAgIH0KIAogICAgIHJldHVybiAwOwotLSAK
Mi43LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
