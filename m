From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 6/9] viridian: separate time related
 enlightenment implementations...
Date: Mon, 05 Nov 2018 06:36:37 -0700
Message-ID: <5BE0476502000078001F80B2@prv1-mh.provo.novell.com>
References: <20181031124335.23867-1-paul.durrant@citrix.com>
 <20181031124335.23867-7-paul.durrant@citrix.com>
 <5BE03E0902000078001F8001@prv1-mh.provo.novell.com>
 <3f74ff787b5443e39f1472f3a839f646@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=5iqt=nq=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gJf3a-0007U5-Li
 for xen-devel@lists.xenproject.org; Mon, 05 Nov 2018 13:36:42 +0000
In-Reply-To: <3f74ff787b5443e39f1472f3a839f646@AMSPEX02CL03.citrite.net>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA1LjExLjE4IGF0IDE0OjI2LCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+PiBGcm9tOiBKYW4gQmV1bGljaCBbbWFpbHRvOkpCZXVsaWNoQHN1c2UuY29tXQo+PiBTZW50
OiAwNSBOb3ZlbWJlciAyMDE4IDEyOjU3Cj4+IAo+PiA+Pj4gT24gMzEuMTAuMTggYXQgMTM6NDMs
IDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4gd3JvdGU6Cj4+ID4gLS0tIC9kZXYvbnVsbAo+PiA+
ICsrKyBiL3hlbi9hcmNoL3g4Ni9odm0vdmlyaWRpYW4vdGltZS5jCj4+ID4gQEAgLTAsMCArMSwy
NDUgQEAKPj4gPgo+PiArLyoqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKgo+PiAqKgo+PiA+ICoKPj4gPiArICogdGlt
ZS5jCj4+ID4gKyAqCj4+ID4gKyAqIEFuIGltcGxlbWVudGF0aW9uIG9mIHNvbWUgdGltZSByZWxh
dGVkIFZpcmlkaWFuIGVubGlnaHRlbm1lbnRzLgo+PiA+ICsgKiBTZWUgTWljcm9zb2Z0J3MgSHlw
ZXJ2aXNvciBUb3AgTGV2ZWwgRnVuY3Rpb25hbCBTcGVjaWZpY2F0aW9uLgo+PiA+ICsgKiBmb3Ig
bW9yZSBpbmZvcm1hdGlvbi4KPj4gPiArICovCj4+ID4gKwo+PiA+ICsjaW5jbHVkZSA8eGVuL2Rv
bWFpbl9wYWdlLmg+Cj4+ID4gKyNpbmNsdWRlIDx4ZW4vaHlwZXJjYWxsLmg+Cj4+ID4gKyNpbmNs
dWRlIDx4ZW4vc2NoZWQuaD4KPj4gPiArI2luY2x1ZGUgPHhlbi92ZXJzaW9uLmg+Cj4+ID4gKwo+
PiA+ICsjaW5jbHVkZSA8YXNtL2FwaWMuaD4KPj4gPiArI2luY2x1ZGUgPGFzbS9odm0vc3VwcG9y
dC5oPgo+PiA+ICsKPj4gPiArdHlwZWRlZiBzdHJ1Y3QgX0hWX1JFRkVSRU5DRV9UU0NfUEFHRQo+
PiA+ICt7Cj4+ID4gKyAgICB1aW50MzJfdCBUc2NTZXF1ZW5jZTsKPj4gPiArICAgIHVpbnQzMl90
IFJlc2VydmVkMTsKPj4gPiArICAgIHVpbnQ2NF90IFRzY1NjYWxlOwo+PiA+ICsgICAgaW50NjRf
dCAgVHNjT2Zmc2V0Owo+PiA+ICsgICAgdWludDY0X3QgUmVzZXJ2ZWQyWzUwOV07Cj4+ID4gK30g
SFZfUkVGRVJFTkNFX1RTQ19QQUdFLCAqUEhWX1JFRkVSRU5DRV9UU0NfUEFHRTsKPj4gCj4+IEFu
ZCB5b3Ugd2FudCB0byBjb250aW51ZSB0byBoYXZlIGl0IGFsbCB1cHBlciBjYXNlLCBkZXNwaXRl
IHVzIG5vcm1hbGx5Cj4+IHVzaW5nIHN1Y2ggaWRlbnRpZmllcnMgZm9yICNkZWZpbmUtcyBvbmx5
Pwo+PiAKPiAKPiBJdCdzIGEgZGVmaW5pdGlvbiBsaWZ0ZWQgZnJvbSB0aGUgc3BlYy4gc28gaXQn
cyB1c3VhbCBNaWNyb3NvZnQgc3R5bGUuLi4gCj4gaS5lLiB1cHBlciBjYXNlIHR5cGVzIGFuZCBj
YW1lbC1jYXNlIG5hbWVzLiBJIGRpZG4ndCBkZWZpbmUgVUlOVDMyLCBJTlQ2NCBhbmQgCj4gVUlO
VDY0IHR5cGVzIC0gYXMgdXNlZCBieSB0aGUgc3BlYyAtIGJ1dCBJIGNvdWxkIGRvIHNvIGlmIHlv
dSdkIHByZWZlciB0aGUgCj4gY29uc2lzdGVuY3kuCgpPaCwgbm8sIEknbSBub3QgbG9va2luZyBm
b3J3YXJkIHRvIHNlZSBVSU5UPG4+IGFwcGVhci4gSQp3YXMgcmF0aGVyIGFza2luZyB3aGV0aGVy
IHRoZSBvZGQgYWxsLXVwcGVyLWNhc2UgbmFtaW5nCmNvdWxkIGJlIGNoYW5nZWQsIHRvIGJlIGlu
IGxpbmUgd2l0aCBvdXIgc3R5bGUgcmF0aGVyIHRoYW4KTWljcm9zb2Z0J3MuCgo+PiBBcGFydCBm
cm9tIHRoYXQgc2FtZSByZW1hcmsgcmVnYXJkaW5nIHRoZSBwbGFjZW1lbnQgb2YgdGhlIGZ1bmN0
aW9uCj4+IGRlY2xhcmF0aW9ucyBhcyBmb3IgdGhlIHByZXZpb3VzIHBhdGNoLgo+IAo+IEkgYXNz
dW1lIHlvdSBtZWFuIGluIHRoZSBwcm9wb3NlZCBuZXcgaGVhZGVyLCB3aGljaCBpcyBmaW5lLgoK
WWVzLCB0aGF0J3Mgd2hhdCBJIG1lYW4uCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
