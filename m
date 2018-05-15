From: Eric Blake <eblake@redhat.com>
Subject: Re: [Qemu-devel] [PATCH v2 3/3] xen-hvm: try to use
 xenforeignmemory_map_resource() to map ioreq pages
Date: Tue, 15 May 2018 11:42:56 -0500
Message-ID: <298c911d-21df-33bc-1185-f52165fd8d21@redhat.com>
References: <20180510091518.28199-1-paul.durrant@citrix.com>
 <20180510091518.28199-4-paul.durrant@citrix.com>
 <20180515153821.GD2057@perard.uk.xensource.com>
 <d3dff46e447b4a18bead5bf6ae36f3ba@AMSPEX02CL03.citrite.net>
 <20180515161641.GE2057@perard.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=j3wl=ic=redhat.com=eblake@srs-us1.protection.inumbo.net>)
 id 1fId2R-0000vJ-3I
 for xen-devel@lists.xenproject.org; Tue, 15 May 2018 16:42:59 +0000
In-Reply-To: <20180515161641.GE2057@perard.uk.xensource.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anthony PERARD <anthony.perard@citrix.com>, Paul Durrant <Paul.Durrant@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDUvMTUvMjAxOCAxMToxNiBBTSwgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cgo+Pj4+ICsgICAg
ZXJybm8gPSBFT1BOT1RTVVBQOwo+Pj4KPj4+IEkgdGhpbmsgRU5PU1lTIHdvdWxkIGJlIGJldHRl
ci4gRU9QTk9UU1VQUCBzZWVtcyB0byBiZSBmb3Igc29ja2V0cy4KPj4+Cj4+Cj4+IE5vLCBFT1BO
T1RTVVBQIGlzIG1vcmUgZ2VuZXJhbCB0aGFuIHRoYXQgYW5kIGlzIGNvbnZlbnRpb24gZm9yIHVu
aW1wbGVtZW50ZWQgQVBJIG9wZXJhdGlvbnMgZWxzZXdoZXJlLiBFTk9TWVMgaXMgc3VwcG9zZWQg
dG8gc3RyaWN0bHkgbWVhbiAnc3lzdGVtIGNhbGwgbm90IGltcGxlbWVudGVkJyBidXQgd2UgdXNl
IGl0IGZvciBoeXBlcmNhbGxzIGluIFhlbiwgbGVhZGluZyB0byBvY2Nhc2lvbmFsIGZ1biB3aXRo
IExpbnV4IGNoZWNrcGF0Y2gucGwuCj4gCj4gSW4gbWFuIGVycm5vLCBJIGhhdmU6Cj4gRU5PVFNV
UCAgICAgICAgIE9wZXJhdGlvbiBub3Qgc3VwcG9ydGVkIChQT1NJWC4xLTIwMDEpCj4gRU9QTk9U
U1VQUCAgICAgIE9wZXJhdGlvbiBub3Qgc3VwcG9ydGVkIG9uIHNvY2tldCAoUE9TSVguMS0yMDAx
KS4KClBPU0lYIGFsbG93cyAoYW5kIExpbnV4IGV4cGxvaXRzKSBFTk9UU1VQIGFuZCBFT1BOT1RT
VVBQIHRvIGJlIHN5bm9ueW1zIApmb3IgdGhlIHNhbWUgZXJyb3IgdmFsdWUuICBJIHNvbWV3aGF0
IHByZWZlciB0aGUgRU5PVFNVUCBzcGVsbGluZzsgYW5kIAppdCdzIHByb2JhYmx5IGEgYml0IG5p
Y2VyIGJldHdlZW4gdGhlIHR3byB3aGVuIHBvcnRpbmcgdG8gcGxhdGZvcm1zIAp3aGVyZSB0aGUg
dHdvIHNwZWxsaW5ncyBhcmUgbm90IHN5bm9ueW1zLgoKPiBFTk9TWVMgICAgICAgICAgRnVuY3Rp
b24gbm90IGltcGxlbWVudGVkIChQT1NJWC4xLTIwMDEpLgo+IAo+IEJ1dCBJIGd1ZXNzIGFueSBv
ZiB0aGVzZSB3b3VsZCB3b3JrLgo+IAoKLS0gCkVyaWMgQmxha2UsIFByaW5jaXBhbCBTb2Z0d2Fy
ZSBFbmdpbmVlcgpSZWQgSGF0LCBJbmMuICAgICAgICAgICArMS05MTktMzAxLTMyNjYKVmlydHVh
bGl6YXRpb246ICBxZW11Lm9yZyB8IGxpYnZpcnQub3JnCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
