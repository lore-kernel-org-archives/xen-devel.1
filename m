From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH v3 10/31] libxl_qmp: Move buffers to the
 stack of qmp_next.
Date: Thu, 28 Jun 2018 10:57:12 +0100
Message-ID: <23348.45304.793394.553020@mariner.uk.xensource.com>
References: <20180601143720.24637-1-anthony.perard@citrix.com>
 <20180601143720.24637-11-anthony.perard@citrix.com>
 <23347.40960.451387.595477@mariner.uk.xensource.com>
 <20180627165818.GE2052@perard.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=3gz1=jo=citrix.com=prvs=710363d4d=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fYTfx-0003m8-Jt
 for xen-devel@lists.xenproject.org; Thu, 28 Jun 2018 09:57:17 +0000
In-Reply-To: <20180627165818.GE2052@perard.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

QW50aG9ueSBQRVJBUkQgd3JpdGVzICgiUmU6IFtQQVRDSCB2MyAxMC8zMV0gbGlieGxfcW1wOiBN
b3ZlIGJ1ZmZlcnMgdG8gdGhlIHN0YWNrIG9mIHFtcF9uZXh0LiIpOgo+IE9uIFdlZCwgSnVuIDI3
LCAyMDE4IGF0IDAzOjMyOjMyUE0gKzAxMDAsIElhbiBKYWNrc29uIHdyb3RlOgo+ID4gQW50aG9u
eSBQRVJBUkQgd3JpdGVzICgiW1BBVENIIHYzIDEwLzMxXSBsaWJ4bF9xbXA6IE1vdmUgYnVmZmVy
cyB0byB0aGUgc3RhY2sgb2YgcW1wX25leHQuIik6Cj4gPiA+IFRoYXQgYnVmZmVyIGlzIG9ubHkg
dXNlZCBsb2NhbGx5LCBhbmQgbmV2ZXIgcmV1c2UgYWNjcm9zcyBkaWZmZXJlbnQgY2FsbAo+ID4g
PiBvZiBxbXBfbmV4dC4gU28gcmVtb3ZlIGl0IGZvcm0gdGhlIGhhbmRsZXIuCj4gPiAKPiA+IEhv
dyBiaWcgaXMgdGhpcyBidWZmZXIgPwo+IAo+IEl0J3MgNGsKCkkgdGhpbmsgdGhhdCBpcyBiaWcg
ZW5vdWdoIHRoYXQgaXQgd291bGQgYmUgYmV0dGVyIG9uIHRoZSBoZWFwLAphbHRob3VnaCBsaWJ4
bCBpcyBxdWl0ZSBmbGFiYnkgaW4gaXRzIHN0YWNrIHVzZS4KClRoYW5rcywKSWFuLgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
