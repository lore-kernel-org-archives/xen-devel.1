From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH 18/34] x86/amd: skip OSVW function calls if
 !CONFIG_HVM
Date: Fri, 17 Aug 2018 16:12:36 +0100
Message-ID: <803c213fc809d8d7b648a4e174a08275ca3f1864.1534518694.git-series.wei.liu2@citrix.com>
References: <cover.f5351150954129956fcf53a7781206b6295df78d.1534518694.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=v/z7=la=citrix.com=prvs=760f4e3ef=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fqggK-0001li-9q
 for xen-devel@lists.xenproject.org; Fri, 17 Aug 2018 15:28:56 +0000
In-Reply-To: <cover.f5351150954129956fcf53a7781206b6295df78d.1534518694.git-series.wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

VGhlIHR3byBmdW5jdGlvbnMgYXJlIG5vdCBuZWVkZWQgd2hlbiBIVk0gaXMgbm90IHN1cHBvcnRl
ZCBpbgpoeXBlcnZpc29yLgoKTm90ZSB0aGF0IHVzaW5nIGh2bV9lbmFibGVkIHdvbid0IHdvcmsg
YmVjYXVzZSBlYXJseV9taWNyb2NvZGVfaW5pdApnZXRzIHRvIGNwdV9yZXF1ZXN0X21pY3JvY29k
ZSBiZWZvcmUgaHZtX2VuYWJsZWQgaXMgc2V0IGluIHByZXNtcCBpbml0CmNhbGwgc3RhZ2UuCgpT
aWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgotLS0KIHhlbi9hcmNo
L3g4Ni9taWNyb2NvZGVfYW1kLmMgfCA0ICsrKysKIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlv
bnMoKykKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvbWljcm9jb2RlX2FtZC5jIGIveGVuL2Fy
Y2gveDg2L21pY3JvY29kZV9hbWQuYwppbmRleCA1M2Y5ZjU0Li5mYmE0NGNjIDEwMDY0NAotLS0g
YS94ZW4vYXJjaC94ODYvbWljcm9jb2RlX2FtZC5jCisrKyBiL3hlbi9hcmNoL3g4Ni9taWNyb2Nv
ZGVfYW1kLmMKQEAgLTU1MCw3ICs1NTAsOSBAQCBzdGF0aWMgaW50IGNwdV9yZXF1ZXN0X21pY3Jv
Y29kZSh1bnNpZ25lZCBpbnQgY3B1LCBjb25zdCB2b2lkICpidWYsCiAgICAgICAgIHhmcmVlKG1j
X29sZCk7CiAKICAgb3V0OgorI2lmIENPTkZJR19IVk0KICAgICBzdm1faG9zdF9vc3Z3X2luaXQo
KTsKKyNlbmRpZgogCiAgICAgLyoKICAgICAgKiBJbiBzb21lIGNhc2VzIHdlIG1heSByZXR1cm4g
YW4gZXJyb3IgZXZlbiBpZiBwcm9jZXNzb3IncyBtaWNyb2NvZGUgaGFzCkBAIC02MDksNiArNjEx
LDcgQEAgZXJyMToKIAogc3RhdGljIGludCBzdGFydF91cGRhdGUodm9pZCkKIHsKKyNpZiBDT05G
SUdfSFZNCiAgICAgLyoKICAgICAgKiBXZSBhc3N1bWUgaGVyZSB0aGF0IHN2bV9ob3N0X29zdndf
aW5pdCgpIHdpbGwgYmUgY2FsbGVkIG9uIGVhY2ggY3B1IChmcm9tCiAgICAgICogY3B1X3JlcXVl
c3RfbWljcm9jb2RlKCkpLgpAQCAtNjE5LDYgKzYyMiw3IEBAIHN0YXRpYyBpbnQgc3RhcnRfdXBk
YXRlKHZvaWQpCiAgICAgICogc3VwcG9ydGluZyBPU1ZXIHNvIHdlIHdpbGwgbm90IGRlYWwgd2l0
aCB0aGlzIHBvc3NpYmlsaXR5LgogICAgICAqLwogICAgIHN2bV9ob3N0X29zdndfcmVzZXQoKTsK
KyNlbmRpZgogCiAgICAgcmV0dXJuIDA7CiB9Ci0tIApnaXQtc2VyaWVzIDAuOS4xCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
