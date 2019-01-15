From: Christopher Clark <christopher.w.clark@gmail.com>
Subject: Re: [PATCH v3 04/15] argo: init, destroy and soft-reset,
 with enable command line opt
Date: Mon, 14 Jan 2019 23:24:00 -0800
Message-ID: <CACMJ4GZNFV9E7Vvz3bG7XtDr5X7dc_v2+PagTYh8mpECXkNjyw@mail.gmail.com>
References: <1546846968-7372-1-git-send-email-christopher.w.clark@gmail.com>
 <1546846968-7372-5-git-send-email-christopher.w.clark@gmail.com>
 <90a21420-9f9f-7a8f-32e5-b00e3e3bd1d0@citrix.com>
 <5C3CA6E5020000780020D59D@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rejp=PX=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
 id 1gjJ55-0000df-O7
 for xen-devel@lists.xenproject.org; Tue, 15 Jan 2019 07:24:15 +0000
Received: by mail-lj1-x244.google.com with SMTP id k19-v6so1381654lji.11
 for <xen-devel@lists.xenproject.org>; Mon, 14 Jan 2019 23:24:14 -0800 (PST)
In-Reply-To: <5C3CA6E5020000780020D59D@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Ross Philipson <ross.philipson@gmail.com>, Jason Andryuk <jandryuk@gmail.com>, Daniel Smith <dpsmith@apertussolutions.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Rich Persaud <persaur@gmail.com>, James McKenzie <james@bromium.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, eric chanudet <eric.chanudet@gmail.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBKYW4gMTQsIDIwMTkgYXQgNzoxMiBBTSBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+Cj4gPj4+IE9uIDE0LjAxLjE5IGF0IDE1OjU4LCA8YW5kcmV3LmNvb3Bl
cjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4gPiBPbiAwNy8wMS8yMDE5IDA3OjQyLCBDaHJpc3RvcGhl
ciBDbGFyayB3cm90ZToKPiA+PiAtLS0gYS94ZW4vY29tbW9uL2FyZ28uYwo+ID4+ICsrKyBiL3hl
bi9jb21tb24vYXJnby5jCj4gPj4gIGxvbmcKPiA+PiAgZG9fYXJnb19vcCh1bnNpZ25lZCBpbnQg
Y21kLCBYRU5fR1VFU1RfSEFORExFX1BBUkFNKHZvaWQpIGFyZzEsCj4gPgo+ID4gSSBrbm93IEkn
bSBjb21tZW50aW5nIG9uIHRoZSB3cm9uZyBwYXRjaCwgYnV0IHBsZWFzZSB1c2UgdW5zaWduZWQg
bG9uZwo+ID4gY21kLCBzbyB0aGUgdHlwZSBkZWZpbml0aW9uIGhlcmUgZG9lc24ndCB0cnVuY2F0
ZSB0aGUgY2FsbGVyIHByb3ZpZGVkCj4gPiB2YWx1ZS4gIFdlIGhhdmUgc2ltaWxhciBidWdneSBj
b2RlIGFsbCBvdmVyIFhlbiwgYnV0IGl0cyB0b28gbGF0ZSB0byBmaXgKPiA+IHRoYXQsIGFuZCBJ
J2QgcHJlZmVyIG5vdCB0byBwcm9wYWdhdGUgdGhlIGVycm9yLgo+Cj4gV2h5IGJ1Z2d5PyBJdCBh
bGwgZGVwZW5kcyBvbiBob3cgdGhlIGludGVyZmFjZSBpcyBzcGVjaWZpZWQuIElmCj4gdGhlIGlu
cHV0IGlzIDMyIGJpdHMgd2lkZSwgaXQgaXMgY2xlYXIgdGhhdCBoaWdoZXIgYml0cyBhcmUgc3Vw
cG9zZWQKPiB0byBiZSBpZ25vcmVkLiBOb3RoaW5nIHNheXMgdGhhdCB0aGUgZnVsbCByZWdpc3Rl
ciB3aWR0aCBpcwo+IHNpZ25pZmljYW50LgoKSSd2ZSBsZWZ0IHRoaXMgYXMgaXMgKGllLiB1bnNp
Z25lZCBpbnQpIGJ1dCBJIGNhbiBjaGFuZ2UgaXQgaWYgaXQgc2hvdWxkIGNoYW5nZS4KCj4KPiA+
PiAgICAgICAgICAgICBYRU5fR1VFU1RfSEFORExFX1BBUkFNKHZvaWQpIGFyZzIsIHVuc2lnbmVk
IGxvbmcgYXJnMywKPiA+PiAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIGFyZzQpCj4gPj4gIHsK
PiA+PiAtICAgIHJldHVybiAtRU5PU1lTOwo+ID4+ICsgICAgc3RydWN0IGRvbWFpbiAqY3VycmQg
PSBjdXJyZW50LT5kb21haW47Cj4gPj4gKyAgICBsb25nIHJjID0gLUVGQVVMVDsKPiA+PiArCj4g
Pj4gKyAgICBhcmdvX2RwcmludGsoIi0+ZG9fYXJnb19vcCgldSwlcCwlcCwlZCwlZClcbiIsIGNt
ZCwKPiA+PiArICAgICAgICAgICAgICAgICAodm9pZCAqKWFyZzEucCwgKHZvaWQgKilhcmcyLnAs
IChpbnQpIGFyZzMsIChpbnQpIGFyZzQpOwo+ID4KPiA+IEZvciBkZWJ1Z2dpbmcgcHVycG9zZXMs
IHlvdSBkb24ndCB3YW50IHRvIHRydW5jYXRlIGFueSBvZiB0aGVzZSB2YWx1ZXMsCj4gPiBvciB5
b3UnbGwgaGF2ZSBhIHByaW50IG1lc3NhZ2Ugd2hpY2ggZG9lc24ndCBtYXRjaCB3aGF0IHRoZSBn
dWVzdAo+ID4gcHJvdmlkZWQuICBJJ2QgdXNlICVsZCBmb3IgYXJnMyBhbmQgYXJnNC4KPgo+IFBl
cmhhcHMgYmV0dGVyICVseCwgZm9yIHRoZSBvdXRwdXQgYmVpbmcgZWFzaWVyIHRvIHJlY29nbml6
ZQo+IGZvciBib3RoIGJpdG1hcHMgKGUuZy4gZmxhZyB2YWx1ZXMpIGFuZCBzdWZmaWNpZW50bHkg
bGFyZ2UgdmFsdWVzLgoKYWNrLCBkb25lCgo+Cj4gPj4gKwo+ID4+ICsgICAgaWYgKCB1bmxpa2Vs
eSghb3B0X2FyZ29fZW5hYmxlZCkgKQo+ID4+ICsgICAgewo+ID4+ICsgICAgICAgIHJjID0gLUVP
UE5PVFNVUFA7Cj4gPgo+ID4gU2hvdWxkbid0IHRoaXMgYmUgRU5PU1lTIGluc3RlYWQ/ICBUaGVy
ZSBpc24ndCBhIGNvbmNlcHR1YWwgZGlmZmVyZW5jZQo+ID4gYmV0d2VlbiBDT05GSUdfQVJHTyBj
b21waWxlZCBvdXQsIGFuZCBvcHRfYXJnbyBjbGVhciBvbiB0aGUgY29tbWFuZAo+ID4gbGluZSwg
YW5kIEkgZG9uJ3QgdGhpbmsgYSBndWVzdCBzaG91bGQgYmUgYWJsZSB0byB0ZWxsIHRoZSBkaWZm
ZXJlbmNlLgo+Cj4gSSBhZG1pdCBpdCdzIGEgYm91bmRhcnkgY2FzZSwgYnV0IEkgdGhpbmsgRU5P
U1lTIHNob3VsZCBzdHJpY3RseQo+IG9ubHkgZXZlciBiZSAoYW5kIGhhdmUgYmVlbikgcmV0dXJu
ZWQgZm9yIHVucmVjb2duaXplZCBtYWpvcgo+IGh5cGVyY2FsbCBudW1iZXJzLgoKYWNrCgpDaHJp
c3RvcGhlcgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
