From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH for-4.11] libxl: fix memory map reported to
 PVH guests
Date: Fri, 20 Apr 2018 08:43:40 -0600
Message-ID: <5AD9FC9C02000078001BD106@prv1-mh.provo.novell.com>
References: <20180420135235.4584-1-roger.pau@citrix.com>
 <5AD9F2BF02000078001BD09B@prv1-mh.provo.novell.com>
 <20180420141529.ifdwolbg55zoycz4@MacBook-Pro-de-Roger.local>
 <5AD9F86502000078001BD0E0@prv1-mh.provo.novell.com>
 <20180420143138.6ptqi7u5zryubcdf@MacBook-Pro-de-Roger.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=xcz5=hj=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1f9XGD-0000B8-Gc
 for xen-devel@lists.xenproject.org; Fri, 20 Apr 2018 14:43:37 +0000
In-Reply-To: <20180420143138.6ptqi7u5zryubcdf@MacBook-Pro-de-Roger.local>
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

Pj4+IE9uIDIwLjA0LjE4IGF0IDE2OjMxLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IEFGQUlDVCB0aGUgb25seSByZXNlcnZlZCBwYWdlcyBmb3IgUFZIIGFyZSB0aGUgSFZNIHNwZWNp
YWwgcGFnZXMsIHNvCj4gSSd2ZSBjaGFuZ2VkIHRoZSBtZW1vcnkgbWFwIGJ1aWxkZXIgdG8gb25s
eSByZXBvcnQgdGhvc2UgYXMgcmVzZXJ2ZWQsCj4gaGVyZSBpcyB0aGUgcmVzdWx0aW5nIG1lbW9y
eSBtYXA6Cj4gCj4gMHgwMDAwMDAwMDAwMDAwMCAtIDB4MDAwMDAwZmMwMDAwMDAgUkFNCj4gMHgw
MDAwMDBmZWZmODAwMCAtIDB4MDAwMDAwZmYwMDAwMDAgUkVTRVJWRUQKPiAweDAwMDAwMGZjMDA5
MDAwIC0gMHgwMDAwMDBmYzAwOTA0MCBBQ1BJCj4gMHgwMDAwMDBmYzAwMDAwMCAtIDB4MDAwMDAw
ZmMwMDEwMDAgQUNQSQo+IDB4MDAwMDAwZmMwMDEwMDAgLSAweDAwMDAwMGZjMDA5MDAwIEFDUEkK
PiAweDAwMDAwMTAwMDAwMDAwIC0gMHgwMDAwMDFmZTAwMDQwMCBSQU0KCkxHVE0KCj4gSSBzZWUg
bm8gcmVhc29uIHRvIG1hcmsgdGhlIGxvY2FsIEFQSUMgcGFnZSBhcyByZXNlcnZlZCBpbiB0aGUg
bWVtb3J5Cj4gbWFwLiBJZiB0aGF0IHNlZW1zIGxpa2UgYSBzZW5zaWJsZSBhcHByb2FjaCBJIGNh
biBzZW5kIHRoZSB1cGRhdGVkCj4gcGF0Y2guCgpSaWdodCAtIGNvbW1vbmx5IGJhcmUgaGFyZHdh
cmUgZG9lc24ndCBoYXZlIHRoaXMgcGFnZSBtYXJrZWQgcmVzZXJ2ZWQKZWl0aGVyLgoKSmFuCgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
