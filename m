From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: [PATCH 2/7] xen/arm: Remove
 flush_xen_text_tlb_local()
Date: Fri, 26 Apr 2019 17:15:19 +0300
Message-ID: <eb656a28-7910-c65a-bf50-1c62494f5acd@gmail.com>
References: <20190417175815.16905-1-julien.grall@arm.com>
 <20190417175815.16905-3-julien.grall@arm.com>
 <3fa56715-823e-985b-384c-dc8342d77364@gmail.com>
 <fb22f2a1-f3a6-a962-a9ba-54c22e5c7d2a@arm.com>
 <4e365b84-122d-e613-ceaa-e2df8c865262@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TPdi=S4=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hK1dM-0003VT-DV
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2019 14:15:24 +0000
Received: by mail-lj1-x242.google.com with SMTP id k2so3046727lje.10
 for <xen-devel@lists.xenproject.org>; Fri, 26 Apr 2019 07:15:23 -0700 (PDT)
In-Reply-To: <4e365b84-122d-e613-ceaa-e2df8c865262@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <Julien.Grall@arm.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "Oleksandr_Tyshchenko@epam.com" <Oleksandr_Tyshchenko@epam.com>, nd <nd@arm.com>, "Andrii_Anisov@epam.com" <Andrii_Anisov@epam.com>, "sstabellini@kernel.org" <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

SnVsaWVuLAoKU29ycnksIHJlcGx5IGZvcm1hdCBpcyBicm9rZW4uIEl0IHNob3VsZCBiZSBhcyBm
b2xsb3dpbmc6CgpPbiAyNi4wNC4xOSAxNjo1MCwgQW5kcmlpIEFuaXNvdiB3cm90ZToKPj4gVG8g
YmUgaG9uZXN0LCBJIGFtIG5vdCBlbnRpcmVseSBzdXJlIHdoZXRoZXIgdGhlIGlzYigpIGlzIG5l
Y2Vzc2FyeQo+PiBoZXJlLiBBdCB3b3JzdCwgYW4gZW50cnkgb2YgYW4gZXhpc3RpbmcgbWFwcGlu
Z3MgaXMgbm90IGNhY2hlZCB3aXRoIHRoZQo+PiBTQ1RMUl9FTDIuV1hOIHNldC4gVGhpcyBtYXkg
b25seSBkZWZlciB0aGUgcHJvYmxlbSBpcyBhbiBlbnRyeSBpcwo+PiBpbmNvcnJlY3RseSBjb25m
aWd1cmVkIGJlZm9yZSB0aGUgZmx1c2guIFRoaXMgaXMgZG9uZSBlYXJseSBhdCBib290IChhbmQK
Pj4gd2lsbCBiZSBkb25lIG11Y2ggZWFybGllciBpbiBbMV0pLgoKCldlbGwsIGZvbGxvd2luZyB0
aGlzIGxvZ2ljIHdlIG1heSBmaW5pc2ggd2l0aCBUTEIgZmx1c2ggaXMgbm90IG5lZWRlZCBoZXJl
IGF0IGFsbC4gQmVjYXVzZSBlbnRyaWVzLCBhbHJlYWR5IHJlYWNoZWQgVExCLCB3ZXJlIGNvbmZp
Z3VyZWQgYmVmb3JlLCBhbmQgYXJlIGJlbGlldmVkIHZhbGlkLiBBbGwgdGhlIG5leHQgd2lsbCBo
YXZlIFdYTiBzZXQuCkJ1dCBpbiB0aGlzIGNhc2UsIElTQiBpcyBuZWVkZWQgYXMgYW4gZXhhY3Qg
cG9pbnQgZnJvbSB3aGljaCBhbGwgbmV3IFRMQiBlbnRyaWVzIHdpbGwgaGF2ZSBXWE4uCgoKPj4g
U28gSSBhbSBraW5kIG9mIHRlbXB0ZWQgdG8gZHJvcCB0aGUKPj4gaXNiKCkgaGVyZS4KCi0tIApT
aW5jZXJlbHksCkFuZHJpaSBBbmlzb3YuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
