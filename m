From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH for-4.11] libxl: fix memory map reported to
 PVH guests
Date: Fri, 20 Apr 2018 08:01:35 -0600
Message-ID: <5AD9F2BF02000078001BD09B@prv1-mh.provo.novell.com>
References: <20180420135235.4584-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=xcz5=hj=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1f9WbU-0005FK-Fy
 for xen-devel@lists.xenproject.org; Fri, 20 Apr 2018 14:01:32 +0000
In-Reply-To: <20180420135235.4584-1-roger.pau@citrix.com>
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
Cc: Juergen Gross <jgross@suse.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIwLjA0LjE4IGF0IDE1OjUyLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IFBWSCBndWVzdHMgd2l0aCA0R0Igb2YgUkFNIG9yIG1vcmUgZ2V0IGEgbWVtb3J5IG1hcCBsaWtl
IHRoZQo+IGZvbGxvd2luZzoKPiAKPiAweDAwMDAwMDAwMDAwMDAwIC0gMHgwMDAwMDBmZWUwMDAw
MCBSQU0KPiAweDAwMDAwMGZlZTAwMDAwIC0gMHgwMDAwMDEwMDAwMDAwMCBSRVNFUlZFRAo+IDB4
MDAwMDAwZmMwMDkwMDAgLSAweDAwMDAwMGZjMDA5MDQwIEFDUEkKPiAweDAwMDAwMGZjMDAwMDAw
IC0gMHgwMDAwMDBmYzAwMTAwMCBBQ1BJCj4gMHgwMDAwMDBmYzAwMTAwMCAtIDB4MDAwMDAwZmMw
MDkwMDAgQUNQSQo+IDB4MDAwMDAxMDAwMDAwMDAgLSAweDAwMDAwMWZiMjAwNDAwIFJBTQo+IAo+
IFRoaXMgaXMgd3JvbmcgYmVjYXVzZSBBQ1BJIHJlZ2lvbnMgYXJlIGFsc28gcmVwb3J0ZWQgYXMg
UkFNIHJlZ2lvbnMuCj4gVGhlIGNhdXNlIG9mIHRoaXMgaXNzdWUgaXMgbm90IHNldHRpbmcgYSBi
aWcgZW5vdWdoIE1NSU8gaG9sZSwgY3VycmVudAo+IGxpYnhsIGNvZGUgb25seSB0YWtlcyBpbnRv
IGFjY291bnQgdGhlIGFkZHJlc3Mgb2YgdGhlIGxvY2FsIEFQSUMgcGFnZQo+IGFuZCB0aGUgcmVz
ZXJ2ZWQgcGFnZXMgaW4gb3JkZXIgdG8gc2V0IHRoZSBzaXplIG9mIHRoZSBNTUlPIGhvbGUsIHdo
ZW4KPiBpdCBzaG91bGQgYWxzbyB0YWtlIGludG8gYWNjb3VudCB0aGUgbG9jYXRpb24gb2YgdGhl
IEFDUEkgdGFibGVzLgo+IAo+IEFmdGVyIHRoZSBmaXggdGhlIGxheW91dCByZXBvcnRlZCBmb3Ig
dGhlIHNhbWUgZ3Vlc3QgaXM6Cj4gCj4gMHgwMDAwMDAwMDAwMDAwMCAtIDB4MDAwMDAwZmMwMDAw
MDAgUkFNCj4gMHgwMDAwMDBmYzAwMDAwMCAtIDB4MDAwMDAxMDAwMDAwMDAgUkVTRVJWRUQKPiAw
eDAwMDAwMGZjMDA5MDAwIC0gMHgwMDAwMDBmYzAwOTA0MCBBQ1BJCj4gMHgwMDAwMDBmYzAwMDAw
MCAtIDB4MDAwMDAwZmMwMDEwMDAgQUNQSQo+IDB4MDAwMDAwZmMwMDEwMDAgLSAweDAwMDAwMGZj
MDA5MDAwIEFDUEkKPiAweDAwMDAwMTAwMDAwMDAwIC0gMHgwMDAwMDFmZTAwMDQwMCBSQU0KCkJ1
dCB0aGlzIGlzIHN0aWxsIHdyb25nIC0gbm8gdHdvIHJlZ2lvbnMgbWF5IG92ZXJsYXAsIHJlZ2Fy
ZGxlc3Mgb2YgdHlwZS4KQWxzbyB5b3UgYXBwZWFyIHRvIGJlIGxvc2luZyBhbGwgUkFNIGluIFtm
YzAwOTAwMCwgZmVlMDAwMDApLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
