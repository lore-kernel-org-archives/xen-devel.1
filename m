From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH for-next] xen/arm: irq: Don't use
 _IRQ_PENDING when handling host interrupt
Date: Fri, 5 Apr 2019 15:34:58 +0100
Message-ID: <8dec40f1-3b28-d178-13e9-f0dbcde8b7c2@arm.com>
References: <20190128155909.14289-1-julien.grall@arm.com>
 <f916ec14-a1bd-c4bd-0287-655cfb831d89@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NmJK=SH=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hCPvq-0000JB-R3
 for xen-devel@lists.xenproject.org; Fri, 05 Apr 2019 14:35:02 +0000
In-Reply-To: <f916ec14-a1bd-c4bd-0287-655cfb831d89@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrii Anisov <andrii.anisov@gmail.com>, xen-devel@lists.xenproject.org
Cc: andre.przywara@arm.com, sstabellini@kernel.org
List-Id: xen-devel@lists.xenproject.org

CgpPbiAwNS8wNC8yMDE5IDE1OjE2LCBBbmRyaWkgQW5pc292IHdyb3RlOgo+IE9uIDI4LjAxLjE5
IDE3OjU5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IFdoaWxlIFNQSXMgYXJlIHNoYXJlZCBiZXR3
ZWVuIENQVSwgaXQgaXMgbm90IHBvc3NpYmxlIHRvIHJlY2VpdmUgdGhlCj4+IHNhbWUgaW50ZXJy
dXB0cyBvbiBhIGRpZmZlcmVudCBDUFUgd2hpbGUgdGhlIGludGVycnVwdCBpcyBpbiBhY3RpdmUK
Pj4gc3RhdGUuIFRoZSBkZWFjdGl2YXRpb24gb2YgdGhlIGludGVycnVwdCBpcyBkb25lIGF0IHRo
ZSBlbmQgb2YgdGhlCj4+IGhhbmRsaW5nLgo+Pgo+PiBUaGlzIG1lYW5zIHRoZSBfSVJRX1BFTkRJ
TkcgbG9naWMgaXMgdW5lY2Vzc2FyeSBvbiBBcm0gYXMgYSBzYW1lCj4+IGludGVycnVwdCBjYW4g
bmV2ZXIgY29tZSB1cCB3aGlsZSBpbiB0aGUgbG9vcC4gU28gcmVtb3ZlIGl0IHRvCj4+IHNpbXBs
aWZ5IHRoZSBpbnRlcnJ1cHQgaGFuZGxlIGNvZGUuCj4gCj4gV2hhdCBhYm91dCBfSVJRX1BFTkRJ
TkcgbWFjcm8gaXRzZWxmPwo+IEFueSByZWFzb25zIHRvIG5vdCBlbGltaW5hdGUgaXQ/CgpJdCBp
cyBpbiBjb21tb24gaGVhZGVyIGFuZCB1c2VkIGJ5IHg4Ni4gSXQgaXMgcHJlZmVyYWJsZSB0byBr
ZWVwIGFsbCBJUlEgZmxhZ3MgCmF0IHRoZSBzYW1lIHBsYWNlIGhlbmNlIHdoeSB0aGlzIHdhcyBu
b3QgbW92ZWQgaW4gYXJjaC1zcGVjaWZpYyBoZWFkZXIuCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdy
YWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
