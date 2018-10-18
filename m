From: Julien Grall <julien.grall@arm.com>
Subject: [PATCH 17/22] xen/arm: Remove unnecessary includes in
 asm/p2m.h
Date: Thu, 18 Oct 2018 14:21:04 +0100
Message-ID: <20181018132109.31192-18-julien.grall@arm.com>
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
ZW4vaW5jbHVkZS9hc20tYXJtL3AybS5oIHwgMyAtLS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vcDJtLmggYi94ZW4vaW5j
bHVkZS9hc20tYXJtL3AybS5oCmluZGV4IGMwMzU1NzU0NGEuLmJlNTgxMjVmYjcgMTAwNjQ0Ci0t
LSBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vcDJtLmgKKysrIGIveGVuL2luY2x1ZGUvYXNtLWFybS9w
Mm0uaApAQCAtNSwxMCArNSw3IEBACiAjaW5jbHVkZSA8eGVuL3JhZGl4LXRyZWUuaD4KICNpbmNs
dWRlIDx4ZW4vcndsb2NrLmg+CiAjaW5jbHVkZSA8eGVuL21lbV9hY2Nlc3MuaD4KLSNpbmNsdWRl
IDxwdWJsaWMvdm1fZXZlbnQuaD4gLyogZm9yIHZtX2V2ZW50X3Jlc3BvbnNlX3QgKi8KLSNpbmNs
dWRlIDxwdWJsaWMvbWVtb3J5Lmg+CiAjaW5jbHVkZSA8eGVuL3AybS1jb21tb24uaD4KLSNpbmNs
dWRlIDxwdWJsaWMvbWVtb3J5Lmg+CiAKICNkZWZpbmUgcGFkZHJfYml0cyBQQUREUl9CSVRTCiAK
LS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
