From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH RFC 2/4] x86: report if PCID and INVPCID are
	supported
Date: Thu, 15 Feb 2018 12:10:38 +0000
Message-ID: <20180215121040.20585-3-wei.liu2@citrix.com>
References: <20180215121040.20585-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=zbre=fj=citrix.com=prvs=57767c78e=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1emING-0002Vh-8N
 for xen-devel@lists.xenproject.org; Thu, 15 Feb 2018 12:10:50 +0000
In-Reply-To: <20180215121040.20585-1-wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

U2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KLS0tCiB4ZW4vYXJj
aC94ODYvc2V0dXAuYyB8IDcgKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygr
KQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9zZXR1cC5jIGIveGVuL2FyY2gveDg2L3NldHVw
LmMKaW5kZXggYWM1MzBlY2UyYy4uODllNDI4NjVhNCAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2
L3NldHVwLmMKKysrIGIveGVuL2FyY2gveDg2L3NldHVwLmMKQEAgLTE3MDEsNiArMTcwMSwxMyBA
QCB2b2lkIF9faW5pdCBub3JldHVybiBfX3N0YXJ0X3hlbih1bnNpZ25lZCBsb25nIG1iaV9wKQog
ICAgICAgICAgICBjcHVfaGFzX254ID8gWEVOTE9HX0lORk8gOiBYRU5MT0dfV0FSTklORyAiV2Fy
bmluZzogIiwKICAgICAgICAgICAgY3B1X2hhc19ueCA/ICIiIDogIm5vdCAiKTsKIAorCisgICAg
cHJpbnRrKFhFTkxPR19JTkZPCisgICAgICAgICAgICJQQ0lEIChQcm9jZXNzLUNvbnRleHQgSURl
bnRpZmllcikgJXNzdXBwb3J0ZWRcbiIsCisgICAgICAgICAgIGNwdV9oYXNfcGNpZCA/ICIiIDog
Im5vdCAiKTsKKworICAgIHByaW50ayhYRU5MT0dfSU5GTyAiSU5WUENJRCAlc3N1cHBvcnRlZFxu
IiwgY3B1X2hhc19pbnZwY2lkID8gIiIgOiAibm90ICIpOworCiAgICAgLyoKICAgICAgKiBXZSdy
ZSBnb2luZyB0byBzZXR1cCBkb21haW4wIHVzaW5nIHRoZSBtb2R1bGUocykgdGhhdCB3ZSBzdGFz
aGVkIHNhZmVseQogICAgICAqIGFib3ZlIG91ciBoZWFwLiBUaGUgc2Vjb25kIG1vZHVsZSwgaWYg
cHJlc2VudCwgaXMgYW4gaW5pdHJkIHJhbWRpc2suCi0tIAoyLjExLjAKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
