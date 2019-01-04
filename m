From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH v7 01/14] libxl: Enhance libxl__sendmsg_fds
 to deal with EINTR and EWOULDBLOCK
Date: Fri, 4 Jan 2019 15:58:17 +0000
Message-ID: <23599.33433.110571.940798@mariner.uk.xensource.com>
References: <20181123135355.6001-1-anthony.perard@citrix.com>
 <20181123135355.6001-2-anthony.perard@citrix.com>
 <23580.63725.92336.625926@mariner.uk.xensource.com>
 <20190104120723.GC1508@perard.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0HmE=PM=citrix.com=prvs=90098d2ee=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1gfRrZ-0003nR-4r
 for xen-devel@lists.xenproject.org; Fri, 04 Jan 2019 15:58:21 +0000
In-Reply-To: <20190104120723.GC1508@perard.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

QW50aG9ueSBQRVJBUkQgd3JpdGVzICgiUmU6IFtQQVRDSCB2NyAwMS8xNF0gbGlieGw6IEVuaGFu
Y2UgbGlieGxfX3NlbmRtc2dfZmRzIHRvIGRlYWwgd2l0aCBFSU5UUiBhbmQgRVdPVUxEQkxPQ0si
KToKPiBPbiBGcmksIERlYyAyMSwgMjAxOCBhdCAwMjozMDowNVBNICswMDAwLCBJYW4gSmFja3Nv
biB3cm90ZToKPiA+IEV2ZW4gd2l0aCBhIGJsb2NraW5nIGZkLCBzZW5kbXNnIG1heSBpbiBwcmlu
Y2lwbGUgcmVwb3J0IGEgc2hvcnQKPiA+IHdyaXRlLiAgKFNvIHRoZSBjb21taXQgbWVzc2FnZSBz
aG91bGQgdGFsayBhYm91dCBzaG9ydCB3cml0ZXMgaW4KPiA+IGdlbmVyYWwuKQo+IAo+IEkgaGF2
ZSByZXdyaXRlIHRoZSBjb21taXQgbWVzc2FnZSBsaWtlIHRoaXM6Cj4gCj4gVGhpcyBwYXRjaCBj
aGFuZ2UgdGhlIGJlaGF2aW9yIG9mIGxpYnhsX19zZW5kbXNnX2ZkcyB0byByZXRyeSBzZW5kbXNn
IG9uCj4gRUlOVFIgZXJyb3IgYW5kIHJldHVybiBhbiBlcnJvciBvbiBzaG9ydCB3cml0ZXMuCj4g
Cj4gVGhpcyBwYXRjaCBhbGxvdyBhIGNhbGxlciBvZiBsaWJ4bF9fc2VuZG1zZ19mZHMgdG8gZGVh
bCB3aXRoIEVXT1VMREJMT0NLCj4gYW5kIHNob3J0IHdyaXRlcy4gVGhlIGZ1bmN0aW9uIG5vdyBy
ZXF1aXJlcyB0byBzZW5kIG9ubHkgMSBieXRlIG9mIGRhdGEKPiBzbyB0aGF0IHdoZW4gZGVhbGlu
ZyB3aXRoIG5vbi1ibG9ja2luZyBmZHMgYSBFV09VTERCTE9DSyBlcnJvciB3b3VsZAo+IG1lYW4g
dGhhdCB0aGUgZmRzIGhhdmVuJ3QgYmVlbiBzZW50IHlldC4gQ3VycmVudCBjYWxsZXIgYWxyZWFk
eSBzZW5kCj4gb25seSAxIGJ5dGUuCgpUaGFua3MsCklhbi4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
