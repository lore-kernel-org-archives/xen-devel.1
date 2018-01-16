From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 2/2] x86: allow Meltdown band-aid to be
 disabled
Date: Tue, 16 Jan 2018 05:35:25 -0700
Message-ID: <5A5DFF9D020000780019F13E@prv-mh.provo.novell.com>
References: <5A5C981A020000780019EB82@prv-mh.provo.novell.com>
 <5A5C996A020000780019EB97@prv-mh.provo.novell.com>
 <CAFLBxZa12YCq_=jnPK_s-ZbRk6=p9AL+MY0K=SiJL+e-OT+4ZA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=n0uv=el=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ebQSl-00008j-5C
 for xen-devel@lists.xenproject.org; Tue, 16 Jan 2018 12:35:35 +0000
In-Reply-To: <CAFLBxZa12YCq_=jnPK_s-ZbRk6=p9AL+MY0K=SiJL+e-OT+4ZA@mail.gmail.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE2LjAxLjE4IGF0IDEzOjEyLCA8ZHVubGFwZ0B1bWljaC5lZHU+IHdyb3RlOgo+IE9u
IE1vbiwgSmFuIDE1LCAyMDE4IGF0IDExOjA3IEFNLCBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+PiBGaXJzdCBvZiBhbGwgd2UgZG9uJ3QgbmVlZCBpdCBvbiBBTUQgc3lz
dGVtcy4gQWRkaXRpb25hbGx5IGFsbG93IGl0cyB1c2UKPj4gdG8gYmUgY29udHJvbGxlZCBieSBj
b21tYW5kIGxpbmUgb3B0aW9uLiBGb3IgYmVzdCBiYWNrcG9ydGFiaWxpdHksIHRoaXMKPj4gaW50
ZW50aW9uYWxseSBkb2Vzbid0IHVzZSBhbHRlcm5hdGl2ZSBpbnN0cnVjdGlvbiBwYXRjaGluZyB0
byBhY2hpZXZlCj4+IHRoZSBpbnRlbmRlZCBlZmZlY3QgLSB3aGlsZSB3ZSBsaWtlbHkgd2FudCBp
dCwgdGhpcyB3aWxsIGJlIGxhdGVyCj4+IGZvbGxvdy11cC4KPiAKPiBJcyBpdCB3b3J0aCBtYWtp
bmcgaXQgb3B0aW9uYWwgdG8gYXBwbHkgdG8gZG9tMD8gIEluIG1vc3QgY2FzZXMsIGlmIGFuCj4g
YXR0YWNrZXIgY2FuIG1hbmFnZSB0byBnZXQgdXNlcnNwYWNlIG9uIGRvbTAsIHRoZXkgc2hvdWxk
IGJlIGFibGUgdG8KPiB0YWtlIG92ZXIgdGhlIHdob2xlIHN5c3RlbSBhbnl3YXk7IHR1cm5pbmcg
aXQgb2ZmIG9uIGRvbTAgdG8gZ2V0Cj4gYmV0dGVyIHBlcmZvcm1hbmNlIHNlZW1zIGxpa2UgYSBw
b2xpY3kgZGVjaXNpb24gdGhhdCBhZG1pbmlzdHJhdG9ycwo+IG1pZ2h0IHJlYXNvbmFibHkgbWFr
ZS4KCklycmVzcGVjdGl2ZSBvZiBKw7xyZ2VuJ3MgcmVwbHkgKHdoaWNoIEkgYWdyZWUgd2l0aCkg
dGhpcyB3b3VsZCBiZSBhbgpvcHRpb24sIGJ1dCBJJ2QgcHJlZmVyIHRvIGZvbGQgdGhpcyBpbnRv
IHRoZSBzdGFnZSAyIGFjdGl2aXRpZXMgKGlmIHdlCnJlYWxseSB3YW50IGl0IGluIHRoZSBmaXJz
dCBwbGFjZSkuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
