From: Julien Grall <julien.grall@arm.com>
Subject: [for-4.11][PATCH v7 02/16] xen/arm: setup: use
 maddr_to_mfn rather than _mfn(paddr_to_pfn(...))
Date: Tue,  3 Apr 2018 16:32:37 +0100
Message-ID: <20180403153251.19595-3-julien.grall@arm.com>
References: <20180403153251.19595-1-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180403153251.19595-1-julien.grall@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xen.org
Cc: Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, George Dunlap <george.dunlap@citrix.com>
List-Id: xen-devel@lists.xenproject.org

U2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KUmV2aWV3
ZWQtYnk6IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT4KCi0tLQpDYzog
U3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgoKICAgIENoYW5nZXMg
aW4gdjY6CiAgICAgICAgLSBSZW1vdmUgdGhlIGp1c3RpZmljYXRpb24gZnJvbSB0aGUgY29tbWl0
IG1lc3NhZ2UKICAgICAgICAtIEFkZCBHZW9yZ2UncyByZXZpZXdlZC1ieQoKICAgIENoYW5nZXMg
aW4gdjQ6CiAgICAgICAgLSBQYXRjaCBhZGRlZAotLS0KIHhlbi9hcmNoL2FybS9zZXR1cC5jIHwg
NCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9zZXR1cC5jIGIveGVuL2FyY2gvYXJtL3NldHVwLmMK
aW5kZXggYjE3Nzk3ZGM5Ny4uMWNlNmEyNmU4NCAxMDA2NDQKLS0tIGEveGVuL2FyY2gvYXJtL3Nl
dHVwLmMKKysrIGIveGVuL2FyY2gvYXJtL3NldHVwLmMKQEAgLTI2OCw4ICsyNjgsOCBAQCB2b2lk
IF9faW5pdCBkaXNjYXJkX2luaXRpYWxfbW9kdWxlcyh2b2lkKQogICAgICAgICBpZiAoIG1pLT5t
b2R1bGVbaV0ua2luZCA9PSBCT09UTU9EX1hFTiApCiAgICAgICAgICAgICBjb250aW51ZTsKIAot
ICAgICAgICBpZiAoICFtZm5fdmFsaWQoX21mbihwYWRkcl90b19wZm4ocykpKSB8fAotICAgICAg
ICAgICAgICFtZm5fdmFsaWQoX21mbihwYWRkcl90b19wZm4oZSkpKSkKKyAgICAgICAgaWYgKCAh
bWZuX3ZhbGlkKG1hZGRyX3RvX21mbihzKSkgfHwKKyAgICAgICAgICAgICAhbWZuX3ZhbGlkKG1h
ZGRyX3RvX21mbihlKSkgKQogICAgICAgICAgICAgY29udGludWU7CiAKICAgICAgICAgZHRfdW5y
ZXNlcnZlZF9yZWdpb25zKHMsIGUsIGluaXRfZG9taGVhcF9wYWdlcywgMCk7Ci0tIAoyLjExLjAK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
