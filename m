From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v1 01/13] xen/arm: domain: Zero the per-vCPU
 cpu_info
Date: Mon, 11 Jun 2018 15:59:53 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1806111558250.14695@sstabellini-ThinkPad-X260>
References: <20180605152303.14450-1-julien.grall@arm.com>
 <20180605152303.14450-2-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=6gn7=i5=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1fSVn5-0007JK-Uu
 for xen-devel@lists.xenproject.org; Mon, 11 Jun 2018 22:59:59 +0000
In-Reply-To: <20180605152303.14450-2-julien.grall@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, andre.przywara@arm.com
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCA1IEp1biAyMDE4LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gQSBzdGFjayBpcyBhbGxv
Y2F0ZWQgcGVyIHZDUFUgdG8gYmUgdXNlZCBieSBYZW4uIFRoZSBhbGxvY2F0aW9uIGlzIGRvbmUK
PiB3aXRoIGFsbG9jX3hlbmhlYXBfcGFnZXMgdGhhdCBkb2VzIG5vdCB6ZXJvIHRoZSBtZW1vcnkg
cmV0dXJuZWQuIEhvd2V2ZXIKPiB0aGUgdG9wIG9mIHRoZSBzdGFjayBpcyBjb250YWluaW5nIGlu
Zm9ybWF0aW9uIHRoYXQgd2lsbCBiZSB1c2VkIHRvCj4gc3RvcmUgdGhlIGluaXRpYWwgc3RhdGUg
b2YgdGhlIHZDUFUgKHNlZSBzdHJ1Y3QgY3B1X2luZm8pLiBTb21lIG9mIHRoZQo+IGZpZWxkcyBt
YXkgbm90IGJlIGluaXRpYWxpemVkIGFuZCB3aWxsIGxlYWQgdG8gdXNlL2xlYWsgYml0cyBvZiBw
cmV2aW91cwo+IG1lbW9yeSBpbiBzb21lIGNhc2VzIG9uIHRoZSBmaXJzdCBydW4gb2YgdkNQVSAo
QUZBSUNUIHRoaXMgb25seSBoYXBwZW4gb24KPiB2Q1BVMCBmb3IgRG9tMCkuCj4gCj4gVGhpcyBp
cyBwYXJ0IG9mIFhTQS0yNjMuCj4gCj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxp
ZW4uZ3JhbGxAYXJtLmNvbT4KClJldmlld2VkLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFi
ZWxsaW5pQGtlcm5lbC5vcmc+CgoKPiAtLS0KPiAgICAgQ2hhbmdlcyBpbiB2MjoKPiAgICAgICAg
IC0gWmVybyBvbmx5IGNwdV9pbmZvCj4gLS0tCj4gIHhlbi9hcmNoL2FybS9kb21haW4uYyB8IDEg
Kwo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPiAKPiBkaWZmIC0tZ2l0IGEveGVu
L2FyY2gvYXJtL2RvbWFpbi5jIGIveGVuL2FyY2gvYXJtL2RvbWFpbi5jCj4gaW5kZXggZWMwZjA0
MmJmNy4uNWEyYTlhNmI4MyAxMDA2NDQKPiAtLS0gYS94ZW4vYXJjaC9hcm0vZG9tYWluLmMKPiAr
KysgYi94ZW4vYXJjaC9hcm0vZG9tYWluLmMKPiBAQCAtNTUwLDYgKzU1MCw3IEBAIGludCB2Y3B1
X2luaXRpYWxpc2Uoc3RydWN0IHZjcHUgKnYpCj4gICAgICB2LT5hcmNoLmNwdV9pbmZvID0gKHN0
cnVjdCBjcHVfaW5mbyAqKSh2LT5hcmNoLnN0YWNrCj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICArIFNUQUNLX1NJWkUKPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIC0gc2l6ZW9mKHN0cnVjdCBjcHVfaW5mbykpOwo+ICsgICAg
bWVtc2V0KHYtPmFyY2guY3B1X2luZm8sIDAsIHNpemVvZigqdi0+YXJjaC5jcHVfaW5mbykpOwo+
ICAKPiAgICAgIG1lbXNldCgmdi0+YXJjaC5zYXZlZF9jb250ZXh0LCAwLCBzaXplb2Yodi0+YXJj
aC5zYXZlZF9jb250ZXh0KSk7Cj4gICAgICB2LT5hcmNoLnNhdmVkX2NvbnRleHQuc3AgPSAocmVn
aXN0ZXJfdCl2LT5hcmNoLmNwdV9pbmZvOwo+IC0tIAo+IDIuMTEuMAo+IAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
