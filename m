From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2 1/2] console: adjust IRQ initialization
Date: Thu, 29 Nov 2018 18:18:13 +0100
Message-ID: <20181129171813.f5jy2pd6bezml7cx@mac>
References: <5BB2455202000078001ED685@prv1-mh.provo.novell.com>
 <5BB24A7D02000078001ED6BD@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=mkqz=oi=citrix.com=prvs=864cd69c8=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gSPxe-0007L4-R4
 for xen-devel@lists.xenproject.org; Thu, 29 Nov 2018 17:18:46 +0000
Content-Disposition: inline
In-Reply-To: <5BB24A7D02000078001ED6BD@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBPY3QgMDEsIDIwMTggYXQgMTA6MjU6MzNBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gSW4gb3JkZXIgZm9yIGEgWGVuIGludGVybmFsIFBDSSBkZXZpY2UgZHJpdmVyIHRvIGVu
YWJsZSBNU0kgb24gdGhlCj4gZGV2aWNlLCB3ZSBuZWVkIGFub3RoZXIgaG9vayB3aGljaCB0aGUg
ZHJpdmVyIGNhbiB1c2UgdG8gY3JlYXRlIHRoZSBJUlEKPiAoZG9pbmcgdGhpcyBpbiB0aGUgaW5p
dF9wcmVpcnEgaG9vayBpcyB0b28gZWFybHksIHNpbmNlIElSUSBjb2RlIGhhc24ndAo+IGdvdCBp
bml0aWFsaXplZCBhdCB0aGF0IHRpbWUgeWV0LCBhbmQgZG9pbmcgaXQgaW4gaW5pdF9wb3N0aXJx
IGlzIHRvbwo+IGxhdGUgYmVjYXVzZSBhdCBsZWFzdCBvbiB4ODYgc21wX2ludHJfaW5pdCgpIG5l
ZWRzIHRvIGtub3cgdGhlIElSUQo+IG51bWJlcikuCj4gCj4gT24geDg2IHRoaXMgYWRkaXRpb25h
bGx5IHJlcXVpcmVzIGEgc2xpZ2h0IG9yZGVyaW5nIGNoYW5nZSB0byBJUlEKPiBpbml0aWFsaXph
dGlvbiwgdG8gZmFjaWxpdGF0ZSBjYWxsaW5nIHRoZSBuZXcgaG9vayBiZXR3ZWVuIGJhc2ljCj4g
aW5pdGlhbGl6YXRpb24gYW5kIHRoZSBjYWxsIHBhdGggbGVhZGluZyB0byBzbXBfaW50cl9pbml0
KCkuCj4gCj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoK
UmV2aWV3ZWQtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
