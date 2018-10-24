From: "Bernhard M. Wiedemann" <bwiedemann@suse.de>
Subject: [PATCH] x86/efi: Do not insert timestamps in efi files
Date: Wed, 24 Oct 2018 10:03:50 +0200
Message-ID: <20181024080350.2449-1-bwiedemann@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xen.org
Cc: "Bernhard M. Wiedemann" <bwiedemann@suse.de>
List-Id: xen-devel@lists.xenproject.org

aW4gb3JkZXIgdG8gbWFrZSBidWlsZHMgcmVwcm9kdWNpYmxlLgpTZWUgaHR0cHM6Ly9yZXByb2R1
Y2libGUtYnVpbGRzLm9yZy8gZm9yIHdoeSB0aGlzIGlzIGdvb2QuCgpTaWduZWQtb2ZmLWJ5OiBC
ZXJuaGFyZCBNLiBXaWVkZW1hbm4gPGJ3aWVkZW1hbm5Ac3VzZS5kZT4KLS0tCiB4ZW4vYXJjaC94
ODYvTWFrZWZpbGUgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAt
LWdpdCBhL3hlbi9hcmNoL3g4Ni9NYWtlZmlsZSBiL3hlbi9hcmNoL3g4Ni9NYWtlZmlsZQppbmRl
eCAxNjJiMGI5NGMwLi4wNTJiZGIxZTI1IDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvTWFrZWZp
bGUKKysrIGIveGVuL2FyY2gveDg2L01ha2VmaWxlCkBAIC0xNTgsNiArMTU4LDcgQEAgbm90ZS5v
OiAkKFRBUkdFVCktc3ltcwogCiBFRklfTERGTEFHUyA9ICQocGF0c3Vic3QgLW0lLC1taTM4NnBl
cCwkKExERkxBR1MpKSAtLXN1YnN5c3RlbT0xMAogRUZJX0xERkxBR1MgKz0gLS1pbWFnZS1iYXNl
PSQoMSkgLS1zdGFjaz0wLDAgLS1oZWFwPTAsMCAtLXN0cmlwLWRlYnVnCitFRklfTERGTEFHUyAr
PSAtLW5vLWluc2VydC10aW1lc3RhbXAKIEVGSV9MREZMQUdTICs9IC0tc2VjdGlvbi1hbGlnbm1l
bnQ9MHgyMDAwMDAgLS1maWxlLWFsaWdubWVudD0weDIwCiBFRklfTERGTEFHUyArPSAtLW1ham9y
LWltYWdlLXZlcnNpb249JChYRU5fVkVSU0lPTikKIEVGSV9MREZMQUdTICs9IC0tbWlub3ItaW1h
Z2UtdmVyc2lvbj0kKFhFTl9TVUJWRVJTSU9OKQotLSAKMi4xNi40CgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
