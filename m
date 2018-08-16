From: Zhenzhong Duan <zhenzhong.duan@oracle.com>
Subject: [PATCH] x86/mmcfg: Remove redundant code in
 pci_mmcfg_reject_broken()
Date: Wed, 15 Aug 2018 22:10:35 -0700 (PDT)
Message-ID: <e6e0f512-58f4-42ac-8813-0320850a24b7@default>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-Devel <xen-devel@lists.xen.org>
Cc: Andrew Cooper3 <andrew.cooper3@citrix.com>, JBeulich <JBeulich@suse.com>, Srinivas REDDY Eeda <srinivas.eeda@oracle.com>
List-Id: xen-devel@lists.xenproject.org

Tm8gZnVuY3Rpb25hbCBjaGFuZ2UuCgpTaWduZWQtb2ZmLWJ5OiBaaGVuemhvbmcgRHVhbiA8emhl
bnpob25nLmR1YW5Ab3JhY2xlLmNvbT4KLS0tCiB4ZW4vYXJjaC94ODYveDg2XzY0L21tY29uZmln
LXNoYXJlZC5jIHwgICAgMiAtLQogMSBmaWxlcyBjaGFuZ2VkLCAwIGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L3g4Nl82NC9tbWNvbmZpZy1z
aGFyZWQuYyBiL3hlbi9hcmNoL3g4Ni94ODZfNjQvbW1jb25maWctc2hhcmVkLmMKaW5kZXggN2Mz
YjdmZC4uNGE2Y2EyNiAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L3g4Nl82NC9tbWNvbmZpZy1z
aGFyZWQuYworKysgYi94ZW4vYXJjaC94ODYveDg2XzY0L21tY29uZmlnLXNoYXJlZC5jCkBAIC0z
NzEsOCArMzcxLDYgQEAgc3RhdGljIGJvb2xfdCBfX2luaXQgcGNpX21tY2ZnX3JlamVjdF9icm9r
ZW4odm9pZCkKICAgICAgICAgKHBjaV9tbWNmZ19jb25maWdbMF0uYWRkcmVzcyA9PSAwKSkKICAg
ICAgICAgcmV0dXJuIDA7CiAKLSAgICBjZmcgPSAmcGNpX21tY2ZnX2NvbmZpZ1swXTsKLQogICAg
IGZvciAoaSA9IDA7IGkgPCBwY2lfbW1jZmdfY29uZmlnX251bTsgaSsrKSB7CiAgICAgICAgIHU2
NCBhZGRyLCBzaXplOwogCi0tIAoxLjcuMwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
