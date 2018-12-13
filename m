From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 1/2] x86/dom0: rename paging function
Date: Thu, 13 Dec 2018 00:45:07 -0700
Message-ID: <5C120E030200007800205B30@prv1-mh.provo.novell.com>
References: <20181205145500.11989-2-roger.pau@citrix.com>
 <5C0FD3030200007800205203@prv1-mh.provo.novell.com>
 <20181211151936.yr6s3dokmmpkgt5w@mac>
 <5C0FD8B40200007800205267@prv1-mh.provo.novell.com>
 <20181212091455.xziv2gbsswljlur2@mac>
 <5C10DA96020000780020560C@prv1-mh.provo.novell.com>
 <20181212100407.j5hg4vqi2l4kjvsk@mac>
 <5C10E3D5020000780020564D@prv1-mh.provo.novell.com>
 <20181212155608.nujhjevz2yyqfjdw@mac>
 <5C11340D02000078002058FA@prv1-mh.provo.novell.com>
 <20181212170519.remicvdevdl6r65n@mac>
 <3F7E1F6E020000A10063616D@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=79tL=OW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gXLgF-0006sD-NF
 for xen-devel@lists.xenproject.org; Thu, 13 Dec 2018 07:45:11 +0000
In-Reply-To: <3F7E1F6E020000A10063616D@prv1-mh.provo.novell.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, andrei.semenov@bertin.fr, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEyLjEyLjE4IGF0IDE4OjA1LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIFdlZCwgRGVjIDEyLCAyMDE4IGF0IDA5OjE1OjA5QU0gLTA3MDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+PiBUaGUgTU1JTyBzaWRlIG9mIHRoaW5ncyBvZiBjb3Vyc2Ugc3RpbGwgcmVtYWlucyB1
bmNsZWFyLgo+IAo+IFJpZ2h0LCBmb3IgdGhlIE1NSU8gYW5kIHRoZSBoYW5kbGluZyBvZiBncmFu
dCBhbmQgZm9yZWlnbiBtYXBwaW5ncyBpdCdzCj4gbm90IGNsZWFyIGhvdyB3ZSB3YW50IHRvIHBy
b2NlZWQuCj4gCj4gTWF5YmUgYWNjb3VudCBmb3IgYWxsIGhvc3QgUkFNICh0b3RhbF9wYWdlcykg
cGx1cyBNTUlPIEJBUnM/CgpXZWxsLCBJIHRob3VnaHQgd2UndmUgYWxyZWFkeSBzZXR0bGVkIG9u
IGl0IGJlaW5nIGltcG9zc2libGUgdG8KYWNjb3VudCBmb3IgYWxsIE1NSU8gQkFScyBhdCB0aGlz
IHBvaW50LgoKPj4gV2hhdCBJIGRvbid0IHVuZGVyc3RhbmQgaW4gYW55IGNhc2UgdGhvdWdoIGlz
Cj4+ICJQQUdFX1NJWkUgPDwgUEFHRV9PUkRFUl80SyIuIFRoaXMgaXMgeDg2IGNvZGUgLSB3aHkg
bm90Cj4+IGp1c3QgUEFHRV9TSVpFPwo+IAo+IE9oLCBJJ3ZlIGRvbmUgaXQgbGlrZSB0aGF0IGJl
Y2F1c2UgdGhpcyBpcyByZWxhdGVkIHRvIHAybSBjb2RlLCB3aGljaAo+IHVzZXMgdGhpcyB3YXkg
dG8gZ2V0IHRoZSBwYWdlIHNpemUuIElJUkMgeW91IHRvbGQgbWUgdG8gdXNlIHRoaXMgZm9yCj4g
dGhpbmdzIGxpa2UgcHZoX3NldHVwX2U4MjAuIEkgZG9uJ3QgbWluZCBzd2l0Y2hpbmcgdG8ganVz
dCBQQUdFX1NJWkUuCgpPaCwgSSBzZWUuIEl0J3MgZmluZSBlaXRoZXIgd2F5IHRoZW4uIE15IGdl
bmVyYWwgd2F5IG9mIHRoaW5raW5nCmhlcmUgaXMgdGhhdCBvdXRzaWRlIG9mIHg4NiBjb2RlIHdl
IGJldHRlciB1c2UgdGhlc2UKUEFHRV9PUkRFUl8qIHZhbHVlcywgd2hpbGUgaW4geDg2IHNwZWNp
ZmljIGNvZGUgSSBkb24ndCBzZWUKdGhlIHBvaW50LiBCdXQgaW5kZWVkIHRoZSBwMm0gY29kZSBp
cyBsaXR0ZXJlZCB3aXRoIHRoZW0uCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
