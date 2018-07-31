From: Norbert Manthey <nmanthey@amazon.de>
Subject: Re: [goto-label] memory: fix label syntax
Date: Tue, 31 Jul 2018 10:32:52 +0200
Message-ID: <a993a757-edad-6a10-3109-9b18482c874b@amazon.de>
References: <1533021498-21452-1-git-send-email-nmanthey@amazon.de>
 <5B60143D02000078001D940B@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=vjw3=kp=amazon.de=prvs=74377f6f8=nmanthey@srs-us1.protection.inumbo.net>)
 id 1fkQ5X-0003qT-2A
 for xen-devel@lists.xenproject.org; Tue, 31 Jul 2018 08:33:03 +0000
In-Reply-To: <5B60143D02000078001D940B@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Elizabeth Polgreen <polgreen@amazon.de>, george.dunlap@citrix.com
List-Id: xen-devel@lists.xenproject.org

U29ycnkgZm9yIHB1dHRpbmcgeW91IGluIHRoZSBUbyBmaWVsZCwgSSdsbCB1c2UgQ2MgaW4gdGhl
IGZ1dHVyZS4KCkkgYWdyZWUgdGhhdCB0aGUgY29tbWl0IG1lc3NhZ2UgaXMgYSBsaXR0bGUgc2hv
cnQsIGFuZCBJIHdpbGwgaXRlcmF0ZSBvbgp0aGF0LiBGdXJ0aGVybW9yZSwgSSBhZ3JlZSB0aGF0
IGdjYyBjb21wYXRpYmlsaXR5IHdvdWxkIGFsbG93IHRvIHBhcnNlCnRoaXMgc3RhdGVtZW50LiBI
b3dldmVyLCB0aGUgZ2l2ZW4gc2VxdWVuY2UgaXMgbm90IHVuaXF1ZSwgYW5kIHRoZSBnY2MKZG9j
dW1lbnRhdGlvbiBzdGF0ZXMgdGhhdCB0aGUgc2VtaWNvbG9uIGlzIG1hbmRhdG9yeS4KCmh0dHBz
Oi8vZ2NjLmdudS5vcmcvb25saW5lZG9jcy9nY2MvTGFiZWwtQXR0cmlidXRlcy5odG1sCgpJJ2xs
IGFkZCBtb3JlIGRldGFpbHMgdG8gdGhlIGNvbW1pdCBtZXNzYWdlLgoKQmVzdCwKTm9yYmVydAoK
T24gMDcvMzEvMjAxOCAwOTo0OCBBTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMzEuMDcu
MTggYXQgMDk6MTgsIDxubWFudGhleUBhbWF6b24uZGU+IHdyb3RlOgo+PiBUbyBiZSBhYmxlIHRv
IGNvbXBpbGUgWGVuIHdpdGggZ290b2NjLCB0aGUgbGFiZWwgc3RhdGVtZW50IGhhcyB0byBiZQo+
PiBmb2xsb3dlZCBieSBhIHNlbWljb2xvbi4KPiAKPiBBc3N1bWluZyB0aGF0IGdvdG9jYyBhaW1z
IHRvIGJlIGdjYyBjb21wYXRpYmxlLCB0aGlzIGxvb2tzIGxpa2UgYQo+IHNob3J0Y29taW5nIHRo
ZXJlLiBBcyB0aGUgd29ya2Fyb3VuZCBpcyBzaW1wbGUgZW5vdWdoLCBJJ20gZmluZQo+IHdpdGgg
dGhlIGNoYW5nZSwgYnV0IHRoZSBkZXNjcmlwdGlvbiBzaG91bGQgdGhlbiBzYXkgc28uIE9yCj4g
b3RoZXJ3aXNlIGl0IHNob3VsZCBhcyB3ZWxsIGNsYXJpZnkgdGhlIHNpdHVhdGlvbi4KPiAKPiBG
dXJ0aGVybW9yZSAtIHBsZWFzZSBmb2xsb3cgcGF0Y2ggc3VibWlzc2lvbiBydWxlczogUGF0Y2hl
cyBnZXQKPiBzZW50IF9Ub18gdGhlIGxpc3QsIHdpdGggX2FsbF8gbWFpbnRhaW5lcnMgX0NjXy1l
ZC4KPiAKPiBKYW4KPiAKPiAKPiAKQW1hem9uIERldmVsb3BtZW50IENlbnRlciBHZXJtYW55IEdt
YkgKQmVybGluIC0gRHJlc2RlbiAtIEFhY2hlbgptYWluIG9mZmljZTogS3JhdXNlbnN0ci4gMzgs
IDEwMTE3IEJlcmxpbgpHZXNjaGFlZnRzZnVlaHJlcjogRHIuIFJhbGYgSGVyYnJpY2gsIENocmlz
dGlhbiBTY2hsYWVnZXIKVXN0LUlEOiBERTI4OTIzNzg3OQpFaW5nZXRyYWdlbiBhbSBBbXRzZ2Vy
aWNodCBDaGFybG90dGVuYnVyZyBIUkIgMTQ5MTczIEIKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
