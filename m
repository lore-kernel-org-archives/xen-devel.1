From: Julien Grall <julien.grall@arm.com>
Subject: [PATCH v2 15/21] xen/arm: Remove unnecessary includes
 in asm/mmio.h
Date: Wed, 31 Oct 2018 18:13:07 +0000
Message-ID: <20181031181313.8028-16-julien.grall@arm.com>
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
aW5jbHVkZS9hc20tYXJtL21taW8uaCB8IDIgLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vbW1pby5oIGIveGVuL2luY2x1
ZGUvYXNtLWFybS9tbWlvLmgKaW5kZXggM2VkM2Y4MmJmNy4uOGRiZmIyNzY4MiAxMDA2NDQKLS0t
IGEveGVuL2luY2x1ZGUvYXNtLWFybS9tbWlvLmgKKysrIGIveGVuL2luY2x1ZGUvYXNtLWFybS9t
bWlvLmgKQEAgLTIzLDggKzIzLDYgQEAKICNpbmNsdWRlIDx4ZW4vcndsb2NrLmg+CiAKICNpbmNs
dWRlIDxhc20vaHNyLmg+Ci0jaW5jbHVkZSA8YXNtL3Byb2Nlc3Nvci5oPgotI2luY2x1ZGUgPGFz
bS9yZWdzLmg+CiAKICNkZWZpbmUgTUFYX0lPX0hBTkRMRVIgIDE2CiAKLS0gCjIuMTEuMAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
