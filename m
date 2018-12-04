From: Julien Grall <julien.grall@arm.com>
Subject: [PATCH for-4.12 v2 10/17] xen/arm: p2m: Allow to flush
 cache on any RAM region
Date: Tue,  4 Dec 2018 20:26:44 +0000
Message-ID: <20181204202651.8836-11-julien.grall@arm.com>
References: <20181204202651.8836-1-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aD1Q=ON=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gUHI1-00088W-J4
 for xen-devel@lists.xenproject.org; Tue, 04 Dec 2018 20:27:29 +0000
In-Reply-To: <20181204202651.8836-1-julien.grall@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Julien Grall <julien.grall@arm.com>, sstabellini@kernel.org
List-Id: xen-devel@lists.xenproject.org

Q3VycmVudGx5LCB3ZSBvbmx5IGFsbG93IHRvIGZsdXNoIGNhY2hlIG9uIHJlZ2lvbnMgbWFwcGVk
IGFzIHAybV9yYW1fe3J3LHJvfS4KClRoZXJlIGFyZSBubyByZWFsIHByb2JsZW0gaW4gY2FjaGUg
Zmx1c2hpbmcgYW55IFJBTSByZWdpb25zIHN1Y2ggYXMgZ3JhbnRzCmFuZCBmb3JlaWduIG1hcHBp
bmcuIFRoZXJlZm9yZSwgcmVsYXggdGhlIGNoZWNrIHRvIGFsbG93IGZsdXNoaW5nIHRoZQpjYWNo
ZSBvbiBhbnkgUkFNIHJlZ2lvbi4KClNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVu
LmdyYWxsQGFybS5jb20+ClJldmlld2VkLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxs
aW5pQGtlcm5lbC5vcmc+CgotLS0KICAgIENoYW5nZXMgaW4gdjI6CiAgICAgICAgLSBGaXggdHlw
b2VzCiAgICAgICAgLSBBZGQgU3RlZmFubydzIHJldmlld2VkLWJ5Ci0tLQogeGVuL2FyY2gvYXJt
L3AybS5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL3AybS5jIGIveGVuL2FyY2gvYXJtL3AybS5j
CmluZGV4IDgzNjE1NzI5MmMuLjRlMGRkYmY3MGIgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL2FybS9w
Mm0uYworKysgYi94ZW4vYXJjaC9hcm0vcDJtLmMKQEAgLTE1MzksNyArMTUzOSw3IEBAIGludCBw
Mm1fY2FjaGVfZmx1c2hfcmFuZ2Uoc3RydWN0IGRvbWFpbiAqZCwgZ2ZuX3Qgc3RhcnQsIGdmbl90
IGVuZCkKICAgICAgICAgbmV4dF9nZm4gPSBnZm5fbmV4dF9ib3VuZGFyeShzdGFydCwgb3JkZXIp
OwogCiAgICAgICAgIC8qIFNraXAgaG9sZSBhbmQgbm9uLVJBTSBwYWdlICovCi0gICAgICAgIGlm
ICggbWZuX2VxKG1mbiwgSU5WQUxJRF9NRk4pIHx8ICFwMm1faXNfcmFtKHQpICkKKyAgICAgICAg
aWYgKCBtZm5fZXEobWZuLCBJTlZBTElEX01GTikgfHwgIXAybV9pc19hbnlfcmFtKHQpICkKICAg
ICAgICAgICAgIGNvbnRpbnVlOwogCiAgICAgICAgIC8qIFhYWDogSW1wbGVtZW50IHByZWVtcHRp
b24gKi8KLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
