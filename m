From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH RFC 07/55] x86/mm: add an end_of_loop label
 in map_pages_to_xen
Date: Tue, 9 Apr 2019 13:22:35 +0100
Message-ID: <20190409122235.GP1986@zion.uk.xensource.com>
References: <20190207164456.9260-1-wei.liu2@citrix.com>
 <20190207164456.9260-8-wei.liu2@citrix.com>
 <5C8BC777020000780021F5EF@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=piA2=SL=citrix.com=prvs=9957968d6=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hDpm5-0008EF-Gj
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 12:22:49 +0000
Content-Disposition: inline
In-Reply-To: <5C8BC777020000780021F5EF@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBNYXIgMTUsIDIwMTkgYXQgMDk6NDA6MzlBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDA3LjAyLjE5IGF0IDE3OjQ0LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gPiBXZSB3aWxsIHNvb24gbmVlZCB0byBjbGVhbiB1cCBtYXBwaW5ncyB3aGVuZXZlciB0
aGUgb3V0IG1vc3QgbG9vcCBpcwo+ID4gZW5kZWQuIEFkZCBhIG5ldyBsYWJlbCBhbmQgdHVybiBy
ZWxldmFudCBjb250aW51ZSdzIGludG8gZ290bydzLgo+IAo+IFRvIGJlIGhvbmVzdCwgSSB3YXMg
b24gdGhlIGVkZ2Ugb2YgYWxyZWFkeSBzdWdnZXN0aW5nIGxlc3MgdXNlCj4gb2YgZ290byBpbiB0
aGUgcHJldmlvdXMgcGF0Y2guIFRoaXMgb25lIGRlZmluaXRlbHkgZ29lcyB0b28gZmFyCj4gZm9y
IG15IHRhc3RlIC0gSSBjYW4gc29tZWhvdyBsaXZlIHdpdGggZ290by1zIHVzZWQgZm9yIGVycm9y
Cj4gaGFuZGxpbmcsIGJ1dCBwbGVhc2Ugbm90IG11Y2ggbW9yZS4gSXMgdGhlcmUgcmVhbGx5IG5v
IGJldHRlcgo+IHdheT8KPiAKCkl0IG1heSBiZSBwb3NzaWJsZSB0byBjYWxsIFVOTUFQIGF0IHRo
ZSBiZWdpbm5pbmcgb2YgdGhlIGxvb3AgaW5zdGVhZC4KSG93IGRvZXMgdGhhdCBzb3VuZCB0byB5
b3U/CgpXZWkuCgo+IEphbgo+IAo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
