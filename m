From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 2/2] xen: make opt_xen_console true before
 console initialisation
Date: Fri, 28 Sep 2018 17:19:50 +0100
Message-ID: <20180928161950.rjxa4t4g5agy7lad@zion.uk.xensource.com>
References: <20180928082437.15140-1-wei.liu2@citrix.com>
 <20180928082437.15140-3-wei.liu2@citrix.com>
 <5BAE43F202000078001ECF13@prv1-mh.provo.novell.com>
 <20180928151207.kinkppv7klym6zoe@zion.uk.xensource.com>
 <5BAE469C02000078001ECF54@prv1-mh.provo.novell.com>
 <20180928152324.w4rozilb7iajr6qn@zion.uk.xensource.com>
 <20180928155327.ecbrkbcny7luwqxg@zion.uk.xensource.com>
 <5BAE514102000078001ECFF0@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=rttn=mk=citrix.com=prvs=802525662=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1g5vUq-0006nO-PJ
 for xen-devel@lists.xenproject.org; Fri, 28 Sep 2018 16:20:04 +0000
Content-Disposition: inline
In-Reply-To: <5BAE514102000078001ECFF0@prv1-mh.provo.novell.com>
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

T24gRnJpLCBTZXAgMjgsIDIwMTggYXQgMTA6MDU6MjFBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDI4LjA5LjE4IGF0IDE3OjUzLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gPiBBdCB0aGUgbW9tZW50IHRoZSBvcmRlcmluZyBvZiB0aGUgb3B0aW9ucyBtYXR0ZXIs
IHdoaWNoIG1lYW5zIGlmICJ4ZW4iCj4gPiBpcyBub3QgdGhlIGZpcnN0IG9wdGlvbiB3ZSBjYW4g
bG9zZSBvdXRwdXQuCj4gPiAKPiA+IEkgdGhpbmsgb25lIGVhc3kgd2F5IG9mIGltcHJvdmluZyBp
cyB0byBwYXJzZSBvcHRfY29uc29sZSB0d2ljZS4gVGhlCj4gPiBmaXJzdCB0aW1lIHNvbGVseSBs
b29rcyBmb3IgInhlbiIgYW5kIHRoZSBzZWNvbmQgdGltZSBwYXJzZXMgdGhlIHJlc3QKPiA+IG9w
dGlvbnMuCj4gCj4gV2hhdCdzIHdyb25nIHdpdGggbWFraW5nIHRoZSB2YXJpYWJsZSBhIHRyaXN0
YXRlLCBhbmQgbW92ZSB5b3VyCj4gc2V0LXRvLWZhbHNlIGFmdGVyIHRoZSBwYXJzaW5nIGxvb3A/
IElmIHRoZSB1c2VyIHNhaWQgImZhbHNlIiBmb3IgdGhlCj4gb3B0aW9uLCB0aGVuIHRoZXkgYXBw
YXJlbnRseSBkb24ndCBjYXJlIG11Y2ggYWJvdXQgdGhlIG91dHB1dC4KCk9oLCB0aGVyZSBpcyBu
b3RoaW5nIHdyb25nIHdpdGggdGhhdC4gSXQganVzdCBJIGRpZG4ndCB0aGluayBhYm91dCB0aGF0
CnNvbHV0aW9uIHdoaWxlIHRoaW5raW5nIGFib3V0IHRoaXMgcHJvYmxlbS4KCj4gCj4gQnV0IHll
cywgd2hhdCB5b3Ugc3VnZ2VzdCBpcyBhbiBvcHRpb24gYXMgd2VsbC4KClllYWgsIEkgYWxyZWFk
eSBnb3QgY29kZSBmb3IgaXQuCgpXZWkuCgo+IAo+IEphbgo+IAo+IAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
