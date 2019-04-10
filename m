From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v3 2/3] xen: remove tmem from hypervisor
Date: Wed, 10 Apr 2019 13:27:17 +0100
Message-ID: <20190410122717.GB30543@zion.uk.xensource.com>
References: <20190409165210.7624-1-wei.liu2@citrix.com>
 <20190409165210.7624-3-wei.liu2@citrix.com>
 <5CADCBB60200007800226206@prv1-mh.provo.novell.com>
 <20190410115757.GY30543@zion.uk.xensource.com>
 <5CADDDB3020000780022634F@prv1-mh.provo.novell.com>
 <20190410122135.GA30543@zion.uk.xensource.com>
 <5CADE0BA020000780022639C@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=T/zj=SM=citrix.com=prvs=9969b238a=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hECK1-0003fD-8O
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 12:27:21 +0000
Content-Disposition: inline
In-Reply-To: <5CADE0BA020000780022639C@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, Daniel de Graaf <dgdegra@tycho.nsa.gov>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBBcHIgMTAsIDIwMTkgYXQgMDY6MjU6MzBBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDEwLjA0LjE5IGF0IDE0OjIxLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gPiBPbiBXZWQsIEFwciAxMCwgMjAxOSBhdCAwNjoxMjozNUFNIC0wNjAwLCBKYW4gQmV1
bGljaCB3cm90ZToKPiA+PiA+Pj4gT24gMTAuMDQuMTkgYXQgMTM6NTcsIDx3ZWkubGl1MkBjaXRy
aXguY29tPiB3cm90ZToKPiA+PiA+IE9uIFdlZCwgQXByIDEwLCAyMDE5IGF0IDA0OjU1OjUwQU0g
LTA2MDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+ID4+ID4+ID4+PiBPbiAwOS4wNC4xOSBhdCAxODo1
MiwgPHdlaS5saXUyQGNpdHJpeC5jb20+IHdyb3RlOgo+ID4+ID4+ID4gLS0tIGEveGVuL2NvbW1v
bi9NYWtlZmlsZQo+ID4+ID4+ID4gKysrIGIveGVuL2NvbW1vbi9NYWtlZmlsZQo+ID4+ID4+IAo+
ID4+ID4+IFRoZXJlJ3MgYXJlIGh1bmtzIG1pc3NpbmcgaGVyZSB0byByZW1vdmUKPiA+PiA+PiAK
PiA+PiA+PiBvYmotJChDT05GSUdfVE1FTSkgKz0gbHpvLm8KPiA+PiA+PiAKPiA+PiA+PiBhbmQg
dG8gcmVwbGFjZQo+ID4+ID4+IAo+ID4+ID4+IGx6by15IDo9IGx6bwo+ID4+ID4+IGx6by0kKENP
TkZJR19UTUVNKSA6PQo+ID4+ID4+IAo+ID4+ID4+IChhbmQgaXRzIHVzZSkuCj4gPj4gPiAKPiA+
PiA+IEkgZ3Vlc3Mgd2UgY2FuIGRyb3AgbHpvIGluIGl0cyBlbnRpcmV0eSBub3c/Cj4gPj4gCj4g
Pj4gWW91IGNhbiBkcm9wIGx6by15LCBidXQgbm90IHRoZSBidWlsZGluZyBvZiBsem8uaW5pdC5v
LCBhcyBpdCBtYXkgYmUKPiA+PiBuZWVkZWQgZm9yIGRlY29tcHJlc3NpbmcgdGhlIERvbTAga2Vy
bmVsLgo+ID4gCj4gPiBQbGVhc2UgY2hlY2sgdGhpcyBmaXh1cCBwYXRjaAo+IAo+IExHVE0gLSBJ
IG5vdGljZSB5b3UncmUgZXZlbiBjbGVhbmluZyB1cCBsem8uYyBub3cuIE15IEEtYiBmb3IgdGhl
Cj4gd2hvbGUgcGF0Y2ggc3RhbmRzLgoKVGhhbmsgeW91LgoKV2VpLgoKPiAKPiBKYW4KPiAKPiAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
