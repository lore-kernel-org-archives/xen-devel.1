From: Julien Grall <julien.grall@arm.com>
Subject: [PATCH 15/22] xen/arm: Remove unnecessary includes in
 asm/mmio.h
Date: Thu, 18 Oct 2018 14:21:02 +0100
Message-ID: <20181018132109.31192-16-julien.grall@arm.com>
References: <20181018132109.31192-1-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20181018132109.31192-1-julien.grall@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xen.org
Cc: Julien Grall <julien.grall@arm.com>, sstabellini@kernel.org
List-Id: xen-devel@lists.xenproject.org

U2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KLS0tCiB4
ZW4vaW5jbHVkZS9hc20tYXJtL21taW8uaCB8IDIgLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vbW1pby5oIGIveGVuL2lu
Y2x1ZGUvYXNtLWFybS9tbWlvLmgKaW5kZXggM2VkM2Y4MmJmNy4uOGRiZmIyNzY4MiAxMDA2NDQK
LS0tIGEveGVuL2luY2x1ZGUvYXNtLWFybS9tbWlvLmgKKysrIGIveGVuL2luY2x1ZGUvYXNtLWFy
bS9tbWlvLmgKQEAgLTIzLDggKzIzLDYgQEAKICNpbmNsdWRlIDx4ZW4vcndsb2NrLmg+CiAKICNp
bmNsdWRlIDxhc20vaHNyLmg+Ci0jaW5jbHVkZSA8YXNtL3Byb2Nlc3Nvci5oPgotI2luY2x1ZGUg
PGFzbS9yZWdzLmg+CiAKICNkZWZpbmUgTUFYX0lPX0hBTkRMRVIgIDE2CiAKLS0gCjIuMTEuMAoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
