From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v10 00/11] Enable Memory Bandwidth
	Allocation in Xen
Date: Mon, 8 Jan 2018 12:25:02 +0000
Message-ID: <20180108122502.pqm4yljz5zd7m4cp@citrix.com>
References: <1513644142-50972-1-git-send-email-yi.y.sun@linux.intel.com>
 <5A3A37540200007800198C59@prv-mh.provo.novell.com>
 <20180108042858.GA31347@yi.y.sun>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=9h6o=ed=citrix.com=prvs=53941dece=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1eYWUG-0004b1-2b
 for xen-devel@lists.xenproject.org; Mon, 08 Jan 2018 12:25:08 +0000
Content-Disposition: inline
In-Reply-To: <20180108042858.GA31347@yi.y.sun>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Yi Sun <yi.y.sun@linux.intel.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>, xen-devel@lists.xenproject.org, Chao Peng <chao.p.peng@linux.intel.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>, Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBKYW4gMDgsIDIwMTggYXQgMTI6Mjg6NThQTSArMDgwMCwgWWkgU3VuIHdyb3RlOgo+
IE9uIDE3LTEyLTIwIDAyOjExOjMyLCBKYW4gQmV1bGljaCB3cm90ZToKPiA+ID4+PiBPbiAxOS4x
Mi4xNyBhdCAwMTo0MiwgPHlpLnkuc3VuQGxpbnV4LmludGVsLmNvbT4gd3JvdGU6Cj4gPiA+IFdl
IHBsYW4gdG8gYnJpbmcgYSBuZXcgUFNSIChQbGF0Zm9ybSBTaGFyZWQgUmVzb3VyY2UpIGZlYXR1
cmUgY2FsbGVkCj4gPiA+IEludGVsIE1lbW9yeSBCYW5kd2lkdGggQWxsb2NhdGlvbiAoTUJBKSB0
byBYZW4uCj4gPiA+IAo+ID4gPiBCZXNpZGVzIHRoZSBNQkEgZW5hYmxpbmcsIHdlIGNoYW5nZSBz
b21lIGludGVyZmFjZXMgdG8gbWFrZSB0aGVtIG1vcmUKPiA+ID4gZ2VuZXJhbCBidXQgbm90IG9u
bHkgZm9yIENBVC4KPiA+ID4gCj4gPiA+IFRoZSBmaXJzdCA1IHBhdGNoZXMgb2YgVjkgaGF2ZW4g
YmVlbiBtZXJnZWQuIFRvIGZpeCBhIGZldyBpc3N1ZXMsIHRoZQo+ID4gPiBWMTAgaXMgc3VibWl0
dGVkLgo+ID4gCj4gPiBJJ3ZlIGNvbW1pdHRlZCB0aGUgdGhyZWUgaHlwZXJ2aXNvciBwYXRjaGVz
OyBJJ3ZlIG5vdCBkb25lIGFueXRoaW5nCj4gPiB3aXRoIHRoZSBlaWdodCB0b29scyBvbmVzLCBh
cyBvbmUgb2YgdGhlbSBuZWVkcyB0byBiZSAocmUtKWFja2VkLiBJJ2xsCj4gPiBsZWF2ZSB0aGF0
IHBhcnQgdG8gb25lIG9mIHlvdS4KPiA+IAo+ID4gSmFuCj4gCj4gSGksIElhbiBhbmQgV2VpLAo+
IAo+IENvdWxkIHlvdSBwbGVhc2UgaGVscCB0byBjaGVjayB0b29scy8gcGF0Y2hlcz8gVGhhbmtz
IQo+IAoKSSBqdXN0IGFja2VkIHRoZSBvbmUgcGF0Y2ggdGhhdCBtaXNzZWQgYW4gYWNrLiBJIHdp
bGwgdHJ5IHRvIGdldCBhcm91bmQKdG8gY29tbWl0IHRoZW0gbGF0ZXIgdGhpcyB3ZWVrLgoKV2Vp
LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
