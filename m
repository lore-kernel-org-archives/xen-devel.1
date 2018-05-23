From: Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 02/10] arm: make it possible to disable
 HAS_GICV3
Date: Tue, 22 May 2018 17:25:00 -0700
Message-ID: <1527035108-15051-2-git-send-email-sstabellini@kernel.org>
References: <alpine.DEB.2.10.1805221719560.24793@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <alpine.DEB.2.10.1805221719560.24793@sstabellini-ThinkPad-X260>
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
IFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+CgotLS0KQ2hhbmdlcyBpbiB2MzoK
LSByZW1vdmUgYW55IGNoYW5nZXMgdG8gTUVNX0FDQ0VTUwotIHVwZGF0ZSBjb21taXQgbWVzc2Fn
ZQoKQ2hhbmdlcyBpbiB2MjoKLSBtYWtlIEhBU19HSUN2MyBkZXBlbmQgb24gQVJNXzY0Ci0gcmVt
b3ZlIG1vZGlmaWNhdGlvbnMgdG8gQVJNX0hETENEIGtjb25maWcsIGl0IGhhcyBiZWVuIHJlbW92
ZWQKLS0tCiB4ZW4vYXJjaC9hcm0vS2NvbmZpZyB8IDggKysrKysrKy0KIDEgZmlsZSBjaGFuZ2Vk
LCA3IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC9h
cm0vS2NvbmZpZyBiL3hlbi9hcmNoL2FybS9LY29uZmlnCmluZGV4IDRkYzdlZjUuLmZiNjlhNjYg
MTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL2FybS9LY29uZmlnCisrKyBiL3hlbi9hcmNoL2FybS9LY29u
ZmlnCkBAIC0xMiw3ICsxMiw2IEBAIGNvbmZpZyBBUk1fMzIKIGNvbmZpZyBBUk1fNjQKIAlkZWZf
Ym9vbCB5CiAJZGVwZW5kcyBvbiA2NEJJVAotCXNlbGVjdCBIQVNfR0lDVjMKIAogY29uZmlnIEFS
TQogCWRlZl9ib29sIHkKQEAgLTQyLDYgKzQxLDEzIEBAIGNvbmZpZyBBQ1BJCiAKIGNvbmZpZyBI
QVNfR0lDVjMKIAlib29sCisJcHJvbXB0ICJHSUN2MyBkcml2ZXIiCisJZGVwZW5kcyBvbiBBUk1f
NjQKKwlkZWZhdWx0IHkKKwktLS1oZWxwLS0tCisKKwkgIERyaXZlciBmb3IgdGhlIEFSTSBHZW5l
cmljIEludGVycnVwdCBDb250cm9sbGVyIHYzLgorCSAgSWYgdW5zdXJlLCBzYXkgWQogCiBjb25m
aWcgSEFTX0lUUwogICAgICAgICBib29sCi0tIAoxLjkuMQoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
