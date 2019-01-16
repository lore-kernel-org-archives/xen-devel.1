From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2] xen/cmdline: Fix buggy strncmp(s, LITERAL,
 ss - s) construct
Date: Wed, 16 Jan 2019 05:48:57 -0700
Message-ID: <5C3F2839020000780020E491@prv1-mh.provo.novell.com>
References: <1546622255-9324-1-git-send-email-andrew.cooper3@citrix.com>
 <5C3314F0020000780020AAC3@prv1-mh.provo.novell.com>
 <bd3f5d10-0d0f-df07-c3ae-b83a74d8809d@citrix.com>
 <5C345FED020000780020B2DF@prv1-mh.provo.novell.com>
 <CAFLBxZZHBX7=YYjOiAmE+ap0dyxRCAK1GX+nJ61sMQn3pxem5w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <CAFLBxZZHBX7=YYjOiAmE+ap0dyxRCAK1GX+nJ61sMQn3pxem5w@mail.gmail.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <dunlapg@umich.edu>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xen.org>, Julien Grall <julien.grall@arm.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE2LjAxLjE5IGF0IDEzOjA4LCA8ZHVubGFwZ0B1bWljaC5lZHU+IHdyb3RlOgo+IE9u
IFR1ZSwgSmFuIDgsIDIwMTkgYXQgODozMiBBTSBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3VzZS5j
b20+IHdyb3RlOgo+Pgo+PiA+Pj4gT24gMDcuMDEuMTkgYXQgMTg6MjgsIDxhbmRyZXcuY29vcGVy
M0BjaXRyaXguY29tPiB3cm90ZToKPj4gPiBPbiAwNy8wMS8yMDE5IDA4OjU5LCBKYW4gQmV1bGlj
aCB3cm90ZToKPj4gPj4+IEBAIC0yNzEsNiArMjk3LDI3IEBAIGludCBwYXJzZV9ib29sZWFuKGNv
bnN0IGNoYXIgKm5hbWUsIGNvbnN0IGNoYXIgKnMsCj4+ID4gY29uc3QgY2hhciAqZSkKPj4gPj4+
ICAgICAgcmV0dXJuIC0xOwo+PiA+Pj4gIH0KPj4gPj4+Cj4+ID4+PiAraW50IGNtZGxpbmVfc3Ry
Y21wKGNvbnN0IGNoYXIgKmZyYWcsIGNvbnN0IGNoYXIgKm5hbWUpCj4+ID4+IFNvIHlvdSd2ZSBk
ZWNpZGVkIHRvIHJldGFpbiB0aGUgc3RyY21wKCktbGlrZSByZXR1cm4gdHlwZSBhbmQgdmFsdWUs
Cj4+ID4+IGRlc3BpdGUgdGhlbSBiZWluZyBvZiBubyBpbnRlcmVzdCB0byBhbnkgY2FsbGVyLCBh
bmQgaXQgYmVpbmcKPj4gPj4gdmFuaXNoaW5nbHkgdW5saWtlbHkgZm9yIGEgY2FsbGVyIHRvIGFw
cGVhciB3aGljaCB3b3VsZCBjYXJlLiBGaW5lCj4+ID4+IGZvciBub3csIGJ1dCBJJ2Qgc3RpbGwg
bGlrZSB0byB1bmRlcnN0YW5kIHdoeS4KPj4gPgo+PiA+IFlvdSBhbHJlYWR5IGFza2VkIHRoaXMs
IGFuZCBnaXZlIG5vIG9iamVjdGlvbiB0byBteSBhbnN3ZXIsIEkgcHJlc3VtZWQKPj4gPiB5b3Ug
d2VyZSBzYXRpc2ZpZWQgd2l0aCB0aGUgY29uY3JldGUgdXNlY2FzZSBJIGdhdmUsIGNpdGluZyBh
IHBhdGNoCj4+ID4gbmVlZGluZyB0aGlzIGJlaGF2aW91ciB3aGljaCBoYXMgYWxyZWFkeSBiZWVu
IHBvc3RlZCB0byB0aGUgbGlzdC4KPj4KPj4gV2VsbCwgZm9yIG9uZSBJIGFkbWl0IEkgZGlkbid0
IHJlY2FsbCB0aGlzIGFuc3dlciBvZiB5b3Vycy4gUGVyaGFwcwo+PiBsYXJnZWx5IGJlY2F1c2Ug
dGhhdCAodG8gbWUpIHdhcyByZWZlcnJpbmcgdG8geWV0IHRvIGJlIHBvc3RlZAo+PiBjb2RlLCBh
cyAob2J2aW91c2x5KSB5b3UgY2FuJ3QgaGF2ZSB1c2VkIGNtZGxpbmVfc3RyY21wKCkgdGhlcmUu
Cj4+IE5vdyB0aGF0IHlvdSBzYXkgdGhpcyB3YXMgcG9zdGVkIGFscmVhZHkgKHdpdGggc3RybmNt
cCgpCj4+IHByZXN1bWFibHkpLCBJIGNhbiBvbmx5IHJlbWluZCB5b3UgdGhhdCAuLi4KPj4KPj4g
PiA8YmZmM2MzM2QtYTI0NC0zNjJhLTUyOWMtMzJmOTFiNWYzOTY1QGNpdHJpeC5jb20+Cj4+Cj4+
IC4uLiBuZWl0aGVyIG15IG1haWwgY2xpZW50IG5vciB0aGUgbGlzdCBhcmNoaXZlcyBhbGxvdyBt
ZSB0byBzZWFyY2gKPj4gZm9yIHN1Y2ggYSBtYWlsIElELgo+IAo+IEkgcHJlcGVuZCAiaHR0cDov
L21hcmMuaW5mby8/aT0iIHRvIHRoZSBpZCBpbiBxdWVzdGlvbi4gIEZvciBleGFtcGxlOgo+IAo+
IG1hcmMuaW5mby8/aT08YmZmM2MzM2QtYTI0NC0zNjJhLTUyOWMtMzJmOTFiNWYzOTY1QGNpdHJp
eC5jb20+CgpPaCwgdGhhbmtzLCB0aGF0J3MgdXNlZnVsIHRvIGtub3cgYXMgYSB3b3JrYXJvdW5k
LgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
