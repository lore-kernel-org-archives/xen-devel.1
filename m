From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v4 04/14] argo: init, destroy and soft-reset,
 with enable command line opt
Date: Tue, 15 Jan 2019 15:16:43 +0100
Message-ID: <20190115141643.eejp7jqqbzfx2izw@mac>
References: <1547544466-21135-1-git-send-email-christopher.w.clark@gmail.com>
 <1547544466-21135-5-git-send-email-christopher.w.clark@gmail.com>
 <20190115122947.gnhxdr3x7se6tiat@mac>
 <5C3DD528020000780020DD3A@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2vyh=PX=citrix.com=prvs=911eac428=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gjPWS-00085Q-Ue
 for xen-devel@lists.xenproject.org; Tue, 15 Jan 2019 14:16:56 +0000
Content-Disposition: inline
In-Reply-To: <5C3DD528020000780020DD3A@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, ross.philipson@gmail.com, Jason Andryuk <jandryuk@gmail.com>, Daniel Smith <dpsmith@apertussolutions.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Christopher Clark <christopher.w.clark@gmail.com>, Rich Persaud <persaur@gmail.com>, James McKenzie <james@bromium.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, eric chanudet <eric.chanudet@gmail.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBKYW4gMTUsIDIwMTkgYXQgMDU6NDI6MTZBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDE1LjAxLjE5IGF0IDEzOjI5LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gT24gVHVlLCBKYW4gMTUsIDIwMTkgYXQgMDE6Mjc6MzZBTSAtMDgwMCwgQ2hyaXN0
b3BoZXIgQ2xhcmsgd3JvdGU6Cj4gPj4gIGxvbmcKPiA+PiAgZG9fYXJnb19vcCh1bnNpZ25lZCBp
bnQgY21kLCBYRU5fR1VFU1RfSEFORExFX1BBUkFNKHZvaWQpIGFyZzEsCj4gPj4gICAgICAgICAg
ICAgWEVOX0dVRVNUX0hBTkRMRV9QQVJBTSh2b2lkKSBhcmcyLCB1bnNpZ25lZCBsb25nIGFyZzMs
Cj4gPj4gICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBhcmc0KQo+ID4+ICB7Cj4gPj4gLSAgICBy
ZXR1cm4gLUVOT1NZUzsKPiA+PiArICAgIGxvbmcgcmMgPSAtRUZBVUxUOwo+ID4+ICsKPiA+PiAr
ICAgIGFyZ29fZHByaW50aygiLT5kb19hcmdvX29wKCV1LCVwLCVwLCVsdSwweCVseClcbiIsIGNt
ZCwKPiA+PiArICAgICAgICAgICAgICAgICAodm9pZCAqKWFyZzEucCwgKHZvaWQgKilhcmcyLnAs
IGFyZzMsIGFyZzQpOwo+ID4+ICsKPiA+PiArICAgIGlmICggdW5saWtlbHkoIW9wdF9hcmdvX2Vu
YWJsZWQpICkKPiA+PiArICAgICAgICByZXR1cm4gLUVPUE5PVFNVUFA7Cj4gPiAKPiA+IEkgdGhp
bmsgdGhpcyBzaG91bGQgcmV0dXJuIC1FTk9TWVMsIGFuIGh5cGVydmlzb3IgYnVpbHQgd2l0aAo+
ID4gQ09ORklHX0FSR08gYnV0IHdpdGhvdXQgYXJnbyBlbmFibGVkIG9uIHRoZSBjb21tYW5kIGxp
bmUgc2hvdWxkbid0Cj4gPiBiZWhhdmUgZGlmZmVyZW50bHkgdGhhbiBhbiBoeXBlcnZpc29yIGJ1
aWxkIHdpdGhvdXQgQ09ORklHX0FSR08uCj4gCj4gV2UndmUgYmVlbiB0aGVyZSBiZWZvcmUsIGFu
ZCB0aGVyZSBhcHBlYXJzIHRvIGJlIGRpc2FncmVlbWVudC4KPiBJIHN1cHBvcnQgdGhlIHVzZSBv
ZiAtRU9QTk9UU1VQUCBoZXJlLgoKSSB3aXRoZHJhdyBteSBjb21tZW50IHRoZW4uCgo+ID4+IC0t
LSBhL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC5oCj4gPj4gKysrIGIveGVuL2luY2x1ZGUveGVuL3Nj
aGVkLmgKPiA+PiBAQCAtNDkwLDYgKzQ5MCwxMSBAQCBzdHJ1Y3QgZG9tYWluCj4gPj4gICAgICAg
ICAgdW5zaWduZWQgaW50IGd1ZXN0X3JlcXVlc3RfZW5hYmxlZCAgICAgICA6IDE7Cj4gPj4gICAg
ICAgICAgdW5zaWduZWQgaW50IGd1ZXN0X3JlcXVlc3Rfc3luYyAgICAgICAgICA6IDE7Cj4gPj4g
ICAgICB9IG1vbml0b3I7Cj4gPj4gKwo+ID4+ICsjaWZkZWYgQ09ORklHX0FSR08KPiA+PiArICAg
IC8qIEFyZ28gaW50ZXJkb21haW4gY29tbXVuaWNhdGlvbiBzdXBwb3J0ICovCj4gPj4gKyAgICBz
dHJ1Y3QgYXJnb19kb21haW4gKmFyZ287Cj4gPiAKPiA+IEknbSBsaWtlbHkgbWlzc2luZyBzb21l
dGhpbmcsIGJ1dCBhcmdvX2RvbWFpbiBpcyBkZWNsYXJlZCBpbiBhcmdvLmMsCj4gPiBkb24ndCB5
b3UgbmVlZCBhIGZvcndhcmQgZGVjbGFyYXRpb24gaGVyZSBmb3IgdGhpcyB0byBidWlsZD8KPiAK
PiBUaGF0IHdvdWxkIGJlIG5lZWRlZCBpbiBDKysgKGlpcmMpLCBidXQgbm90IGluIEMsIHdoZXJl
IHN1Y2gKPiBmb3J3YXJkIGRlY2xhcmF0aW9ucyBhcmUgbmVlZGVkIHNvbGVseSB3aGVuIHRoZSB0
eXBlIGlzIHVzZWQKPiBhcyBhIGZ1bmN0aW9uIHBhcmFtZXRlciwgYXMgb3RoZXJ3aXNlIHRoYXQg
cGFyYW1ldGVyJ3MgdHlwZQo+IGVuZHMgdXAgaGF2aW5nIHNjb3BlIGxvY2FsIHRvIHRoZSBkZWNs
YXJlZCBmdW5jdGlvbi4KCk9oLCBPSywgc29ycnkgZm9yIHRoZSBub2lzZS4KClRoYW5rcywgUm9n
ZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
