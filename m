From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 0/2] MMIO emulation fixes
Date: Wed, 29 Aug 2018 11:53:05 +0100
Message-ID: <75009cae-1c9b-65d9-8269-497f94469983@citrix.com>
References: <5B6D86F302000078001DCF85@prv1-mh.provo.novell.com>
 <e8cff3ca6c154b67a2a932af83719354@AMSPEX02CL03.citrite.net>
 <fdf19f7d-1b92-a9c0-3602-b1c9807bf610@citrix.com>
 <a735b4359ccc4b278330204d9790c6ac@AMSPEX02CL03.citrite.net>
 <5B6DAF9F02000078001DD040@prv1-mh.provo.novell.com>
 <e2f77af0b2394b8f859a1f2dc1a91797@AMSPEX02CL03.citrite.net>
 <5B6DB69D02000078001DD06A@prv1-mh.provo.novell.com>
 <eaab5a73-2910-7fb6-e1fc-08537e63088c@citrix.com>
 <92ca69e5-98b1-61e4-817a-3868f829471a@citrix.com>
 <5B712A3502000078001DD514@prv1-mh.provo.novell.com>
 <20180829103614.GA31376@aepfle.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=xzde=lm=citrix.com=prvs=772b5abf7=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fuy63-0001HJ-7l
 for xen-devel@lists.xenproject.org; Wed, 29 Aug 2018 10:53:11 +0000
In-Reply-To: <20180829103614.GA31376@aepfle.de>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Olaf Hering <olaf@aepfle.de>, Jan Beulich <JBeulich@suse.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Paul Durrant <paul.durrant@citrix.com>, george.dunlap@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gMjkvMDgvMTggMTE6MzYsIE9sYWYgSGVyaW5nIHdyb3RlOgo+IE9uIE1vbiwgQXVnIDEzLCBK
YW4gQmV1bGljaCB3cm90ZToKPgo+PiBBbmQgaGVuY2UgdGhlIGNvbnNpZGVyYXRpb24gb2YgbWFw
cGluZyBpbiBhbiBhbGwgemVyb3MgcGFnZQo+PiBpbnN0ZWFkLiBUaGlzIGlzIGJlY2F1c2Ugb2Yg
dGhlIHdheSBfX2h2bWVtdWxfcmVhZCgpIC8KPj4gX19odm1fY29weSgpIHdvcms6IFRoZSBsYXR0
ZXIgZG9lc24ndCB0ZWxsIGl0cyBjYWxsZXIgaG93IG1hbnkKPj4gYnl0ZXMgaXQgd2FzIGFibGUg
dG8gcmVhZCwgYW5kIGhlbmNlIHRoZSBmb3JtZXIgY29uc2lkZXJzIHRoZQo+PiBlbnRpcmUgcmFu
Z2UgTU1JTyAoYW5kIGZvcndhcmRzIHRoZSByZXF1ZXN0IGZvciBlbXVsYXRpb24pLgo+PiBPZiBj
b3Vyc2UgYWxsIG9mIHRoaXMgaXMgYW4gaXNzdWUgb25seSBiZWNhdXNlCj4+IGh2bWVtdWxfdmly
dHVhbF90b19saW5lYXIoKSBzZWVzIG5vIG5lZWQgdG8gc3BsaXQgdGhlIHJlcXVlc3QKPj4gYXQg
dGhlIHBhZ2UgYm91bmRhcnksIGR1ZSB0byB0aGUgYmFsbG9vbiBkcml2ZXIgaGF2aW5nIGxlZnQg
aW4KPj4gcGxhY2UgdGhlIG1hcHBpbmcgb2YgdGhlIGJhbGxvb25lZCBvdXQgcGFnZS4KPiBTaG91
bGQgcGVyaGFwcyBfX2h2bV9jb3B5IGRldGVjdCB0aGUgZmF1bHQgYW5kIGNvcHkgMHhmIGZvciB0
aGUKPiB1bmF2YWlsYWJsZSBwYWdlIGludG8gJ2J1ZicsIGFuZCBmaW5hbGx5IHJldHVybiBzdWNj
ZXNzPwo+Cj4gQ2xlYXJseSBzb21ldGhpbmcgbXVzdCBiZSBkb25lIGF0IHRoZSBYZW4gbGV2ZWwu
CgpUaGlzIGlzIGZpcnN0IGFuZCBmb3Jtb3N0IGEgTGludXggYnVnLsKgIE5vIGFtb3VudCBvZiBm
aXhpbmcgWGVuIGlzIGdvaW5nCnRvIGFsdGVyIHRoYXQuCgpBcmNoaXRlY3R1cmFsbHkgc3BlYWtp
bmcsIGhhbmRpbmcgI01DIGJhY2sgaXMgcHJvYmFibHkgdGhlIGNsb3Nlc3Qgd2UKY2FuIGdldCB0
byBzZW5zaWJsZSBiZWhhdmlvdXIsIGJ1dCBpdCBpcyBzdGlsbCBhIGJ1ZyB0aGF0IExpbnV4IGlz
CnRvdWNoaW5nIHRoZSBiYWxsb29uZWQgb3V0IHBhZ2UgaW4gdGhlIGZpcnN0IHBsYWNlLgoKfkFu
ZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
