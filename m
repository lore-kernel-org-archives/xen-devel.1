From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2] x86emul: don't read mask register on
 AVX512F-incapable platforms
Date: Fri, 29 Mar 2019 04:56:10 -0600
Message-ID: <5C9DF9CA0200007800222C2E@prv1-mh.provo.novell.com>
References: <5C9CFE7102000078002229A1@prv1-mh.provo.novell.com>
 <5C9DCC4A0200007800222AEA@prv1-mh.provo.novell.com>
 <0eaf98eb-3e30-0136-1c75-1deb7c8a3bbc@citrix.com>
 <5C9DE7060200007800222BA1@prv1-mh.provo.novell.com>
 <d9515e2d-9c21-910e-7226-130b54c17a4d@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=NqUC=SA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1h9pBF-0004cN-HP
 for xen-devel@lists.xenproject.org; Fri, 29 Mar 2019 10:56:13 +0000
In-Reply-To: <d9515e2d-9c21-910e-7226-130b54c17a4d@citrix.com>
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Juergen Gross <jgross@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI5LjAzLjE5IGF0IDExOjAyLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMjkvMDMvMjAxOSAwOTozNiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IEknZCBsaWtl
IHRvIHB1dCB1cCB0aGUgb3RoZXIgb3B0aW9uIHRoZW46IFJhdGhlciB0aGFuIHVzaW5nCj4+IF9n
ZXRfZnB1KCkgKGFuZCBpbiBwYXJ0aWN1bGFyIHRoZSByZWFkX3hjcigpIGFuZCByZWFkX2NyKCkg
aG9va3MpCj4+IHdlIGNvdWxkIHJlYWQgdGhlIHJlYWwgWENSMCBoZXJlLiBBZnRlciBhbGwgd2Ug
aXNzdWUgdGhlIEtNT1Ygbm90Cj4+IGJlY2F1c2UgdGhlIGd1ZXN0IGhhcyBzcGVjaWZpZWQgaXQs
IGJ1dCBiZWNhdXNlIHdlIG5lZWQgdGhlIHZhbHVlCj4+IG9mIHRoZSByZWdpc3RlciBmb3IgY29y
cmVjdCBmYXVsdCBzdXBwcmVzc2lvbiBlbXVsYXRpb24uCj4gCj4gVHJ1ZSwgYW5kIHRoYXQgd291
bGQgYmUgcmF0aGVyIHNtYWxsZXIgYW5kIGxlc3MgaW52YXNpdmUgdGhhbgo+IGRlbGliZXJhdGVs
eSBzcXVhc2hpbmcgdGhlIG90aGVyIHNpZGUgZWZmZWN0cyBvZiBnZXRfZnB1KCkKCkhtbSwgSSd2
ZSB0cmllZCB0byBkbyB0aGlzLCBidXQgdGhpcyBpcyBtb3JlIGNvbXBsaWNhdGVkOiBDUjAuVFMK
bWF5IGJlIHNldCwgaW4gd2hpY2ggY2FzZSB3ZSBuZWVkIHRvIGludm9rZSB0aGUgZ2V0X2ZwdSgp
IGhvb2sKdG8gZ2V0IGl0IGNsZWFyZWQgd2l0aCBhcHByb3ByaWF0ZSBib29ra2VlcGluZy4gSSBk
b24ndCB0aGluayBpdCdzCndvcnRoIGZ1cnRoZXIgY29tcGxpY2F0aW5nIHRoZSBjb2RlIGJ5IGlu
dm9raW5nIHRoZSBob29rIF9vbmx5XwppbiB0aGF0IGNhc2UuIFNvIEkgZ3Vlc3Mgd2UgYmV0dGVy
IHN0aWNrIHRvIHYyLgoKV2hpY2ggbWFrZXMgbWUgY29tZSBiYWNrIHRvIHlvdXIgcmVxdWVzdCB0
byBkcm9wIHRoZQpjcHVfaGFzX2F2eDUxMmYgcGFydCBvZiB0aGUgY29uZGl0aW9uOiBSaWdodCBu
b3cgdGhlIGZ1enplcgp1c2VzIGVtdWxfdGVzdF9yZWFkX3hjcigpIGluc3RlYWQgb2YgYWN0dWFs
bHkgZnV6emluZyB0aGUKdmFsdWUuIE9uY2UgaXQgZG9lcywgd291bGQgd2UgZXhwZWN0IGl0IHRv
IG5ldmVyIHNldCBhbnkgYml0cwppbiB0aGUgcmV0dXJuZWQgdmFsdWUgdGhhdCBhcmVuJ3Qgc2V0
IGluIGhhcmR3YXJlLCBidXQgY291bGQKaW4gcHJpbmNpcGxlIGJlIHNldCBiYXNlZCBvbiAocmVh
bCkgQ1BVSUQgb3V0cHV0PyBJbiB0aGF0IGNhc2UKSSBjb3VsZCBhZ3JlZSB0byByZW1vdmUgdGhl
IGV4dHJhIGNvbmRpdGlvbi4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
