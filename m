From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: [PATCH MM-PART2 RESEND v2 04/19] xen/arm: Rework
 HSCTLR_BASE
Date: Thu, 30 May 2019 19:17:10 +0300
Message-ID: <db46cc3c-23cf-671d-3b4e-2b188f1dd985@gmail.com>
References: <20190514122456.28559-1-julien.grall@arm.com>
 <20190514122456.28559-5-julien.grall@arm.com>
 <alpine.DEB.2.21.1905201451570.16404@sstabellini-ThinkPad-T480s>
 <b5d35a7b-1ada-8e9f-3162-02891b2c5781@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dPnK=T6=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hWNjx-0005jY-N5
 for xen-devel@lists.xenproject.org; Thu, 30 May 2019 16:17:17 +0000
Received: by mail-lj1-x244.google.com with SMTP id j24so6672698ljg.1
 for <xen-devel@lists.xenproject.org>; Thu, 30 May 2019 09:17:16 -0700 (PDT)
In-Reply-To: <b5d35a7b-1ada-8e9f-3162-02891b2c5781@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Andrii_Anisov@epam.com, Oleksandr_Tyshchenko@epam.com
List-Id: xen-devel@lists.xenproject.org

CgpPbiAyMS4wNS4xOSAxMzowOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpLAo+IAo+IE9uIDUv
MjAvMTkgMTE6NTYgUE0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPj4gT24gVHVlLCAxNCBN
YXkgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+Pj4gVGhlIGN1cnJlbnQgdmFsdWUgb2YgSFND
VExSX0JBU0UgZm9yIEFybTY0IGlzIHByZXR0eSB3cm9uZy4gSXQgd291bGQKPj4+IGFjdHVhbGx5
IHR1cm4gb24gU0NUTFJfRUwyLm5BQSAoYml0IDYpIG9uIGhhcmR3YXJlIGltcGxlbWVudGluZwo+
Pj4gQVJNdjguNC1MU0UuCj4+Pgo+Pj4gRnVydGhlcm1vcmUsIHRoZSBkb2N1bWVudGF0aW9uIG9m
IHdoYXQgaXMgY2xlYXJlZC9zZXQgaW4gU0NUTFJfRUwyIGlzCj4+PiBhbHNvIG5vdCBjb3JyZWN0
IGFuZCBsb29rcyBsaWtlIHRvIGJlIGEgdmVyYmF0aW0gY29weSBmcm9tIEFybTMyLgo+Pj4KPj4+
IEhTQ1RMUl9CQVNFIGlzIHJlcGxhY2VkIHdpdGggYSBidW5jaCBvZiBwZXItYXJjaGl0ZWN0dXJl
IG5ldyBkZWZpbmVzCj4+PiBoZWxwaW5nIHRvIHVuZGVyc3RhbmQgYmV0dGVyIHdoYXQgaXMgdGhl
IGluaXRpYWxpZSB2YWx1ZSBmb3IKPiAKPiBzL2luaXRpYWxpZS9pbml0aWFsLwo+IAo+Pj4gTGFz
dGx5LCB0aGUgZG9jdW1lbnRhdGlvbiBpcyBkcm9wcGVkIGZyb20gYXJtezMyLDY0fS9oZWFkLlMg
YXMgaXQgd291bGQKPj4+IGJlIHByZXR0eSBlYXN5IHRvIGdldCBvdXQtb2Ytc3luYyB3aXRoIHRo
ZSBkZWZpbml0aW9ucy4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGll
bi5ncmFsbEBhcm0uY29tPgoKRldJVywgd2l0aCBtaXNwcmludCBmaXhlZAoKUmV2aWV3ZWQtYnk6
IEFuZHJpaSBBbmlzb3YgPGFuZHJpaV9hbmlzb3ZAZXBhbS5jb20+CgotLSAKU2luY2VyZWx5LApB
bmRyaWkgQW5pc292LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
