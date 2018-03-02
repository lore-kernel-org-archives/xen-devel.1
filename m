From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 3/3] xen/arm: domain_builder: irq sanity
 check logic fix
Date: Fri, 2 Mar 2018 15:10:59 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1803021510500.4239@sstabellini-ThinkPad-X260>
References: <20180227151555.1953-1-julien.grall@arm.com>
 <20180227151555.1953-4-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=z25z=fy=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1ertpS-0003S1-FL
 for xen-devel@lists.xenproject.org; Fri, 02 Mar 2018 23:11:06 +0000
In-Reply-To: <20180227151555.1953-4-julien.grall@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>, xen-devel@lists.xenproject.org, sstabellini@kernel.org, andre.przywara@arm.com
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCAyNyBGZWIgMjAxOCwganVsaWVuLmdyYWxsQGFybS5jb20gd3JvdGU6Cj4gRnJvbTog
U3Rld2FydCBIaWxkZWJyYW5kIDxTdGV3YXJ0LkhpbGRlYnJhbmRAZG9ybmVyd29ya3MuY29tPgo+
IAo+IFNpbmNlIGNvbW1pdCAieGVuL2FybTogZG9tYWluX2J1aWxkOiBSZXdvcmsgdGhlIHdheSB0
byBhbGxvY2F0ZSB0aGUKPiBldmVudCBjaGFubmVsIGludGVycnVwdCIsIGl0IGlzIG5vdCBwb3Nz
aWJsZSBmb3IgYW4gaXJxIHRvIGJlIGJvdGggYmVsb3cgMTYKPiBhbmQgZ3JlYXRlci9lcXVhbCB0
aGFuIDMyLgo+IAo+IEFsc28gZml4IHRoZSByZWZlcmVuY2UgdG8gbGludXggZG9jdW1lbnRhdGlv
biB3aGlsZSB3ZSdyZSBhdCBpdC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBTdGV3YXJ0IEhpbGRlYnJh
bmQgPHN0ZXdhcnQuaGlsZGVicmFuZEBkb3JuZXJ3b3Jrcy5jb20+Cj4gU2lnbmVkLW9mZi1ieTog
SnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KPiBbU2xpZ2h0bHkgcmV3b3JrIHRo
ZSBjb21taXQgbWVzc2FnZV0KCkFja2VkLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxs
aW5pQGtlcm5lbC5vcmc+CgoKPiAtLS0KPiAgeGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jIHwg
NSArKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygt
KQo+IAo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMgYi94ZW4vYXJj
aC9hcm0vZG9tYWluX2J1aWxkLmMKPiBpbmRleCBlZDFhMzkzYmI1Li4yOGVlODc2YjkyIDEwMDY0
NAo+IC0tLSBhL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYwo+ICsrKyBiL3hlbi9hcmNoL2Fy
bS9kb21haW5fYnVpbGQuYwo+IEBAIC01MDMsOSArNTAzLDEwIEBAIHN0YXRpYyB2b2lkIHNldF9p
bnRlcnJ1cHRfcHBpKGdpY19pbnRlcnJ1cHRfdCBpbnRlcnJ1cHQsIHVuc2lnbmVkIGludCBpcnEs
Cj4gIHsKPiAgICAgIF9fYmUzMiAqY2VsbHMgPSBpbnRlcnJ1cHQ7Cj4gIAo+IC0gICAgQlVHX09O
KGlycSA8IDE2ICYmIGlycSA+PSAzMik7Cj4gKyAgICBCVUdfT04oaXJxIDwgMTYpOwo+ICsgICAg
QlVHX09OKGlycSA+PSAzMik7Cj4gIAo+IC0gICAgLyogU2VlIGxpbnV4IERvY3VtZW50YXRpb24v
ZGV2aWN0cmVlL2JpbmRpbmdzL2FybS9naWMudHh0ICovCj4gKyAgICAvKiBTZWUgbGludXggRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL2FybSxn
aWMudHh0ICovCj4gICAgICBkdF9zZXRfY2VsbCgmY2VsbHMsIDEsIDEpOyAvKiBpcyBhIFBQSSAq
Lwo+ICAgICAgZHRfc2V0X2NlbGwoJmNlbGxzLCAxLCBpcnEgLSAxNik7IC8qIFBQSXMgc3RhcnQg
YXQgMTYgKi8KPiAgICAgIGR0X3NldF9jZWxsKCZjZWxscywgMSwgKGNwdW1hc2sgPDwgOCkgfCBs
ZXZlbCk7Cj4gLS0gCj4gMi4xMS4wCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
