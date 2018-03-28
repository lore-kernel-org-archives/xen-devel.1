From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH] xen/acpi: off by one in read_acpi_id()
Date: Wed, 28 Mar 2018 20:15:07 +0300
Message-ID: <20180328171507.s5phr3fic7zoj6tr@mwanda>
References: <20180328114747.GB29050@mwanda>
 <12f59a38-ac39-d62a-6951-bd8393d45f12@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=idvp=gs=oracle.com=dan.carpenter@srs-us1.protection.inumbo.net>)
 id 1f1EhJ-0007s1-Iz
 for xen-devel@lists.xenproject.org; Wed, 28 Mar 2018 17:17:17 +0000
Content-Disposition: inline
In-Reply-To: <12f59a38-ac39-d62a-6951-bd8393d45f12@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, kernel-janitors@vger.kernel.org, Joao Martins <joao.m.martins@oracle.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBNYXIgMjgsIDIwMTggYXQgMDE6NTc6MjBQTSArMDIwMCwgSnVlcmdlbiBHcm9zcyB3
cm90ZToKPiBPbiAyOC8wMy8xOCAxMzo0NywgRGFuIENhcnBlbnRlciB3cm90ZToKPiA+IElmIGFj
cGlfaWQgaXMgPT0gbnJfYWNwaV9iaXRzLCB0aGVuIHdlIGFjY2VzcyBvbmUgZWxlbWVudCBiZXlv
bmQgdGhlIGVuZAo+ID4gb2YgdGhlIGFjcGlfcHNkW10gYXJyYXkgb3Igd2Ugc2V0IG9uZSBiaXQg
YmV5b25kIHRoZSBlbmQgb2YgdGhlIGJpdCBtYXAKPiA+IHdoZW4gd2UgZG8gX19zZXRfYml0KGFj
cGlfaWQsIGFjcGlfaWRfY3N0X3ByZXNlbnQpOwo+ID4gCj4gPiBGaXhlczogNTlhNTY4MDI5MTgx
ICgieGVuL2FjcGktcHJvY2Vzc29yOiBDIGFuZCBQLXN0YXRlIGRyaXZlciB0aGF0IHVwbG9hZHMg
c2FpZCBkYXRhIHRvIGh5cGVydmlzb3IuIikKPiA+IFNpZ25lZC1vZmYtYnk6IERhbiBDYXJwZW50
ZXIgPGRhbi5jYXJwZW50ZXJAb3JhY2xlLmNvbT4KPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMveGVuL3hlbi1hY3BpLXByb2Nlc3Nvci5jIGIvZHJpdmVycy94ZW4veGVuLWFjcGktcHJvY2Vz
c29yLmMKPiA+IGluZGV4IGM4MDE5NWU4ZmJkMS4uZDIzYzljMTUwMTk5IDEwMDY0NAo+ID4gLS0t
IGEvZHJpdmVycy94ZW4veGVuLWFjcGktcHJvY2Vzc29yLmMKPiA+ICsrKyBiL2RyaXZlcnMveGVu
L3hlbi1hY3BpLXByb2Nlc3Nvci5jCj4gPiBAQCAtMzY0LDcgKzM2NCw3IEBAIHJlYWRfYWNwaV9p
ZChhY3BpX2hhbmRsZSBoYW5kbGUsIHUzMiBsdmwsIHZvaWQgKmNvbnRleHQsIHZvaWQgKipydikK
PiA+ICAJfQo+ID4gIAkvKiBUaGVyZSBhcmUgbW9yZSBBQ1BJIFByb2Nlc3NvciBvYmplY3RzIHRo
YW4gaW4geDJBUElDIG9yIE1BRFQuCj4gPiAgCSAqIFRoaXMgY2FuIGhhcHBlbiB3aXRoIGluY29y
cmVjdCBBQ1BJIFNTRFQgZGVjbGVyYXRpb25zLiAqLwo+ID4gLQlpZiAoYWNwaV9pZCA+IG5yX2Fj
cGlfYml0cykgewo+ID4gKwlpZiAoYWNwaV9pZCA+PSBucl9hY3BpX2JpdHMpIHsKPiA+ICAJCXBy
X2RlYnVnKCJXZSBvbmx5IGhhdmUgJXUsIHRyeWluZyB0byBzZXQgJXVcbiIsCj4gPiAgCQkJIG5y
X2FjcGlfYml0cywgYWNwaV9pZCk7Cj4gCj4gQ2FuIHlvdSBwbGVhc2UgbW9kaWZ5IHRoaXMgbWVz
c2FnZSwgdG9vPyBFLmcuIHNvbWV0aGluZyBsaWtlOgo+IAo+IHByX2RlYnVnKCJtYXggYWNwaSBp
ZCAldSwgdHJ5aW5nIHRvIHNldCAldVxuIiwKPiAgICAgICAgICBucl9hY3BpX2JpdHMgLSAxLCBh
Y3BpX2lkKTsKPiAKPiBXaXRoIHRoYXQ6Cj4gCj4gUmV2aWV3ZWQtYnk6IEp1ZXJnZW4gR3Jvc3Mg
PGpncm9zc0BzdXNlLmNvbT4KPiAKClN1cmUsIGxldCBtZSByZXNlbmQuCgpyZWdhcmRzLApkYW4g
Y2FycGVudGVyCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
