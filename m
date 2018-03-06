From: George Dunlap <george.dunlap@citrix.com>
Subject: [PATCH] SUPPORT.md: Clarify stubdomain support
Date: Tue, 6 Mar 2018 17:08:43 +0000
Message-ID: <20180306170843.19409-1-george.dunlap@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=9xvu=f4=citrix.com=prvs=5963a300f=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1etG55-0001EZ-C5
 for xen-devel@lists.xenproject.org; Tue, 06 Mar 2018 17:08:51 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Ian Jackson <ian.jackson@citrix.com>
List-Id: xen-devel@lists.xenproject.org

V2UgZG9uJ3QgcHJvbWlzZSB0byBwcm90ZWN0IHlvdSBhZ2FpbnN0IHJvZ3VlIHN0dWIgZG9tYWlu
IGJpbmFyaWVzOwpvbmx5IGZyb20gdGhlIHJ1bm5pbmcgZG9tYWluIG9uY2UgdGhlIGd1ZXN0IGhh
cyBjb21lIHVwLgoKU2lnbmVkLW9mZi1ieTogR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBj
aXRyaXguY29tPgotLS0KQ0M6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBjaXRyaXguY29tPgpD
QzogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KQ0M6IEFuZHJldyBDb29wZXIgPGFuZHJl
dy5jb29wZXIzQGNpdHJpeC5jb20+CkNDOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+
CkNDOiBUaW0gRGVlZ2FuIDx0aW1AeGVuLm9yZz4KQ0M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0
YWJlbGxpbmlAa2VybmVsLm9yZz4KQ0M6IEtvbnJhZCBXaWxrIDxrb25yYWQud2lsa0BvcmFjbGUu
Y29tPgpDQzogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KLS0tCiBTVVBQT1JU
Lm1kIHwgNSArKysrKwogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdp
dCBhL1NVUFBPUlQubWQgYi9TVVBQT1JULm1kCmluZGV4IGExODEwYjgwNDYuLmNlOWY2OGUxYzIg
MTAwNjQ0Ci0tLSBhL1NVUFBPUlQubWQKKysrIGIvU1VQUE9SVC5tZApAQCAtNTAxLDYgKzUwMSwx
MSBAQCBmb3IgbW9yZSBpbmZvcm1hdGlvbiBhYm91dCBzZWN1cml0eSBzdXBwb3J0LgogCiAgICAg
U3RhdHVzOiBTdXBwb3J0ZWQsIHdpdGggY2F2ZWF0cwogCitPbmx5IHN0dWIgZG9tYWluIGJpbmFy
aWVzIHByb3ZpZGVkIGJ5IHRoZSBob3N0IGFkbWluCitvciB0cnVzdGVkIHVzZXJzIGFyZSBzZWN1
cml0eSBzdXBwb3J0ZWQ7Cit1bnRydXN0ZWQgc3R1YiBkb21haW4gYmluYXJpZXMgKGUuZy4sIHBy
b3ZpZGVkIGJ5IHVudHJ1c3RlZCB1c2VycykKK2FyZSBleGNsdWRlZCBmcm9tIHNlY3VyaXR5IHN1
cHBvcnQuCisKIFZ1bG5lcmFiaWxpdGllcyBvZiBhIGRldmljZSBtb2RlbCBzdHViIGRvbWFpbgog
dG8gYSBob3N0aWxlIGRyaXZlciBkb21haW4gKGVpdGhlciBjb21wcm9taXNlZCBvciB1bnRydXN0
ZWQpCiBhcmUgZXhjbHVkZWQgZnJvbSBzZWN1cml0eSBzdXBwb3J0LgotLSAKMi4xNi4yCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
