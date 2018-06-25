From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: Ping: [PATCH 2/2] x86/HVM: attempts to emulate FPU
 insns need to set fpu_initialised
Date: Mon, 25 Jun 2018 07:20:17 +0000
Message-ID: <82c56214d41a4d1aad8470be37b48789@AMSPEX02CL03.citrite.net>
References: <5B237D0B02000078001CB837@prv1-mh.provo.novell.com>
 <5B237FC302000078001CB84E@prv1-mh.provo.novell.com>
 <5B2CD4FC02000078001CCEEC@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ndbz=jl=citrix.com=prvs=707e514f0=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1fXLnQ-0003AZ-HS
 for xen-devel@lists.xenproject.org; Mon, 25 Jun 2018 07:20:20 +0000
In-Reply-To: <5B2CD4FC02000078001CCEEC@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: 'Jan Beulich' <JBeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEphbiBCZXVsaWNoIFttYWlsdG86
SkJldWxpY2hAc3VzZS5jb21dCj4gU2VudDogMjIgSnVuZSAyMDE4IDExOjUzCj4gVG86IFBhdWwg
RHVycmFudCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+Cj4gQ2M6IEFuZHJldyBDb29wZXIgPEFu
ZHJldy5Db29wZXIzQGNpdHJpeC5jb20+OyB4ZW4tZGV2ZWwgPHhlbi0KPiBkZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZz47IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KPiBTdWJqZWN0
OiBQaW5nOiBbUEFUQ0ggMi8yXSB4ODYvSFZNOiBhdHRlbXB0cyB0byBlbXVsYXRlIEZQVSBpbnNu
cyBuZWVkIHRvCj4gc2V0IGZwdV9pbml0aWFsaXNlZAo+IAo+ID4+PiBPbiAxNS4wNi4xOCBhdCAx
MDo1OCwgPEpCZXVsaWNoQHN1c2UuY29tPiB3cm90ZToKPiA+IE15IG9yaWdpbmFsIHdheSBvZiB0
aGlua2luZyBoZXJlIHdhcyB0aGF0IHRoaXMgd291bGQgYmUgc2V0IGFueXdheSBhdAo+ID4gdGhl
IHBvaW50IHN0YXRlIGdldHMgcmVsb2FkZWQgYWZ0ZXIgdGhlIGFkanVzdG1lbnRzIGh2bWVtdWxf
cHV0X2ZwdSgpCj4gPiBkb2VzLCBidXQgdGhlIGZsYWcgc2hvdWxkIGFscmVhZHkgYmUgc2V0IGJl
Zm9yZSB0aGF0IC0gYWZ0ZXIgYWxsIHRoZQo+ID4gZ3Vlc3QgbWF5IG5ldmVyIGFnYWluIHRvdWNo
IHRoZSBGUFUgYmVmb3JlIGUuZy4gZ2V0dGluZyBtaWdyYXRlZC9zYXZlZC4KPiA+Cj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gPgo+ID4gLS0tIGEv
eGVuL2FyY2gveDg2L2h2bS9lbXVsYXRlLmMKPiA+ICsrKyBiL3hlbi9hcmNoL3g4Ni9odm0vZW11
bGF0ZS5jCj4gPiBAQCAtMjA1Myw2ICsyMDUzLDcgQEAgc3RhdGljIGludCBodm1lbXVsX2dldF9m
cHUoCj4gPiAgICAgICAgICAgKiBtYXNraW5nIG9mIGFsbCBleGNlcHRpb25zIGJ5IEZOU1RFTlYu
KQo+ID4gICAgICAgICAgICovCj4gPiAgICAgICAgICBzYXZlX2ZwdV9lbmFibGUoKTsKPiA+ICsg
ICAgICAgIGN1cnItPmZwdV9pbml0aWFsaXNlZCA9IHRydWU7Cj4gPiAgICAgICAgICBjdXJyLT5m
cHVfZGlydGllZCA9IHRydWU7Cj4gPiAgICAgICAgICBpZiAoIChmcHVfY3R4dC0+ZmN3ICYgMHgz
ZikgIT0gMHgzZiApCj4gPiAgICAgICAgICB7Cj4gCgpBcG9sb2dpZXMgZm9yIHRoZSBkZWxheS4u
LgoKQWNrZWQtYnk6IFBhdWwgRHVycmFudCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+CgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
