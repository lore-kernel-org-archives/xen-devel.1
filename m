From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [goto-label v2] memory: fix label syntax
Date: Tue, 31 Jul 2018 10:24:07 +0100
Message-ID: <20180731092407.kspimrsqq2wplf5m@citrix.com>
References: <5B60210E02000078001D9489@prv1-mh.provo.novell.com>
 <1533027369-16597-1-git-send-email-nmanthey@amazon.de>
 <5B601EC50200002B04CC06FC@prv1-mh.provo.novell.com>
 <5B60210E02000078001D9489@prv1-mh.provo.novell.com>
 <5B60243D0200005904CC0BD5@prv1-mh.provo.novell.com>
 <5B60297B02000078001D9505@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=mxhy=kp=citrix.com=prvs=7433d6730=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fkQt2-0001Fd-BM
 for xen-devel@lists.xenproject.org; Tue, 31 Jul 2018 09:24:12 +0000
Content-Disposition: inline
In-Reply-To: <5B60297B02000078001D9505@prv1-mh.provo.novell.com>
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

T24gVHVlLCBKdWwgMzEsIDIwMTggYXQgMDM6MTg6NTFBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDMxLjA3LjE4IGF0IDEwOjU2LCA8bm1hbnRoZXlAYW1hem9uLmRlPiB3cm90
ZToKPiA+IFdoZW4gY29tcGlsaW5nIHRoaXMgZmlsZSB3aXRoIGdjYywgdGhlIGNvbXBpbGVyIGhh
cHBpbHkgYWNjZXB0cyB0aGUKPiA+IHNlcXVlbmNlIG9mIGEgbGFiZWwgZm9sbG93ZWQgYnkgYW4g
YXR0cmlidXRlLiBIb3dldmVyLCB0aGlzIHNlcXVlbmNlIGRvZXMKPiA+IG5vdCBmb2xsb3cgdGhl
IGdjYyBkb2N1bWVudGF0aW9uLiBIZW5jZSwgb3RoZXIgY29tcGlsZXJzIG1pZ2h0IHN0dW1ibGUK
PiA+IHVwb24gdGhpcyBzdGF0ZW1lbnQuCj4gPiAKPiA+IFRvIGJlIGFibGUgdG8gY29tcGlsZSBY
ZW4gd2l0aCBnb3RvLWNjICh0aGUgY29tcGlsZXIgb2YgdGhlIENQUk9WRVIgdG9vbAo+ID4gc3Vp
dGUpLCB0aGUgbWlzc2luZyBzZW1pY29sb24gaXMgYWRkZWQgaW4gdGhpcyBjb21taXQuCj4gPiAK
PiA+IFJlcG9ydGVkLWJ5OiBFbGl6YWJldGggUG9sZ3JlZW4gPHBvbGdyZWVuQGFtYXpvbi5kZT4K
PiA+IFNpZ25lZC1vZmYtYnk6IE5vcmJlcnQgTWFudGhleSA8bm1hbnRoZXlAYW1hem9uLmRlPgo+
IAo+IFJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gCj4gQnR3
IC0geW91IHN0aWxsIGRpZG4ndCBDYyBhbGwgcmVsZXZhbnQgbWFpbnRhaW5lcnMsIGJ1dCBJJ20g
c3VyZSBubyBvbmUKPiBvZiB0aGVtIHdvdWxkIG9iamVjdCB0byBhIGNoYW5nZSBsaWtlIHRoaXMu
CgpTdHJhbmdlbHkgdGhpcyBwYXRjaCBuZXZlciBzaG93ZWQgdXAgaW4gbXkgaW5ib3ggb3IgeGVu
LWRldmVsIGFyY2hpdmUuCgpOb3JiZXJ0LCBJIHdvbmRlciBpZiB0aGVyZSBpcyBzb21ldGhpbmcg
d3Jvbmcgd2l0aCB5b3VyIGVtYWlsIHNldHRpbmc/CgpXZWkuCgo+IEphbgo+IAo+IAo+IAo+IF9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gWGVuLWRldmVs
IG1haWxpbmcgbGlzdAo+IFhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwo+IGh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWwKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
