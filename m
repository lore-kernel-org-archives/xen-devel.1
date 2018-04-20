From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH for-4.11] libxl: fix memory map reported to
 PVH guests
Date: Fri, 20 Apr 2018 15:58:24 +0200
Message-ID: <a2952b6d-6a42-6c3d-08d8-4af65cc1a77c@suse.com>
References: <20180420135235.4584-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=7tp6=hj=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1f9WYY-0004XI-88
 for xen-devel@lists.xenproject.org; Fri, 20 Apr 2018 13:58:30 +0000
In-Reply-To: <20180420135235.4584-1-roger.pau@citrix.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjAvMDQvMTggMTU6NTIsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToKPiBQVkggZ3Vlc3RzIHdp
dGggNEdCIG9mIFJBTSBvciBtb3JlIGdldCBhIG1lbW9yeSBtYXAgbGlrZSB0aGUKPiBmb2xsb3dp
bmc6Cj4gCj4gMHgwMDAwMDAwMDAwMDAwMCAtIDB4MDAwMDAwZmVlMDAwMDAgUkFNCj4gMHgwMDAw
MDBmZWUwMDAwMCAtIDB4MDAwMDAxMDAwMDAwMDAgUkVTRVJWRUQKPiAweDAwMDAwMGZjMDA5MDAw
IC0gMHgwMDAwMDBmYzAwOTA0MCBBQ1BJCj4gMHgwMDAwMDBmYzAwMDAwMCAtIDB4MDAwMDAwZmMw
MDEwMDAgQUNQSQo+IDB4MDAwMDAwZmMwMDEwMDAgLSAweDAwMDAwMGZjMDA5MDAwIEFDUEkKPiAw
eDAwMDAwMTAwMDAwMDAwIC0gMHgwMDAwMDFmYjIwMDQwMCBSQU0KPiAKPiBUaGlzIGlzIHdyb25n
IGJlY2F1c2UgQUNQSSByZWdpb25zIGFyZSBhbHNvIHJlcG9ydGVkIGFzIFJBTSByZWdpb25zLgo+
IFRoZSBjYXVzZSBvZiB0aGlzIGlzc3VlIGlzIG5vdCBzZXR0aW5nIGEgYmlnIGVub3VnaCBNTUlP
IGhvbGUsIGN1cnJlbnQKPiBsaWJ4bCBjb2RlIG9ubHkgdGFrZXMgaW50byBhY2NvdW50IHRoZSBh
ZGRyZXNzIG9mIHRoZSBsb2NhbCBBUElDIHBhZ2UKPiBhbmQgdGhlIHJlc2VydmVkIHBhZ2VzIGlu
IG9yZGVyIHRvIHNldCB0aGUgc2l6ZSBvZiB0aGUgTU1JTyBob2xlLCB3aGVuCj4gaXQgc2hvdWxk
IGFsc28gdGFrZSBpbnRvIGFjY291bnQgdGhlIGxvY2F0aW9uIG9mIHRoZSBBQ1BJIHRhYmxlcy4K
PiAKPiBBZnRlciB0aGUgZml4IHRoZSBsYXlvdXQgcmVwb3J0ZWQgZm9yIHRoZSBzYW1lIGd1ZXN0
IGlzOgo+IAo+IDB4MDAwMDAwMDAwMDAwMDAgLSAweDAwMDAwMGZjMDAwMDAwIFJBTQo+IDB4MDAw
MDAwZmMwMDAwMDAgLSAweDAwMDAwMTAwMDAwMDAwIFJFU0VSVkVECj4gMHgwMDAwMDBmYzAwOTAw
MCAtIDB4MDAwMDAwZmMwMDkwNDAgQUNQSQo+IDB4MDAwMDAwZmMwMDAwMDAgLSAweDAwMDAwMGZj
MDAxMDAwIEFDUEkKPiAweDAwMDAwMGZjMDAxMDAwIC0gMHgwMDAwMDBmYzAwOTAwMCBBQ1BJCj4g
MHgwMDAwMDEwMDAwMDAwMCAtIDB4MDAwMDAxZmUwMDA0MDAgUkFNCj4gCj4gU2lnbmVkLW9mZi1i
eTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+CgpSZWxlYXNlLWFja2Vk
LWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CgoKSnVlcmdlbgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
