From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: [PATCH 10/12] xen/arm: mm: Rework Xen page-tables
 walk during update
Date: Mon, 6 May 2019 15:49:02 +0300
Message-ID: <3aa4cb6e-506b-cf93-9b2a-493a64fd3704@gmail.com>
References: <20190424165955.23718-1-julien.grall@arm.com>
 <20190424165955.23718-11-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aYeK=TG=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hNd3K-0007hn-Gv
 for xen-devel@lists.xenproject.org; Mon, 06 May 2019 12:49:06 +0000
Received: by mail-lf1-x144.google.com with SMTP id y10so2360316lfl.3
 for <xen-devel@lists.xenproject.org>; Mon, 06 May 2019 05:49:05 -0700 (PDT)
In-Reply-To: <20190424165955.23718-11-julien.grall@arm.com>
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

CgpPbiAyNC4wNC4xOSAxOTo1OSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEN1cnJlbnRseSwgeGVu
X3B0X3VwZGF0ZV9lbnRyeSgpIGlzIG9ubHkgYWJsZSB0byB1cGRhdGUgdGhlIHJlZ2lvbiBjb3Zl
cmVkCj4gYnkgeGVuX3NlY29uZCAoaS5lIDAgdG8gMHg3ZmZmZmZmZikuCj4gCj4gQmVjYXVzZSBv
ZiB0aGUgcmVzdHJpY3Rpb24gd2UgZW5kIHRvIGhhdmUgbXVsdGlwbGUgZnVuY3Rpb25zIGluIG1t
LmMKPiBtb2RpZnlpbmcgdGhlIHBhZ2UtdGFibGVzIGRpZmZlcmVudGx5Lgo+IAo+IEZ1cnRoZXJt
b3JlLCB3ZSBuZXZlciB3YWxrZWQgdGhlIHBhZ2UtdGFibGVzIGZ1bGx5LiBUaGlzIG1lYW5zIHRo
YXQgYW55Cj4gY2hhbmdlIGluIHRoZSBsYXlvdXQgbWF5IHJlcXVpcmVzIG1ham9yIHJld3JpdGUg
b2YgdGhlIHBhZ2UtdGFibGVzIGNvZGUuCj4gCj4gTGFzdGx5LCB3ZSBoYXZlIGJlZW4gcXVpdGUg
bHVja3kgdGhhdCBubyBvbmUgZXZlciB0cmllZCB0byBwYXNzIGFuIGFkZHJlc3MKPiBvdXRzaWRl
IHRoaXMgcmFuZ2UgYmVjYXVzZSBpdCB3b3VsZCBoYXZlIGJsb3duLXVwLgo+IAo+IHhlbl9wdF91
cGRhdGVfZW50cnkoKSBpcyByZXdvcmtlZCB0byB3YWxrIG92ZXIgdGhlIHBhZ2UtdGFibGVzIGV2
ZXJ5Cj4gdGltZS4gVGhlIGxvZ2ljIGhhcyBiZWVuIGJvcnJvd2VkIGZyb20gYXJjaC9hcm0vcDJt
LmMgYW5kIGNvbnRhaW4gc29tZQo+IGxpbWl0YXRpb25zIGZvciB0aGUgdGltZSBiZWluZzoKPiAg
ICAgIC0gU3VwZXJwYWdlIGNhbm5vdCBiZSBzaGF0dGVyZWQKPiAgICAgIC0gT25seSBsZXZlbCAz
IChpLmUgNEtCKSBjYW4gYmUgZG9uZQo+IAo+IE5vdGUgdGhhdCB0aGUgcGFyYW1ldGVyICdhZGRy
JyBoYXMgYmVlbiByZW5hbWVkIHRvICd2aXJ0JyB0byBtYWtlIGNsZWFyCj4gd2UgYXJlIGRlYWxp
bmcgd2l0aCBhIHZpcnR1YWwgYWRkcmVzcy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3Jh
bGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgo+IC0tLQoKUmV2aWV3ZWQtYnk6IEFuZHJpaSBBbmlz
b3YgPGFuZHJpaV9hbmlzb3ZAZXBhbS5jb20+CgotLSAKU2luY2VyZWx5LApBbmRyaWkgQW5pc292
LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
