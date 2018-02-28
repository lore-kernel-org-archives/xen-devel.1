From: Juergen Gross <jgross@suse.com>
Subject: Re: Ping: [PATCH v2 0/7] x86: Meltdown band-aid
 overhead reduction
Date: Wed, 28 Feb 2018 13:00:40 +0100
Message-ID: <0625f7c7-6060-5e52-74f8-90e24f2f3536@suse.com>
References: <5A7B31DF02000078001A61F9@prv-mh.provo.novell.com>
 <5A96A62102000078001ACAF7@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=j4wv=fw=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1er0Pg-0004NT-S5
 for xen-devel@lists.xenproject.org; Wed, 28 Feb 2018 12:00:48 +0000
In-Reply-To: <5A96A62102000078001ACAF7@prv-mh.provo.novell.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMjgvMDIvMTggMTI6NTIsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDA3LjAyLjE4IGF0
IDE3OjA1LCA8SkJldWxpY2hAc3VzZS5jb20+IHdyb3RlOgo+PiAxOiBzbGlnaHRseSByZWR1Y2Ug
TWVsdGRvd24gYmFuZC1haWQgb3ZlcmhlYWQKPj4gMjogcmVtb3ZlIENSIHJlYWRzIGZyb20gZXhp
dC10by1ndWVzdCBwYXRoCj4+IDM6IGludHJvZHVjZSBhbHRpbnN0cnVjdGlvbl9ub3AgYXNzZW1i
bGVyIG1hY3JvCj4+IDQ6IE5PUCBvdXQgbW9zdCBYUFRJIGVudHJ5L2V4aXQgY29kZSB3aGVuIGl0
J3Mgbm90IGluIHVzZQo+IAo+IEkndmUgdXBkYXRlZCB0aGlzIG9uZSB0byBwYXRjaCBhbGwgcGF0
aHMsIGJ1dCBJJ2QgbGlrZSB0byBhdm9pZCBzZW5kaW5nCj4gdjMgb2YgdGhlIHNlcmllcyB3aXRo
b3V0IGhhdmluZyBoYWQgYW55IGZlZWRiYWNrIG9uIHYyIChsZWF2aW5nCj4gYXNpZGUgYSB0aW55
IGJpdCBvbiBwYXRjaCAxKS4KPiAKPiBKYW4KPiAKPj4gNTogYXZvaWQgZG91YmxlIENSMyByZWxv
YWQgd2hlbiBzd2l0Y2hpbmcgdG8gZ3Vlc3QgdXNlciBtb2RlCj4+IDY6IGRpc2FibGUgWFBUSSB3
aGVuIFJEQ0xfTk8KPj4gNzogeDg2OiBsb2cgWFBUSSBlbmFibGVkIHN0YXR1cwo+Pgo+PiBJIHdv
bid0IG1pbmQgaWYgaXQgd2FzIGRlY2lkZWQgZm9yIHNvbWUgb2YgdGhlbSB0byBiZSBwb2ludGxl
c3MsIGJ1dCBJCj4+IHRoaW5rIDEgKGJlY2F1c2Ugb2YgYSBtZWFzdXJhYmxlIGltcHJvdmVtZW50
IG9mIDEtMyUpLCA0IChoZWxwaW5nCj4+IHRoZSAieHB0aT1ubyIgY2FzZSwgZXZlbiBpZiBvbmx5
IGEgbGl0dGxlOyB0YWtpbmcgMyBhcyBwcmVyZXEpLCBhbmQKPj4gNis3IHNob3VsZCBiZSBjb25z
aWRlcmVkIHNlcmlvdXNseS4KPj4KPj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVs
aWNoQHN1c2UuY29tPgoKWW91IGNhbiBhZGQgdG8gYWxsIG9mIHRoZW06CgpUZXN0ZWQtYnk6IEp1
ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KUmV2aWV3ZWQtYnk6IEp1ZXJnZW4gR3Jvc3Mg
PGpncm9zc0BzdXNlLmNvbT4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
