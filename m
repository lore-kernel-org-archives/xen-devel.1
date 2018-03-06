From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH 26/57] ARM: vPL011: Use the VGIC's level
 triggered IRQs handling if available
Date: Tue, 6 Mar 2018 17:23:48 +0000
Message-ID: <0f65611c-4b69-86ff-7ab6-1a77104a4446@arm.com>
References: <20180305160415.16760-1-andre.przywara@linaro.org>
 <20180305160415.16760-27-andre.przywara@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=lh2b=f4=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1etGJh-0002oh-1I
 for xen-devel@lists.xenproject.org; Tue, 06 Mar 2018 17:23:57 +0000
In-Reply-To: <20180305160415.16760-27-andre.przywara@linaro.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andre Przywara <andre.przywara@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

SGkgQW5kcmUsCgpPbiAwNS8wMy8xOCAxNjowMywgQW5kcmUgUHJ6eXdhcmEgd3JvdGU6Cj4gVGhl
IGVtdWxhdGVkIEFSTSBTQlNBIFVBUlQgaXMgdXNpbmcgbGV2ZWwgdHJpZ2dlcmVkIElSUSBzZW1h
bnRpY3MsCj4gaG93ZXZlciB0aGUgY3VycmVudCBWR0lDIGNhbiBvbmx5IGhhbmRsZSBlZGdlIHRy
aWdnZXJlZCBJUlFzLCByZWFsbHkuCj4gRGlzYWJsZSB0aGUgZXhpc3Rpbmcgd29ya2Fyb3VuZCBm
b3IgdGhpcyBwcm9ibGVtIGluIGNhc2Ugd2UgaGF2ZSB0aGUKPiBuZXcgVkdJQyBpbiBwbGFjZSwg
d2hpY2ggY2FuIHByb3Blcmx5IGhhbmRsZSBsZXZlbCB0cmlnZ2VyZWQgSVJRcy4KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBBbmRyZSBQcnp5d2FyYSA8YW5kcmUucHJ6eXdhcmFAbGluYXJvLm9yZz4KPiAt
LS0KPiBDaGFuZ2Vsb2cgUkZDIC4uLiB2MToKPiAtIG5vIGNoYW5nZXMKPiAKPiAgIHhlbi9hcmNo
L2FybS92cGwwMTEuYyB8IDQgKysrKwo+ICAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygr
KQo+IAo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vdnBsMDExLmMgYi94ZW4vYXJjaC9hcm0v
dnBsMDExLmMKPiBpbmRleCA1ZGNmNGJlYzE4Li4xOTdlY2U4ODczIDEwMDY0NAo+IC0tLSBhL3hl
bi9hcmNoL2FybS92cGwwMTEuYwo+ICsrKyBiL3hlbi9hcmNoL2FybS92cGwwMTEuYwo+IEBAIC01
NCw2ICs1NCw3IEBAIHN0YXRpYyB2b2lkIHZwbDAxMV91cGRhdGVfaW50ZXJydXB0X3N0YXR1cyhz
dHJ1Y3QgZG9tYWluICpkKQo+ICAgICAgICAqLwo+ICAgICAgIEFTU0VSVChzcGluX2lzX2xvY2tl
ZCgmdnBsMDExLT5sb2NrKSk7Cj4gICAKPiArI2lmbmRlZiBDT05GSUdfTkVXX1ZHSUMKPiAgICAg
ICAvKgo+ICAgICAgICAqIFRPRE86IFBMMDExIGludGVycnVwdHMgYXJlIGxldmVsIHRyaWdnZXJl
ZCB3aGljaCBtZWFucwo+ICAgICAgICAqIHRoYXQgaW50ZXJydXB0IG5lZWRzIHRvIGJlIHNldC9j
bGVhciBpbnN0ZWFkIG9mIGJlaW5nCj4gQEAgLTcxLDYgKzcyLDkgQEAgc3RhdGljIHZvaWQgdnBs
MDExX3VwZGF0ZV9pbnRlcnJ1cHRfc3RhdHVzKHN0cnVjdCBkb21haW4gKmQpCj4gICAgICAgICAg
IHZnaWNfaW5qZWN0X2lycShkLCBOVUxMLCBHVUVTVF9WUEwwMTFfU1BJLCB0cnVlKTsKPiAgIAo+
ICAgICAgIHZwbDAxMS0+c2hhZG93X3VhcnRtaXMgPSB1YXJ0bWlzOwo+ICsjZWxzZQo+ICsgICAg
dmdpY19pbmplY3RfaXJxKGQsIE5VTEwsIEdVRVNUX1ZQTDAxMV9TUEksICEhdWFydG1pcyk7CgpU
aGUgISEgaXMgbm90IG5lY2Vzc2FyeSBhcyB0aGUgcGFyYW1ldGVyIGlzIGJvb2wuCgoKPiArI2Vu
ZGlmCj4gICB9Cj4gICAKPiAgIHN0YXRpYyB1aW50OF90IHZwbDAxMV9yZWFkX2RhdGEoc3RydWN0
IGRvbWFpbiAqZCkKPiAKCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
