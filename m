From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 1/3] x86/HVM: __hvm_copy() should not write
 to p2m_ioreq_server pages
Date: Tue, 13 Nov 2018 03:54:08 -0700
Message-ID: <5BEAAD5002000078001FB653@prv1-mh.provo.novell.com>
References: <5BEAA1DB02000078001FB5BD@prv1-mh.provo.novell.com>
 <5BEAA3DA02000078001FB5CB@prv1-mh.provo.novell.com>
 <450a6b67-a896-7324-cb68-4611d110e0e6@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=k8x1=ny=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gMWKj-0006Hd-Gx
 for xen-devel@lists.xenproject.org; Tue, 13 Nov 2018 10:54:13 +0000
In-Reply-To: <450a6b67-a896-7324-cb68-4611d110e0e6@citrix.com>
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, Paul Durrant <paul.durrant@citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEzLjExLjE4IGF0IDExOjQ3LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMTMvMTEvMTggMTA6MTMsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBDb21taXQgM2Jk
ZWM1MzBhNSAoIng4Ni9IVk06IHNwbGl0IHBhZ2Ugc3RyYWRkbGluZyBlbXVsYXRlZCBhY2Nlc3Nl
cyBpbgo+PiBtb3JlIGNhc2VzIikgaW50cm9kdWNlZCBhIGh2bV9jb3B5X3RvX2d1ZXN0X2xpbmVh
cigpIGF0dGVtcHQgYmVmb3JlCj4+IGZhbGxpbmcgYmFjayB0byBodm1lbXVsX2xpbmVhcl9tbWlv
X3dyaXRlKCkuIFRoaXMgaXMgd3JvbmcgZm9yIHRoZQo+PiBwMm1faW9yZXFfc2VydmVyIHNwZWNp
YWwgY2FzZS4gVGhhdCBjaGFuZ2Ugd2lkZW5lZCBhIHByZS1leGlzdGluZyBpc3N1ZQo+PiB0aG91
Z2g6IE90aGVyIHdyaXRlcyB0byBzdWNoIHBhZ2VzIGFsc28gbmVlZCB0byBiZSBmYWlsZWQgKG9y
IGZvcmNlZAo+PiB0aHJvdWdoIGVtdWxhdGlvbiksIGluIHBhcnRpY3VsYXIgaHlwZXJjYWxsIGJ1
ZmZlciB3cml0ZXMuCj4+Cj4+IFJlcG9ydGVkLWJ5OiA/Pz8gPD8/P0BjaXRyaXguY29tPgo+PiBT
aWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4+Cj4+IC0tLSBh
L3hlbi9hcmNoL3g4Ni9odm0vaHZtLmMKPj4gKysrIGIveGVuL2FyY2gveDg2L2h2bS9odm0uYwo+
PiBAQCAtMzIwMiw2ICszMjAyLDEyIEBAIHN0YXRpYyBlbnVtIGh2bV90cmFuc2xhdGlvbl9yZXN1
bHQgX19odm0KPj4gICAgICAgICAgaWYgKCByZXMgIT0gSFZNVFJBTlNfb2theSApCj4+ICAgICAg
ICAgICAgICByZXR1cm4gcmVzOwo+PiAgCj4+ICsgICAgICAgIGlmICggKGZsYWdzICYgSFZNQ09Q
WV90b19ndWVzdCkgJiYgcDJtdCA9PSBwMm1faW9yZXFfc2VydmVyICkKPiAKPiBXaGlsZSB0aGlz
IGRvZXMgYWRkcmVzcyB0aGUgaXNzdWUsIEknbSBjb25jZXJuZWQgYWJvdXQgaGFyZGNvZGluZyB0
aGUKPiBiZWhhdmlvdXIgaGVyZS4KPiAKPiBwMm1faW9yZXFfc2VydmVyIGRvZXNuJ3QgbWVhbiAi
SSB3YW50IHNoYWRvd2luZyBwcm9wZXJ0aWVzIi4gSXQgaGFzIGFuCj4gYXMteWV0IHVuc3BlY2lm
aWVkIHBlci1pb3JlcS1jbGllbnQgbWVhbmluZy4KCldoeS9ob3cgaXMgdGhpcyBkaWZmZXJlbnQg
ZnJvbSBtbWlvX2RtLCB3aGljaCB0aGVuIGNvdWxkIGJlCmNvbnNpZGVyZWQgaGF2aW5nIHVuc3Bl
Y2lmaWVkIG1lYW5pbmcgZm9yIHJlYWRzIF9hbmRfIHdyaXRlcz8KQXJlbid0IHdlIHNpbXBseSBz
YXlpbmcgImNvbnNpZGVyIHRoaXMgUkFNIGZvciByZWFkcyBidXQgTU1JTwpmb3Igd3JpdGVzIj8K
Cj4gV2UgZWl0aGVyIHdhbnQgdG8gcmVuYW1lIHAybV9pb3JlcV9zZXJ2ZXIgdG8gc29tZXRoaW5n
IHdoaWNoIGluZGljYXRlcwo+IGl0cyAiYWxsb3ctcmVhZHMvZW11bGF0ZSB3cml0ZXMiIGJlaGF2
aW91ciwgb3IgZGVzaWduIGEgd2F5IGZvciB0aGUKPiBpb3JlcSBjbGllbnQgdG8gc3BlY2lmeSB0
aGUgYmVoYXZpb3VyIGl0IHdhbnRzLgoKUmVuYW1pbmcgbWlnaHQgYmUgd29ydGh3aGlsZSwgYnV0
IGlzIG9ydGhvZ29uYWwgaW1vLiBJaXJjIHdlIGhhZApzdHJ1Z2dsZWQgdG8gZmluZCBhIHJlYWxs
eSBzdWl0YWJsZSAoYW5kIG5vdCBvdmVybHkgbG9uZykgbmFtZSBiYWNrCnRoZW4gYWxyZWFkeS4K
CkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
