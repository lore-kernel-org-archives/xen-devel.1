From: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH] automation: introduce a script for build
 test
Date: Wed, 25 Jul 2018 12:19:52 +0100
Message-ID: <20180725111952.GH2296@perard.uk.xensource.com>
References: <20180724165651.21743-1-wei.liu2@citrix.com>
 <20180724180152.luftbxunayvi5zgf@doug-macbook.localdomain>
 <20180725104836.GG2296@perard.uk.xensource.com>
 <20180725105353.pgbb36jz6aacufpl@citrix.com>
 <9c904663-da57-48f8-44d3-42b9ce3c4387@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=b3i8=kj=citrix.com=prvs=73789403c=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1fiHpk-0004gm-Go
 for xen-devel@lists.xenproject.org; Wed, 25 Jul 2018 11:19:56 +0000
Content-Disposition: inline
In-Reply-To: <9c904663-da57-48f8-44d3-42b9ce3c4387@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Doug Goldstein <cardoe@cardoe.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBKdWwgMjUsIDIwMTggYXQgMTI6MDQ6MzNQTSArMDEwMCwgR2VvcmdlIER1bmxhcCB3
cm90ZToKPiBPbiAwNy8yNS8yMDE4IDExOjUzIEFNLCBXZWkgTGl1IHdyb3RlOgo+ID4gT24gV2Vk
LCBKdWwgMjUsIDIwMTggYXQgMTE6NDg6MzZBTSArMDEwMCwgQW50aG9ueSBQRVJBUkQgd3JvdGU6
Cj4gPj4gICAgIGdpdCByZWJhc2UgLS1leGVjIC4vc2NyaXB0cy9iYXNpYy1idWlsZC5zaCA8YmFz
ZT4KPiA+IAo+ID4gVG8gZXhwb3VuZCB0aGlzIGEgYml0Ogo+ID4gCj4gPiBUaGF0J3Mgd2hhdCBJ
IHVzZWQgYW5kIHRvbGQgb3RoZXJzIHRvIHVzZSBiZWZvcmUsIGJ1dCBpdCBpcyBmYXIgbW9yZQo+
ID4gZGFuZ2Vyb3VzIHRoYW4gdGhpcyBzY3JpcHQgYmVjYXVzZSBnaXQtcmViYXNlIF9yZXdyaXRl
c18gaGlzdG9yeS4KPiA+IAo+ID4gQSBmYWlsZWQgY29tbWFuZCBhbHNvIGRvZXNuJ3QgcmVzdG9y
ZSBvcmlnaW5hbCBoZWFkLCBzbyBpdCBpcyBsZXNzCj4gPiBjb252ZW5pZW50IC0tIHlvdSBoYXZl
IHRvIGNoZWNrIHRoZSBzdGF0dXMgb2YgdGhlIHRyZWUgZXZlcnkgdGltZQo+ID4gc29tZXRoaW5n
IGJyZWFrcy4KPiAKPiBJJ20gbm90IG9wcG9zZWQgdG8gdGhlIHNjcmlwdCB5b3UgaGF2ZSwgYnV0
IGl0IG1pZ2h0IGJlIHdvcnRoIHNlZWluZwo+IHdoYXQgd2UgY2FuIGRvIHRvIHRvIHVzZSBgZ2l0
IHJlYmFzZWAsIHNpbmNlIHRoYXQgc2ltcGxpZmllcyB0aGUgcHJvY2Vzc2luZy4KCk9uIHRoZSBv
dGhlciBoYW5kLCB0aGVyZSBtaWdodCBub3QgYmUgYW55IHN1cHBvcnQgZm9yIGdpdC1yZWJhc2Ug
LS1leGVjLAphdCBpdCdzIGEgZmFpcmx5IG5ldyBvcHRpb25zLCBzbyB0aGUgc2NyaXB0IHdvdWxk
IHdvcmsgd2l0aCBvbGRlcgp2ZXJzaW9uIG9mIGdpdC4KCj4gV2UgY291bGQgaGF2ZSBhIHNjcmlw
dCwgZm9yIGluc3RhbmNlLCBkbyBzb21ldGhpbmcgbGlrZToKPiAKPiBjdXJicmFuY2g9JChnaXQg
bmFtZS1yZXYgLS1uYW1lLW9ubHkgSEVBRCkKPiBnaXQgY2hlY2tvdXQgLWIgdG1wLXNlcmllcy1i
dWlsZC10ZXN0Cj4gaWYgISBnaXQgcmViYXNlIC0tZXhlYyAuLi4gJGJhc2UgOyB0aGVuCj4gCWdp
dCByZWJhc2UgLS1hYm9ydAo+IGZpCj4gZ2l0IGNoZWNrb3V0IC1mICRjdXJicmFuY2gKPiBnaXQg
ZGVsZXRlIC1EIHRtcC1zZXJpZXMtYnVpbGQtdGVzdAo+IAo+IFRoZSBoaXN0b3J5IHJld3JpdGlu
ZyBpcyBub3cgbW9vdCBiZWNhdXNlIHlvdSdyZSByZXdyaXRpbmcgYSB0ZW1wb3JhcnkKPiBicmFu
Y2guCgpBbHNvLCBpbiBteSBleHBlcmllbmNlLCByZWJhc2UgZG9lc24ndCBjaGFuZ2UgaGlzdG9y
eSBhcyBsb25nIGFzIGl0IG9ubHkKcGlja3MgY29tbWl0cyAobm8gc3F1YXNoL2ZpeHVwIG1vdmlu
ZyBjb21taXRzIGFycm91bmQpLCBidXQgaXQgbWlnaHQgd2l0aAp0aGluZyBsaWtlIC0tYXV0b3Nx
dWFzaC4KCi0tIApBbnRob255IFBFUkFSRAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
