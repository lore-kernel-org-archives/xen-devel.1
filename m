From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3 4/5] x86: use MOV for PFN/PDX conversion
 when possible
Date: Fri, 17 Aug 2018 09:41:32 +0100
Message-ID: <346f7e0e-a18a-9327-bfcd-decd30a4ee2d@citrix.com>
References: <5AA7E79302000078001B0FAB@prv1-mh.provo.novell.com>
 <5AA7D98302000000000F73C0@prv1-mh.provo.novell.com>
 <5AA7D98302000078001CDC8C@prv1-mh.provo.novell.com>
 <5AA7D98302000000000F8008@prv1-mh.provo.novell.com>
 <5AA7D98302000078001DD5F0@prv1-mh.provo.novell.com>
 <5B76740802000078001DF345@prv1-mh.provo.novell.com>
 <5B7677DC02000078001DF38A@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=lgsd=la=citrix.com=prvs=760e009d3=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fqaKY-00034y-So
 for xen-devel@lists.xenproject.org; Fri, 17 Aug 2018 08:42:02 +0000
In-Reply-To: <5B7677DC02000078001DF38A@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMTcvMDgvMjAxOCAwODoyMywgSmFuIEJldWxpY2ggd3JvdGU6Cj4gLi4uIGFuZCAob2YgY291
cnNlKSBhbHNvIG1hZGRyIC8gZGlyZWN0LW1hcC1vZmZzZXQgb25lcy4KPgo+IE1vc3QgeDg2IHN5
c3RlbXMgZG9uJ3QgYWN0dWFsbHkgcmVxdWlyZSB0aGUgdXNlIG9mIFBEWCBjb21wcmVzc2lvbi4g
Tm93Cj4gdGhhdCB3ZSBoYXZlIHBhdGNoaW5nIGZvciB0aGUgY29udmVyc2lvbiBjb2RlIGluIHBs
YWNlIGFueXdheSwgZXh0ZW5kIGl0Cj4gdG8gdXNlIHNpbXBsZSBNT1Ygd2hlbiBwb3NzaWJsZS4g
SW50cm9kdWNlIGEgbmV3IHBzZXVkby1DUFUtZmVhdHVyZSB0bwo+IGtleSB0aGUgcGF0Y2hpbmcg
b2ZmIG9mLgo+Cj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29t
Pgo+IC0tLQo+IFRoZSBpbmRlbnRhdGlvbiBvZiB0aGUgYWx0ZXJuYXRpdmVfaW9fMigpIHVzZXMg
YmVsb3cgZW5kcyB1cCB3cm9uZywgYnV0Cj4gcmUtaW5kZW50aW5nIGhlcmUgc2VlbXMgdW5kZXNp
cmFibGUuIEkgY291bGQgZWl0aGVyIGFkZCBhIGZvbGxvdy11cAo+IHJlLWZvcm1hdHRpbmcgcGF0
Y2gsIG9yIHNpbXBseSBzbGlnaHRseSBib2RnZSB0aGUgaW5kZW50YXRpb24gaW4gdGhlCj4gZWFy
bGllciBwYXRjaGVzLCBmb3IgaXQgdG8gY29tZSBvdXQgcmlnaHQgaGVyZS4KCkkndmUgdXNlZCB0
aGUgImJvZGdlIHRoZSBpbmRlbnRhdGlvbiBpbiB0aGUgZWFybGllciBwYXRjaGVzIiB0cmljawpi
ZWZvcmUsIGFuZCBpdCBpcyBwcm9iYWJseSB0aGUgY2xlYW5lc3QgYXBwcm9hY2guCgpBY2tlZC1i
eTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
