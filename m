From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: [PATCH for-next] xen/arm: irq: Don't use
 _IRQ_PENDING when handling host interrupt
Date: Fri, 5 Apr 2019 17:59:53 +0300
Message-ID: <294d08cf-de0b-35cd-42a4-1571f7ae53b4@gmail.com>
References: <20190128155909.14289-1-julien.grall@arm.com>
 <f916ec14-a1bd-c4bd-0287-655cfb831d89@gmail.com>
 <8dec40f1-3b28-d178-13e9-f0dbcde8b7c2@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=awEa=SH=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hCQJy-0001y9-4Q
 for xen-devel@lists.xenproject.org; Fri, 05 Apr 2019 14:59:58 +0000
Received: by mail-lj1-x243.google.com with SMTP id l7so5541406ljg.6
 for <xen-devel@lists.xenproject.org>; Fri, 05 Apr 2019 07:59:57 -0700 (PDT)
In-Reply-To: <8dec40f1-3b28-d178-13e9-f0dbcde8b7c2@arm.com>
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
Cc: andre.przywara@arm.com, sstabellini@kernel.org
List-Id: xen-devel@lists.xenproject.org

SGVsbG8gSnVsaWVuLAoKT24gMDUuMDQuMTkgMTc6MzQsIEp1bGllbiBHcmFsbCB3cm90ZToKPiBJ
dCBpcyBpbiBjb21tb24gaGVhZGVyIGFuZCB1c2VkIGJ5IHg4Ni4gSXQgaXMgcHJlZmVyYWJsZSB0
byBrZWVwIGFsbCBJUlEgZmxhZ3MgYXQgdGhlIHNhbWUgcGxhY2UgaGVuY2Ugd2h5IHRoaXMgd2Fz
IG5vdCBtb3ZlZCBpbiBhcmNoLXNwZWNpZmljIGhlYWRlci4KQWgsIHllcywgc3VyZS4KClJldmll
d2VkLWJ5OiBBbmRyaWkgQW5pc292IDxhbmRyaWlfYW5pc292QGVwYW0uY29tPgoKLS0gClNpbmNl
cmVseSwKQW5kcmlpIEFuaXNvdi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
