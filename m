From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH RFC] libxl: set 1GB MMIO hole for PVH
Date: Thu, 10 May 2018 11:01:56 +0100
Message-ID: <20180510100156.333eaunp4doblaxy@MacBook-Pro-de-Roger.local>
References: <20180509160712.26231-1-roger.pau@citrix.com>
 <CAFLBxZZ3A0tZGterC-6OUg6oN=KdTL6EjqvSeCLRB5rON96UZA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=tie0=h5=citrix.com=prvs=66130e668=roger.pau@srs-us1.protection.inumbo.net>)
 id 1fGiOi-0003VX-G4
 for xen-devel@lists.xenproject.org; Thu, 10 May 2018 10:02:04 +0000
Content-Disposition: inline
In-Reply-To: <CAFLBxZZ3A0tZGterC-6OUg6oN=KdTL6EjqvSeCLRB5rON96UZA@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <dunlapg@umich.edu>
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBNYXkgMTAsIDIwMTggYXQgMTA6NDM6MjZBTSArMDEwMCwgR2VvcmdlIER1bmxhcCB3
cm90ZToKPiBPbiBXZWQsIE1heSA5LCAyMDE4IGF0IDU6MDcgUE0sIFJvZ2VyIFBhdSBNb25uZSA8
cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+ID4gVGhpcyBwcmV2ZW50cyBwYWdlLXNoYXR0
ZXJpbmcsIGJ5IGJlaW5nIGFibGUgdG8gcG9wdWxhdGUgdGhlIFJBTQo+ID4gcmVnaW9ucyBiZWxv
dyA0R0IgdXNpbmcgMUdCIHBhZ2VzLCBwcm92aWRlZCB0aGUgZ3Vlc3QgbWVtb3J5IHNpemUgaXMK
PiA+IHNldCB0byBhIG11bHRpcGxlIG9mIGEgR0IuCj4gPgo+ID4gTm90ZSB0aGF0IHRoZXJlIGFy
ZSBzb21lIHNwZWNpYWwgYW5kIEFDUEkgcGFnZXMgaW4gdGhlIE1NSU8gaG9sZSB0aGF0Cj4gPiB3
aWxsIGJlIHBvcHVsYXRlZCB1c2luZyBzbWFsbGVyIG9yZGVyIHBhZ2VzLCBidXQgdGhvc2Ugc2hv
dWxkbid0IGJlCj4gPiBhY2Nlc3NlZCBhcyBvZnRlbiBhcyBSQU0gcmVnaW9ucy4KPiAKPiBJcyBp
dCBwb3NzaWJsZSB0byBydW4gUFZIIGluIHB1cmUgMzItYml0IG1vZGUgKGFzIG9wcG9zZWQgdG8g
MzItYml0Cj4gUEFFKT8gIElmIHNvLCBzdWNoIGd1ZXN0cyB3b3VsZCBiZSBsaW1pdGVkIHRvIDNH
aUIgb2YgdG90YWwgbWVtb3J5Cj4gKGluc3RlYWQgb2YgNEdpQikuCgpZZXMsIHRoYXQncyBjb3Jy
ZWN0LiBQVkggZ3Vlc3RzIGFyZSBub3QgbGltaXRlZCB0byBhbnkgbW9kZSwgeW91IGNvdWxkCmV2
ZW4gcnVuIHRoZW0gaW4gcHJvdGVjdGVkIG9yIHJlYWwgbW9kZS4KCj4gQnV0IEkgc3VwcG9zZSB0
aGVyZSdzIG5vIHBhcnRpY3VsYXIgcmVhc29uIHRvIHJ1biBQVkggaW4gcHVyZSAzMi1iaXQKPiBt
b2RlIGluc3RlYWQgb2YgMzItYml0IFBBRS4gIChJIGRvbid0ICp0aGluayogVExCIG1pc3NlcyBh
cmUgc2xvd2VyIG9uCj4gMy1sZXZlbCBwYWdpbmcgdGhhbiAyLWxldmVsIHBhZ2luZywgYmVjYXVz
ZSB0aGUgTDMgZW50cmllcyBhcmUKPiBlc3NlbnRpYWxseSBsb2FkZWQgb24gQ1IzIHN3aXRjaC4p
Cj4gCj4gU28gYXQgdGhlIG1vbWVudCB0aGlzIHNlZW1zIE9LIHRvIG1lLiAgSWYgc29tZW9uZSBk
ZWNpZGVzIHRoZXkgd2FudCB0bwo+IHJ1biBQVkggMi1sZXZlbCBwYWdpbmcgd2l0aCBtb3JlIHRo
YW4gM0dpQiBvZiBSQU0sIHdlIGNhbiBlYXNpbHkgYWRkCj4gYW4gb3B0aW9uIHRvIHR1cm4gaXQg
b24uCgpUaGF0J3MgbXkgb3Bpbmlvbi4gSFZNIGd1ZXN0cyBhbHJlYWR5IGhhdmUgYSBtbWlvX2hv
bGUgb3B0aW9uLCBpdAp3b3VsZCBiZSBhbG1vc3QgdHJpdmlhbCB0byBtYWtlIHRoYXQgb3B0aW9u
IGFsc28gYXZhaWxhYmxlIHRvIFBWSCBpZgp0aGVyZSdzIGEgbmVlZCBmb3IgaXQuCgpUaGFua3Ms
IFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
