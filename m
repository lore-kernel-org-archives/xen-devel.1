From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 0/2] x86: fix build with gcc9
Date: Thu, 7 Mar 2019 11:12:02 +0000
Message-ID: <20190307111202.oxt2ab3cinxwd2r2@zion.uk.xensource.com>
References: <5C80F130020000780021C602@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4dte=RK=citrix.com=prvs=962e1a8a8=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1h1qwb-0004Ea-MV
 for xen-devel@lists.xenproject.org; Thu, 07 Mar 2019 11:12:09 +0000
Content-Disposition: inline
In-Reply-To: <5C80F130020000780021C602@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Charles Arnold <CARNOLD@suse.com>, Juergen Gross <jgross@suse.com>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBNYXIgMDcsIDIwMTkgYXQgMDM6MjM6NDRBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gU2V2ZXJhbCBidWlsZCBpc3N1ZXMgKG5ldyB3YXJuaW5ncywgY2F1c2luZyB0aGUgYnVp
bGQgdG8gZmFpbCBkdWUgdG8KPiAtV2Vycm9yKSBoYXZlIGJlZW4gZm91bmQuIFRoZSB0d28gY2hh
bmdlcyBoZXJlIGFkZHJlc3MgdGhlIG9uZXMKPiBJIGNhbiBhY3R1YWxseSByZXBybzsgdGhlcmUg
YXJlIGEgZmV3IG1vcmUgcmVsYXRlZCB0bwo+IC1XYWRkcmVzcy1vZi1wYWNrZWQtbWVtYmVyIHdo
aWNoIEkgaGF2ZW4ndCBiZWVuIGFibGUgdG8gc2VlCj4gbXlzZWxmLCBhbmQgaGVuY2UgZm9yIG5v
dyBJJ20gdW5hYmxlIHRvIHNvcnQgb3V0IGEgcHJvcGVyIGZpeCAvCj4gd29ya2Fyb3VuZCBmb3Ig
dGhlbS4KPiAKPiBEZXNwaXRlIHRoaXMgY29taW5nIGxhdGUsIEkgdGhpbmsgdGhpcyBpcyBhIHdv
cnRod2hpbGUgY2hhbmdlIGZvciA0LjEyCj4gd2l0aCBwcmV0dHkgbG93IHJpc2suCj4gCj4gMTog
ZTgyMDogZml4IGJ1aWxkIHdpdGggZ2NjOQo+IDI6IG10cnI6IGZpeCBidWlsZCB3aXRoIGdjYzkK
PiAKClJldmlld2VkLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
