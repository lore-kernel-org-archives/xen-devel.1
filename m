From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 1/4] x86/vvmx: Drop unused CASE_{GET,
 SET}_REG() macros
Date: Thu, 15 Nov 2018 13:52:47 +0000
Message-ID: <1542289970-32709-2-git-send-email-andrew.cooper3@citrix.com>
References: <1542289970-32709-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1542289970-32709-1-git-send-email-andrew.cooper3@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xen.org>
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhlc2UgaGF2ZSBiZWVuIG9ic29sZXRlIHNpbmNlIGMvcyAwNTNhZTIzMCAieDg2L3Z2bXg6IFJl
bW92ZSBlbnVtCnZteF9yZWdzX2VuYyIuCgpTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxh
bmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgotLS0KQ0M6IEphbiBCZXVsaWNoIDxKQmV1bGljaEBz
dXNlLmNvbT4KQ0M6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+CkNDOiBSb2dlciBQYXUg
TW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KQ0M6IFNlcmdleSBEeWFzbGkgPHNlcmdleS5k
eWFzbGlAY2l0cml4LmNvbT4KQ0M6IEp1biBOYWthamltYSA8anVuLm5ha2FqaW1hQGludGVsLmNv
bT4KQ0M6IEtldmluIFRpYW4gPGtldmluLnRpYW5AaW50ZWwuY29tPgotLS0KIHhlbi9hcmNoL3g4
Ni9odm0vdm14L3Z2bXguYyB8IDUgLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA1IGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9odm0vdm14L3Z2bXguYyBiL3hlbi9hcmNoL3g4
Ni9odm0vdm14L3Z2bXguYwppbmRleCA4ODAyMWFmLi5jMjk2NjYwIDEwMDY0NAotLS0gYS94ZW4v
YXJjaC94ODYvaHZtL3ZteC92dm14LmMKKysrIGIveGVuL2FyY2gveDg2L2h2bS92bXgvdnZteC5j
CkBAIC0yMDcsMTEgKzIwNyw2IEBAIHN0cnVjdCB2bXhfaW5zdF9kZWNvZGVkIHsKICAgICB1bnNp
Z25lZCBpbnQgcmVnMjsKIH07CiAKLSNkZWZpbmUgQ0FTRV9TRVRfUkVHKFJFRywgcmVnKSAgICAg
IFwKLSAgICBjYXNlIFZNWF9SRUdfICMjIFJFRzogcmVncy0+cmVnID0gdmFsdWU7IGJyZWFrCi0j
ZGVmaW5lIENBU0VfR0VUX1JFRyhSRUcsIHJlZykgICAgICBcCi0gICAgY2FzZSBWTVhfUkVHXyAj
IyBSRUc6IHZhbHVlID0gcmVncy0+cmVnOyBicmVhawotCiBzdGF0aWMgaW50IHZ2bWNzX29mZnNl
dCh1MzIgd2lkdGgsIHUzMiB0eXBlLCB1MzIgaW5kZXgpCiB7CiAgICAgaW50IG9mZnNldDsKLS0g
CjIuMS40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
