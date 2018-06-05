From: Julien Grall <julien.grall@arm.com>
Subject: [PATCH 6/7] xen/libfdt: Put all libfdt in init
Date: Tue,  5 Jun 2018 18:12:36 +0100
Message-ID: <20180605171237.30601-7-julien.grall@arm.com>
References: <20180605171237.30601-1-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180605171237.30601-1-julien.grall@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org, xen-devel@lists.xen.org
Cc: Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

TGliZmR0IGlzIHVzZWQgZm9yOgogICAgLSBVbmZsYXR0ZW4gdGhlIEZsYXR0ZW4gRGV2aWNlLVRy
ZWUgKEZEVCkgYmxvYgogICAgLSBDcmVhdGUgRGV2aWNlLVRyZWUgZm9yIHRoZSBIYXJkd2FyZS1E
b21haW4KCkJvdGggdXNlIGFyZSBkb25lIGR1cmluZyB0aGUgaW5pdGlhbGl6YXRpb24gb2YgWGVu
LiBTbyBtb3ZlIGFsbCB0aGUKbGliZmR0IHRvIGluaXQuCgpOb3RlIHRoYXQgdGhlIHJ1bmVzIHdh
cyBib3Jyb3dlZCBmcm9tIGxpYmVsZiBNYWtlZmlsZS4KClNpZ25lZC1vZmYtYnk6IEp1bGllbiBH
cmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Ci0tLQogeGVuL2NvbW1vbi9saWJmZHQvTWFrZWZp
bGUgfCAxMCArKysrKysrKystCiAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAxIGRl
bGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9saWJmZHQvTWFrZWZpbGUgYi94ZW4v
Y29tbW9uL2xpYmZkdC9NYWtlZmlsZQppbmRleCA3NTc4ZmU5YzUwLi5kODFmNTRiNmI4IDEwMDY0
NAotLS0gYS94ZW4vY29tbW9uL2xpYmZkdC9NYWtlZmlsZQorKysgYi94ZW4vY29tbW9uL2xpYmZk
dC9NYWtlZmlsZQpAQCAtMSw1ICsxLDEzIEBACiBpbmNsdWRlIE1ha2VmaWxlLmxpYmZkdAogCi1v
YmoteSArPSAkKExJQkZEVF9PQkpTKQorU0VDVElPTlMgOj0gdGV4dCBkYXRhICQoU1BFQ0lBTF9E
QVRBX1NFQ1RJT05TKQorCitvYmoteSArPSBsaWJmZHQubwogCiBDRkxBR1MgKz0gLUkkKEJBU0VE
SVIpL2luY2x1ZGUveGVuL2xpYmZkdC8KKworbGliZmR0Lm86IGxpYmZkdC10ZW1wLm8gTWFrZWZp
bGUKKwkkKE9CSkNPUFkpICQoZm9yZWFjaCBzLCQoU0VDVElPTlMpLC0tcmVuYW1lLXNlY3Rpb24g
LiQocyk9LmluaXQuJChzKSkgJDwgJEAKKworbGliZmR0LXRlbXAubzogJChMSUJGRFRfT0JKUykK
KwkkKExEKSAkKExERkxBR1MpIC1yIC1vICRAICReCi0tIAoyLjExLjAKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
