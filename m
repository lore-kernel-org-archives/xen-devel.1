From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v10 00/11] Enable Memory Bandwidth
	Allocation in Xen
Date: Thu, 18 Jan 2018 11:50:03 +0000
Message-ID: <20180118115003.646vmsbqv7vgpne2@citrix.com>
References: <1513644142-50972-1-git-send-email-yi.y.sun@linux.intel.com>
 <5A3A37540200007800198C59@prv-mh.provo.novell.com>
 <20180108042858.GA31347@yi.y.sun>
 <20180108122502.pqm4yljz5zd7m4cp@citrix.com>
 <20180109003152.GB31347@yi.y.sun>
 <20180118111050.ihscgkgz6qd2v3hj@citrix.com>
 <20180118113151.sdcxo4rpcg7ug5up@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=w6dq=en=citrix.com=prvs=5494ca295=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1ec8hr-0003qv-Td
 for xen-devel@lists.xenproject.org; Thu, 18 Jan 2018 11:50:07 +0000
Content-Disposition: inline
In-Reply-To: <20180118113151.sdcxo4rpcg7ug5up@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Yi Sun <yi.y.sun@linux.intel.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>, xen-devel@lists.xenproject.org, Chao Peng <chao.p.peng@linux.intel.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>, Roger Pau =?utf-8?B?TW9ubu+/vQ==?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBKYW4gMTgsIDIwMTggYXQgMTE6MzE6NTFBTSArMDAwMCwgV2VpIExpdSB3cm90ZToK
PiBPbiBUaHUsIEphbiAxOCwgMjAxOCBhdCAxMToxMDo1MEFNICswMDAwLCBXZWkgTGl1IHdyb3Rl
Ogo+ID4gT24gVHVlLCBKYW4gMDksIDIwMTggYXQgMDg6MzE6NTJBTSArMDgwMCwgWWkgU3VuIHdy
b3RlOgo+ID4gPiBPbiAxOC0wMS0wOCAxMjoyNTowMiwgV2VpIExpdSB3cm90ZToKPiA+ID4gPiBP
biBNb24sIEphbiAwOCwgMjAxOCBhdCAxMjoyODo1OFBNICswODAwLCBZaSBTdW4gd3JvdGU6Cj4g
PiA+ID4gPiBPbiAxNy0xMi0yMCAwMjoxMTozMiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gPiA+ID4g
PiA+ID4+PiBPbiAxOS4xMi4xNyBhdCAwMTo0MiwgPHlpLnkuc3VuQGxpbnV4LmludGVsLmNvbT4g
d3JvdGU6Cj4gPiA+ID4gPiA+ID4gV2UgcGxhbiB0byBicmluZyBhIG5ldyBQU1IgKFBsYXRmb3Jt
IFNoYXJlZCBSZXNvdXJjZSkgZmVhdHVyZSBjYWxsZWQKPiA+ID4gPiA+ID4gPiBJbnRlbCBNZW1v
cnkgQmFuZHdpZHRoIEFsbG9jYXRpb24gKE1CQSkgdG8gWGVuLgo+ID4gPiA+ID4gPiA+IAo+ID4g
PiA+ID4gPiA+IEJlc2lkZXMgdGhlIE1CQSBlbmFibGluZywgd2UgY2hhbmdlIHNvbWUgaW50ZXJm
YWNlcyB0byBtYWtlIHRoZW0gbW9yZQo+ID4gPiA+ID4gPiA+IGdlbmVyYWwgYnV0IG5vdCBvbmx5
IGZvciBDQVQuCj4gPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+ID4gVGhlIGZpcnN0IDUgcGF0Y2hl
cyBvZiBWOSBoYXZlbiBiZWVuIG1lcmdlZC4gVG8gZml4IGEgZmV3IGlzc3VlcywgdGhlCj4gPiA+
ID4gPiA+ID4gVjEwIGlzIHN1Ym1pdHRlZC4KPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+IEkndmUg
Y29tbWl0dGVkIHRoZSB0aHJlZSBoeXBlcnZpc29yIHBhdGNoZXM7IEkndmUgbm90IGRvbmUgYW55
dGhpbmcKPiA+ID4gPiA+ID4gd2l0aCB0aGUgZWlnaHQgdG9vbHMgb25lcywgYXMgb25lIG9mIHRo
ZW0gbmVlZHMgdG8gYmUgKHJlLSlhY2tlZC4gSSdsbAo+ID4gPiA+ID4gPiBsZWF2ZSB0aGF0IHBh
cnQgdG8gb25lIG9mIHlvdS4KPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+IEphbgo+ID4gPiA+ID4g
Cj4gPiA+ID4gPiBIaSwgSWFuIGFuZCBXZWksCj4gPiA+ID4gPiAKPiA+ID4gPiA+IENvdWxkIHlv
dSBwbGVhc2UgaGVscCB0byBjaGVjayB0b29scy8gcGF0Y2hlcz8gVGhhbmtzIQo+ID4gPiA+ID4g
Cj4gPiA+ID4gCj4gPiA+ID4gSSBqdXN0IGFja2VkIHRoZSBvbmUgcGF0Y2ggdGhhdCBtaXNzZWQg
YW4gYWNrLiBJIHdpbGwgdHJ5IHRvIGdldCBhcm91bmQKPiA+ID4gPiB0byBjb21taXQgdGhlbSBs
YXRlciB0aGlzIHdlZWsuCj4gPiA+ID4gCj4gPiA+IFRoYW5rIHlvdSEgOikKPiA+IAo+ID4gSGkg
WWkKPiA+IAo+ID4gSSB0cmllZCB0byBhcHBseSBwYXRjaCA0IHRvIDExIHRvZGF5IGJ1dCB0aGVy
ZSB3ZXJlIGNvbmZsaWN0cy4gQ2FuIHlvdQo+ID4gcmViYXNlIHlvdXIgc2VyaWVzIG9uIHRvcCBv
ZiBzdGFnaW5nPwo+ID4gCj4gPiBTb3JyeSBmb3IgdGhlIGluY29udmVuaWVuY2UuIFdlJ3ZlIG1v
c3RseSBiZWVuIGRlYWxpbmcgd2l0aCBzZWN1cml0eQo+ID4gaXNzdWVzIGFuZCB0aGUgdHJlZSBz
ZWVtZWQgdG8gaGF2ZSBjaGFuZ2VkIGEgYml0IHdpdGggYWxsIHRoZSByZWNlbnQKPiA+IGZpeGVz
IGFwcGxpZWQuCj4gPiAKPiAKPiBBY3R1YWxseSwgYmVmb3JlIHlvdSBzZXQgb2ZmIHRvIGRvIGFu
eXRoaW5nLCBsZXQgbWUgdHJ5IGFnYWluLiBUaGVyZQo+IGNvdWxkIGEgcHJvYmxlbSB3aXRoIG15
IGVtYWlsIGNsaWVudC4gSSB3aWxsIGxldCB5b3Uga25vdyB0aGUgcmVzdWx0LgoKQWxyaWdodCwg
aXQgaXMgZG9uZS4gWW91ciBwYXRjaGVzIGFyZSBub3cgaW4gc3RhZ2luZy4gUGxlYXNlIGxldCBt
ZSBrbm93CmlmIHRoZXJlIGlzIGFueSBwcm9ibGVtLgoKV2VpLgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
