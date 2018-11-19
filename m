From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v4 3/5] vpci/msix: carve p2m hole for MSIX
 MMIO regions
Date: Mon, 19 Nov 2018 07:56:18 -0700
Message-ID: <5BF2CF1202000078001FD86C@prv1-mh.provo.novell.com>
References: <20181114115740.1050-1-roger.pau@citrix.com>
 <20181114115740.1050-4-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=NNqu=N6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gOkzR-0004xw-Qp
 for xen-devel@lists.xenproject.org; Mon, 19 Nov 2018 14:57:29 +0000
In-Reply-To: <20181114115740.1050-4-roger.pau@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE0LjExLjE4IGF0IDEyOjU3LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE1ha2Ugc3VyZSB0aGUgTVNJWCBNTUlPIHJlZ2lvbnMgZG9uJ3QgaGF2ZSBwMm0gZW50cmllcyBz
ZXR1cCwgc28gdGhhdAo+IGFjY2Vzc2VzIHRvIHRoZW0gdHJhcCBpbnRvIHRoZSBoeXBlcnZpc29y
IGFuZCBjYW4gYmUgaGFuZGxlZCBieSB2cGNpLgo+IAo+IENvbW1pdCAwNDI2Nzg3NjIgKCJ4ODYv
aW9tbXU6IGFkZCBtYXAtcmVzZXJ2ZWQgZG9tMC1pb21tdSBvcHRpb24gdG8KPiBtYXAgcmVzZXJ2
ZWQgbWVtb3J5IHJhbmdlcyIpIGFkZGVkIG1hcHBpbmdzIGZvciBhbGwgdGhlIHJlc2VydmVkCj4g
cmVnaW9ucyBpbnRvIHRoZSBQVkggRG9tMCBwMm0sIGFuZCBzb21lIG9mIHRob3NlIHJlc2VydmVk
IHJlZ2lvbnMKPiBtaWdodCBjb250YWluIE1TSVggTU1JTyByZWdpb25zLCBoZW5jZSB0aGUgbmVl
ZCB0byBtYWtlIHN1cmUgdGhlcmUgYXJlCj4gbm8gbWFwcGluZ3MgZXN0YWJsaXNoZWQuCj4gCj4g
U2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+CgpS
ZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpkZXNwaXRlIC4uLgoK
PiAtLS0gYS94ZW4vZHJpdmVycy92cGNpL2hlYWRlci5jCj4gKysrIGIveGVuL2RyaXZlcnMvdnBj
aS9oZWFkZXIuYwo+IEBAIC04OSw2ICs4OSwxNyBAQCBzdGF0aWMgdm9pZCBtb2RpZnlfZGVjb2Rp
bmcoY29uc3Qgc3RydWN0IHBjaV9kZXYgKnBkZXYsIHVpbnQxNl90IGNtZCwKPiAgICAgIGJvb2wg
bWFwID0gY21kICYgUENJX0NPTU1BTkRfTUVNT1JZOwo+ICAgICAgdW5zaWduZWQgaW50IGk7Cj4g
IAo+ICsgICAgLyoKPiArICAgICAqIE1ha2Ugc3VyZSB0aGVyZSBhcmUgbm8gbWFwcGluZ3MgaW4g
dGhlIE1TSVggTU1JTyBhcmVhcywgc28gdGhhdCBhY2Nlc3Nlcwo+ICsgICAgICogY2FuIGJlIHRy
YXBwZWQgKGFuZCBlbXVsYXRlZCkgYnkgWGVuIHdoZW4gdGhlIG1lbW9yeSBkZWNvZGluZyBiaXQg
aXMKPiArICAgICAqIGVuYWJsZWQuCj4gKyAgICAgKgo+ICsgICAgICogRklYTUU6IHB1bmNoaW5n
IGhvbGVzIGFmdGVyIHRoZSBwMm0gaGFzIGJlZW4gc2V0IHVwIG1pZ2h0IGJlIHJhY3kgZm9yCj4g
KyAgICAgKiBEb21VIHVzYWdlLCBuZWVkcyB0byBiZSByZXZpc2l0ZWQuCj4gKyAgICAgKi8KPiAr
ICAgIGlmICggbWFwICYmICFyb21fb25seSAmJiB2cGNpX21ha2VfbXNpeF9ob2xlKHBkZXYpICkK
PiArICAgICAgICByZXR1cm47CgouLi4gdGhpcyBzdGlsbCB3b3JyeWluZyBtZSwgYXMgSSB0aGlu
ayBpdCdsbCBuZWVkIHRvIGJlIHJlLWltcGxlbWVudGVkCmFsdG9nZXRoZXIgYXQgdGhhdCBsYXRl
ciBwb2ludC4KCkFmYWljdCB0aGlzIHBhdGNoIGlzIGluZGVwZW5kZW50IG9mIHRoZSBlYXJsaWVy
IHR3byAobGVhdmluZyBhc2lkZQpzb21lIGZ1enogdGhhdCB3b3VsZCBiZSBlYXN5IHRvIHJlc29s
dmUpLCB3aGljaCBtZWFucyBpdCBjb3VsZApnbyBpbiBhaGVhZCBvZiB0aGVtLgoKSmFuCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
