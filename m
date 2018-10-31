From: Julien Grall <julien.grall@arm.com>
Subject: [PATCH v2 17/21] xen/arm: Remove unnecessary includes
 in asm/p2m.h
Date: Wed, 31 Oct 2018 18:13:09 +0000
Message-ID: <20181031181313.8028-18-julien.grall@arm.com>
References: <20181031181313.8028-1-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20181031181313.8028-1-julien.grall@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xen.org
Cc: Julien Grall <julien.grall@arm.com>, sstabellini@kernel.org, andrii_anisov@epam.com
List-Id: xen-devel@lists.xenproject.org

U2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KUmV2aWV3
ZWQtYnk6IEFuZHJpaSBBbmlzb3YgPGFuZHJpaV9hbmlzb3ZAZXBhbS5jb20+CgotLS0KICAgIENo
YW5nZXMgaW4gdjI6CiAgICAgICAgLSBBZGQgQW5kcmlpJ3MgcmV2aWV3ZWQtYnkKLS0tCiB4ZW4v
aW5jbHVkZS9hc20tYXJtL3AybS5oIHwgMyAtLS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vcDJtLmggYi94ZW4vaW5jbHVk
ZS9hc20tYXJtL3AybS5oCmluZGV4IGMwMzU1NzU0NGEuLmJlNTgxMjVmYjcgMTAwNjQ0Ci0tLSBh
L3hlbi9pbmNsdWRlL2FzbS1hcm0vcDJtLmgKKysrIGIveGVuL2luY2x1ZGUvYXNtLWFybS9wMm0u
aApAQCAtNSwxMCArNSw3IEBACiAjaW5jbHVkZSA8eGVuL3JhZGl4LXRyZWUuaD4KICNpbmNsdWRl
IDx4ZW4vcndsb2NrLmg+CiAjaW5jbHVkZSA8eGVuL21lbV9hY2Nlc3MuaD4KLSNpbmNsdWRlIDxw
dWJsaWMvdm1fZXZlbnQuaD4gLyogZm9yIHZtX2V2ZW50X3Jlc3BvbnNlX3QgKi8KLSNpbmNsdWRl
IDxwdWJsaWMvbWVtb3J5Lmg+CiAjaW5jbHVkZSA8eGVuL3AybS1jb21tb24uaD4KLSNpbmNsdWRl
IDxwdWJsaWMvbWVtb3J5Lmg+CiAKICNkZWZpbmUgcGFkZHJfYml0cyBQQUREUl9CSVRTCiAKLS0g
CjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
