From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH 2/2] xen: events: free irqs in error
	condition
Date: Tue, 27 Feb 2018 08:14:21 +0000
Message-ID: <20180227081421.i2x3vcw6imrreshv__40426.2068485425$1519719202$gmane$org@MacBook-Pro-de-Roger.local>
References: <1519666595-41362-1-git-send-email-aams@amazon.com>
 <1519666595-41362-3-git-send-email-aams@amazon.com>
 <20180226181439.zbdtzbv7wifjst2l@MacBook-Pro-de-Roger.local>
 <1519671423.4965.11.camel@amazon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=wvqs=fv=citrix.com=prvs=589048569=roger.pau@srs-us1.protection.inumbo.net>)
 id 1eqaP0-0002kD-Nx
 for xen-devel@lists.xenproject.org; Tue, 27 Feb 2018 08:14:22 +0000
Content-Disposition: inline
In-Reply-To: <1519671423.4965.11.camel@amazon.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "Shah, Amit" <aams@amazon.de>
Cc: "jgross@suse.com" <jgross@suse.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "anoob.soman@citrix.com" <anoob.soman@citrix.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "stable@vger.kernel.org" <stable@vger.kernel.org>, "shuo.a.liu@intel.com" <shuo.a.liu@intel.com>, "Valentin,
 Eduardo" <eduval@lab126.com>, "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>, "kys@microsoft.com" <kys@microsoft.com>, "tglx@linutronix.de" <tglx@linutronix.de>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBGZWIgMjYsIDIwMTggYXQgMDY6NTc6MDNQTSArMDAwMCwgU2hhaCwgQW1pdCB3cm90
ZToKPiAKPiBPbiBNbywgMjAxOC0wMi0yNiBhdCAxODoxNCArMDAwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiA+IE9uIE1vbiwgRmViIDI2LCAyMDE4IGF0IDA1OjM2OjM1UE0gKzAwMDAsIEFt
aXQgU2hhaCB3cm90ZToKPiA+ID4gCj4gPiA+IEluIGNhc2Ugb2YgZXJyb3JzIGluIGlycSBzZXR1
cCBmb3IgTVNJLCBmcmVlIHVwIHRoZSBhbGxvY2F0ZWQgaXJxcy4KPiA+ID4gCj4gPiA+IEZpeGVz
OiA0ODkyYzliNGFkYTlmOSAoInhlbjogYWRkIHN1cHBvcnQgZm9yIE1TSSBtZXNzYWdlIGdyb3Vw
cyIpCj4gPiA+IFJlcG9ydGVkLWJ5OiBIb29tYW4gTWlyaGFkaSA8bWlyaGFkaWhAYW1hem9uLmNv
bT4KPiA+ID4gQ0M6IDxzdGFibGVAdmdlci5rZXJuZWwub3JnPgo+ID4gPiBDQzogUm9nZXIgUGF1
IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gPiA+IENDOiBEYXZpZCBWcmFiZWwgPGRh
dmlkLnZyYWJlbEBjaXRyaXguY29tPgo+ID4gPiBDQzogQm9yaXMgT3N0cm92c2t5IDxib3Jpcy5v
c3Ryb3Zza3lAb3JhY2xlLmNvbT4KPiA+ID4gQ0M6IEVkdWFyZG8gVmFsZW50aW4gPGVkdXZhbEBh
bWF6b24uY29tPgo+ID4gPiBDQzogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgo+ID4g
PiBDQzogVGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGxpbnV0cm9uaXguZGU+Cj4gPiA+IENDOiAiSy4g
WS4gU3Jpbml2YXNhbiIgPGt5c0BtaWNyb3NvZnQuY29tPgo+ID4gPiBDQzogTGl1IFNodW8gPHNo
dW8uYS5saXVAaW50ZWwuY29tPgo+ID4gPiBDQzogQW5vb2IgU29tYW4gPGFub29iLnNvbWFuQGNp
dHJpeC5jb20+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IEFtaXQgU2hhaCA8YWFtc0BhbWF6b24uY29t
Pgo+ID4gPiAtLS0KPiA+ID4gwqBkcml2ZXJzL3hlbi9ldmVudHMvZXZlbnRzX2Jhc2UuYyB8IDEg
Kwo+ID4gPiDCoDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+ID4gPiAKPiA+ID4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMveGVuL2V2ZW50cy9ldmVudHNfYmFzZS5jCj4gPiA+IGIvZHJpdmVy
cy94ZW4vZXZlbnRzL2V2ZW50c19iYXNlLmMKPiA+ID4gaW5kZXggYjZiOGIyOS4uOTZhYTU3NSAx
MDA2NDQKPiA+ID4gLS0tIGEvZHJpdmVycy94ZW4vZXZlbnRzL2V2ZW50c19iYXNlLmMKPiA+ID4g
KysrIGIvZHJpdmVycy94ZW4vZXZlbnRzL2V2ZW50c19iYXNlLmMKPiA+ID4gQEAgLTc1OCw2ICs3
NTgsNyBAQCBpbnQgeGVuX2JpbmRfcGlycV9tc2lfdG9faXJxKHN0cnVjdCBwY2lfZGV2Cj4gPiA+
ICpkZXYsIHN0cnVjdCBtc2lfZGVzYyAqbXNpZGVzYywKPiA+ID4gwqBlcnJvcl9pcnE6Cj4gPiA+
IMKgCWZvciAoOyBpID49IDA7IGktLSkKPiA+ID4gwqAJCV9fdW5iaW5kX2Zyb21faXJxKGlycSAr
IGkpOwo+ID4gPiArCXhlbl9mcmVlX2lycShpcnEpOwo+ID4gSG0sIHhlbl9mcmVlX2lycSBjYWxs
cyBpcnFfZnJlZV9kZXNjLCB3aGljaCBpcyBpcnFfZnJlZV9kZXNjcyhpcnEsCj4gPiAxKSwKPiAK
PiBFci4uLiDCoHJpZ2h0Lgo+IAo+ID4gSSB0aGluayB5b3Ugd2lsbCBoYXZlIHRvIGludHJvZHVj
ZSBhIG5ldyBmcmVlIGZ1bmN0aW9uOgo+ID4gCj4gPiB4ZW5fZnJlZV9pcnFzKHVuc2lnbmVkIGly
cSwgdW5zaWduZWQgaW50IG5yKQo+ID4gCj4gPiBUaGF0IGNhbGxzIGlycV9mcmVlX2Rlc2NzKGly
cSwgbnIpCj4gCj4gQWN0dWFsbHksIHhlbl9mcmVlX2lycSgpIGlzIGFscmVhZHkgZG9uZSBpbiBf
X3VuYmluZF9mcm9tX2lycSgpLCBzbwo+IHRoaXMgcGF0Y2ggaXMgYWN0dWFsbHkgd3JvbmcgYW5k
IG5vdCBuZWVkZWQuCgpZb3Ugc3RpbGwgbmVlZCB0byBmcmVlIHVuYm91bmQgSVJRcywgQUZBSUNU
IHlvdSBjb3VsZCBmaXggdGhlIGlzc3VlCndpdGggYSBzaW5nbGUgcGF0Y2gsIGxpa2U6Cgp3aGls
ZSAobnZlYy0tKSB7CglpZiAobnZlYyA+PSBpKQoJCXhlbl9mcmVlX2lycShpcnEgKyBpKTsKCWVs
c2UKCQlfX3VuYmluZF9mcm9tX2lycShpcnEgKyBpKTsKfQoKUm9nZXIuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
