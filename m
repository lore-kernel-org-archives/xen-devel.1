From: Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v5 02/10] arm: make it possible to disable
 HAS_GICV3
Date: Mon,  4 Jun 2018 10:24:03 -0700
Message-ID: <1528133051-924-2-git-send-email-sstabellini@kernel.org>
References: <alpine.DEB.2.10.1806041020340.23991@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <alpine.DEB.2.10.1806041020340.23991@sstabellini-ThinkPad-X260>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: julien.grall@arm.com
Cc: artem_mygaiev@epam.com, lars.kurth@citrix.com, sstabellini@kernel.org, andrii_anisov@epam.com, dfaggioli@suse.com, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

VG9kYXkgaXQgaXMgYSBzaWxlbnQgb3B0aW9uLiBUaGlzIHBhdGNoIGFkZHMgYSBvbmUgbGluZSBk
ZXNjcmlwdGlvbiBhbmQKbWFrZXMgaXQgb3B0aW9uYWwuCgpTaWduZWQtb2ZmLWJ5OiBTdGVmYW5v
IFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+CkFja2VkLWJ5OiBKdWxpZW4gR3Jh
bGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgoKLS0tCkNoYW5nZXMgaW4gdjM6Ci0gcmVtb3ZlIGFu
eSBjaGFuZ2VzIHRvIE1FTV9BQ0NFU1MKLSB1cGRhdGUgY29tbWl0IG1lc3NhZ2UKCkNoYW5nZXMg
aW4gdjI6Ci0gbWFrZSBIQVNfR0lDdjMgZGVwZW5kIG9uIEFSTV82NAotIHJlbW92ZSBtb2RpZmlj
YXRpb25zIHRvIEFSTV9IRExDRCBrY29uZmlnLCBpdCBoYXMgYmVlbiByZW1vdmVkCi0tLQogeGVu
L2FyY2gvYXJtL0tjb25maWcgfCA4ICsrKysrKystCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRp
b25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL0tjb25maWcg
Yi94ZW4vYXJjaC9hcm0vS2NvbmZpZwppbmRleCA0ZGM3ZWY1Li5mYjY5YTY2IDEwMDY0NAotLS0g
YS94ZW4vYXJjaC9hcm0vS2NvbmZpZworKysgYi94ZW4vYXJjaC9hcm0vS2NvbmZpZwpAQCAtMTIs
NyArMTIsNiBAQCBjb25maWcgQVJNXzMyCiBjb25maWcgQVJNXzY0CiAJZGVmX2Jvb2wgeQogCWRl
cGVuZHMgb24gNjRCSVQKLQlzZWxlY3QgSEFTX0dJQ1YzCiAKIGNvbmZpZyBBUk0KIAlkZWZfYm9v
bCB5CkBAIC00Miw2ICs0MSwxMyBAQCBjb25maWcgQUNQSQogCiBjb25maWcgSEFTX0dJQ1YzCiAJ
Ym9vbAorCXByb21wdCAiR0lDdjMgZHJpdmVyIgorCWRlcGVuZHMgb24gQVJNXzY0CisJZGVmYXVs
dCB5CisJLS0taGVscC0tLQorCisJICBEcml2ZXIgZm9yIHRoZSBBUk0gR2VuZXJpYyBJbnRlcnJ1
cHQgQ29udHJvbGxlciB2My4KKwkgIElmIHVuc3VyZSwgc2F5IFkKIAogY29uZmlnIEhBU19JVFMK
ICAgICAgICAgYm9vbAotLSAKMS45LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
