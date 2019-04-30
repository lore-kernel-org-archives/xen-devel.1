From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v3 2/4] x86/mem_sharing: introduce and use
 page_lock_memshr instead of page_lock
Date: Tue, 30 Apr 2019 01:15:29 -0600
Message-ID: <5CC7F611020000780022A3DF@prv1-mh.provo.novell.com>
References: <20190426172138.14669-1-tamas@tklengyel.com>
 <20190426172138.14669-2-tamas@tklengyel.com>
 <5CC715D7020000780022A158@prv1-mh.provo.novell.com>
 <CABfawhmuCWcixtbcvs-7Psc3JGaUrWs50Dr4-aKgHVMYJXp+Rw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=xzkl=TA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hLMzH-0001vp-Iv
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2019 07:15:35 +0000
In-Reply-To: <CABfawhmuCWcixtbcvs-7Psc3JGaUrWs50Dr4-aKgHVMYJXp+Rw@mail.gmail.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Tamas K Lengyel <tamas@tklengyel.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI5LjA0LjE5IGF0IDE4OjM1LCA8dGFtYXNAdGtsZW5neWVsLmNvbT4gd3JvdGU6Cj4g
T24gTW9uLCBBcHIgMjksIDIwMTkgYXQgOToxOCBBTSBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+PiA+Pj4gT24gMjYuMDQuMTkgYXQgMTk6MjEsIDx0YW1hc0B0a2xlbmd5
ZWwuY29tPiB3cm90ZToKPj4gPiAtLS0gYS94ZW4vYXJjaC94ODYvbW0uYwo+PiA+ICsrKyBiL3hl
bi9hcmNoL3g4Ni9tbS5jCj4+ID4gQEAgLTIwMzAsMTIgKzIwMzAsMTEgQEAgc3RhdGljIGlubGlu
ZSBib29sIGN1cnJlbnRfbG9ja2VkX3BhZ2VfbmVfY2hlY2soc3RydWN0IHBhZ2VfaW5mbyAqcGFn
ZSkgewo+PiA+ICAjZGVmaW5lIGN1cnJlbnRfbG9ja2VkX3BhZ2VfbmVfY2hlY2soeCkgdHJ1ZQo+
PiA+ICAjZW5kaWYKPj4gPgo+PiA+IC1pbnQgcGFnZV9sb2NrKHN0cnVjdCBwYWdlX2luZm8gKnBh
Z2UpCj4+ID4gKyNpZiBkZWZpbmVkKENPTkZJR19QVikgfHwgZGVmaW5lZChDT05GSUdfSEFTX01F
TV9TSEFSSU5HKQo+PiA+ICtzdGF0aWMgaW50IF9wYWdlX2xvY2soc3RydWN0IHBhZ2VfaW5mbyAq
cGFnZSkKPj4KPj4gQXMgcGVyIGFib3ZlLCBwZXJzb25hbGx5IEknbSBhZ2FpbnN0IGludHJvZHVj
aW5nCj4+IHBhZ2Vfeyx1bn1sb2NrX21lbXNocigpLCBhcyB0aGF0IG1ha2VzIHRoZSBhYnVzZSBl
dmVuIG1vcmUKPj4gbG9vayBsaWtlIHByb3BlciB1c2UuIEJ1dCBpZiB0aGlzIHdhcyB0byBiZSBr
ZXB0IHRoaXMgd2F5LCBtYXkgSQo+PiBhc2sgdGhhdCB5b3Ugc3dpdGNoIGludCAtPiBib29sIGlu
IHRoZSByZXR1cm4gdHlwZXMgYXQgdGhpcyBvY2Nhc2lvbj8KPiAKPiBTd2l0Y2hpbmcgdGhlbSB0
byBib29sIHdvdWxkIGJlIGZpbmUuIFJlcGxhY2luZyB0aGVtIHdpdGggc29tZXRoaW5nCj4gc2Fu
ZXIgaXMgdW5mb3J0dW5hdGVseSBvdXQtb2Ytc2NvcGUgYXQgdGhlIG1vbWVudC4gVW5sZXNzIHNv
bWVvbmUgaGFzCj4gYSBzcGVjaWZpYyBzb2x1dGlvbiB0aGF0IGNhbiBiZSBwdXQgaW4gcGxhY2Uu
IEkgZG9uJ3QgaGF2ZSBvbmUuCgpJJ3ZlIG91dGxpbmVkIGEgc29sdXRpb24gYWxyZWFkeTogTWFr
ZSBhIG1lbS1zaGFyaW5nIHByaXZhdGUgdmFyaWFudApvZiBwYWdlX3ssdW59bG9jaygpLCBkZXJp
dmVkIGZyb20gdGhlIFBWIG9uZXMgKGJ1dCB3aXRoIHBpZWNlcwpkcm9wcGVkIHlvdSBkb24ndCB3
YW50L25lZWQpLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
