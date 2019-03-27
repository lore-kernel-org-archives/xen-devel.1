From: Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH V2 00/10] block: enable multi-page bvec for
 passthrough IO
Date: Wed, 27 Mar 2019 09:44:21 -0600
Message-ID: <e15258e5-6869-7dc1-5ea2-31c86a6aaa24@kernel.dk>
References: <20190317100112.8106-1-ming.lei@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=+VG5=R6=kernel.dk=axboe@srs-us1.protection.inumbo.net>)
 id 1h9Aj3-0000V0-Lm
 for xen-devel@lists.xenproject.org; Wed, 27 Mar 2019 15:44:25 +0000
Received: by mail-io1-xd43.google.com with SMTP id f6so14465679iop.3
 for <xen-devel@lists.xenproject.org>; Wed, 27 Mar 2019 08:44:23 -0700 (PDT)
In-Reply-To: <20190317100112.8106-1-ming.lei@redhat.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ming Lei <ming.lei@redhat.com>
Cc: Juergen Gross <jgross@suse.com>, Omar Sandoval <osandov@fb.com>, linux-block@vger.kernel.org, xen-devel@lists.xenproject.org, ris Ostrovsky <boris.ostrovsky@oracle.com>, Christoph Hellwig <hch@lst.de>
List-Id: xen-devel@lists.xenproject.org

T24gMy8xNy8xOSA0OjAxIEFNLCBNaW5nIExlaSB3cm90ZToKPiBIaSwKPiAKPiBOb3cgdGhlIHdo
b2xlIElPIHN0YWNrIGlzIGNhcGFibGUgb2YgaGFuZGxpbmcgbXVsdGktcGFnZSBidmVjLCBhbmQg
aXQgaGFzCj4gYmVlbiBlbmFibGVkIGluIHRoZSBub3JtYWwgRlMgSU8gcGF0aC4gSG93ZXZlciwg
aXQgaXNuJ3QgZG9uZSBmb3IKPiBwYXNzdGhyb3VnaCBJTy4KPiAKPiBXaXRob3V0IGVuYWJsaW5n
IG11bHRpLWJ2ZWMgZm9yIHBhc3N0aG91Z2ggSU8sIHdlIHdvbid0IGdvIGFoZWFkIGZvcgo+IG9w
dGltaXppbmcgcmVsYXRlZCBJTyBwYXRocywgc3VjaCBhcyBidmVjIG1lcmdpbmcsIGJpb19hZGRf
cGNfcGFnZQo+IHNpbXBsaWZpY2F0aW9uLgo+IAo+IFRoaXMgcGF0Y2ggZW5hYmxlcyBtdWx0aS1w
YWdlIGJ2ZWMgZm9yIHBhc3N0aHJvdWdoIElPLiBUdXJucyBvdXQKPiBiaW9fYWRkX3BjX3BhZ2Uo
KSBpcyBzaW1wbGllZmllZCBhIGxvdCwgZXNwZWNpYWxseSB0aGUgcGh5c2ljYWwgc2VnbWVudAo+
IG51bWJlciBvZiBwYXNzdGhyb3VnaCBiaW8gaXMgYWx3YXlzIHNhbWUgd2l0aCBiaW8uYmlfdmNu
dC4gQWxzbyB0aGUKPiBidmVjIG1lcmdpbmcgaW5zaWRlIGJpbyBpcyBraWxsZWQuCj4gCj4gYmxr
dGVzdHMoYmxvY2svMDI5KSBpcyBhZGRlZCBmb3IgY292ZXJpbmcgcGFzc3Rob3VnaCBJTyBwYXRo
LCBhbmQgdGhpcwo+IHBhdGNoc2V0IGRvZXMgcGFzcyB0aGUgbmV3IGJsb2NrLzAyOSB0ZXN0Lgo+
IAo+IAlodHRwczovL21hcmMuaW5mby8/bD1saW51eC1ibG9jayZtPTE1NTE3NTA2MzQxNzEzOSZ3
PTIKCk1lcmdlZCBmb3IgNS4yLCB0aGFua3MgTWluZy4KCi0tIApKZW5zIEF4Ym9lCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
