From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: [PATCH] gic:vgic: avoid excessive conversions
Date: Mon, 19 Nov 2018 17:48:31 +0200
Message-ID: <1046e6f5-1608-0d94-8bfd-668fe21cf5e3@gmail.com>
References: <1542386727-30311-1-git-send-email-andrii.anisov@gmail.com>
 <fb41738a-282e-a633-ff60-ac3fca664cee@arm.com>
 <81077db3-73a0-6037-cb20-a5dd1510c95e@gmail.com>
 <CAF3u54Agc7Yw5KRfaiLdP7pb06_Pj-RcajD+VUFsQJCwMyb7TA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=sool=n6=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1gOlmt-0001Pa-VW
 for xen-devel@lists.xenproject.org; Mon, 19 Nov 2018 15:48:36 +0000
Received: by mail-ed1-x532.google.com with SMTP id f23so16552969edb.3
 for <xen-devel@lists.xenproject.org>; Mon, 19 Nov 2018 07:48:34 -0800 (PST)
In-Reply-To: <CAF3u54Agc7Yw5KRfaiLdP7pb06_Pj-RcajD+VUFsQJCwMyb7TA@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@gmail.com>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Andrii Anisov <andrii_anisov@epam.com>
List-Id: xen-devel@lists.xenproject.org

Ck9uIDE5LjExLjE4IDE1OjU0LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gWW91IGRpZG4ndCBnZXQg
bXkgcG9pbnQuIFlvdSByZW1vdmVkIGEgcGFyYW1ldGVyIHdpdGhvdXQgZXhwbGFpbmluZyAKPiB3
aHkgaXQgaXMgZmluZS4KCkl0IGlzIGEgcHVyZSBvcHRpbWl6YXRpb24uIElmIHlvdSBsb29rIHRo
cm91Z2ggdGhlIGNvZGUsIHlvdSBjYW4gc2VlIAp0aGF0IGNhbGxlcnMgb2YgdGhlc2UgZnVuY3Rp
b25zIGFscmVhZHkgaGF2ZSBhIGNvcnJlc3BvbmRlbnQgYHN0cnVjdCAKcGVuZGluZ19pcnFgIHBv
aW50ZXIuIEJ1dCB0aGV5IHBhc3MgaXJxIG51bWJlciAoYW5kIHByaW9yaXR5KSB0byAKZ2ljX3Jh
aXNlX2d1ZXN0X2lycS9naWNfcmFpc2VfaW5mbGlnaHRfaXJxIHNvIHRoYXQgdGhleSBzaG91bGQg
Y2FsY3VsYXRlIAp0aGUgcG9pbnRlciBhZ2Fpbiwgd2hhdCBpcyBzdWJvcHRpbWFsLgoKCj4gSW4g
dGhhdCBjb250ZXh0LCB0aGUgY2FsbGVyIGZvciBMUEkgaXMgdXNpbmcgbHBpX3ByaW9yaXR5LgpX
aGF0IGluIGl0cyB0dXJuIGlzIG5vdCB0YWtlbiBpbnRvIGNvbnNpZGVyYXRpb24gYnkgdGhlIGN1
cnJlbnQgCmBnaWNfcmFpc2VfZ3Vlc3RfaXJxYCBmdW5jdGlvbiBpbXBsZW1lbnRhdGlvbi4gRXZl
biBjbGVhcmx5IGlnbm9yZWQsIApiZWNhdXNlIHRoZSBwcmlvcml0eSBhYnN0cmFjdGlvbiBpcyBv
bmx5IG5lZWRlZCBieSAKYGdpY19hZGRfdG9fbHJfcGVuZGluZ2AgdG8gaW5zZXJ0IGEgcGVuZGlu
ZyBpcnEgaW50byBgbHJfcXVldWVgLCBidXQgaXQgCmRvZXMgb3JkZXJpbmcgYnkgYHAtPnByaW9y
aXR5YCBvbmx5LgoKPiBXaXRoIHlvdXIgY2hhbmdlLCBpdCBpcyBiZWNvbWluZyBpc3N1ZSB3aXRo
IHRoZSBpbnRlcmZhY2UgYmVjYXVzZSBpdCAKPiBtYXkgbm90IHBhc3MgdGhlIGNvcnJlY3QgdGhp
bmdzLgoKTm93IHRoZSBpbnRlcmZhY2Ugb2YgYGdpY19yYWlzZV9ndWVzdF9pcnFgIGZ1bmN0aW9u
IGNvcnJlc3BvbmRzIHRvIGl0cyAKaW1wbGVtZW50YXRpb24gaW4gYWRkaXRpb24gdG8gb3B0aW1p
emF0aW9uLgoKCj4gU28gdGhpcyBub3QgYSBjbGVhbnVwIGFuZCB0aGVyZSBtdXN0IGJlIGEgcmVh
c29uIHdoeSBscGlfcHJpb3JpdHkgd2FzIAo+IHBhc3NlZCBpbnN0ZWFkIG9mIHByaW9yaXR5LgoK
TW9yZW92ZXIsIGlmIG9uZSB3b3VsZCBsaWtlIG9yIHBsYW4gdG8gaG9ub3IgbHBpX3ByaW9yaXR5
IGluIApgZ2ljX3JhaXNlX2d1ZXN0X2lycWAsIGhlIGNhbiBmcmVlbHkgZXh0cmFjdCBpdCBmcm9t
IGEgcGVuZGluZ19pcnEgCnN0cnVjdHVyZS4gSXQgaXMgc3RpbGwgdGhlcmUuCgoKLS0gCgpTaW5j
ZXJlbHksCkFuZHJpaSBBbmlzb3YuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
