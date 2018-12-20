From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH for-4.12 v2 6/8] xen/arm: Initialize trace
 buffer
Date: Thu, 20 Dec 2018 15:14:11 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1812201513510.15901@sstabellini-ThinkPad-X260>
References: <20181220192338.17526-1-julien.grall@arm.com>
 <20181220192338.17526-7-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NfYO=O5=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1ga7WA-0006ys-AU
 for xen-devel@lists.xenproject.org; Thu, 20 Dec 2018 23:14:14 +0000
In-Reply-To: <20181220192338.17526-7-julien.grall@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, Andrii Anisov <andrii_anisov@epam.com>, Benjamin Sanda <ben.sanda@dornerworks.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCAyMCBEZWMgMjAxOCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEZyb206IEJlbmphbWlu
IFNhbmRhIDxiZW4uc2FuZGFAZG9ybmVyd29ya3MuY29tPgo+IAo+IE5vdyB0aGF0IHdlIGFsbG93
IGEgcHJpdmlsZWdlZCBkb21haW4gdG8gbWFwIHRyYWNpbmcgYnVmZmVyLCBpbml0aWFsaXplCj4g
dGhlbSBzbyBhIHVzZXIgY2FuIGVmZmVjdGl2ZWx5IHRyYWNlIFhlbi4KPiAKPiBTaWduZWQtb2Zm
LWJ5OiBCZW5qYW1pbiBTYW5kYSA8YmVuLnNhbmRhQGRvcm5lcndvcmtzLmNvbT4KPiBbanVsaWVu
OiByZXdvcmsgY29tbWl0IG1lc3NhZ2VdCj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxq
dWxpZW4uZ3JhbGxAYXJtLmNvbT4KPiBSZXZpZXdlZC1ieTogQW5kcmlpIEFuaXNvdiA8YW5kcmlp
X2FuaXNvdkBlcGFtLmNvbT4KCkFja2VkLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxs
aW5pQGtlcm5lbC5vcmc+CgoKPiAtLS0KPiAgICAgQ2hhbmdlcyBpbiB2MjoKPiAgICAgICAgIC0g
QWRkIEFuZHJpaSdzIHJldmlld2VkLWJ5Cj4gLS0tCj4gIHhlbi9hcmNoL2FybS9zZXR1cC5jIHwg
MyArKysKPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQg
YS94ZW4vYXJjaC9hcm0vc2V0dXAuYyBiL3hlbi9hcmNoL2FybS9zZXR1cC5jCj4gaW5kZXggZmI5
MjNjZGY2Ny4uNDQ0ODU3YTk2NyAxMDA2NDQKPiAtLS0gYS94ZW4vYXJjaC9hcm0vc2V0dXAuYwo+
ICsrKyBiL3hlbi9hcmNoL2FybS9zZXR1cC5jCj4gQEAgLTM2LDYgKzM2LDcgQEAKPiAgI2luY2x1
ZGUgPHhlbi9wZm4uaD4KPiAgI2luY2x1ZGUgPHhlbi92aXJ0dWFsX3JlZ2lvbi5oPgo+ICAjaW5j
bHVkZSA8eGVuL3ZtYXAuaD4KPiArI2luY2x1ZGUgPHhlbi90cmFjZS5oPgo+ICAjaW5jbHVkZSA8
eGVuL2xpYmZkdC9saWJmZHQuaD4KPiAgI2luY2x1ZGUgPHhlbi9hY3BpLmg+Cj4gICNpbmNsdWRl
IDxhc20vYWx0ZXJuYXRpdmUuaD4KPiBAQCAtODk5LDYgKzkwMCw4IEBAIHZvaWQgX19pbml0IHN0
YXJ0X3hlbih1bnNpZ25lZCBsb25nIGJvb3RfcGh5c19vZmZzZXQsCj4gIAo+ICAgICAgaGVhcF9p
bml0X2xhdGUoKTsKPiAgCj4gKyAgICBpbml0X3RyYWNlX2J1ZnMoKTsKPiArCj4gICAgICBpbml0
X2NvbnN0cnVjdG9ycygpOwo+ICAKPiAgICAgIGNvbnNvbGVfZW5kYm9vdCgpOwo+IC0tIAo+IDIu
MTEuMAo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
