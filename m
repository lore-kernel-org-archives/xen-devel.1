From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH 1/4] xen/arm: gic: Ensure we have an ISB
 between ack and do_IRQ()
Date: Mon, 29 Oct 2018 16:22:27 +0000
Message-ID: <7fb8e43d-d9fa-b3e7-d0a2-11d22a793819@arm.com>
References: <20181023181709.11883-1-julien.grall@arm.com>
 <20181023181709.11883-2-julien.grall@arm.com>
 <6098937f-98de-bff9-6c48-5575a45875e0@epam.com>
 <57ee191b-be21-701e-ef19-4ed4df1cf289@arm.com>
 <77f72cc9-6548-afd9-3766-23326b3551d9@epam.com>
 <6acf65ef-4302-c403-32ba-1d88ab954265@epam.com>
 <22f7ebc8-c74b-0d8e-4847-9d3df9bcf5db@arm.com>
 <3622e468-8f44-1e31-138f-db58ca3835ff@epam.com>
 <2090f5b4-22ff-38bc-3d47-6dbb6d7fccfb@epam.com>
 <6d1c980b-b316-f634-7793-0aca4b34aa85@arm.com>
 <dd88b504-1120-267e-f157-1ba08afcf438@epam.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <dd88b504-1120-267e-f157-1ba08afcf438@epam.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrii Anisov <Andrii_Anisov@epam.com>, "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
Cc: "andre.przywara@arm.com" <andre.przywara@arm.com>, "sstabellini@kernel.org" <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAyOS8xMC8yMDE4IDE2OjE2LCBBbmRyaWkgQW5pc292IHdyb3RlOgo+IEhlbGxvIEp1bGll
bgoKSGksCj4gT24gMjkuMTAuMTggMTU6MzYsIEp1bGllbiBHcmFsbCB3cm90ZTowCj4+IEkgd3Jv
dGUgZG93biBhbiBhbnN3ZXIgeWVzdGVyZGF5IChzZW50IGl0IHRvZGF5KSB0byB5b3VyIHByZXZp
b3VzCj4+IGFuc3dlci4gWW91IG1heSB1c2UgdGhlIExScyBpbmZvcm1hdGlvbiBmcm9tIHRoZSBw
cmV2aW91cyBndWVzdCB0cmFwIGFzCj4+IGludGVycnVwdHMgYXJlIHJlLWVuYWJsZWQgYmVmb3Jl
IHN0b3JpbmcgdGhlIExScy4KPiAKPiBZZXMsIGl0IGlzIHRoZSBjYXNlLiBJJ3ZlIG92ZXJsb29r
ZWQgdGhhdCBmb3Igc29tZSBleGNlcHRpb25zIGludGVycnVwdHMKPiBhcmUgZW5hYmxlZCBiZWZv
cmUgZW50ZXJfaHlwZXJ2aXNvcl9oZWFkKCkuCj4gCj4gCj4+IENhbiB5b3UgdHJ5IHRoZSBwYXRj
aCBiZWxvdz8KPiAKPiBJIHRyaWVkIGl0LCBhbmQgaXQgd29ya3MgbGlrZSBhIGNoYXJtIGZvciB0
aGUgaXNzdWUuCgpXaGF0IGlzIHRoZSBpc3N1ZT8gSXMgaXQganVzdCB5b3VyIHByaW50IG9yIHRo
ZXJlIGEgbGF0ZW50IGJ1ZyBpbiBjdXJyZW50IHZHSUM/Cgo+IAo+IFRoZSBvbmx5IG5vdGljZSBo
ZXJlIGlzIHRoYXQsIEkgc3VwcG9zZSwgY2hhbmdlcyBhcmUgbmVlZGVkIGZvcgo+IGV4Y2VwdGlv
bnMgdGFrZW4gZnJvbSBhIGd1ZXN0IG1vZGUuIEZvciB0aGUgZXhjZXB0aW9ucyB0YWtlbiBmcm9t
IGh5cCwKPiB3ZSBkbyBub3QgbWFzc2FnZSBnaWMgaW4gZW50ZXJfaHlwZXJ2aXNvcl9oZWFkLgoK
SSBhY3R1YWxseSBwcmVmZXIgaWYgd2UgcmUtZW5hYmxlIGludGVycnVwdHMgYWZ0ZXIgZW50cnlf
aHlwZXJ2aXNvcl9oZWFkKCkuIFRoaXMgCm1ha2VzIHRoZSBjb2RlIHdvcmtpbmcgdGhlIHNhbWUg
d2F5IGV2ZXJ5d2hlcmUgc28gbGVzcyB0cm91YmxlIHRvIGZpZ3VyZSBvdXQgCnByb2JsZW0uCgpD
aGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
