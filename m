From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: [RFC 11/16] irq: skip action avalability check for
 guest's IRQ
Date: Wed, 12 Dec 2018 15:51:23 +0200
Message-ID: <934f091c-234c-9bd6-52bc-2e78f9de4e17@gmail.com>
References: <1543440731-21947-1-git-send-email-andrii.anisov@gmail.com>
 <1543440731-21947-12-git-send-email-andrii.anisov@gmail.com>
 <3be90d82-cdcd-b3d5-c734-6da90ecd7344@arm.com>
 <c7678ede-86c5-f742-e749-acc4841d7481@gmail.com>
 <17e191b5-7252-c1d7-1f0f-39f98fdb9895@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=X41P=OV=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1gX4vA-0001rD-5E
 for xen-devel@lists.xenproject.org; Wed, 12 Dec 2018 13:51:28 +0000
Received: by mail-lj1-x241.google.com with SMTP id u6-v6so16349237ljd.1
 for <xen-devel@lists.xenproject.org>; Wed, 12 Dec 2018 05:51:27 -0800 (PST)
In-Reply-To: <17e191b5-7252-c1d7-1f0f-39f98fdb9895@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>, Andrii Anisov <andrii_anisov@epam.com>
List-Id: xen-devel@lists.xenproject.org

SnVsaWVuLAoKCk9uIDEyLjEyLjE4IDEzOjU5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gQW4gQVNT
RVJUKC4uLikgaXMgYWxyZWFkeSBlbWJlZCBpbiBpcnFfZ2V0X2d1ZXN0X2luZm8oZGVzYykuClll
cC4KCj4gSSB0aG91Z2h0IGFib3V0IHRoZSBBU1NFUlQoLi4uKSBvdmVyIHRoZSBjdXJyZW50IHBy
aW50ayB5ZXN0ZXJkYXkuIEJ1dCBJIGRpc2NhcmRlZCBpdCBiZWNhdXNlIGl0IGRvZXMgbm90IGdp
dmUgeW91IG1vcmUgaW5mb3JtYXRpb24gaWYgc29tZXRoaW5nIHdlbnQgcmVhbGx5IHdyb25nIGFz
IHRoZSBzdGFjayB0cmFjZSB3b3VsZCBub3QgcmVhbGx5IGJlIGhlbHBmdWwgaW4gdGhhdCBjb250
ZXh0LgpCdXQgQVNTRVJUIGFsc28gcHJpbnRzIGEgZmFpbGVkIGNvbmRpdGlvbiB0ZXh0LgoKPiBT
byBJIHdvdWxkIHByZWZlciB0aGUgI2lmZGVmIE5ERUJVRyBzb2x1dGlvbi4KSSdtIGEgYml0IGNv
bmZ1c2VkIGFib3V0IHlvdXIgc3VnZ2VzdGlvbi4KRG8geW91IHdhbnQgdG8gc2VlIHR3byBpZGVu
dGljYWwgcGllY2VzIG9mIGNvZGUgYmVmb3JlIGFuZCBhZnRlciB0aGUgYGlmICggdGVzdF9iaXQo
X0lSUV9HVUVTVCwgJmRlc2MtPnN0YXR1cykgKWA/IE9uZSB3aXRoIGAjaWZuZGVmIE5ERUJVR2As
IG90aGVyIHdpdGhvdXQuCklzIG15IHVuZGVyc3RhbmRpbmcgY29ycmVjdD8KCgotLSAKU2luY2Vy
ZWx5LApBbmRyaWkgQW5pc292LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
