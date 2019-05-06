From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: [PATCH 09/12] xen/arm: mm: Use {,
 un}map_domain_page() to map/unmap Xen page-tables
Date: Mon, 6 May 2019 15:48:56 +0300
Message-ID: <2f2c7307-dd35-70b2-a2d7-3a6f5034f8c7@gmail.com>
References: <20190424165955.23718-1-julien.grall@arm.com>
 <20190424165955.23718-10-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aYeK=TG=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hNd3F-0007eM-7r
 for xen-devel@lists.xenproject.org; Mon, 06 May 2019 12:49:01 +0000
Received: by mail-lf1-x143.google.com with SMTP id h126so9041670lfh.4
 for <xen-devel@lists.xenproject.org>; Mon, 06 May 2019 05:48:59 -0700 (PDT)
In-Reply-To: <20190424165955.23718-10-julien.grall@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Cc: Oleksandr_Tyshchenko@epam.com, sstabellini@kernel.org, Andrii_Anisov@epam.com
List-Id: xen-devel@lists.xenproject.org

CgpPbiAyNC4wNC4xOSAxOTo1OSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEN1cnJlbnRseSwgdGhl
IHZpcnR1YWwgYWRkcmVzcyBvZiB0aGUgM3JkIGxldmVsIHBhZ2UtdGFibGVzIGlzIG9idGFpbmVk
Cj4gdXNpbmcgbWZuX3RvX3ZpcnQoKS4KPiAKPiBPbiBBcm0zMiwgbWZuX3RvX3ZpcnQgY2FuIG9u
bHkgd29yayBvbiB4ZW5oZWFwIHBhZ2UuIFdoaWxlIGluIHByYWN0aWNlCj4gYWxsIHRoZSBwYWdl
LXRhYmxlcyB1cGRhdGVkIHdpbGwgcmVzaWRlIGluIHhlbmhlYXAsIGluIHByYWN0aXZlIHRoZQo+
IHBhZ2UtdGFibGVzIGNvdmVyaW5nIFhlbiBtZW1vcnkgKGUuZyB4ZW5fbWFwcGluZykgaXMgcGFy
dCBvZiBYZW4gYmluYXJ5Lgo+IAo+IEZ1cnRoZXJtb3JlLCBhIGZvbGxvdy11cCBjaGFuZ2Ugd2ls
bCB1cGRhdGUgeGVuX3B0X3VwZGF0ZV9lbnRyeSgpIHRvCj4gd2FsayBhbGwgdGhlIGxldmVscyBh
bmQgdGhlcmVmb3JlIGJlIG1vcmUgZ2VuZXJpYy4gU29tZSBvZiB0aGUKPiBwYWdlLXRhYmxlcyB3
aWxsIGFsc28gcGFydCBvZiBYZW4gbWVtb3J5IGFuZCB0aGVyZWZvcmUgd2lsbCBub3QgYmUKPiBy
ZWFjaGFibGUgdXNpbmcgbWZuX3RvX3ZpcnQoKS4KPiAKPiBUaGUgZWFzaWVzdCB3YXkgdG8gcmVh
Y2ggdGhvc2UgcGFnZXMgaXMgdG8gdXNlIHssIHVufW1hcF9kb21haW5fcGFnZSgpLgo+IFdoaWxl
IG9uIGFybTMyIHRoaXMgbWVhbnMgYW4gZXh0cmEgbWFwcGluZyBpbiB0aGUgbm9ybWFsIGNhc2Vz
LCB0aGlzIGlzIG5vdAo+IHZlcnkgaW1wb3J0YW50IGFzIHhlbiBwYWdlLXRhYmxlcyBhcmUgbm90
IHVwZGF0ZWQgb2Z0ZW4uCj4gCj4gSW4gb3JkZXIgdG8gYWxsb3cgZnV0dXJlIGNoYW5nZSBpbiB0
aGUgd2F5IFhlbiBwYWdlLXRhYmxlcyBhcmUgbWFwcGVkLAo+IHR3byBuZXcgaGVscGVycyBhcmUg
aW50cm9kdWNlZCB0byBtYXAvdW5tYXAgdGhlIHBhZ2UtdGFibGVzLgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cj4gLS0tCj4gCgoKUmV2aWV3
ZWQtYnk6IEFuZHJpaSBBbmlzb3YgPGFuZHJpaV9hbmlzb3ZAZXBhbS5jb20+CgotLSAKU2luY2Vy
ZWx5LApBbmRyaWkgQW5pc292LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
