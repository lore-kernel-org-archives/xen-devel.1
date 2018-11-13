From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [PATCH 2/3] x86/HVM: make hvmemul_map_linear_addr()
 honor p2m_ioreq_server
Date: Tue, 13 Nov 2018 10:29:26 +0000
Message-ID: <b9d2c741d1974a348929c3b0b5cd7584@AMSPEX02CL03.citrite.net>
References: <5BEAA1DB02000078001FB5BD@prv1-mh.provo.novell.com>
 <5BEAA3F102000078001FB5D0@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=89dt=ny=citrix.com=prvs=84824ace7=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1gMVwn-0003Cj-0Z
 for xen-devel@lists.xenproject.org; Tue, 13 Nov 2018 10:29:29 +0000
In-Reply-To: <5BEAA3F102000078001FB5D0@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: 'Jan Beulich' <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEphbiBCZXVsaWNoIFttYWlsdG86
SkJldWxpY2hAc3VzZS5jb21dCj4gU2VudDogMTMgTm92ZW1iZXIgMjAxOCAxMDoxNAo+IFRvOiB4
ZW4tZGV2ZWwgPHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZz4KPiBDYzogQW5kcmV3IENv
b3BlciA8QW5kcmV3LkNvb3BlcjNAY2l0cml4LmNvbT47IFBhdWwgRHVycmFudAo+IDxQYXVsLkR1
cnJhbnRAY2l0cml4LmNvbT47IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Cj4gU3ViamVj
dDogW1BBVENIIDIvM10geDg2L0hWTTogbWFrZSBodm1lbXVsX21hcF9saW5lYXJfYWRkcigpIGhv
bm9yCj4gcDJtX2lvcmVxX3NlcnZlcgo+IAo+IFdyaXRlIGFjY2Vzc2VzIHRvIHAybV9pb3JlcV9z
ZXJ2ZXIgcGFnZXMgc2hvdWxkIGdldCByZWRpcmVjdGVkIHRvIHRoZQo+IGVtdWxhdG9yIGFsc28g
d2hlbiB1c2luZyB0aGUgbWFwcGluZyBhcHByb2FjaC4gRXh0ZW5kIHRoZQo+IHAybV9pc19kaXNj
YXJkX3dyaXRlKCkgY2hlY2sgdGhlcmUsIGFuZCByZXN0cmljdCBib3RoIHRvIHRoZSB3cml0ZQo+
IGFjY2VzcyBjYXNlICh0aGlzIGlzIGp1c3QgYSBsYXRlbnQgYnVnIGFzIGN1cnJlbnRseSB3ZSBn
byB0aGlzIHJvdXRlCj4gb25seSBmb3Igd3JpdGUgYWNjZXNzZXMpLgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KClJldmlld2VkLWJ5OiBQYXVsIER1
cnJhbnQgPHBhdWwuZHVycmFudEBjaXRyaXguY29tPgoKPiAKPiAtLS0gYS94ZW4vYXJjaC94ODYv
aHZtL2VtdWxhdGUuYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9odm0vZW11bGF0ZS5jCj4gQEAgLTYx
MywxMCArNjEzLDIxIEBAIHN0YXRpYyB2b2lkICpodm1lbXVsX21hcF9saW5lYXJfYWRkcigKPiAK
PiAgICAgICAgICAqbWZuKysgPSBwYWdlX3RvX21mbihwYWdlKTsKPiAKPiAtICAgICAgICBpZiAo
IHAybV9pc19kaXNjYXJkX3dyaXRlKHAybXQpICkKPiArICAgICAgICBpZiAoIHBmZWMgJiBQRkVD
X3dyaXRlX2FjY2VzcyApCj4gICAgICAgICAgewo+IC0gICAgICAgICAgICBlcnIgPSBFUlJfUFRS
KH5YODZFTVVMX09LQVkpOwo+IC0gICAgICAgICAgICBnb3RvIG91dDsKPiArICAgICAgICAgICAg
aWYgKCBwMm1faXNfZGlzY2FyZF93cml0ZShwMm10KSApCj4gKyAgICAgICAgICAgIHsKPiArICAg
ICAgICAgICAgICAgIGVyciA9IEVSUl9QVFIoflg4NkVNVUxfT0tBWSk7Cj4gKyAgICAgICAgICAg
ICAgICBnb3RvIG91dDsKPiArICAgICAgICAgICAgfQo+ICsKPiArICAgICAgICAgICAgaWYgKCBw
Mm10ID09IHAybV9pb3JlcV9zZXJ2ZXIgKQo+ICsgICAgICAgICAgICB7Cj4gKyAgICAgICAgICAg
ICAgICBlcnIgPSBOVUxMOwo+ICsgICAgICAgICAgICAgICAgZ290byBvdXQ7Cj4gKyAgICAgICAg
ICAgIH0KPiArCj4gKyAgICAgICAgICAgIEFTU0VSVChwMm10ID09IHAybV9yYW1fbG9nZGlydHkg
fHwgIXAybV9pc19yZWFkb25seShwMm10KSk7Cj4gICAgICAgICAgfQo+ICAgICAgfQo+IAo+IAo+
IAo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
