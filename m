From: "Jan Beulich" <JBeulich@suse.com>
Subject: Ping#2: [PATCH v2 0/2] ns16550: enable use of PCI MSI
Date: Thu, 29 Nov 2018 09:54:04 -0700
Message-ID: <5C0019AC020000780020151F@prv1-mh.provo.novell.com>
References: <5BB2455202000078001ED685@prv1-mh.provo.novell.com>
 <5BD2F51802000078001F50BA@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=suqh=oi=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gSPZm-0004dO-6B
 for xen-devel@lists.xenproject.org; Thu, 29 Nov 2018 16:54:06 +0000
In-Reply-To: <5BD2F51802000078001F50BA@prv1-mh.provo.novell.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI2LjEwLjE4IGF0IDEzOjA2LCA8SkJldWxpY2hAc3VzZS5jb20+IHdyb3RlOgo+Pj4+
IE9uIDAxLjEwLjE4IGF0IDE4OjAzLCA8SkJldWxpY2hAc3VzZS5jb20+IHdyb3RlOgo+PiBQYXRj
aCAyIGlzIG5vIGxvbmdlciBSRkMsIG5vdyB0aGF0IEkgaGF2ZSBhIGRldmljZSB3aGVyZSBNU0kg
YWN0dWFsbHkKPj4gd29ya3MgKHN1Z2dlc3RpbmcgdGhhdCBpdCB3YXMgcmVhbGx5IHRoZSBvdGhl
ciBkZXZpY2UncyBmYXVsdCB0aGF0IHRoaW5ncwo+PiBkaWRuJ3Qgd29yaykuCj4+IAo+PiAxOiBj
b25zb2xlOiBhZGp1c3QgSVJRIGluaXRpYWxpemF0aW9uCj4+IDI6IG5zMTY1NTA6IGVuYWJsZSB1
c2Ugb2YgUENJIE1TSQoKVW5sZXNzIEkgaGVhciBiYWNrIGFueSBvYmplY3Rpb25zLCBJJ20gZ29p
bmcgdG8gY29tbWl0IHRoaXMgcGFpciBvZgpwYXRjaGVzIGFzIHdlbGwgYXMgIm5zMTY1NTAvUENJ
OiBmaXggc2tpcHBpbmcgb2YgZGV2aWNlcyIgaW4gYSB3ZWVrJ3MKdGltZSwgaXJyZXNwZWN0aXZl
IG9mIHRoZSBsYWNrIG9mIGFja3MuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
