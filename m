From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v10 09/11] vpci/msi: add MSI handlers
Date: Fri, 16 Mar 2018 08:04:55 -0600
Message-ID: <5AABDD1702000078001B2D77@prv-mh.provo.novell.com>
References: <20180316133008.66443-1-roger.pau@citrix.com>
 <20180316133008.66443-10-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=krzt=gg=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ewpyk-0006Qe-5C
 for xen-devel@lists.xenproject.org; Fri, 16 Mar 2018 14:05:06 +0000
In-Reply-To: <20180316133008.66443-10-roger.pau@citrix.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE2LjAzLjE4IGF0IDE0OjMwLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IC0tLSBhL3hlbi9kcml2ZXJzL3ZwY2kvdnBjaS5jCj4gKysrIGIveGVuL2RyaXZlcnMvdnBjaS92
cGNpLmMKPiBAQCAtNDcsNiArNDcsNyBAQCB2b2lkIHZwY2lfcmVtb3ZlX2RldmljZShzdHJ1Y3Qg
cGNpX2RldiAqcGRldikKPiAgICAgICAgICB4ZnJlZShyKTsKPiAgICAgIH0KPiAgICAgIHNwaW5f
dW5sb2NrKCZwZGV2LT52cGNpLT5sb2NrKTsKPiArICAgIHhmcmVlKHBkZXYtPnZwY2ktPm1zaSk7
Cj4gICAgICB4ZnJlZShwZGV2LT52cGNpKTsKCk9rYXksIHRoZSAjaWZkZWYgaGVyZSBpcyBnb25l
IGFzIGFncmVlZC4gQnV0IHNvbWV0aGluZyBpcyBzdGlsbCBmaXNoeQpoZXJlIGZvciB0aGUgdGVz
dCB1dGlsaXR5OiBZb3UgZG9uJ3QgY2hhbmdlIHRoZSB0ZXN0IGNvZGUgaGVyZSBhdCBhbGwsCndo
aWNoIG1hZGUgbWUgZ28gbG9vayB3aHkgdGhhdCBpcy4gQXMgaXQgbG9va3MgeW91IHVzZSBhIHNp
bmdsZQpzdGF0aWMgc3RydWN0IHZwY2kgaW5zdGFuY2UgdGhlcmUuIFRoYXQnbGwgbWFrZSB0aGUg
eGZyZWUoKSB5b3UgYWRkCmhlcmUgY29ycmVjdCwgYnV0IHRoZSBvdGhlciBvbmUgYWJvdmUgdGhl
biBpcyB3cm9uZyAoeW91J3JlIGZyZWVpbmcKc3RhdGljIGRhdGEpLiBPciBhbSBJIG1pc3Npbmcg
c29tZXRoaW5nPwoKSmFuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
