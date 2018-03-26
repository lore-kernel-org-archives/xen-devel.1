From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v3 07/39] ARM: vPL011: Use the VGIC's level
 triggered IRQs handling if available
Date: Mon, 26 Mar 2018 13:20:54 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1803261320490.12360@sstabellini-ThinkPad-X260>
References: <20180321163235.12529-1-andre.przywara@linaro.org>
 <20180321163235.12529-8-andre.przywara@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=desu=gq=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1f0Ybx-0000W0-7T
 for xen-devel@lists.xenproject.org; Mon, 26 Mar 2018 20:20:57 +0000
In-Reply-To: <20180321163235.12529-8-andre.przywara@linaro.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andre Przywara <andre.przywara@linaro.org>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCAyMSBNYXIgMjAxOCwgQW5kcmUgUHJ6eXdhcmEgd3JvdGU6Cj4gVGhlIGVtdWxhdGVk
IEFSTSBTQlNBIFVBUlQgaXMgdXNpbmcgbGV2ZWwgdHJpZ2dlcmVkIElSUSBzZW1hbnRpY3MsCj4g
aG93ZXZlciB0aGUgY3VycmVudCBWR0lDIGNhbiBvbmx5IGhhbmRsZSBlZGdlIHRyaWdnZXJlZCBJ
UlFzLCByZWFsbHkuCj4gRGlzYWJsZSB0aGUgZXhpc3Rpbmcgd29ya2Fyb3VuZCBmb3IgdGhpcyBw
cm9ibGVtIGluIGNhc2Ugd2UgaGF2ZSB0aGUKPiBuZXcgVkdJQyBpbiBwbGFjZSwgd2hpY2ggY2Fu
IHByb3Blcmx5IGhhbmRsZSBsZXZlbCB0cmlnZ2VyZWQgSVJRcy4KPiAKPiBTaWduZWQtb2ZmLWJ5
OiBBbmRyZSBQcnp5d2FyYSA8YW5kcmUucHJ6eXdhcmFAbGluYXJvLm9yZz4KPiBSZXZpZXdlZC1i
eTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KCkFja2VkLWJ5OiBTdGVmYW5v
IFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+Cgo+IC0tLQo+ICB4ZW4vYXJjaC9h
cm0vdnBsMDExLmMgfCA0ICsrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQo+
IAo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vdnBsMDExLmMgYi94ZW4vYXJjaC9hcm0vdnBs
MDExLmMKPiBpbmRleCA1ZGNmNGJlYzE4Li5hMjgxZWFiZDdlIDEwMDY0NAo+IC0tLSBhL3hlbi9h
cmNoL2FybS92cGwwMTEuYwo+ICsrKyBiL3hlbi9hcmNoL2FybS92cGwwMTEuYwo+IEBAIC01NCw2
ICs1NCw3IEBAIHN0YXRpYyB2b2lkIHZwbDAxMV91cGRhdGVfaW50ZXJydXB0X3N0YXR1cyhzdHJ1
Y3QgZG9tYWluICpkKQo+ICAgICAgICovCj4gICAgICBBU1NFUlQoc3Bpbl9pc19sb2NrZWQoJnZw
bDAxMS0+bG9jaykpOwo+ICAKPiArI2lmbmRlZiBDT05GSUdfTkVXX1ZHSUMKPiAgICAgIC8qCj4g
ICAgICAgKiBUT0RPOiBQTDAxMSBpbnRlcnJ1cHRzIGFyZSBsZXZlbCB0cmlnZ2VyZWQgd2hpY2gg
bWVhbnMKPiAgICAgICAqIHRoYXQgaW50ZXJydXB0IG5lZWRzIHRvIGJlIHNldC9jbGVhciBpbnN0
ZWFkIG9mIGJlaW5nCj4gQEAgLTcxLDYgKzcyLDkgQEAgc3RhdGljIHZvaWQgdnBsMDExX3VwZGF0
ZV9pbnRlcnJ1cHRfc3RhdHVzKHN0cnVjdCBkb21haW4gKmQpCj4gICAgICAgICAgdmdpY19pbmpl
Y3RfaXJxKGQsIE5VTEwsIEdVRVNUX1ZQTDAxMV9TUEksIHRydWUpOwo+ICAKPiAgICAgIHZwbDAx
MS0+c2hhZG93X3VhcnRtaXMgPSB1YXJ0bWlzOwo+ICsjZWxzZQo+ICsgICAgdmdpY19pbmplY3Rf
aXJxKGQsIE5VTEwsIEdVRVNUX1ZQTDAxMV9TUEksIHVhcnRtaXMpOwo+ICsjZW5kaWYKPiAgfQo+
ICAKPiAgc3RhdGljIHVpbnQ4X3QgdnBsMDExX3JlYWRfZGF0YShzdHJ1Y3QgZG9tYWluICpkKQo+
IC0tIAo+IDIuMTQuMQo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
