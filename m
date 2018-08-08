From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v3 0/4] x86/iommu: PVH Dom0 workarounds for
 missing RMRR entries
Date: Wed, 8 Aug 2018 10:25:57 +0200
Message-ID: <20180808082557.iklujkqgmb5sdzyr@mac>
References: <20180807140243.11265-1-roger.pau@citrix.com>
 <CABfawhkwcV+T5UxRFZ3jz_1eS3ZVF=sMq=zN2sa+eVq8ux5zVg@mail.gmail.com>
 <20180807143715.kscihz3wuj6mcnfi@mac>
 <CABfawhmQ557uduVUJjTMbZ3u5FWswPvbVYSUBY785Vx=qbitfA@mail.gmail.com>
 <20180807150829.ydvmvpfyrigeeyyd@mac>
 <CABfawhkomnqJ4rjc5ZBZ+rdJSeqx1XTeAKSeYQRva-BoLQeHsw@mail.gmail.com>
 <CABfawhnSmeR_SeMHjL7CG0tCnnHUKPdCPQePD_iRVZiO4N+mxw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=xhyf=kx=citrix.com=prvs=751fb83b8=roger.pau@srs-us1.protection.inumbo.net>)
 id 1fnJnE-0000y1-22
 for xen-devel@lists.xenproject.org; Wed, 08 Aug 2018 08:26:08 +0000
Content-Disposition: inline
In-Reply-To: <CABfawhnSmeR_SeMHjL7CG0tCnnHUKPdCPQePD_iRVZiO4N+mxw@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Connor Davis <davisc@ainfosec.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBBdWcgMDcsIDIwMTggYXQgMTA6NDU6MzJBTSAtMDYwMCwgVGFtYXMgSyBMZW5neWVs
IHdyb3RlOgo+IE9uIFR1ZSwgQXVnIDcsIDIwMTggYXQgMTA6MDQgQU0gVGFtYXMgSyBMZW5neWVs
Cj4gPHRhbWFzLmsubGVuZ3llbEBnbWFpbC5jb20+IHdyb3RlOgo+IChYRU4pIFtWVC1EXWlvbW11
LmM6OTE5OiBpb21tdV9mYXVsdF9zdGF0dXM6IEZhdWx0IE92ZXJmbG93Cj4gKFhFTikgW1ZULURd
aW9tbXUuYzo5MjE6IGlvbW11X2ZhdWx0X3N0YXR1czogUHJpbWFyeSBQZW5kaW5nIEZhdWx0Cj4g
KFhFTikgW1ZULURdRE1BUjpbRE1BIFJlYWRdIFJlcXVlc3QgZGV2aWNlIFswMDAwOjAwOjAyLjBd
IGZhdWx0IGFkZHIKPiA0MjhmOTI2MDAwLCBpb21tdSByZWcgPSBmZmZmODJjMDAwYTBjMDAwCj4g
KFhFTikgW1ZULURdRE1BUjogcmVhc29uIDA2IC0gUFRFIFJlYWQgYWNjZXNzIGlzIG5vdCBzZXQK
PiAoWEVOKSBwcmludF92dGRfZW50cmllczogaW9tbXUgIzAgZGV2IDAwMDA6MDA6MDIuMCBnbWZu
IDQyOGY5MjYKPiAoWEVOKSAgICAgcm9vdF9lbnRyeVswMF0gPSA0M2FhYWUwMDEKPiAoWEVOKSAg
ICAgY29udGV4dFsxMF0gPSAyXzQzY2Y5MjAwMQo+IChYRU4pICAgICBsNFswMDBdID0gOWMwMDAw
MDQzY2Y5MTEwNwo+IChYRU4pICAgICBsM1sxMGFdID0gODAwMDAwMDAwMDAwMDAwMAo+IChYRU4p
ICAgICBsM1sxMGFdIG5vdCBwcmVzZW50Cj4gCj4gVGhlIGZhdWx0IGlzIHJlcGVhdGVkIGEgbWls
bGlvbiB0aW1lcyBwZXIgc2Vjb25kIGFuZCB0aGUgc3lzdGVtIGlzCj4gcHJldHR5IG11Y2ggc3Rh
bGxlZC4KCkFzIEphbiBzYXlzLCB0aGlzIHBhZ2UgaXMgb3V0c2lkZSBvZiBhbnkgcmFuZ2UgaW4g
dGhlIG1lbW9yeSBtYXAuIEkKd29uZGVyIGhvd2V2ZXIgd2hhdCdzIGluIHRoZXJlLgoKSSB0aGlu
ayAoYWxzbyBzZWVpbmcgdGhlIFBWIGlzc3VlcykgeW91IHNob3VsZCBicmluZyB0aGlzIHVwIHdp
dGggdGhlCmRyaXZlciBtYWludGFpbmVycywgaXQgbWlnaHQgYWN0dWFsbHkgYmUgYSBidWcgdGhh
dCB0aGUgZHJpdmVyIGlzCnRyeWluZyB0byBhY2Nlc3Mgc3VjaCBhZGRyZXNzLgoKSW4gdGhlIG1l
YW50aW1lLCB5b3UgY2FuIHRyeSB0byBhZGQgdG8gdGhlIGNvbW1hbmQgbGluZToKCnJtcnI9MHg0
MjhmOTI2PTA6MDoyLjAKCkluIG9yZGVyIHRvIGZvcmNlIGFuIGlvbW11IG1hcHBpbmcgb2YgdGhp
cyBhZGRyZXNzLgoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
