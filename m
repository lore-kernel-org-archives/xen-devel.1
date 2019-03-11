From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [PATCH] x86/HVM: don't crash guest in
 hvmemul_find_mmio_cache()
Date: Mon, 11 Mar 2019 10:11:00 +0000
Message-ID: <c4d5d32e8f8d4662ac1904786e93b2cb@AMSPEX02CL02.citrite.net>
References: <5C863097020000780021D1CD@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TKYa=RO=citrix.com=prvs=96668afeb=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1h3HuW-0006JZ-6q
 for xen-devel@lists.xenproject.org; Mon, 11 Mar 2019 10:11:56 +0000
In-Reply-To: <5C863097020000780021D1CD@prv1-mh.provo.novell.com>
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
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEphbiBCZXVsaWNoIFttYWlsdG86
SkJldWxpY2hAc3VzZS5jb21dCj4gU2VudDogMTEgTWFyY2ggMjAxOSAwOTo1Ngo+IFRvOiB4ZW4t
ZGV2ZWwgPHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZz4KPiBDYzogQW5kcmV3IENvb3Bl
ciA8QW5kcmV3LkNvb3BlcjNAY2l0cml4LmNvbT47IFBhdWwgRHVycmFudCA8UGF1bC5EdXJyYW50
QGNpdHJpeC5jb20+OyBSb2dlciBQYXUgTW9ubmUKPiA8cm9nZXIucGF1QGNpdHJpeC5jb20+OyBX
ZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgo+IFN1YmplY3Q6IFtQQVRDSF0geDg2L0hWTTog
ZG9uJ3QgY3Jhc2ggZ3Vlc3QgaW4gaHZtZW11bF9maW5kX21taW9fY2FjaGUoKQo+IAo+IENvbW1p
dCAzNWE2MWMwNWVhICgieDg2ZW11bDogYWRqdXN0IGhhbmRsaW5nIG9mIEFWWDIgZ2F0aGVycyIp
IGJ1aWxkcwo+IHVwb24gdGhlIGZhY3QgdGhhdCB0aGUgZG9tYWluIHdpbGwgYWN0dWFsbHkgc3Vy
dml2ZSBydW5uaW5nIG91dCBvZiBNTUlPCj4gcmVzdWx0IGJ1ZmZlciBzcGFjZS4gRHJvcCB0aGUg
ZG9tYWluX2NyYXNoKCkgaW52b2NhdGlvbi4gQWxzbyBkZWxheQo+IGluY3JlbWVudGluZyBvZiB0
aGUgdXNhZ2UgY291bnRlciwgc3VjaCB0aGF0IHRoZSBmdW5jdGlvbiBjYW4ndCBwb3NzaWJseQo+
IHVzZS9yZXR1cm4gYW4gb3V0LW9mLWJvdW5kcyBzbG90L3BvaW50ZXIgaW4gY2FzZSBleGVjdXRp
b24gc3Vic2VxdWVudGx5Cj4gbWFrZXMgaXQgaW50byB0aGUgZnVuY3Rpb24gYWdhaW4gd2l0aG91
dCBhIHByaW9yIHJlc2V0IG9mIHN0YXRlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNo
IDxqYmV1bGljaEBzdXNlLmNvbT4KPiAKPiAtLS0gYS94ZW4vYXJjaC94ODYvaHZtL2VtdWxhdGUu
Ywo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9odm0vZW11bGF0ZS5jCj4gQEAgLTk2NiwxMiArOTY2LDEx
IEBAIHN0YXRpYyBzdHJ1Y3QgaHZtX21taW9fY2FjaGUgKmh2bWVtdWxfZmkKPiAgICAgICAgICAg
ICAgcmV0dXJuIGNhY2hlOwo+ICAgICAgfQo+IAo+IC0gICAgaSA9IHZpby0+bW1pb19jYWNoZV9j
b3VudCsrOwo+ICsgICAgaSA9IHZpby0+bW1pb19jYWNoZV9jb3VudDsKPiAgICAgIGlmKCBpID09
IEFSUkFZX1NJWkUodmlvLT5tbWlvX2NhY2hlKSApCj4gLSAgICB7Cj4gLSAgICAgICAgZG9tYWlu
X2NyYXNoKGN1cnJlbnQtPmRvbWFpbik7Cj4gICAgICAgICAgcmV0dXJuIE5VTEw7Cj4gLSAgICB9
Cj4gKwo+ICsgICAgKyt2aW8tPm1taW9fY2FjaGVfY291bnQ7CgpBRkFJQ1QgdGhpcyBpc24ndCBn
b2luZyB0byBzdG9wIHRoZSBmb3IgbG9vcCBhdCB0aGUgdG9wIG9mIHRoZSBmdW5jdGlvbiBhY2Nl
c3Npbmcgb25lIGVudHJ5IGJleW9uZCB0aGUgYm91bmRzIG9mIHRoZSBhcnJheS4gSWYgeW91J3Jl
IGdvaW5nIHRvIHJlbW92ZSB0aGUgZG9tYWluX2NyYXNoKCkgdGhlbiBJIHRoaW5rIHlvdSBhbHNv
IG5lZWQgdG8gbW92ZSB0aGUgYm91bmRzIGNoZWNrIHRvIHRoZSB0b3Agb2YgdGhlIGZ1bmN0aW9u
LgoKICBQYXVsCgo+IAo+ICAgICAgY2FjaGUgPSAmdmlvLT5tbWlvX2NhY2hlW2ldOwo+ICAgICAg
bWVtc2V0KGNhY2hlLCAwLCBzaXplb2YgKCpjYWNoZSkpOwo+IAoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
