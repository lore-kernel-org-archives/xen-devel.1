From: Juergen Gross <jgross@suse.com>
Subject: Re: Patches for stable
Date: Fri, 6 Apr 2018 17:15:42 +0200
Message-ID: <799fc74e-0142-dc18-8516-b757d8f15355@suse.com>
References: <a38538ef-d766-adb9-77d7-4624cf1dd749@suse.com>
 <950f2f68-04ef-bf4d-fa61-afa9bdc918e4@suse.com>
 <ce82c767-cfb6-5bb7-1733-7b322a4360f2@oracle.com>
 <4bf257f2-dad7-62d2-ad5b-8972c0311119@suse.com>
 <CAFLBxZaAB8nEnYTtaG-qgps54ZZWxRL7ysTC7U7rA1fMKnjwdA@mail.gmail.com>
 <9fb78740-33a1-76f8-4a7d-e7713c3b8078@suse.com>
 <CAFLBxZaHR6dHgzULfKf9OPA9b9dtBy0DBEe5MTFhmMMw67A5Zw@mail.gmail.com>
 <2fc861a4-c4e8-0a3b-ef92-af5308ed2a87@suse.com>
 <1de5bc8e-4c63-f476-6a7b-aaa157487264@oracle.com>
 <CAFLBxZY7W6i3RNq4Rc1fbVZjUB-ssXm9VtAyBESqVAFoGKUakA@mail.gmail.com>
 <566dfafc-0225-4dba-5814-0e0ab4c3f3ef@suse.com>
 <CAFLBxZbp_Nu9sfZs=UJrb8SU0XMWHEW9+QWFJRbK7Uj8RgWvEg@mail.gmail.com>
 <3595097d-5b92-7767-c23f-9f214be6aff1@suse.com>
 <CAFLBxZa=GKRKOhhD_-oG4+6MEo+yeExg6eO33655oVTKpGaqtw@mail.gmail.com>
 <3abfb150-8495-d39d-5fb2-4ce6dfee9df1@suse.com>
 <CAFLBxZb_5u5F6DA5G2YwDP0sXR-w8jr1bgqdZGv=ps8Qh_kxnQ@mail.gmail.com>
 <8aafdc1e-0994-7b52-20f4-fb1fd4bfb3d2@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ofhv=g3=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1f4T5f-0005lZ-5R
 for xen-devel@lists.xenproject.org; Fri, 06 Apr 2018 15:15:47 +0000
In-Reply-To: <8aafdc1e-0994-7b52-20f4-fb1fd4bfb3d2@oracle.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, George Dunlap <dunlapg@umich.edu>
Cc: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDYvMDQvMTggMTY6MTAsIEJvcmlzIE9zdHJvdnNreSB3cm90ZToKPiBPbiAwNC8wNi8yMDE4
IDA5OjMzIEFNLCBHZW9yZ2UgRHVubGFwIHdyb3RlOgo+PiBPbiBGcmksIEFwciA2LCAyMDE4IGF0
IDI6MTIgUE0sIEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4gd3JvdGU6Cj4+Pgo+Pj4g
U28gaXRzIHRpbWUgZm9yIGEgbmV3IFhFTkZFQVRfIHZhbHVlIHRoZW4/IFRoaXMgd291bGQgYmUg
dGhlIGxlYXN0Cj4+PiBpbnRydXNpdmUgd2F5IHRvIGFkZCBzdWNoIGEgZmxhZy4gU29tZXRoaW5n
IGxpa2UKPj4+IFhFTkZFQVRfbGludXhfaGlnaF9yc2RwX2FkZHJlc3Nfb2theSA/Cj4+IFRoYXQg
c291bmRzIHJlYXNvbmFibGUgdG8gbWUuICBJJ2QgcGVyc29uYWxseSBtYWtlIGl0IHNvbWV0aGlu
ZyBsaWtlCj4+ICJyZWFkc19yc2RwX2Zyb21fc3RhcnRfaW5mbyIgb3Igc29tZXRoaW5nLCBidXQg
dGhlIG5hbWUgZG9lc24ndCBtYXR0ZXIKPj4gdG8gbWUgYXMgbXVjaC4gOi0pCj4+Cj4+IFRoZSBv
dGhlciBvcHRpb24gd291bGQgYmUgdG8gaW50cm9kdWNlIGEgIm1heF9wdmhfaW50ZXJmYWNlX3N1
cHBvcnRlZCIKPj4gb3Igc29tZXRoaW5nLiAgSWYgaXQncyBub3QgcHJlc2VudCAoYW5kIGl0J3Mg
YSBMaW51eCBrZXJuZWwpLCBkZWZhdWx0Cj4+IGl0IHRvICcwJywgYW5kIGhhdmUgdGhhdCBtZWFu
ICJSU0RQIG11c3QgYmUgdW5kZXIgMU1pQiIuCj4+Cj4+IFRoYXQgd2lsbCBhbGxvdyB1cyBlbGJv
dy1yb29tIGluIHRoZSBmdXR1cmUgaWYgd2Ugd2FudCB0byBtYWtlIG90aGVyCj4+IGJyZWFraW5n
IGNoYW5nZXMgbGlrZSB0aGlzLCB3aXRob3V0IG5lZWRpbmcgdG8ga2VlcCBhIHNlcGFyYXRlIGZs
YWcKPj4gYXJvdW5kIGZvciBlYWNoIG9uZSBpbmRlZmluaXRlbHkuCj4gCj4gSSBzbGlnaHRseSBt
b3JlIHByZWZlciBhIHBlci1mZWF0dXJlIGJpdC4gSXQgaXMgaW5kZWVkIHNvbWV3aGF0IG1vcmUK
PiBtYWludGVuYW5jZS1oZWF2eSBidXQgaXMgYWxzbyBtb3JlIGZsZXhpYmxlLgoKKzEKCgpKdWVy
Z2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
