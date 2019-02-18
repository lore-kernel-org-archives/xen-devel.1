From: Oleksandr <olekstysh@gmail.com>
Subject: Re: [PATCH V2 3/3] xen/arm: Add SCIFA UART support for
 early printk
Date: Mon, 18 Feb 2019 22:41:44 +0200
Message-ID: <7fb34ed2-f763-938c-0884-844d1fbe1127@gmail.com>
References: <1549024652-24805-1-git-send-email-olekstysh@gmail.com>
 <1549024652-24805-4-git-send-email-olekstysh@gmail.com>
 <c3ae0a46-8418-c426-c87a-96f30730bbda@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ity+=QZ=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1gvpjY-0001XY-EB
 for xen-devel@lists.xenproject.org; Mon, 18 Feb 2019 20:41:48 +0000
Received: by mail-lj1-x241.google.com with SMTP id s5-v6so15450969ljd.12
 for <xen-devel@lists.xenproject.org>; Mon, 18 Feb 2019 12:41:47 -0800 (PST)
In-Reply-To: <c3ae0a46-8418-c426-c87a-96f30730bbda@arm.com>
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
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

Ck9uIDE4LjAyLjE5IDE2OjA1LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSGksCgoKSGkKCgo+Cj4g
T24gMDEvMDIvMjAxOSAxMjozNywgT2xla3NhbmRyIFR5c2hjaGVua28gd3JvdGU6Cj4+IEZyb206
IE9sZWtzYW5kciBUeXNoY2hlbmtvIDxvbGVrc2FuZHJfdHlzaGNoZW5rb0BlcGFtLmNvbT4KPj4K
Pj4gQWRkIHN1cHBvcnQgZm9yIFJlbmVzYXMgIlN0b3V0IiBkZXZlbG9wbWVudCBib2FyZCBiYXNl
ZCBvbgo+PiBSLUNhciBIMiBTb0Mgd2hpY2ggaGFzIFNDSUZBIGNvbXBhdGlibGUgVUFSVC4KPj4K
Pj4gQWN0dWFsbHkgZXhpc3RpbmcgU0NJRiBVQVJUIHN1cHBvcnQgKGRlYnVnLXNjaWYuaW5jKSBh
bmQKPj4gbmV3bHkgYWRkZWQgU0NJRkEgVUFSVCBzdXBwb3J0IChkZWJ1Zy1zY2lmYS5pbmMpIGRp
ZmZlciBvbmx5Cj4+IGluIHJlZ2lzdGVycyBvZmZzZXRzLgo+Cj4gQ2FuIHdlIHRyeSB0byBtZXJn
ZSB0aGUgdHdvIHRoZW4/IE9uZSBzb2x1dGlvbiBpcyB0byBwcm92aWRlIGFub3RoZXIgCj4gb3B0
aW9ucyBzaW1pbGFyIHRvIGhvdyB3ZSBkZWFsIHdpdGggUkVHX1NISUZUIG9uIHRoZSA4MjUwLgoK
CkFjdHVhbGx5LCB0aGUgbWFpbiBkaWZmZXJlbmNlIGZvciB0aGUgImVhcmx5IHByaW50ayIgc3Vw
cG9ydCBpcyBpbiB0d28gCnJlZyBvZmZzZXRzOgoKKyNkZWZpbmUgU0NJRkFfU0NBU1NSwqDCoCAw
eDE0wqDCoMKgIC8qIFNlcmlhbCBzdGF0dXMgcmVnaXN0ZXIgKi8KKyNkZWZpbmUgU0NJRkFfU0NB
RlREUsKgIDB4MjDCoMKgwqAgLyogVHJhbnNtaXQgRklGTyBkYXRhIHJlZ2lzdGVyICovCgorI2Rl
ZmluZSBTQ0lGX1NDRlNSwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDB4MTDCoMKgwqAgLyogU2Vy
aWFsIHN0YXR1cyByZWdpc3RlciAqLworI2RlZmluZSBTQ0lGX1NDRlREUsKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgMHgwY8KgwqDCoCAvKiBUcmFuc21pdCBGSUZPIGRhdGEgcmVnaXN0ZXIgKi8KCgpJ
IGFtIG5vdCBtaXN0YWtlbiwgd2Ugd2lsbCBoYXZlIHRvIGludHJvZHVjZSB0d28gb3B0aW9ucyB0
byBjb3ZlciB0aGlzIApjYXNlLCBhcyB0aGUgb2Zmc2V0cyBhcmUgbm90IGNvcnJlbGF0ZWQgd2l0
aCBlYWNoIG90aGVyLCBubz8KCgo+Cj4gQ2hlZXJzLAo+Ci0tIApSZWdhcmRzLAoKT2xla3NhbmRy
IFR5c2hjaGVua28KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
