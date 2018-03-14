From: julien.grall@arm.com
Subject: [PATCH v5 02/16] xen/arm: setup: use maddr_to_mfn
	rather than _mfn(paddr_to_pfn(...))
Date: Wed, 14 Mar 2018 18:19:55 +0000
Message-ID: <20180314182009.14274-3-julien.grall@arm.com>
References: <20180314182009.14274-1-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180314182009.14274-1-julien.grall@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xen.org
Cc: Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

RnJvbTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KClRoZSBjb25zdHJ1Y3Rp
b24gX21mbihwYWRkcl90b19wZm4oLi4uKSkgY2FuIGJlIHNpbXBsaWZpZWQgYnkgdXNpbmcKbWFk
ZHJfdG9fbWZuLgoKU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJt
LmNvbT4KCi0tLQpDYzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3Jn
PgoKICAgIENoYW5nZXMgaW4gdjQ6CiAgICAgICAgLSBQYXRjaCBhZGRlZAotLS0KIHhlbi9hcmNo
L2FybS9zZXR1cC5jIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAy
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9zZXR1cC5jIGIveGVuL2Fy
Y2gvYXJtL3NldHVwLmMKaW5kZXggNDYyNzM2NjMzYi4uOWUxNDUwYjdkNCAxMDA2NDQKLS0tIGEv
eGVuL2FyY2gvYXJtL3NldHVwLmMKKysrIGIveGVuL2FyY2gvYXJtL3NldHVwLmMKQEAgLTI2OCw4
ICsyNjgsOCBAQCB2b2lkIF9faW5pdCBkaXNjYXJkX2luaXRpYWxfbW9kdWxlcyh2b2lkKQogICAg
ICAgICBpZiAoIG1pLT5tb2R1bGVbaV0ua2luZCA9PSBCT09UTU9EX1hFTiApCiAgICAgICAgICAg
ICBjb250aW51ZTsKIAotICAgICAgICBpZiAoICFtZm5fdmFsaWQoX21mbihwYWRkcl90b19wZm4o
cykpKSB8fAotICAgICAgICAgICAgICFtZm5fdmFsaWQoX21mbihwYWRkcl90b19wZm4oZSkpKSkK
KyAgICAgICAgaWYgKCAhbWZuX3ZhbGlkKG1hZGRyX3RvX21mbihzKSkgfHwKKyAgICAgICAgICAg
ICAhbWZuX3ZhbGlkKG1hZGRyX3RvX21mbihlKSkgKQogICAgICAgICAgICAgY29udGludWU7CiAK
ICAgICAgICAgZHRfdW5yZXNlcnZlZF9yZWdpb25zKHMsIGUsIGluaXRfZG9taGVhcF9wYWdlcywg
MCk7Ci0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
