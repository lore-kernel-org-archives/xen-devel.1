From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH RFC] CODING_STYLE: document intended usage
 of types
Date: Thu, 22 Feb 2018 02:10:35 -0700
Message-ID: <5A8E971B02000078001AA406@prv-mh.provo.novell.com>
References: <5A8A9C9902000078001A8E64@prv-mh.provo.novell.com>
 <CAFLBxZb917w6zTHUoFiEmMSSpe0Z1fQ_XRPp273BJ3nEUO7pKg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=x7kc=fq=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1eomti-0006FE-Bd
 for xen-devel@lists.xenproject.org; Thu, 22 Feb 2018 09:10:38 +0000
In-Reply-To: <CAFLBxZb917w6zTHUoFiEmMSSpe0Z1fQ_XRPp273BJ3nEUO7pKg@mail.gmail.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <George.Dunlap@eu.citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIxLjAyLjE4IGF0IDE2OjM0LCA8R2VvcmdlLkR1bmxhcEBldS5jaXRyaXguY29tPiB3
cm90ZToKPiBPbiBNb24sIEZlYiAxOSwgMjAxOCBhdCA4OjQ0IEFNLCBKYW4gQmV1bGljaCA8SkJl
dWxpY2hAc3VzZS5jb20+IHdyb3RlOgo+PiArV2hlbiBzaWduZWRuZXNzIG1hdHRlcnMsIHF1YWxp
ZnkgcGxhaW4gY2hhciwgc2hvcnQsIGludCwgbG9uZywgYW5kCj4+ICtsb25nIGxvbmcgd2l0aCAi
c2lnbmVkIiBvciAidW5zaWduZWQiLiAgU2lnbmVkbmVzcyBpcyBzcGVjaWZpY2FsbHkKPj4gK2Nv
bnNpZGVyZWQgdG8gbWF0dGVyIHdoZW4gdGhlIHZhbGlkIHZhbHVlIHJhbmdlIG9mIGEgdmFyaWFi
bGUgY292ZXJzCj4+ICtvbmx5IG5vbi1uZWdhdGl2ZSB2YWx1ZXMuICBUaGUgcHJpbWUgZXhhbXBs
ZSBvZiBzdWNoIGlzIGEgdmFyaWFibGUgdXNlZAo+PiArdG8gaW5kZXggYW4gYXJyYXkgKG5lZ2F0
aXZlIGFycmF5IGluZGV4ZXMsIHdoaWxlIHRoZXkgbWF5IG9jY3VyLCBhcmUKPj4gK3JhdGhlciBy
YXJlKS4KPiAKPiBUaGlzIHBhcmFncmFwaCBpcyBhIGJpdCBjb25mdXNpbmcuICBZb3Ugc2F5ICJ3
aGVuIHNpZ25lZGVuZXNzCj4gbWF0dGVycyIsIHdoaWNoIEkgd291bGQgaW50ZXJwcmV0IGFzIHNh
eWluZywgIldoZW4gaXQgbWF0dGVycyB3aGV0aGVyCj4geW91IHVzZSBzaWduZWQgb3IgdW5zaWdu
ZWQgdmFsdWVzIi4gIEJ1dCBpcyB0aGVyZSBldmVyIGEgc2l0dWF0aW9uCj4gd2hlcmUgaXQgZG9l
c24ndCBtYXR0ZXIgd2hldGhlciB3ZSB1c2Ugc2lnbmVkIG9yIHVuc2lnbmVkPwoKWWVzLCBpZiB0
aGUgdmFsdWUgcmFuZ2UgaXMgbGltaXRlZC4gVGhhdCdzIHdoeSBtYW55IHBlb3BsZSB1c2UgKGFu
ZAphcmUgdGF1Z2h0IHRvIHVzZSkgcGxhaW4gaW50IGFuZCBsb25nIGZvciB0aGluZ3MgbGlrZSBs
b29wIHZhcmlhYmxlcywKZXZlbiBpZiBvbmx5IHBvc2l0aXZlIHZhbHVlcyB3aWxsIGJlIGl0ZXJh
dGVkIG92ZXIuIEhlbmNlCi0gInNpZ25lZCIgYW5kICJ1bnNpZ25lZCIgc2hvdWxkIGJlIHVzZWQg
dG8gdGVsbCBhcGFydCBjYXNlcyB3aGVyZQogIHRoZWlyIG9taXNzaW9uIHdhcyBzaW1wbHkgYmVj
YXVzZSBvZiBub3QgZm9sbG93aW5nIHRoZSBydWxlIG9mCi0gInVuc2lnbmVkIiBzaG91bGQgYmUg
dXNlZCB3aGVuIHRoZSB2YWxpZCB2YWx1ZSByYW5nZSBpcyBub24tCiAgbmVnYXRpdmUKClBlcmhh
cHMgSSBzaG91bGQgZGlzdGluZ3Vpc2ggIm1hdHRlcnMgZm9yIGNvcnJlY3RuZXNzIiBmcm9tICJt
YXR0ZXJzCmZvciBxdWFsaXR5IG9mIGdlbmVyYXRlZCBjb2RlIi4gSXQgaXMgdGhlIGZvcm1lciBj
YXNlIHdoZXJlIEknZApwcmVmZXIgInNpZ25lZCIgdG8gYmUgbWFkZSBleHBsaWNpdC4KCkphbgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
