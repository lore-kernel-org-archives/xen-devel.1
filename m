From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: [PATCH MM-PART2 RESEND v2 12/19] xen/arm32: head:
 Always zero r3 before update a page-table entry
Date: Tue, 21 May 2019 13:03:51 +0300
Message-ID: <8a0ff5b0-f674-e65f-f304-3673d45ca212@gmail.com>
References: <20190514122456.28559-1-julien.grall@arm.com>
 <20190514122456.28559-13-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wdSZ=TV=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hT1ci-0003SJ-5J
 for xen-devel@lists.xenproject.org; Tue, 21 May 2019 10:03:56 +0000
Received: by mail-lj1-x244.google.com with SMTP id a10so15315566ljf.6
 for <xen-devel@lists.xenproject.org>; Tue, 21 May 2019 03:03:54 -0700 (PDT)
In-Reply-To: <20190514122456.28559-13-julien.grall@arm.com>
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
Cc: Oleksandr_Tyshchenko@epam.com, Stefano Stabellini <sstabellini@kernel.org>, Andrii_Anisov@epam.com
List-Id: xen-devel@lists.xenproject.org

CgpPbiAxNC4wNS4xOSAxNToyNCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IFRoZSBib290IGNvZGUg
aXMgdXNpbmcgcjIgYW5kIHIzIHRvIGhvbGQgdGhlIHBhZ2UtdGFibGUgZW50cnkgdmFsdWUuCj4g
V2hpbGUgcjIgaXMgYWx3YXlzIHVwZGF0ZWQgYmVmb3JlIHN0b3JpbmcgdGhlIHZhbHVlLCB0aGlz
IGlzIG5vdCBhbHdheXMKPiB0aGUgY2FzZSBmb3IgcjMuCj4gCj4gVGhhbmtmdWxseSB0b2RheSwg
cjMgd2lsbCBhbHdheXMgYmUgemVybyB3aGVuIHdlIGNhcmUuIEJ1dCB0aGlzIGlzCj4gZGlmZmlj
dWx0IHRvIHRyYWNrIGFuZCBlcnJvci1wcm9uZS4KPiAKPiBTbyBhbHdheXMgemVybyByMyB3aXRo
aW4gdGhlIGZldyBpbnN0cnVjdGlvbnMgYmVmb3JlIHRoZSB3cml0ZSB0aGUKPiBwYWdlLXRhYmxl
IGVudHJ5Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFy
bS5jb20+Cj4gCj4gLS0tCj4gICAgICBDaGFuZ2VzIGluIHYyOgo+ICAgICAgICAgIC0gVXNlIDB4
MCBpbnN0ZWFkIG9mIDAKPiAgICAgICAgICAtIFJlbW92ZSBhIGR1cGxpY2F0ZSBtb3YgcjMsICMw
Cj4gLS0tCgoKUmV2aWV3ZWQtYnk6IEFuZHJpaSBBbmlzb3YgPGFuZHJpaV9hbmlzb3ZAZXBhbS5j
b20+CgotLSAKU2luY2VyZWx5LApBbmRyaWkgQW5pc292LgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
