From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH for-4.12 v3 7/8] xenalyze: Build for Both
 ARM and x86 Platforms
Date: Fri, 21 Dec 2018 09:48:08 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1812210946050.15901@sstabellini-ThinkPad-X260>
References: <20181221162650.11515-1-julien.grall@arm.com>
 <20181221162650.11515-8-julien.grall@arm.com>
 <8d9b5bdd-9312-f67b-9731-3178f76f26c2@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0AIz=O6=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1gaOuB-0008JH-8h
 for xen-devel@lists.xenproject.org; Fri, 21 Dec 2018 17:48:11 +0000
In-Reply-To: <8d9b5bdd-9312-f67b-9731-3178f76f26c2@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, Wei Liu <wei.liu2@citrix.com>, Benjamin Sanda <ben.sanda@dornerworks.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCAyMSBEZWMgMjAxOCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpLAo+IAo+IE9uIDIx
LzEyLzIwMTggMTY6MjYsIEp1bGllbiBHcmFsbCB3cm90ZToKPiA+IEZyb206IEJlbmphbWluIFNh
bmRhIDxiZW4uc2FuZGFAZG9ybmVyd29ya3MuY29tPgo+ID4gCj4gPiBNb2RpZmllZCB0byBwcm92
aWRlIGJ1aWxkaW5nIG9mIHRoZSB4ZW5hbHl6ZSBiaW5hcnkgZm9yIGJvdGggQVJNIGFuZAo+ID4g
eDg2IHBsYXRmb3Jtcy4gVGhlIHhlbmFseXplIGJpbmFyeSBpcyBub3cgYnVpbHQgYXMgcGFydCBv
ZiB0aGUgQklOCj4gPiBsaXN0IGZvciBib3RoIHBsYXRmb3Jtcy4KPiA+IAo+ID4gU2lnbmVkLW9m
Zi1ieTogQmVuamFtaW4gU2FuZGEgPGJlbi5zYW5kYUBkb3JuZXJ3b3Jrcy5jb20+Cj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgo+ID4gQWNrZWQt
Ynk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Cj4gPiBBY2tlZC1ieTogU3RlZmFubyBT
dGFiZWxsaW5pIDxzc3RhYmVsaW5pQGtlcm5lbC5vcmc+Cj4gCj4gSSBtYWRlIGEgdHlwbyBpbiB0
aGUgYWRkcmVzcyBlLW1haWwuIFN0ZWZhbm8sIGNvdWxkIHlvdSBmaXggaXQgb24gY29tbWl0PwoK
WWVzLCBmaXhlZCBvbiBjb21taXQuIEZpcnN0IDcgcGF0Y2hlcyBoYXZlIGJlZW4gY29tbWl0dGVk
LgoKCj4gPiAtLS0KPiA+ICAgICAgQ2hhbmdlcyBpbiB2MzoKPiA+ICAgICAgICAgIC0gQWRkIFN0
ZWZhbm8ncyBhY2tlZC1ieQo+ID4gCj4gPiAgICAgIENoYW5nZXMgaW4gdjI6Cj4gPiAgICAgICAg
ICAtIEFkZCBXZWkncyBhY2tlZC1ieQo+ID4gLS0tCj4gPiAgIHRvb2xzL3hlbnRyYWNlL01ha2Vm
aWxlIHwgMyArLS0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0
aW9ucygtKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvdG9vbHMveGVudHJhY2UvTWFrZWZpbGUgYi90
b29scy94ZW50cmFjZS9NYWtlZmlsZQo+ID4gaW5kZXggMGJhZDk0MmJkZi4uOWZiN2ZjOTZlNyAx
MDA2NDQKPiA+IC0tLSBhL3Rvb2xzL3hlbnRyYWNlL01ha2VmaWxlCj4gPiArKysgYi90b29scy94
ZW50cmFjZS9NYWtlZmlsZQo+ID4gQEAgLTksOCArOSw3IEBAIExETElCUyArPSAkKExETElCU19s
aWJ4ZW5ldnRjaG4pCj4gPiAgIExETElCUyArPSAkKExETElCU19saWJ4ZW5jdHJsKQo+ID4gICBM
RExJQlMgKz0gJChBUkdQX0xERkxBR1MpCj4gPiAgIC1CSU4tJChDT05GSUdfWDg2KSA9IHhlbmFs
eXplCj4gPiAtQklOICAgICAgPSAkKEJJTi15KQo+ID4gK0JJTiAgICAgID0geGVuYWx5emUKPiA+
ICAgU0JJTiAgICAgPSB4ZW50cmFjZSB4ZW50cmFjZV9zZXRzaXplCj4gPiAgIExJQkJJTiAgID0g
eGVuY3R4Cj4gPiAgIFNDUklQVFMgID0geGVudHJhY2VfZm9ybWF0Cj4gPiAKPiAKPiAtLSAKPiBK
dWxpZW4gR3JhbGwKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
