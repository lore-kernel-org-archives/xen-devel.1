From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: seabios: import build fix for newer iasl
Date: Wed, 29 Aug 2018 11:32:31 +0100
Message-ID: <20180829103231.46yy4v7vgyhw2mkn@citrix.com>
References: <20180823105733.io65kk4rvtadbysn@mac>
 <20180829102057.t3z2z7p4tr6l2ef4@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=vupe=lm=citrix.com=prvs=7720ea622=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fuxm9-0007PN-3N
 for xen-devel@lists.xenproject.org; Wed, 29 Aug 2018 10:32:37 +0000
Content-Disposition: inline
In-Reply-To: <20180829102057.t3z2z7p4tr6l2ef4@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBBdWcgMjksIDIwMTggYXQgMTE6MjE6MDBBTSArMDEwMCwgV2VpIExpdSB3cm90ZToK
PiBPbiBUaHUsIEF1ZyAyMywgMjAxOCBhdCAxMjo1NzozM1BNICswMjAwLCBSb2dlciBQYXUgTW9u
bsOpIHdyb3RlOgo+ID4gSGVsbG8sCj4gPiAKPiA+IFNlYUJJT1MgY3VycmVudGx5IGZhaWxzIHRv
IGJ1aWxkIHdpdGggbmV3ZXIgdmVyc2lvbnMgb2YgaWFzbCBkdWUgdG86Cj4gPiAKPiA+ICAgQ29t
cGlsaW5nIElBU0wgc3JjL2Z3L3NzZHQtcGNpaHAuaGV4Cj4gPiBvdXQvc3JjL2Z3L3NzZHQtcGNp
aHAuZHNsLmkgICAgICA1OiBEZWZpbml0aW9uQmxvY2sgKCJzc2R0LXBjaWhwLmFtbCIsICJTU0RU
IiwgMHgwMSwgIkJYUEMiLCAiQlhTU0RUUENJSFAiLCAweDEpCj4gPiBFcnJvciAgICA2MTU1IC0g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIEludmFsaWQgT0VNIFRhYmxlIElEIF4gIChMZW5ndGggY2Fubm90IGV4Y2VlZCA4
IGNoYXJhY3RlcnMpCj4gPiAKPiA+IFRoaXMgaGFzIGFscmVhZHkgYmVlbiBmaXhlZCB1cHN0cmVh
bSBieSBjb21taXQKPiA+IDhjM2Y1N2VhMTIxN2VhMGM4MGE3Mjg5OGJjMzViYWEwZTE0YWYwZTA6
ICJzc2R0OiBGaXggYnVpbGRpbmcgb2YKPiA+IGxlZ2FjeSBhY3BpIHRhYmxlcyBvbiBjdXJyZW50
IGlhc2wgY29tcGlsZXIiLgo+ID4gCj4gPiBXb3VsZCBpdCBiZSBwb3NzaWJsZSB0byBwaWNrIHRo
aXMgY29tbWl0IGludG8gb3VyIGJyYW5jaCwgb3IKPiA+IGFsdGVybmF0aXZlbHkgc3dpdGNoIENv
bmZpZy5tayBpbiB1bnN0YWJsZSB0byB1c2UgdGhlIG1hc3RlciBzZWFiaW9zCj4gPiBnaXQgYnJh
bmNoIGluc3RlYWQgb2YgcmVsLTEuMTEuMT8KPiAKPiBJIGNhbiBzd2l0Y2ggQ29uZmlnLm1rIHRv
IHRyYWNrIDEuMTEtc3RhYmxlIGZvciBub3cgYW5kIGRlY2lkZSB3aGF0IHRvCj4gZG8gbGF0ZXIg
d2hlbiBYZW4gaXMgZHVlIHRvIHJlbGVhc2UgLS0gaXQgY291bGQgYmUgdGhlIGNhc2UgdGhhdAo+
IHVwc3RyZWFtIHdpbGwgaGF2ZSByZWxlYXNlZCBhIG5ldyB2ZXJzaW9uIG9mIHNlYWJpb3MgYnkg
dGhlbi4KCk9oLCAxLjExLXN0YWJsZSBkb2Vzbid0IGNvbnRhaW4gdGhlIGZpeC4gTGV0IG1lIHRo
aW5rIHdoYXQgdG8gZG8gbmV4dC4KCldlaS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
