From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: [PATCH 4/8] xen/arm: Add support for read-only
 foreign mappings
Date: Thu, 15 Nov 2018 15:19:03 +0200
Message-ID: <CAC1Wxdib6qQk=iH9ODr9XuJo39bvY+4RJUXFHsurW77AqekHDg@mail.gmail.com>
References: <20181106191454.22143-1-julien.grall@arm.com>
 <20181106191454.22143-5-julien.grall@arm.com>
 <CAC1WxdhvbNCfnaj=1pFJmqu-kwMuvvrW77FjOK22xAvaUAPqTA@mail.gmail.com>
 <27feb9a3-ad1b-aed9-7821-6367a3157ce9@arm.com>
 <CAC1Wxdhy1Dnh3_rLFSX0Uj8e4+BLsfWqCQc__U8+bSwd+pCSHg@mail.gmail.com>
 <f9d4248e-485d-e3a8-88bd-6fab6cabe313@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=abz7=n2=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1gNHYC-00032c-KI
 for xen-devel@lists.xenproject.org; Thu, 15 Nov 2018 13:19:16 +0000
Received: by mail-ot1-x344.google.com with SMTP id g27so17978370oth.6
 for <xen-devel@lists.xenproject.org>; Thu, 15 Nov 2018 05:19:15 -0800 (PST)
In-Reply-To: <f9d4248e-485d-e3a8-88bd-6fab6cabe313@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

PiBTbyBJIHdvdWxkIHByZWZlciB0byBzdGljayB3aXRoIF90IHdoaWNoIGlzIHF1aXRlIGNvbW1v
biB3aXRoaW4gdGhlIHAybQo+IGNvZGUgYmFzZSBzbyBmYXIuCgpJJ3ZlIGZvdW5kIGEgc2ltaWxh
ciBjb2RlIG9ubHkgaW4gb25lIHBsYWNlIC0gcDJtX2dldF9lbnRyeSgpCmZ1bmN0aW9uLiBBbmQg
aXQgaXMsIGF0IGxlYXN0LCBzb21laG93IGNvbW1lbnRlZCB0aGVyZToKLi4uCiAgICAvKiBBbGxv
dyB0IHRvIGJlIE5VTEwgKi8KICAgIHQgPSB0ID86ICZfdDsKCiAgICAqdCA9IHAybV9pbnZhbGlk
OwouLi4KCkJ1dCBJTU8sIGl0IGlzIHJlYWxseSBjb25mdXNpbmcgdG8gd3JpdGUgYSBjb2RlIHRv
IGNhbGN1bGF0ZSBhbmQgc3RvcmUKYSB2YWx1ZSB3aGljaCBjbGVhcmx5IGlzIG5vdCBuZWVkZWQg
YnkgYSBjYWxsZXIuCkZyb20gYW5vdGhlciBoYW5kLCBJJ20gbm90IHN1cmUgaWYgYSBjb21waWxl
ciB3b3VsZCBiZSBpbnRlbGxpZ2VudAplbm91Z2ggdG8gZmFjdG9yIG91dCB0aGUgb2RkIGNvZGUg
ZnJvbSBleGVjdXRpb24gcGFzcyBvbiB0aGUgaW5jb21pbmcKbnVsbCBwb2ludGVyLgoKSSdtIHNv
cnJ5LCBidXQgSSBjYW4ndCBwYXNzIG15IFJCIGZvciBgX3RgLgoKU2luY2VyZWx5LApBbmRyaWkg
QW5pc292LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
