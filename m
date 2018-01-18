From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v10 00/11] Enable Memory Bandwidth
	Allocation in Xen
Date: Thu, 18 Jan 2018 11:10:50 +0000
Message-ID: <20180118111050.ihscgkgz6qd2v3hj@citrix.com>
References: <1513644142-50972-1-git-send-email-yi.y.sun@linux.intel.com>
 <5A3A37540200007800198C59@prv-mh.provo.novell.com>
 <20180108042858.GA31347@yi.y.sun>
 <20180108122502.pqm4yljz5zd7m4cp@citrix.com>
 <20180109003152.GB31347@yi.y.sun>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=w6dq=en=citrix.com=prvs=5494ca295=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1ec85t-0007hf-T3
 for xen-devel@lists.xenproject.org; Thu, 18 Jan 2018 11:10:53 +0000
Content-Disposition: inline
In-Reply-To: <20180109003152.GB31347@yi.y.sun>
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

T24gVHVlLCBKYW4gMDksIDIwMTggYXQgMDg6MzE6NTJBTSArMDgwMCwgWWkgU3VuIHdyb3RlOgo+
IE9uIDE4LTAxLTA4IDEyOjI1OjAyLCBXZWkgTGl1IHdyb3RlOgo+ID4gT24gTW9uLCBKYW4gMDgs
IDIwMTggYXQgMTI6Mjg6NThQTSArMDgwMCwgWWkgU3VuIHdyb3RlOgo+ID4gPiBPbiAxNy0xMi0y
MCAwMjoxMTozMiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gPiA+ID4gPj4+IE9uIDE5LjEyLjE3IGF0
IDAxOjQyLCA8eWkueS5zdW5AbGludXguaW50ZWwuY29tPiB3cm90ZToKPiA+ID4gPiA+IFdlIHBs
YW4gdG8gYnJpbmcgYSBuZXcgUFNSIChQbGF0Zm9ybSBTaGFyZWQgUmVzb3VyY2UpIGZlYXR1cmUg
Y2FsbGVkCj4gPiA+ID4gPiBJbnRlbCBNZW1vcnkgQmFuZHdpZHRoIEFsbG9jYXRpb24gKE1CQSkg
dG8gWGVuLgo+ID4gPiA+ID4gCj4gPiA+ID4gPiBCZXNpZGVzIHRoZSBNQkEgZW5hYmxpbmcsIHdl
IGNoYW5nZSBzb21lIGludGVyZmFjZXMgdG8gbWFrZSB0aGVtIG1vcmUKPiA+ID4gPiA+IGdlbmVy
YWwgYnV0IG5vdCBvbmx5IGZvciBDQVQuCj4gPiA+ID4gPiAKPiA+ID4gPiA+IFRoZSBmaXJzdCA1
IHBhdGNoZXMgb2YgVjkgaGF2ZW4gYmVlbiBtZXJnZWQuIFRvIGZpeCBhIGZldyBpc3N1ZXMsIHRo
ZQo+ID4gPiA+ID4gVjEwIGlzIHN1Ym1pdHRlZC4KPiA+ID4gPiAKPiA+ID4gPiBJJ3ZlIGNvbW1p
dHRlZCB0aGUgdGhyZWUgaHlwZXJ2aXNvciBwYXRjaGVzOyBJJ3ZlIG5vdCBkb25lIGFueXRoaW5n
Cj4gPiA+ID4gd2l0aCB0aGUgZWlnaHQgdG9vbHMgb25lcywgYXMgb25lIG9mIHRoZW0gbmVlZHMg
dG8gYmUgKHJlLSlhY2tlZC4gSSdsbAo+ID4gPiA+IGxlYXZlIHRoYXQgcGFydCB0byBvbmUgb2Yg
eW91Lgo+ID4gPiA+IAo+ID4gPiA+IEphbgo+ID4gPiAKPiA+ID4gSGksIElhbiBhbmQgV2VpLAo+
ID4gPiAKPiA+ID4gQ291bGQgeW91IHBsZWFzZSBoZWxwIHRvIGNoZWNrIHRvb2xzLyBwYXRjaGVz
PyBUaGFua3MhCj4gPiA+IAo+ID4gCj4gPiBJIGp1c3QgYWNrZWQgdGhlIG9uZSBwYXRjaCB0aGF0
IG1pc3NlZCBhbiBhY2suIEkgd2lsbCB0cnkgdG8gZ2V0IGFyb3VuZAo+ID4gdG8gY29tbWl0IHRo
ZW0gbGF0ZXIgdGhpcyB3ZWVrLgo+ID4gCj4gVGhhbmsgeW91ISA6KQoKSGkgWWkKCkkgdHJpZWQg
dG8gYXBwbHkgcGF0Y2ggNCB0byAxMSB0b2RheSBidXQgdGhlcmUgd2VyZSBjb25mbGljdHMuIENh
biB5b3UKcmViYXNlIHlvdXIgc2VyaWVzIG9uIHRvcCBvZiBzdGFnaW5nPwoKU29ycnkgZm9yIHRo
ZSBpbmNvbnZlbmllbmNlLiBXZSd2ZSBtb3N0bHkgYmVlbiBkZWFsaW5nIHdpdGggc2VjdXJpdHkK
aXNzdWVzIGFuZCB0aGUgdHJlZSBzZWVtZWQgdG8gaGF2ZSBjaGFuZ2VkIGEgYml0IHdpdGggYWxs
IHRoZSByZWNlbnQKZml4ZXMgYXBwbGllZC4KCldlaS4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
