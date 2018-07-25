From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] automation: introduce a script for build
 test
Date: Wed, 25 Jul 2018 14:19:53 +0100
Message-ID: <20180725131953.uqfow5mnnwouv7oo@citrix.com>
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
 <srs0=m8ai=kj=citrix.com=prvs=737e41906=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fiJhw-0000oq-54
 for xen-devel@lists.xenproject.org; Wed, 25 Jul 2018 13:20:00 +0000
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Doug Goldstein <cardoe@cardoe.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Anthony PERARD <anthony.perard@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBKdWwgMjUsIDIwMTggYXQgMTI6MDQ6MzNQTSArMDEwMCwgR2VvcmdlIER1bmxhcCB3
cm90ZToKPiBPbiAwNy8yNS8yMDE4IDExOjUzIEFNLCBXZWkgTGl1IHdyb3RlOgo+ID4gT24gV2Vk
LCBKdWwgMjUsIDIwMTggYXQgMTE6NDg6MzZBTSArMDEwMCwgQW50aG9ueSBQRVJBUkQgd3JvdGU6
Cj4gPj4gT24gVHVlLCBKdWwgMjQsIDIwMTggYXQgMDE6MDE6NTJQTSAtMDUwMCwgRG91ZyBHb2xk
c3RlaW4gd3JvdGU6Cj4gPj4+IE9uIFR1ZSwgSnVsIDI0LCAyMDE4IGF0IDA1OjU2OjUxUE0gKzAx
MDAsIFdlaSBMaXUgd3JvdGU6Cj4gPj4+PiBTaWduZWQtb2ZmLWJ5OiBJYW4gSmFja3NvbiA8aWFu
LmphY2tzb25AZXUuY2l0cml4LmNvbT4KPiA+Pj4+IFNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPHdl
aS5saXUyQGNpdHJpeC5jb20+Cj4gPj4+PiAtLS0KPiA+Pj4+IFRoaXMgaXMgYSBzY3JpcHQgSSB3
cm90ZSBwcmV2aW91c2x5IGZvciBidWlsZCB0ZXN0Lgo+ID4+Pgo+ID4+PiBHb2FsIGhlcmUgaXMg
dG8gYmlzZWN0IGEgc2VyaWVzIHRvIGZpbmQgdGhlIGJ1aWxkIGZhaWx1cmU/IFdlIGNvdWxkCj4g
Pj4+IGFsbG93IGdpdCBiaXNlY3QgdG8gZG8gdGhlIHdvcmsgYW5kIGp1c3QgYnVpbGQgYW5kIHJl
dHVybiBzdWNjZXNzIG9yCj4gPj4+IGZhaWx1cmUgaW5zdGVhZCBvZiBoYXZpbmcgdG8gd2FsayBp
dCBieSBoYW5kLiBJIGRvbid0IGhhdmUgb25lCj4gPj4+IHNwZWNpZmljYWxseSBmb3IgWGVuIGJ1
dCBvbiBvdGhlciBwcm9qZWN0cyBJJ3ZlIGdvdCBzb21ldGhpbmcgbGlrZToKPiA+Pj4KPiA+Pgo+
ID4+IEFjdHVhbGx5LCBpdCdzIGEgc2NyaXB0IHRoYXQgdGhvc2UgYSBzaW1pbGFpciBqb2IgdG86
Cj4gPj4gICAgIGdpdCByZWJhc2UgLS1leGVjIC4vc2NyaXB0cy9iYXNpYy1idWlsZC5zaCA8YmFz
ZT4KPiA+IAo+ID4gVG8gZXhwb3VuZCB0aGlzIGEgYml0Ogo+ID4gCj4gPiBUaGF0J3Mgd2hhdCBJ
IHVzZWQgYW5kIHRvbGQgb3RoZXJzIHRvIHVzZSBiZWZvcmUsIGJ1dCBpdCBpcyBmYXIgbW9yZQo+
ID4gZGFuZ2Vyb3VzIHRoYW4gdGhpcyBzY3JpcHQgYmVjYXVzZSBnaXQtcmViYXNlIF9yZXdyaXRl
c18gaGlzdG9yeS4KPiA+IAo+ID4gQSBmYWlsZWQgY29tbWFuZCBhbHNvIGRvZXNuJ3QgcmVzdG9y
ZSBvcmlnaW5hbCBoZWFkLCBzbyBpdCBpcyBsZXNzCj4gPiBjb252ZW5pZW50IC0tIHlvdSBoYXZl
IHRvIGNoZWNrIHRoZSBzdGF0dXMgb2YgdGhlIHRyZWUgZXZlcnkgdGltZQo+ID4gc29tZXRoaW5n
IGJyZWFrcy4KPiAKPiBJJ20gbm90IG9wcG9zZWQgdG8gdGhlIHNjcmlwdCB5b3UgaGF2ZSwgYnV0
IGl0IG1pZ2h0IGJlIHdvcnRoIHNlZWluZwo+IHdoYXQgd2UgY2FuIGRvIHRvIHRvIHVzZSBgZ2l0
IHJlYmFzZWAsIHNpbmNlIHRoYXQgc2ltcGxpZmllcyB0aGUgcHJvY2Vzc2luZy4KClVuZm9ydHVu
YXRlbHkgZ2l0IHJlYmFzZSAtLWV4ZWMgaXNuJ3Qgc3VwcG9ydGVkIGluIG9sZGVyIHZlcnNpb25z
IG9mCmdpdC4KCldlaS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
