From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v3 04/15] argo: init, destroy and soft-reset,
 with enable command line opt
Date: Mon, 14 Jan 2019 08:12:37 -0700
Message-ID: <5C3CA6E5020000780020D59D@prv1-mh.provo.novell.com>
References: <1546846968-7372-1-git-send-email-christopher.w.clark@gmail.com>
 <1546846968-7372-5-git-send-email-christopher.w.clark@gmail.com>
 <90a21420-9f9f-7a8f-32e5-b00e3e3bd1d0@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=+Ly7=PW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gj3wm-0000wY-Vw
 for xen-devel@lists.xenproject.org; Mon, 14 Jan 2019 15:14:41 +0000
In-Reply-To: <90a21420-9f9f-7a8f-32e5-b00e3e3bd1d0@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, ross.philipson@gmail.com, Jason Andryuk <jandryuk@gmail.com>, Daniel Smith <dpsmith@apertussolutions.com>, Tim Deegan <tim@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Christopher Clark <christopher.w.clark@gmail.com>, Rich Persaud <persaur@gmail.com>, James McKenzie <james@bromium.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, eric chanudet <eric.chanudet@gmail.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE0LjAxLjE5IGF0IDE1OjU4LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMDcvMDEvMjAxOSAwNzo0MiwgQ2hyaXN0b3BoZXIgQ2xhcmsgd3JvdGU6Cj4+IC0t
LSBhL3hlbi9jb21tb24vYXJnby5jCj4+ICsrKyBiL3hlbi9jb21tb24vYXJnby5jCj4+ICBsb25n
Cj4+ICBkb19hcmdvX29wKHVuc2lnbmVkIGludCBjbWQsIFhFTl9HVUVTVF9IQU5ETEVfUEFSQU0o
dm9pZCkgYXJnMSwKPiAKPiBJIGtub3cgSSdtIGNvbW1lbnRpbmcgb24gdGhlIHdyb25nIHBhdGNo
LCBidXQgcGxlYXNlIHVzZSB1bnNpZ25lZCBsb25nCj4gY21kLCBzbyB0aGUgdHlwZSBkZWZpbml0
aW9uIGhlcmUgZG9lc24ndCB0cnVuY2F0ZSB0aGUgY2FsbGVyIHByb3ZpZGVkCj4gdmFsdWUuICBX
ZSBoYXZlIHNpbWlsYXIgYnVnZ3kgY29kZSBhbGwgb3ZlciBYZW4sIGJ1dCBpdHMgdG9vIGxhdGUg
dG8gZml4Cj4gdGhhdCwgYW5kIEknZCBwcmVmZXIgbm90IHRvIHByb3BhZ2F0ZSB0aGUgZXJyb3Iu
CgpXaHkgYnVnZ3k/IEl0IGFsbCBkZXBlbmRzIG9uIGhvdyB0aGUgaW50ZXJmYWNlIGlzIHNwZWNp
ZmllZC4gSWYKdGhlIGlucHV0IGlzIDMyIGJpdHMgd2lkZSwgaXQgaXMgY2xlYXIgdGhhdCBoaWdo
ZXIgYml0cyBhcmUgc3VwcG9zZWQKdG8gYmUgaWdub3JlZC4gTm90aGluZyBzYXlzIHRoYXQgdGhl
IGZ1bGwgcmVnaXN0ZXIgd2lkdGggaXMKc2lnbmlmaWNhbnQuCgo+PiAgICAgICAgICAgICBYRU5f
R1VFU1RfSEFORExFX1BBUkFNKHZvaWQpIGFyZzIsIHVuc2lnbmVkIGxvbmcgYXJnMywKPj4gICAg
ICAgICAgICAgdW5zaWduZWQgbG9uZyBhcmc0KQo+PiAgewo+PiAtICAgIHJldHVybiAtRU5PU1lT
Owo+PiArICAgIHN0cnVjdCBkb21haW4gKmN1cnJkID0gY3VycmVudC0+ZG9tYWluOwo+PiArICAg
IGxvbmcgcmMgPSAtRUZBVUxUOwo+PiArCj4+ICsgICAgYXJnb19kcHJpbnRrKCItPmRvX2FyZ29f
b3AoJXUsJXAsJXAsJWQsJWQpXG4iLCBjbWQsCj4+ICsgICAgICAgICAgICAgICAgICh2b2lkICop
YXJnMS5wLCAodm9pZCAqKWFyZzIucCwgKGludCkgYXJnMywgKGludCkgYXJnNCk7Cj4gCj4gRm9y
IGRlYnVnZ2luZyBwdXJwb3NlcywgeW91IGRvbid0IHdhbnQgdG8gdHJ1bmNhdGUgYW55IG9mIHRo
ZXNlIHZhbHVlcywKPiBvciB5b3UnbGwgaGF2ZSBhIHByaW50IG1lc3NhZ2Ugd2hpY2ggZG9lc24n
dCBtYXRjaCB3aGF0IHRoZSBndWVzdAo+IHByb3ZpZGVkLiAgSSdkIHVzZSAlbGQgZm9yIGFyZzMg
YW5kIGFyZzQuCgpQZXJoYXBzIGJldHRlciAlbHgsIGZvciB0aGUgb3V0cHV0IGJlaW5nIGVhc2ll
ciB0byByZWNvZ25pemUKZm9yIGJvdGggYml0bWFwcyAoZS5nLiBmbGFnIHZhbHVlcykgYW5kIHN1
ZmZpY2llbnRseSBsYXJnZSB2YWx1ZXMuCgo+PiArCj4+ICsgICAgaWYgKCB1bmxpa2VseSghb3B0
X2FyZ29fZW5hYmxlZCkgKQo+PiArICAgIHsKPj4gKyAgICAgICAgcmMgPSAtRU9QTk9UU1VQUDsK
PiAKPiBTaG91bGRuJ3QgdGhpcyBiZSBFTk9TWVMgaW5zdGVhZD8gIFRoZXJlIGlzbid0IGEgY29u
Y2VwdHVhbCBkaWZmZXJlbmNlCj4gYmV0d2VlbiBDT05GSUdfQVJHTyBjb21waWxlZCBvdXQsIGFu
ZCBvcHRfYXJnbyBjbGVhciBvbiB0aGUgY29tbWFuZAo+IGxpbmUsIGFuZCBJIGRvbid0IHRoaW5r
IGEgZ3Vlc3Qgc2hvdWxkIGJlIGFibGUgdG8gdGVsbCB0aGUgZGlmZmVyZW5jZS4KCkkgYWRtaXQg
aXQncyBhIGJvdW5kYXJ5IGNhc2UsIGJ1dCBJIHRoaW5rIEVOT1NZUyBzaG91bGQgc3RyaWN0bHkK
b25seSBldmVyIGJlIChhbmQgaGF2ZSBiZWVuKSByZXR1cm5lZCBmb3IgdW5yZWNvZ25pemVkIG1h
am9yCmh5cGVyY2FsbCBudW1iZXJzLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
