From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [goto-label v2] memory: fix label syntax
Date: Tue, 31 Jul 2018 10:29:03 +0100
Message-ID: <20180731092903.schc6pjwkkccbit7@citrix.com>
References: <5B60210E02000078001D9489@prv1-mh.provo.novell.com>
 <1533027369-16597-1-git-send-email-nmanthey@amazon.de>
 <5B601EC50200002B04CC06FC@prv1-mh.provo.novell.com>
 <5B60210E02000078001D9489@prv1-mh.provo.novell.com>
 <5B60243D0200005904CC0BD5@prv1-mh.provo.novell.com>
 <5B60297B02000078001D9505@prv1-mh.provo.novell.com>
 <20180731092407.kspimrsqq2wplf5m@citrix.com>
 <5B602B6702000078001D9521@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=mxhy=kp=citrix.com=prvs=7433d6730=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fkQxn-0001nN-Kb
 for xen-devel@lists.xenproject.org; Tue, 31 Jul 2018 09:29:07 +0000
Content-Disposition: inline
In-Reply-To: <5B602B6702000078001D9521@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Elizabeth Polgreen <polgreen@amazon.de>, Wei Liu <wei.liu2@citrix.com>, nmanthey@amazon.de, george.dunlap@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBKdWwgMzEsIDIwMTggYXQgMDM6Mjc6MDNBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDMxLjA3LjE4IGF0IDExOjI0LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gPiBPbiBUdWUsIEp1bCAzMSwgMjAxOCBhdCAwMzoxODo1MUFNIC0wNjAwLCBKYW4gQmV1
bGljaCB3cm90ZToKPiA+PiA+Pj4gT24gMzEuMDcuMTggYXQgMTA6NTYsIDxubWFudGhleUBhbWF6
b24uZGU+IHdyb3RlOgo+ID4+ID4gV2hlbiBjb21waWxpbmcgdGhpcyBmaWxlIHdpdGggZ2NjLCB0
aGUgY29tcGlsZXIgaGFwcGlseSBhY2NlcHRzIHRoZQo+ID4+ID4gc2VxdWVuY2Ugb2YgYSBsYWJl
bCBmb2xsb3dlZCBieSBhbiBhdHRyaWJ1dGUuIEhvd2V2ZXIsIHRoaXMgc2VxdWVuY2UgZG9lcwo+
ID4+ID4gbm90IGZvbGxvdyB0aGUgZ2NjIGRvY3VtZW50YXRpb24uIEhlbmNlLCBvdGhlciBjb21w
aWxlcnMgbWlnaHQgc3R1bWJsZQo+ID4+ID4gdXBvbiB0aGlzIHN0YXRlbWVudC4KPiA+PiA+IAo+
ID4+ID4gVG8gYmUgYWJsZSB0byBjb21waWxlIFhlbiB3aXRoIGdvdG8tY2MgKHRoZSBjb21waWxl
ciBvZiB0aGUgQ1BST1ZFUiB0b29sCj4gPj4gPiBzdWl0ZSksIHRoZSBtaXNzaW5nIHNlbWljb2xv
biBpcyBhZGRlZCBpbiB0aGlzIGNvbW1pdC4KPiA+PiA+IAo+ID4+ID4gUmVwb3J0ZWQtYnk6IEVs
aXphYmV0aCBQb2xncmVlbiA8cG9sZ3JlZW5AYW1hem9uLmRlPgo+ID4+ID4gU2lnbmVkLW9mZi1i
eTogTm9yYmVydCBNYW50aGV5IDxubWFudGhleUBhbWF6b24uZGU+Cj4gPj4gCj4gPj4gUmV2aWV3
ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiA+PiAKPiA+PiBCdHcgLSB5
b3Ugc3RpbGwgZGlkbid0IENjIGFsbCByZWxldmFudCBtYWludGFpbmVycywgYnV0IEknbSBzdXJl
IG5vIG9uZQo+ID4+IG9mIHRoZW0gd291bGQgb2JqZWN0IHRvIGEgY2hhbmdlIGxpa2UgdGhpcy4K
PiA+IAo+ID4gU3RyYW5nZWx5IHRoaXMgcGF0Y2ggbmV2ZXIgc2hvd2VkIHVwIGluIG15IGluYm94
IG9yIHhlbi1kZXZlbCBhcmNoaXZlLgo+ID4gCj4gPiBOb3JiZXJ0LCBJIHdvbmRlciBpZiB0aGVy
ZSBpcyBzb21ldGhpbmcgd3Jvbmcgd2l0aCB5b3VyIGVtYWlsIHNldHRpbmc/Cj4gCj4gUGVyaGFw
cyBpdCdzIHN0aWxsIGluIG1vZGVyYXRpb24/Cj4gCgpJdCBhcHBlYXJzIHNvLiBBbmR5IGp1c3Qg
bGV0IGl0IHRocm91Z2guIFNvcnJ5IGZvciB0aGUgbm9pc2UuCgpXZWkuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
