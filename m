From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v4 5/6] xen/x86: add PHYSDEVOP_msi_set_enable
Date: Mon, 4 Mar 2019 11:19:14 +0100
Message-ID: <20190304101914.5c4t52232l4oajix@Air-de-Roger>
References: <cover.0268d8ad929f422d7e0142099f5b84dd205f0c2e.1549498018.git-series.marmarek@invisiblethingslab.com>
 <cover.0268d8ad929f422d7e0142099f5b84dd205f0c2e.1549498018.git-series.marmarek@invisiblethingslab.com>
 <cc240476d615c05925891d33fc83be3e1801b52d.1549498018.git-series.marmarek@invisiblethingslab.com>
 <5C767771020000780021AB12@prv1-mh.provo.novell.com>
 <20190227150508.GE19265@mail-itl>
 <5C77BEDD020000780021B030@prv1-mh.provo.novell.com>
 <20190228122546.GN5348@mail-itl> <20190303011024.GP19265@mail-itl>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5fvK=RH=citrix.com=prvs=959464fda=roger.pau@srs-us1.protection.inumbo.net>)
 id 1h0kgx-0005p2-5o
 for xen-devel@lists.xenproject.org; Mon, 04 Mar 2019 10:19:27 +0000
Content-Disposition: inline
In-Reply-To: <20190303011024.GP19265@mail-itl>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Marek Marczykowski <marmarek@invisiblethingslab.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Daniel de Graaf <dgdegra@tycho.nsa.gov>
List-Id: xen-devel@lists.xenproject.org

T24gU3VuLCBNYXIgMDMsIDIwMTkgYXQgMDI6MTA6MjRBTSArMDEwMCwgTWFyZWsgTWFyY3p5a293
c2tpIHdyb3RlOgo+IE9uIFRodSwgRmViIDI4LCAyMDE5IGF0IDAxOjI1OjUwUE0gKzAxMDAsIE1h
cmVrIE1hcmN6eWtvd3NraSB3cm90ZToKPiA+IE9uIFRodSwgRmViIDI4LCAyMDE5IGF0IDAzOjU4
OjM3QU0gLTA3MDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+ID4gPiBBbm90aGVyIHRoaW5nOiBZb3Un
cmUgYWxzbyBieXBhc3NpbmcgdGhlIE1TSXssLVh9LWFscmVhZHktZW5hYmxlZAo+ID4gPiBjaGVj
a3MgdGhhdCBfX3BjaV9lbmFibGVfbXNpeyx4fSgpIGRvLCB5ZXQgYWxsb3dpbmcgdG8gZW5hYmxl
IGJvdGgKPiA+ID4gb24gYSBkZXZpY2Ugd291bGQgYmUgYSBzZWN1cml0eSBpc3N1ZS4KPiA+IAo+
ID4gT2suCj4gCj4gSG1tLCBjb3VsZCB5b3UgZXhwbGFpbiBtb3JlPyBJcyB0aGF0IG9ubHkgdGhl
IGNhc2Ugd2hlbiBpbnRlcnJ1cHQKPiByZW1hcHBpbmcgaXMgbWlzc2luZz8KCkkgdGhpbmsgd2hh
dCBKYW4gbWVudGlvbnMgaXMgdGhhdCB0aGUgaHlwZXJjYWxsIHRvIGVuYWJsZSBNU0koLVgpCnNo
b3VsZCBtYWtlIHN1cmUgUENJIElOVHggaXMgZGlzYWJsZWQsIGFuZCBwcmV2ZW50IGVuYWJsaW5n
IGJvdGggTVNJCmFuZCBNU0ktWCBvbiB0aGUgc2FtZSBkZXZpY2UuCgpUaGUgZGV2aWNlIG1vZGVs
IHRoYXQgbWFuYWdlcyB0aGUgcGFzc3Rocm91Z2ggZGV2aWNlIHNob3VsZCBhbHJlYWR5Cm1ha2Ug
c3VyZSBvZiB0aGF0LCBidXQgWGVuIHNob3VsZCBhbHNvIHByb3RlY3QgaXRzZWxmIGFnYWluc3QK
YmFkLWJlaGF2ZWQgZGV2aWNlIG1vZGVscyB3aGVuIHBvc3NpYmxlLgoKVGhhbmtzLCBSb2dlci4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
