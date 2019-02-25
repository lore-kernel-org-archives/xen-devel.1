From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH for-4.12] xen/arm: psci: Populate
 arm_smccc_res on PSCI_FEATURES call
Date: Mon, 25 Feb 2019 14:13:34 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1902251413160.29379@sstabellini-ThinkPad-X260>
References: <20190218094227.27176-1-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rX0y=RA=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1gyOVi-000536-TD
 for xen-devel@lists.xenproject.org; Mon, 25 Feb 2019 22:14:06 +0000
In-Reply-To: <20190218094227.27176-1-julien.grall@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Artem_Mygaiev@epam.com, jgross@suse.com, sstabellini@kernel.org, Andrii_Anisov@epam.com, Oleksandr_Tyshchenko@epam.com, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCAxOCBGZWIgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IENvbW1pdCAwYmM2YTY4
ZGE1ICJ4ZW4vYXJtOiBSZXBsYWNlIGNhbGxfc21jIHdpdGggYXJtX3NtY2NjX3NtYyIKPiBtaXN0
YWtlbmx5IGZvcmdvdCB0byBwb3B1bGF0ZSBhcm1fc21jY2NfcmVzLiBTbyBhIGdhcmJhZ2dlIHZh
bHVlIHdhcwogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgXiBnYXJiYWdlCgo+IHVzZWQgYXMgcmV0dXJuIHZhbHVlLgo+IAo+IENvdmVyaXR5LUlEOiAx
NDc2ODI3Cj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNv
bT4KClJldmlld2VkLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5v
cmc+Cgo+IC0tLQo+ICB4ZW4vYXJjaC9hcm0vcHNjaS5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEveGVuL2Fy
Y2gvYXJtL3BzY2kuYyBiL3hlbi9hcmNoL2FybS9wc2NpLmMKPiBpbmRleCBkMjNjYjhlNzZlLi4w
YzkwYzIzMDVjIDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL2FybS9wc2NpLmMKPiArKysgYi94ZW4v
YXJjaC9hcm0vcHNjaS5jCj4gQEAgLTg3LDcgKzg3LDcgQEAgc3RhdGljIGludCBfX2luaXQgcHNj
aV9mZWF0dXJlcyh1aW50MzJfdCBwc2NpX2Z1bmNfaWQpCj4gICAgICBpZiAoIHBzY2lfdmVyIDwg
UFNDSV9WRVJTSU9OKDEsIDApICkKPiAgICAgICAgICByZXR1cm4gUFNDSV9OT1RfU1VQUE9SVEVE
Owo+ICAKPiAtICAgIGFybV9zbWNjY19zbWMoUFNDSV8xXzBfRk4zMl9QU0NJX0ZFQVRVUkVTLCBw
c2NpX2Z1bmNfaWQsIE5VTEwpOwo+ICsgICAgYXJtX3NtY2NjX3NtYyhQU0NJXzFfMF9GTjMyX1BT
Q0lfRkVBVFVSRVMsIHBzY2lfZnVuY19pZCwgJnJlcyk7Cj4gIAo+ICAgICAgcmV0dXJuIFBTQ0lf
UkVUKHJlcyk7Cj4gIH0KPiAtLSAKPiAyLjExLjAKPiAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
