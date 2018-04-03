From: Julien Grall <julien.grall@arm.com>
Subject: [for-4.11][PATCH v7 05/16] xen/arm: mm: Remove unused
 relinquish_shared_pages
Date: Tue,  3 Apr 2018 16:32:40 +0100
Message-ID: <20180403153251.19595-6-julien.grall@arm.com>
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

cmVsaW5xdWlzaF9zaGFyZWRfcGFnZXMgaXMgbmV2ZXIgY2FsbGVkIG9uIEFybS4KClNpZ25lZC1v
ZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+ClJldmlld2VkLWJ5OiBH
ZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+CgotLS0KCkNjOiBTdGVmYW5v
IFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+CgogICAgQ2hhbmdlcyBpbiB2NjoK
ICAgICAgICAtIEFkZCBHZW9yZ2UncyByZXZpZXdlZC1ieQoKICAgIENoYW5nZXMgaW4gdjQ6CiAg
ICAgICAgLSBQYXRjaCBhZGRlZAotLS0KIHhlbi9pbmNsdWRlL2FzbS1hcm0vbW0uaCB8IDQgLS0t
LQogMSBmaWxlIGNoYW5nZWQsIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2luY2x1
ZGUvYXNtLWFybS9tbS5oIGIveGVuL2luY2x1ZGUvYXNtLWFybS9tbS5oCmluZGV4IGNhYmIxZGFm
MzAuLjA5YmVjNjdmNjMgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vbW0uaAorKysg
Yi94ZW4vaW5jbHVkZS9hc20tYXJtL21tLmgKQEAgLTMxNCwxMCArMzE0LDYgQEAgc3RydWN0IHBh
Z2VfaW5mbyAqZ2V0X3BhZ2VfZnJvbV9ndmEoc3RydWN0IHZjcHUgKnYsIHZhZGRyX3QgdmEsCiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIGZsYWdzKTsK
IAogc3RhdGljIGlubGluZSB2b2lkIHB1dF9nZm4oc3RydWN0IGRvbWFpbiAqZCwgdW5zaWduZWQg
bG9uZyBnZm4pIHt9Ci1zdGF0aWMgaW5saW5lIGludCByZWxpbnF1aXNoX3NoYXJlZF9wYWdlcyhz
dHJ1Y3QgZG9tYWluICpkKQotewotICAgIHJldHVybiAwOwotfQogCiAvKgogICogQXJtIGRvZXMg
bm90IGhhdmUgYW4gTTJQLCBidXQgY29tbW9uIGNvZGUgZXhwZWN0cyBhIGhhbmRmdWwgb2YKLS0g
CjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
