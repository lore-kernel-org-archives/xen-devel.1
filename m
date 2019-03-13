From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH for-next 9/9] xen: Remove mfn_to_gmfn macro
Date: Wed, 13 Mar 2019 09:40:09 -0600
Message-ID: <5C892459020000780021E3FF@prv1-mh.provo.novell.com>
References: <20190218113600.9540-1-julien.grall@arm.com>
 <20190218113600.9540-10-julien.grall@arm.com>
 <5C892053020000780021E3A3@prv1-mh.provo.novell.com>
 <d99d0f41-9f56-be1b-96eb-de34fce812ee@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=GbKp=RQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1h45zI-0007IU-OD
 for xen-devel@lists.xenproject.org; Wed, 13 Mar 2019 15:40:12 +0000
In-Reply-To: <d99d0f41-9f56-be1b-96eb-de34fce812ee@arm.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEzLjAzLjE5IGF0IDE2OjI0LCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IE9uIDEzLzAzLzIwMTkgMTU6MjIsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAxOC4wMi4x
OSBhdCAxMjozNiwgPGp1bGllbi5ncmFsbEBhcm0uY29tPiB3cm90ZToKPj4+IC0tLSBhL3hlbi9p
bmNsdWRlL2FzbS1hcm0vbW0uaAo+Pj4gKysrIGIveGVuL2luY2x1ZGUvYXNtLWFybS9tbS5oCj4+
PiBAQCAtMzIxLDEwICszMjEsOCBAQCBzdHJ1Y3QgcGFnZV9pbmZvICpnZXRfcGFnZV9mcm9tX2d2
YShzdHJ1Y3QgdmNwdSAqdiwgdmFkZHJfdCB2YSwKPj4+ICAgI2RlZmluZSBTSEFSRURfTTJQX0VO
VFJZICAgICAgICAgKH4wVUwgLSAxVUwpCj4+PiAgICNkZWZpbmUgU0hBUkVEX00yUChfZSkgICAg
ICAgICAgICgoX2UpID09IFNIQVJFRF9NMlBfRU5UUlkpCj4+PiAgIAo+Pj4gLS8qIFhlbiBhbHdh
eXMgb3ducyBQMk0gb24gQVJNICovCj4+PiArLyogV2UgZG9uJ3QgaGF2ZSBhIE0yUCBvbiBBcm0g
Ki8KPj4+ICAgI2RlZmluZSBzZXRfZ3Bmbl9mcm9tX21mbihtZm4sIHBmbikgZG8geyAodm9pZCkg
KG1mbiksICh2b2lkKShwZm4pOyB9IHdoaWxlICgwKQo+Pj4gLSNkZWZpbmUgbWZuX3RvX2dtZm4o
X2QsIG1mbikgIChtZm4pCj4+IAo+PiBTbyBpcyB0aGUgcGxhbiB0byByZW1vdmUgdGhlIG90aGVy
IG1hY3JvIGZyb20gQXJtIHRoZW4gYXMgd2VsbD8KPiAKPiBEbyB5b3UgbWVhbiBtZm5fdG9fZ2Zu
PyBJZiBzbyBpdCBkb2VzIG5vdCBleGlzdCBvbiBBcm0uCgpObywgSSBtZWFuIHRoZSBvbmUgaW4g
Y29udGV4dCBhYm92ZSAtIHNldF9ncGZuX2Zyb21fbWZuKCkuCgpKYW4KCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
