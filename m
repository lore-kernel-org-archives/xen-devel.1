From: Sergey Dyasli <sergey.dyasli@citrix.com>
Subject: [PATCH v1 0/6] x86/vvmx: various fixes
Date: Fri, 12 Oct 2018 16:27:53 +0100
Message-ID: <20181012152800.7921-1-sergey.dyasli@citrix.com>
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
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>
List-Id: xen-devel@lists.xenproject.org

VGhlc2Ugd2VyZSBmb3VuZCBieSBydW5uaW5nIG5lc3RlZCBWTVggdGVzdHMgZnJvbSBrdm0tdW5p
dC10ZXN0cy4KClNlcmdleSBEeWFzbGkgKDYpOgogIHg4Ni92dm14OiBpbnRyb2R1Y2UgdnZtY3hf
dmFsaWQoKQogIHg4Ni92dm14OiBjb3JyZWN0IHZtZmFpbCgpIHVzYWdlIGZvciB2bXB0cmxkIGFu
ZCB2bWNsZWFyCiAgeDg2L3Z2bXg6IGFkZCBWTVhfSU5TTl9WTVBUUkxEX1dJVEhfVk1YT05fUFRS
IGVycm5vCiAgeDg2L3Z2bXg6IGFkZCBWTVhfSU5TTl9WTUNMRUFSX1dJVEhfVk1YT05fUFRSIGVy
cm5vCiAgeDg2L3Z2bXg6IGNvcnJlY3RseSByZXBvcnQgdnZtY3Mgc2l6ZQogIHg4Ni92dm14OiBm
aXggSS9PIGFuZCBNU1IgYml0bWFwcyBtYXBwaW5nCgogeGVuL2FyY2gveDg2L2h2bS92bXgvdnZt
eC5jICAgICAgICAgfCAxNjQgKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLQogeGVuL2luY2x1
ZGUvYXNtLXg4Ni9odm0vbmVzdGVkaHZtLmggfCAgIDUgKwogeGVuL2luY2x1ZGUvYXNtLXg4Ni9o
dm0vdm14L3ZtY3MuaCAgfCAgIDIgKwogMyBmaWxlcyBjaGFuZ2VkLCAxMTcgaW5zZXJ0aW9ucygr
KSwgNTQgZGVsZXRpb25zKC0pCgotLSAKMi4xNy4xCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
