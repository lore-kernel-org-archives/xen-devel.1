From: Oleksandr <olekstysh@gmail.com>
Subject: Re: [PATCH V2 3/3] xen/arm: Add SCIFA UART support for
 early printk
Date: Wed, 20 Feb 2019 20:03:57 +0200
Message-ID: <0839f3bf-384b-ceb6-4412-677575367387@gmail.com>
References: <1549024652-24805-1-git-send-email-olekstysh@gmail.com>
 <1549024652-24805-4-git-send-email-olekstysh@gmail.com>
 <c3ae0a46-8418-c426-c87a-96f30730bbda@arm.com>
 <7fb34ed2-f763-938c-0884-844d1fbe1127@gmail.com>
 <a4f9f1f1-aa25-0faf-4938-78fe396a1ebc@gmail.com>
 <ffc9d12a-0579-bcfd-428b-401524949009@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dYg4=Q3=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1gwWDy-00026Q-Hi
 for xen-devel@lists.xenproject.org; Wed, 20 Feb 2019 18:04:02 +0000
Received: by mail-lj1-x244.google.com with SMTP id a17so5282503ljd.4
 for <xen-devel@lists.xenproject.org>; Wed, 20 Feb 2019 10:04:01 -0800 (PST)
In-Reply-To: <ffc9d12a-0579-bcfd-428b-401524949009@arm.com>
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

Ck9uIDE5LjAyLjE5IDEyOjA5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSGkgT2xla3NhbmRyLAoK
SGkgSnVsaWVuCgoKPj4+Cj4+PiBBY3R1YWxseSwgdGhlIG1haW4gZGlmZmVyZW5jZSBmb3IgdGhl
ICJlYXJseSBwcmludGsiIHN1cHBvcnQgaXMgaW4gCj4+PiB0d28gcmVnIG9mZnNldHM6Cj4+Pgo+
Pj4gKyNkZWZpbmUgU0NJRkFfU0NBU1NSwqDCoCAweDE0wqDCoMKgIC8qIFNlcmlhbCBzdGF0dXMg
cmVnaXN0ZXIgKi8KPj4+ICsjZGVmaW5lIFNDSUZBX1NDQUZURFLCoCAweDIwwqDCoMKgIC8qIFRy
YW5zbWl0IEZJRk8gZGF0YSByZWdpc3RlciAqLwo+Pj4KPj4+ICsjZGVmaW5lIFNDSUZfU0NGU1LC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMHgxMMKgwqDCoCAvKiBTZXJpYWwgc3RhdHVzIHJlZ2lz
dGVyICovCj4+PiArI2RlZmluZSBTQ0lGX1NDRlREUsKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMHgw
Y8KgwqDCoCAvKiBUcmFuc21pdCBGSUZPIGRhdGEgCj4+PiByZWdpc3RlciAqLwo+Pj4KPj4+Cj4+
PiBJIGFtIG5vdCBtaXN0YWtlbiwgd2Ugd2lsbCBoYXZlIHRvIGludHJvZHVjZSB0d28gb3B0aW9u
cyB0byBjb3ZlciAKPj4+IHRoaXMgY2FzZSwgYXMgdGhlIG9mZnNldHMgYXJlIG5vdCBjb3JyZWxh
dGVkIHdpdGggZWFjaCBvdGhlciwgbm8/Cj4KPiBZb3UgZG9uJ3QgbmVlZCB0d28gb3B0aW9ucy4g
Rm9yIGluc3RhbmNlLCB5b3UgY2FuIG9ubHkgaW50cm9kdWNlIGFuIAo+IG9wdGlvbiBTQ0lGX1ZF
UlNJT04gdGhhdCB3b3VsZCBiZSAwIGZvciBTQ0lGIGFuZCA2MSAoYXNjaWkgJ2EnKSBmb3IgCj4g
U0NJRkEuCj4KPiBUaGVuIGluIHRoZSBjb2RlLCB5b3UgY2FuIHVzZSBTQ0lGX1ZFUlNJT04gdG8g
ZGVjaWRlcyB3aGljaCBzZXRzIG9mIAo+IG1hY3JvcyB5b3UgYXJlIHVzaW5nLgoKSSB0aGluayBJ
IHVuZGVyc3RhbmQgdGhlIGlkZWEuIFdpbGwgdHJ5LgoKCi0tIApSZWdhcmRzLAoKT2xla3NhbmRy
IFR5c2hjaGVua28KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
