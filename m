From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 01/15] xen/arm: cpregs: Allow HSR_CPREG* to
 receive more than 1 parameter
Date: Tue, 14 Aug 2018 14:47:46 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1808141443580.15066@sstabellini-ThinkPad-X260>
References: <20180716172712.20294-1-julien.grall@arm.com>
 <20180716172712.20294-2-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=pgrk=k5=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1fphAN-0003DC-0y
 for xen-devel@lists.xenproject.org; Tue, 14 Aug 2018 21:47:51 +0000
In-Reply-To: <20180716172712.20294-2-julien.grall@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, Julien Grall <julien.grall@linaro.org>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCAxNiBKdWwgMjAxOCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEF0IHRoZSBtb21lbnQs
IEhTUl9DUFJFRyBpcyBleHBlY3RlZCB0byByZWNlaXZlIG9ubHkgdGhlIGNvLXByb2Nlc3Nvcgo+
IHJlZ2lzdGVyIG5hbWUgaW4gcGFyYW1ldGVyLiBCZWNhdXNlIHRoZSBuYW1lIGlzIGFjdHVhbGx5
IGEgZGVmaW5lLCB0aGlzCj4gbWF5IGhhdmUgYmVlbiBleHBhbmRlZCBieSBhIHByZXZpb3VzIG1h
Y3JvLgo+IAo+IFJhdGhlciB0aGFuIGltcG9zaW5nIHRoZSB1c2Ugb2YgX0hTUl9DUFJFRyogaW4g
c3VjaCBjYXNlcywgYWxsb3cKPiBIU1JfQ1BSRUcgdG8gcmVjZWl2ZSBtb3JlIHRoYW4gMSBwYXJh
bWV0ZXIuCj4gCj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAbGlu
YXJvLm9yZz4KClJldmlld2VkLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtl
cm5lbC5vcmc+Cgo+IC0tLQo+ICB4ZW4vaW5jbHVkZS9hc20tYXJtL2NwcmVncy5oIHwgNCArKy0t
Cj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4g
ZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vY3ByZWdzLmggYi94ZW4vaW5jbHVkZS9h
c20tYXJtL2NwcmVncy5oCj4gaW5kZXggOGRiNjVkNWUyYS4uNGM3NGU4MTYxYiAxMDA2NDQKPiAt
LS0gYS94ZW4vaW5jbHVkZS9hc20tYXJtL2NwcmVncy5oCj4gKysrIGIveGVuL2luY2x1ZGUvYXNt
LWFybS9jcHJlZ3MuaAo+IEBAIC00Nyw4ICs0Nyw4IEBACj4gICAgICAoKF9fSFNSX0NQUkVHXyMj
b3AxKSA8PCBIU1JfQ1A2NF9PUDFfU0hJRlQpCj4gIAo+ICAvKiBFbmNvZGUgYSByZWdpc3RlciBh
cyBwZXIgSFNSIElTUyBwYXR0ZXJuICovCj4gLSNkZWZpbmUgSFNSX0NQUkVHMzIoWCkgX0hTUl9D
UFJFRzMyKFgpCj4gLSNkZWZpbmUgSFNSX0NQUkVHNjQoWCkgX0hTUl9DUFJFRzY0KFgpCj4gKyNk
ZWZpbmUgSFNSX0NQUkVHMzIoWC4uLikgX0hTUl9DUFJFRzMyKFgpCj4gKyNkZWZpbmUgSFNSX0NQ
UkVHNjQoWC4uLikgX0hTUl9DUFJFRzY0KFgpCj4gIAo+ICAvKgo+ICAgKiBPcmRlciByZWdpc3Rl
cnMgYnkgQ29wcm9jZXNzb3ItPiBDUm4tPiBPcGNvZGUgMS0+IENSbS0+IE9wY29kZSAyCj4gLS0g
Cj4gMi4xMS4wCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
