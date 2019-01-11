From: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <royger@freebsd.org>
Subject: Re: [PATCH v3 07/15] argo: implement the register op
Date: Fri, 11 Jan 2019 10:38:08 +0100
Message-ID: <CAPLaKK6zRLA3eF3On+GNcNG3ZgMJrtO-3are7Uxn8U8t+bytfw@mail.gmail.com>
References: <1546846968-7372-1-git-send-email-christopher.w.clark@gmail.com>
 <1546846968-7372-8-git-send-email-christopher.w.clark@gmail.com>
 <CAPLaKK6g4qvrb2b309AdUBhxwxRVyy7D2sajJ=F1eYcc4Y6-6Q@mail.gmail.com>
 <CACMJ4GY7Gh4SmSgKhSQSO_tnhrAcZ1h=dcbp6kdaHSUv=GxKyQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=lPHj=PT=gmail.com=royger@srs-us1.protection.inumbo.net>)
 id 1ghtGf-0003Tr-V7
 for xen-devel@lists.xenproject.org; Fri, 11 Jan 2019 09:38:21 +0000
Received: by mail-ot1-f65.google.com with SMTP id s5so12566878oth.7
 for <xen-devel@lists.xenproject.org>; Fri, 11 Jan 2019 01:38:20 -0800 (PST)
