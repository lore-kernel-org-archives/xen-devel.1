From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH v3 1/4] x86/mem_sharing: reorder when pages
 are unlocked and released
Date: Mon, 29 Apr 2019 17:22:00 +0100
Message-ID: <3b7198ae-0c18-6296-6221-24458937e021@citrix.com>
References: <20190426172138.14669-1-tamas@tklengyel.com>
 <5CC711DC020000780022A111@prv1-mh.provo.novell.com>
 <CABfawhnxZA5+FXj5uRb59sJ9RGm71uC0MHv4=J5PGfejXiX2qg@mail.gmail.com>
 <4b3607ed-5596-496b-f6a6-19548703b773@citrix.com>
 <CABfawhk4AnVBMTssrqsDr7e9FB2GSiCn9iE13L5=sBKhQdiEeQ@mail.gmail.com>
 <5CC722F8020000780022A22C@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=uN3R=S7=citrix.com=prvs=015486667=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1hL92j-0005VV-9r
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2019 16:22:13 +0000
In-Reply-To: <5CC722F8020000780022A22C@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Tamas K Lengyel <tamas@tklengyel.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gNC8yOS8xOSA1OjE0IFBNLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBPbiAyOS4wNC4xOSBh
dCAxODowNSwgPHRhbWFzQHRrbGVuZ3llbC5jb20+IHdyb3RlOgo+PiBPbiBNb24sIEFwciAyOSwg
MjAxOSBhdCA5OjUyIEFNIEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT4g
d3JvdGU6Cj4+PiBJIGhhdmVuJ3QgcmUtZ3Jva2tlZCB0aGUgY29kZSBoZXJlLCBidXQgYXNzdW1p
bmcgSSB3YXMgY29ycmVjdCAyIHdlZWtzCj4+PiBhZ28sIGlmIHlvdSBoYXZlIHRoZSBCVUdfT04o
KSB0aGVyZSwgeW91IGNhbiBnZXQgcmlkIG9mIHRoZSBleHRyYQo+Pj4gcmVmZXJlbmNlcy4KPj4K
Pj4gU3VyZSwgYnV0IGFnYWluLCB0aGUgb3ZlcmhlYWQgb2YgaGF2aW5nIHRoZW0gaW4tcGxhY2Ug
aXMgbmVnbGlnaWJsZSBzbwo+PiBtaWdodCBhcyB3ZWxsIGp1c3Qga2VlcCBpdC4KPiAKPiBUaGUg
b3ZlcmhlYWQgaXMgb25seSBvbmUgYXNwZWN0IGhlcmUuIFBlb3BsZSBsb29raW5nIGF0IHRoZSBj
b2RlCj4gbWF5IGFsc28gYmUgbWlzbGVhZCBpbnRvIHRyeWluZyB0byBmaWd1cmUgb3V0IHdoeSB0
aGUgaGVjayB0aGlzCj4gZXh0cmEgcmVmZXJlbmNlIGdldHMgb2J0YWluZWQuIFBsdXMgc3ViLW9w
dGltYWwgY29kZSB0ZW5kcyB0byBnZXQKPiBjbG9uZWQgLi4uCgpJIHRoaW5rIGl0J3MgYmV0dGVy
IG5vdCB0byBoYXZlIGR1cGxpY2F0ZSBtZWFzdXJlcyBhcyB3ZWxsLCBidXQgSSBkb24ndAp3YW50
IHRvIGFyZ3VlIHRvbyBtdWNoIG92ZXIgaXQuCgpBdCB2ZXJ5IGxlYXN0LCB0aGVyZSBzaG91bGQg
YmUgYSBjb21tZW50IHNheWluZyB0aGF0IHRoZSBnZXRfcGFnZSgpCnNob3VsZG4ndCBiZSBuZWNl
c3NhcnkuCgogLUdlb3JnZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
