From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v10 00/11] Enable Memory Bandwidth
	Allocation in Xen
Date: Thu, 18 Jan 2018 11:31:51 +0000
Message-ID: <20180118113151.sdcxo4rpcg7ug5up@citrix.com>
References: <1513644142-50972-1-git-send-email-yi.y.sun@linux.intel.com>
 <5A3A37540200007800198C59@prv-mh.provo.novell.com>
 <20180108042858.GA31347@yi.y.sun>
 <20180108122502.pqm4yljz5zd7m4cp@citrix.com>
 <20180109003152.GB31347@yi.y.sun>
 <20180118111050.ihscgkgz6qd2v3hj@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=w6dq=en=citrix.com=prvs=5494ca295=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1ec8QJ-0002AQ-Kx
 for xen-devel@lists.xenproject.org; Thu, 18 Jan 2018 11:31:59 +0000
Content-Disposition: inline
In-Reply-To: <20180118111050.ihscgkgz6qd2v3hj@citrix.com>
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

T24gVGh1LCBKYW4gMTgsIDIwMTggYXQgMTE6MTA6NTBBTSArMDAwMCwgV2VpIExpdSB3cm90ZToK
PiBPbiBUdWUsIEphbiAwOSwgMjAxOCBhdCAwODozMTo1MkFNICswODAwLCBZaSBTdW4gd3JvdGU6
Cj4gPiBPbiAxOC0wMS0wOCAxMjoyNTowMiwgV2VpIExpdSB3cm90ZToKPiA+ID4gT24gTW9uLCBK
YW4gMDgsIDIwMTggYXQgMTI6Mjg6NThQTSArMDgwMCwgWWkgU3VuIHdyb3RlOgo+ID4gPiA+IE9u
IDE3LTEyLTIwIDAyOjExOjMyLCBKYW4gQmV1bGljaCB3cm90ZToKPiA+ID4gPiA+ID4+PiBPbiAx
OS4xMi4xNyBhdCAwMTo0MiwgPHlpLnkuc3VuQGxpbnV4LmludGVsLmNvbT4gd3JvdGU6Cj4gPiA+
ID4gPiA+IFdlIHBsYW4gdG8gYnJpbmcgYSBuZXcgUFNSIChQbGF0Zm9ybSBTaGFyZWQgUmVzb3Vy
Y2UpIGZlYXR1cmUgY2FsbGVkCj4gPiA+ID4gPiA+IEludGVsIE1lbW9yeSBCYW5kd2lkdGggQWxs
b2NhdGlvbiAoTUJBKSB0byBYZW4uCj4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiBCZXNpZGVzIHRo
ZSBNQkEgZW5hYmxpbmcsIHdlIGNoYW5nZSBzb21lIGludGVyZmFjZXMgdG8gbWFrZSB0aGVtIG1v
cmUKPiA+ID4gPiA+ID4gZ2VuZXJhbCBidXQgbm90IG9ubHkgZm9yIENBVC4KPiA+ID4gPiA+ID4g
Cj4gPiA+ID4gPiA+IFRoZSBmaXJzdCA1IHBhdGNoZXMgb2YgVjkgaGF2ZW4gYmVlbiBtZXJnZWQu
IFRvIGZpeCBhIGZldyBpc3N1ZXMsIHRoZQo+ID4gPiA+ID4gPiBWMTAgaXMgc3VibWl0dGVkLgo+
ID4gPiA+ID4gCj4gPiA+ID4gPiBJJ3ZlIGNvbW1pdHRlZCB0aGUgdGhyZWUgaHlwZXJ2aXNvciBw
YXRjaGVzOyBJJ3ZlIG5vdCBkb25lIGFueXRoaW5nCj4gPiA+ID4gPiB3aXRoIHRoZSBlaWdodCB0
b29scyBvbmVzLCBhcyBvbmUgb2YgdGhlbSBuZWVkcyB0byBiZSAocmUtKWFja2VkLiBJJ2xsCj4g
PiA+ID4gPiBsZWF2ZSB0aGF0IHBhcnQgdG8gb25lIG9mIHlvdS4KPiA+ID4gPiA+IAo+ID4gPiA+
ID4gSmFuCj4gPiA+ID4gCj4gPiA+ID4gSGksIElhbiBhbmQgV2VpLAo+ID4gPiA+IAo+ID4gPiA+
IENvdWxkIHlvdSBwbGVhc2UgaGVscCB0byBjaGVjayB0b29scy8gcGF0Y2hlcz8gVGhhbmtzIQo+
ID4gPiA+IAo+ID4gPiAKPiA+ID4gSSBqdXN0IGFja2VkIHRoZSBvbmUgcGF0Y2ggdGhhdCBtaXNz
ZWQgYW4gYWNrLiBJIHdpbGwgdHJ5IHRvIGdldCBhcm91bmQKPiA+ID4gdG8gY29tbWl0IHRoZW0g
bGF0ZXIgdGhpcyB3ZWVrLgo+ID4gPiAKPiA+IFRoYW5rIHlvdSEgOikKPiAKPiBIaSBZaQo+IAo+
IEkgdHJpZWQgdG8gYXBwbHkgcGF0Y2ggNCB0byAxMSB0b2RheSBidXQgdGhlcmUgd2VyZSBjb25m
bGljdHMuIENhbiB5b3UKPiByZWJhc2UgeW91ciBzZXJpZXMgb24gdG9wIG9mIHN0YWdpbmc/Cj4g
Cj4gU29ycnkgZm9yIHRoZSBpbmNvbnZlbmllbmNlLiBXZSd2ZSBtb3N0bHkgYmVlbiBkZWFsaW5n
IHdpdGggc2VjdXJpdHkKPiBpc3N1ZXMgYW5kIHRoZSB0cmVlIHNlZW1lZCB0byBoYXZlIGNoYW5n
ZWQgYSBiaXQgd2l0aCBhbGwgdGhlIHJlY2VudAo+IGZpeGVzIGFwcGxpZWQuCj4gCgpBY3R1YWxs
eSwgYmVmb3JlIHlvdSBzZXQgb2ZmIHRvIGRvIGFueXRoaW5nLCBsZXQgbWUgdHJ5IGFnYWluLiBU
aGVyZQpjb3VsZCBhIHByb2JsZW0gd2l0aCBteSBlbWFpbCBjbGllbnQuIEkgd2lsbCBsZXQgeW91
IGtub3cgdGhlIHJlc3VsdC4KCldlaS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
