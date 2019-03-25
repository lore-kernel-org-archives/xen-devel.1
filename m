From: Pu Wen <puwen@hygon.cn>
Subject: [PATCH v3 12/14] x86/traps: Add Hygon Dhyana support
Date: Mon, 25 Mar 2019 21:31:55 +0800
Message-ID: <48dc73b7ece7e33785b118eb1b0853eda0ff5b31.1553520193.git.puwen@hygon.cn>
References: <cover.1553520193.git.puwen@hygon.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=4Lz9=R4=hygon.cn=puwen@srs-us1.protection.inumbo.net>)
 id 1h8Plh-0003VL-1w
 for xen-devel@lists.xenproject.org; Mon, 25 Mar 2019 13:36:01 +0000
In-Reply-To: <cover.1553520193.git.puwen@hygon.cn>
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
ZW4gPHB1d2VuQGh5Z29uLmNuPgpBY2tlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2Uu
Y29tPgotLS0KIHhlbi9hcmNoL3g4Ni90cmFwcy5jIHwgMyArKysKIDEgZmlsZSBjaGFuZ2VkLCAz
IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvdHJhcHMuYyBiL3hlbi9h
cmNoL3g4Ni90cmFwcy5jCmluZGV4IDA1ZGRjMzkuLjk3YmY5ZTIgMTAwNjQ0Ci0tLSBhL3hlbi9h
cmNoL3g4Ni90cmFwcy5jCisrKyBiL3hlbi9hcmNoL3g4Ni90cmFwcy5jCkBAIC0xOTczLDYgKzE5
NzMsOSBAQCBzdGF0aWMgdW5zaWduZWQgaW50IGNhbGNfbGVyX21zcih2b2lkKQogICAgICAgICAg
ICAgcmV0dXJuIE1TUl9JQTMyX0xBU1RJTlRGUk9NSVA7CiAgICAgICAgIH0KICAgICAgICAgYnJl
YWs7CisKKyAgICBjYXNlIFg4Nl9WRU5ET1JfSFlHT046CisgICAgICAgIHJldHVybiBNU1JfSUEz
Ml9MQVNUSU5URlJPTUlQOwogICAgIH0KIAogICAgIHJldHVybiAwOwotLSAKMi43LjQKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
