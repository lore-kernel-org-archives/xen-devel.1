From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v10 11/11] vpci/msix: add MSI-X handlers
Date: Tue, 20 Mar 2018 13:48:08 +0000
Message-ID: <20180320134808.zkv7tvhv3j6z72qo@MacBook-Pro-de-Roger.local>
References: <20180316133008.66443-1-roger.pau@citrix.com>
 <20180316133008.66443-12-roger.pau@citrix.com>
 <5AB0F87D02000078001B3E0B@prv-mh.provo.novell.com>
 <20180320114300.xzadfq244eihcgn3@MacBook-Pro-de-Roger.local>
 <5AB1165F02000078001B3F03@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=px6q=gk=citrix.com=prvs=610419324=roger.pau@srs-us1.protection.inumbo.net>)
 id 1eyHk7-0002wV-BQ
 for xen-devel@lists.xenproject.org; Tue, 20 Mar 2018 13:55:59 +0000
Content-Disposition: inline
In-Reply-To: <5AB1165F02000078001B3F03@prv-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, IanJackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBNYXIgMjAsIDIwMTggYXQgMDc6MTA6MzlBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDIwLjAzLjE4IGF0IDEyOjQzLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gU2luY2UgeW91IG9ubHkgaGFkIGNvbW1lbnRzIG9uIHBhdGNoIDcgYW5kIDExIGFu
ZCB0aGVyZSdzIHRoZSBleHRyYQo+ID4gZml4IGZvciB0aGUgdGVzdCBoYXJuZXNzLCBzaG91bGQg
SSBqdXN0IHNlbmQgdGhvc2UgYW5kIHByb3ZpZGUgeW91Cj4gPiB3aXRoIGEgZ2l0IGJyYW5jaCB0
aGF0IGNvbnRhaW5zIHRoZSByZXN0Pwo+IAo+IFdlbGwsIGlmIGl0J3Mgbm90IHRvbyBtdWNoIGhh
c3NsZSBmb3IgeW91IEknZCBwcmVmZXIgaWYgeW91IHJlc2VudCB0aGUKPiBmdWxsIHNlcmllcyAo
b3IsIHNlZSBiZWxvdywgd2hhdGV2ZXIgaXMgbGVmdCBhdCB0aGUgdGltZSB5b3UgZ2V0Cj4gYXJv
dW5kIHRvIHNlbmQgaXQpLgo+IAo+ID4gSSBjYW4gYWxzbyB3YWl0IGlmIHlvdSB3YW50IHRvIGNv
bW1pdCB0aGUgc3RhcnQgb2YgdGhlIHNlcmllcwo+ID4gKHByb3ZpZGVkIEkgZ2V0IGFsbCB0aGUg
cmVsZXZhbnQgQWNrcykgYW5kIHJlYmFzZSBvbiB0b3Agb2YgdGhhdC4KPiAKPiBJJ2QgbGVhdmUg
dGhhdCB1cCB0byB5b3U7IGl0IGxvb2tzIGxpa2UgYm90aCB0b29sIHN0YWNrIG1haW50YWluZXJz
Cj4gYXJlIG5vdCBhcm91bmQgcmlnaHQgbm93LCBzbyB0aGVpciBhY2sgZm9yIHBhdGNoIDEgbWF5
IHRha2UgYSBmZXcKPiBtb3JlIGRheXMgdG8gYXJyaXZlLgoKSSBndWVzcyBJIHdpbGwgcmVzZW5k
IHRoZSBmdWxsIHNlcmllcyBsYXRlciBzbyB0aGV5IGNhbiByZXZpZXcgdGhlIGxhdGVzdAp2ZXJz
aW9uLgoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
