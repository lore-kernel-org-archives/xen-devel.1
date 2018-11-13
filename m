From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [PATCH 1/3] x86/HVM: __hvm_copy() should not write
 to p2m_ioreq_server pages
Date: Tue, 13 Nov 2018 10:27:50 +0000
Message-ID: <1f9196d2f7c748e4a9283fe6ba9ca99b@AMSPEX02CL03.citrite.net>
References: <5BEAA1DB02000078001FB5BD@prv1-mh.provo.novell.com>
 <5BEAA3DA02000078001FB5CB@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=89dt=ny=citrix.com=prvs=84824ace7=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1gMVvG-00030w-Fx
 for xen-devel@lists.xenproject.org; Tue, 13 Nov 2018 10:27:54 +0000
In-Reply-To: <5BEAA3DA02000078001FB5CB@prv1-mh.provo.novell.com>
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
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Igor Druzhinin <igor.druzhinin@citrix.com>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEphbiBCZXVsaWNoIFttYWlsdG86
SkJldWxpY2hAc3VzZS5jb21dCj4gU2VudDogMTMgTm92ZW1iZXIgMjAxOCAxMDoxNAo+IFRvOiB4
ZW4tZGV2ZWwgPHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZz4KPiBDYzogQW5kcmV3IENv
b3BlciA8QW5kcmV3LkNvb3BlcjNAY2l0cml4LmNvbT47IFBhdWwgRHVycmFudAo+IDxQYXVsLkR1
cnJhbnRAY2l0cml4LmNvbT47IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Cj4gU3ViamVj
dDogW1BBVENIIDEvM10geDg2L0hWTTogX19odm1fY29weSgpIHNob3VsZCBub3Qgd3JpdGUgdG8K
PiBwMm1faW9yZXFfc2VydmVyIHBhZ2VzCj4gCj4gQ29tbWl0IDNiZGVjNTMwYTUgKCJ4ODYvSFZN
OiBzcGxpdCBwYWdlIHN0cmFkZGxpbmcgZW11bGF0ZWQgYWNjZXNzZXMgaW4KPiBtb3JlIGNhc2Vz
IikgaW50cm9kdWNlZCBhIGh2bV9jb3B5X3RvX2d1ZXN0X2xpbmVhcigpIGF0dGVtcHQgYmVmb3Jl
Cj4gZmFsbGluZyBiYWNrIHRvIGh2bWVtdWxfbGluZWFyX21taW9fd3JpdGUoKS4gVGhpcyBpcyB3
cm9uZyBmb3IgdGhlCj4gcDJtX2lvcmVxX3NlcnZlciBzcGVjaWFsIGNhc2UuIFRoYXQgY2hhbmdl
IHdpZGVuZWQgYSBwcmUtZXhpc3RpbmcgaXNzdWUKPiB0aG91Z2g6IE90aGVyIHdyaXRlcyB0byBz
dWNoIHBhZ2VzIGFsc28gbmVlZCB0byBiZSBmYWlsZWQgKG9yIGZvcmNlZAo+IHRocm91Z2ggZW11
bGF0aW9uKSwgaW4gcGFydGljdWxhciBoeXBlcmNhbGwgYnVmZmVyIHdyaXRlcy4KPiAKPiBSZXBv
cnRlZC1ieTogPz8/IDw/Pz9AY2l0cml4LmNvbT4KCkkgdGhpbmsgdGhpcyBzaG91bGQgYmU6IEln
b3IgRHJ1emhpbmluIDxpZ29yLmRydXpoaW5pbkBjaXRyaXguY29tPgoKPiBTaWduZWQtb2ZmLWJ5
OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpSZXZpZXdlZC1ieTogUGF1bCBEdXJy
YW50IDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4KCj4gCj4gLS0tIGEveGVuL2FyY2gveDg2L2h2
bS9odm0uYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9odm0vaHZtLmMKPiBAQCAtMzIwMiw2ICszMjAy
LDEyIEBAIHN0YXRpYyBlbnVtIGh2bV90cmFuc2xhdGlvbl9yZXN1bHQgX19odm0KPiAgICAgICAg
ICBpZiAoIHJlcyAhPSBIVk1UUkFOU19va2F5ICkKPiAgICAgICAgICAgICAgcmV0dXJuIHJlczsK
PiAKPiArICAgICAgICBpZiAoIChmbGFncyAmIEhWTUNPUFlfdG9fZ3Vlc3QpICYmIHAybXQgPT0g
cDJtX2lvcmVxX3NlcnZlciApCj4gKyAgICAgICAgewo+ICsgICAgICAgICAgICBwdXRfcGFnZShw
YWdlKTsKPiArICAgICAgICAgICAgcmV0dXJuIEhWTVRSQU5TX2JhZF9nZm5fdG9fbWZuOwo+ICsg
ICAgICAgIH0KPiArCj4gICAgICAgICAgcCA9IChjaGFyICopX19tYXBfZG9tYWluX3BhZ2UocGFn
ZSkgKyAoYWRkciAmIH5QQUdFX01BU0spOwo+IAo+ICAgICAgICAgIGlmICggZmxhZ3MgJiBIVk1D
T1BZX3RvX2d1ZXN0ICkKPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
