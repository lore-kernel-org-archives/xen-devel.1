From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 2/2] xen: make opt_xen_console true before
 console initialisation
Date: Fri, 28 Sep 2018 17:55:29 +0100
Message-ID: <20180928165529.wtzbo5psdejq2ssz@zion.uk.xensource.com>
References: <20180928082437.15140-1-wei.liu2@citrix.com>
 <20180928082437.15140-3-wei.liu2@citrix.com>
 <5BAE43F202000078001ECF13@prv1-mh.provo.novell.com>
 <20180928151207.kinkppv7klym6zoe@zion.uk.xensource.com>
 <5BAE469C02000078001ECF54@prv1-mh.provo.novell.com>
 <20180928152324.w4rozilb7iajr6qn@zion.uk.xensource.com>
 <20180928155327.ecbrkbcny7luwqxg@zion.uk.xensource.com>
 <5BAE514102000078001ECFF0@prv1-mh.provo.novell.com>
 <20180928161950.rjxa4t4g5agy7lad@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=rttn=mk=citrix.com=prvs=802525662=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1g5w3C-0001Da-SB
 for xen-devel@lists.xenproject.org; Fri, 28 Sep 2018 16:55:34 +0000
Content-Disposition: inline
In-Reply-To: <20180928161950.rjxa4t4g5agy7lad@zion.uk.xensource.com>
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

T24gRnJpLCBTZXAgMjgsIDIwMTggYXQgMDU6MTk6NTBQTSArMDEwMCwgV2VpIExpdSB3cm90ZToK
PiBPbiBGcmksIFNlcCAyOCwgMjAxOCBhdCAxMDowNToyMUFNIC0wNjAwLCBKYW4gQmV1bGljaCB3
cm90ZToKPiA+ID4+PiBPbiAyOC4wOS4xOCBhdCAxNzo1MywgPHdlaS5saXUyQGNpdHJpeC5jb20+
IHdyb3RlOgo+ID4gPiBBdCB0aGUgbW9tZW50IHRoZSBvcmRlcmluZyBvZiB0aGUgb3B0aW9ucyBt
YXR0ZXIsIHdoaWNoIG1lYW5zIGlmICJ4ZW4iCj4gPiA+IGlzIG5vdCB0aGUgZmlyc3Qgb3B0aW9u
IHdlIGNhbiBsb3NlIG91dHB1dC4KPiA+ID4gCj4gPiA+IEkgdGhpbmsgb25lIGVhc3kgd2F5IG9m
IGltcHJvdmluZyBpcyB0byBwYXJzZSBvcHRfY29uc29sZSB0d2ljZS4gVGhlCj4gPiA+IGZpcnN0
IHRpbWUgc29sZWx5IGxvb2tzIGZvciAieGVuIiBhbmQgdGhlIHNlY29uZCB0aW1lIHBhcnNlcyB0
aGUgcmVzdAo+ID4gPiBvcHRpb25zLgo+ID4gCj4gPiBXaGF0J3Mgd3Jvbmcgd2l0aCBtYWtpbmcg
dGhlIHZhcmlhYmxlIGEgdHJpc3RhdGUsIGFuZCBtb3ZlIHlvdXIKPiA+IHNldC10by1mYWxzZSBh
ZnRlciB0aGUgcGFyc2luZyBsb29wPyBJZiB0aGUgdXNlciBzYWlkICJmYWxzZSIgZm9yIHRoZQo+
ID4gb3B0aW9uLCB0aGVuIHRoZXkgYXBwYXJlbnRseSBkb24ndCBjYXJlIG11Y2ggYWJvdXQgdGhl
IG91dHB1dC4KPiAKPiBPaCwgdGhlcmUgaXMgbm90aGluZyB3cm9uZyB3aXRoIHRoYXQuIEl0IGp1
c3QgSSBkaWRuJ3QgdGhpbmsgYWJvdXQgdGhhdAo+IHNvbHV0aW9uIHdoaWxlIHRoaW5raW5nIGFi
b3V0IHRoaXMgcHJvYmxlbS4KPiAKPiA+IAo+ID4gQnV0IHllcywgd2hhdCB5b3Ugc3VnZ2VzdCBp
cyBhbiBvcHRpb24gYXMgd2VsbC4KPiAKPiBZZWFoLCBJIGFscmVhZHkgZ290IGNvZGUgZm9yIGl0
LgoKQWZ0ZXIgZml4aW5nIHRoZSBidWdzIGluIG15IGNvZGUgaXQgaGFzIGJlY29tZSB0b28gbG9u
ZyBmb3IgbXkgbGlraW5nIHNvCkkgd2lsbCB0dXJuIHRvIHVzZSB0cmlzdGF0ZSBpbnN0ZWFkLiA6
cAoKV2VpLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