In-Reply-To: <CACMJ4GY7Gh4SmSgKhSQSO_tnhrAcZ1h=dcbp6kdaHSUv=GxKyQ@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Ross Philipson <ross.philipson@gmail.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jason Andryuk <jandryuk@gmail.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Tim Deegan <tim@xen.org>, Daniel Smith <dpsmith@apertussolutions.com>, Rich Persaud <persaur@gmail.com>, Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, James McKenzie <james@bromium.com>, Eric Chanudet <eric.chanudet@gmail.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBKYW4gMTEsIDIwMTkgYXQgNzoyOSBBTSBDaHJpc3RvcGhlciBDbGFyawo8Y2hyaXN0
b3BoZXIudy5jbGFya0BnbWFpbC5jb20+IHdyb3RlOgo+Cj4gT24gVGh1LCBKYW4gMTAsIDIwMTkg
YXQgMzoyNSBBTSBSb2dlciBQYXUgTW9ubsOpIDxyb3lnZXJAZ21haWwuY29tPiB3cm90ZToKPiA+
Cj4gPiAgT24gTW9uLCBKYW4gNywgMjAxOSBhdCA4OjQ0IEFNIENocmlzdG9waGVyIENsYXJrCj4g
PiA8Y2hyaXN0b3BoZXIudy5jbGFya0BnbWFpbC5jb20+IHdyb3RlOgo+ID4gPiArc3RhdGljIGlu
dAo+ID4gPiArcmluZ19tYXBfcGFnZShzdHJ1Y3QgYXJnb19yaW5nX2luZm8gKnJpbmdfaW5mbywg
dW5zaWduZWQgaW50IGksIHZvaWQgKipvdXRfcHRyKQo+ID4gPiArewo+ID4gPiArICAgIGlmICgg
aSA+PSByaW5nX2luZm8tPm5tZm5zICkKPiA+ID4gKyAgICB7Cj4gPiA+ICsgICAgICAgIGdwcmlu
dGsoWEVOTE9HX0VSUiwKPiA+ID4gKyAgICAgICAgICAgICAgICJhcmdvOiByaW5nICh2bSV1OiV4
IHZtJWQpICVwIGF0dGVtcHRlZCB0byBtYXAgcGFnZSAgJXUgb2YgJXVcbiIsCj4gPiA+ICsgICAg
ICAgICAgICAgICAgcmluZ19pbmZvLT5pZC5kb21haW5faWQsIHJpbmdfaW5mby0+aWQucG9ydCwK
PiA+ID4gKyAgICAgICAgICAgICAgICByaW5nX2luZm8tPmlkLnBhcnRuZXJfaWQsIHJpbmdfaW5m
bywgaSwgcmluZ19pbmZvLT5ubWZucyk7Cj4gPiA+ICsgICAgICAgIHJldHVybiAtRU5PTUVNOwo+
ID4gPiArICAgIH0KPiA+ID4gKwo+ID4gPiArICAgIGlmICggIXJpbmdfaW5mby0+bWZucyB8fCAh
cmluZ19pbmZvLT5tZm5fbWFwcGluZykKPiA+ID4gKyAgICB7Cj4gPiA+ICsgICAgICAgIEFTU0VS
VF9VTlJFQUNIQUJMRSgpOwo+ID4gPiArICAgICAgICByaW5nX2luZm8tPmxlbiA9IDA7Cj4gPiA+
ICsgICAgICAgIHJldHVybiAtRU5PTUVNOwo+ID4gPiArICAgIH0KPiA+ID4gKwo+ID4gPiArICAg
IGlmICggIXJpbmdfaW5mby0+bWZuX21hcHBpbmdbaV0gKQo+ID4gPiArICAgIHsKPiA+ID4gKyAg
ICAgICAgLyoKPiA+ID4gKyAgICAgICAgICogVE9ETzoKPiA+ID4gKyAgICAgICAgICogVGhlIGZp
cnN0IHBhZ2Ugb2YgdGhlIHJpbmcgY29udGFpbnMgdGhlIHJpbmcgaW5kaWNlcywgc28gYm90aCBy
ZWFkCj4gPiA+ICsgICAgICAgICAqIGFuZCB3cml0ZSBhY2Nlc3MgdG8gdGhlIHBhZ2UgaXMgcmVx
dWlyZWQgYnkgdGhlIGh5cGVydmlzb3IsIGJ1dAo+ID4gPiArICAgICAgICAgKiByZWFkLWFjY2Vz
cyBpcyBub3QgbmVlZGVkIGZvciB0aGlzIG1hcHBpbmcgZm9yIHRoZSByZW1haW5kZXIgb2YgdGhl
Cj4gPiA+ICsgICAgICAgICAqIHJpbmcuCj4gPiA+ICsgICAgICAgICAqIFNpbmNlIHRoaXMgbWFw
cGluZyB3aWxsIHJlbWFpbiByZXNpZGVudCBpbiBYZW4ncyBhZGRyZXNzIHNwYWNlIGZvcgo+ID4g
PiArICAgICAgICAgKiB0aGUgbGlmZXRpbWUgb2YgdGhlIHJpbmcsIGFuZCBmb2xsb3dpbmcgdGhl
IHByaW5jaXBsZSBvZiBsZWFzdAo+ID4gPiArICAgICAgICAgKiBwcml2aWxlZ2UsIGl0IGNvdWxk
IGJlIHByZWZlcmFibGUgdG86Cj4gPiA+ICsgICAgICAgICAqICAjIGFkZCBhIFhTTSBjaGVjayB0
byBkZXRlcm1pbmUgd2hhdCBwb2xpY3kgaXMgd2FudGVkIGhlcmUKPiA+ID4gKyAgICAgICAgICog
ICMgZGVwZW5kaW5nIG9uIHRoZSBYU00gcXVlcnksIG9wdGlvbmFsbHkgY3JlYXRlIHRoaXMgbWFw
cGluZyBhcwo+ID4gPiArICAgICAgICAgKiAgICBfd3JpdGUtb25seV8gb24gcGxhdGZvcm1zIHRo
YXQgY2FuIHN1cHBvcnQgaXQuCj4gPiA+ICsgICAgICAgICAqICAgIChlZy4gSW50ZWwgRVBUL0FN
RCBOUFQpLgo+ID4KPiA+IFdoeSBkbyBJbnRlbCBFUFQgb3IgQU1EIE5QVCBtYXR0ZXIgaGVyZT8K
Pgo+IEkgdGhpbmsgKHRob3VnaCBjb3VsZCBiZSB3cm9uZyBhbmQgYW0gb3BlbiB0byBjb3JyZWN0
aW9uIGhlcmUpIHRoYXQKPiBFUFQgYW5kIE5QVCBlbmFibGUgdGhlIGNvbnN0cnVjdGlvbiBvZiB3
cml0ZS1vbmx5IChpZSBub3QgcmVhZGFibGUpCj4gbWVtb3J5IG1hcHBpbmdzLiBTdGFuZGFyZCBw
YWdlIHRhYmxlcyBjYW4ndCBkbyB0aGF0OiB3aXRoIHRob3NlLAo+IGlmIGl0J3Mgd3JpdGFibGUs
IGl0J3MgYWxzbyByZWFkYWJsZS4KClRoZSBoeXBlcnZpc29yIGl0c2VsZiBkb2Vzbid0IHJ1biBv
biBFUFQgb3IgTlBUIHNlY29uZCBzdGFnZQp0cmFuc2xhdGlvbiwgdGhhdCdzIHVzZWQgZXhjbHVz
aXZlbHkgZm9yIChIVk0pIGd1ZXN0cy4gU28gZXZlbiBpZgp0aGVyZSdzIHN1Y2ggc3VwcG9ydCBp
biBFUFQgb3IgTlBUIGl0J3Mgbm90IHJlbGV2YW50IGhlcmUuIHg4NiBwYWdlCnRhYmxlcyBkb24n
dCBoYXZlIHRoZSBjYXBhYmlsaXR5IHRvIGNyZWF0ZSB3cml0ZS1vbmx5IG1hcHBpbmdzLgoKVGhh
bmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
