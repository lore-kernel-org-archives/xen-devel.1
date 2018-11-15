From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: [PATCH 4/8] xen/arm: Add support for read-only
 foreign mappings
Date: Thu, 15 Nov 2018 13:33:32 +0200
Message-ID: <CAC1WxdhvbNCfnaj=1pFJmqu-kwMuvvrW77FjOK22xAvaUAPqTA@mail.gmail.com>
References: <20181106191454.22143-1-julien.grall@arm.com>
 <20181106191454.22143-5-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=abz7=n2=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1gNFu4-0000Zu-8r
 for xen-devel@lists.xenproject.org; Thu, 15 Nov 2018 11:33:44 +0000
Received: by mail-oi1-x243.google.com with SMTP id 192-v6so16461632oii.6
 for <xen-devel@lists.xenproject.org>; Thu, 15 Nov 2018 03:33:43 -0800 (PST)
In-Reply-To: <20181106191454.22143-5-julien.grall@arm.com>
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

SGVsbG8gSnVsaWVuLAoK0LLRgiwgNiDQu9C40YHRgi4gMjAxOCDQviAyMToxNiBKdWxpZW4gR3Jh
bGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPiDQv9C40YjQtToKPiBAQCAtMjc1LDcgKzI4MCwzOCBA
QCBzdHJ1Y3QgcGFnZV9pbmZvICpwMm1fZ2V0X3BhZ2VfZnJvbV9nZm4oc3RydWN0IGRvbWFpbiAq
ZCwgZ2ZuX3QgZ2ZuLAo+ICBzdGF0aWMgaW5saW5lIHN0cnVjdCBwYWdlX2luZm8gKmdldF9wYWdl
X2Zyb21fZ2ZuKAo+ICAgICAgc3RydWN0IGRvbWFpbiAqZCwgdW5zaWduZWQgbG9uZyBnZm4sIHAy
bV90eXBlX3QgKnQsIHAybV9xdWVyeV90IHEpCj4gIHsKPiAtICAgIHJldHVybiBwMm1fZ2V0X3Bh
Z2VfZnJvbV9nZm4oZCwgX2dmbihnZm4pLCB0KTsKPiArICAgIG1mbl90IG1mbjsKPiArICAgIHAy
bV90eXBlX3QgX3Q7CgpNZSBwZXJzb25hbGx5LCBkbyBub3QgbGlrZSBpbnRyb2R1Y2luZyBpbnRl
cm1lZGlhdGUgYF90YCB2YXJpYWJsZS4KSU1PLCBjb25zdHJ1Y3RzIGxpa2UgZm9sbG93aW5nOgoK
PiArICAgIGlmICggIXQgKQo+ICsgICAgICAgIHQgPSAmX3Q7Cj4gKwo+ICsgICAgKnQgPSBwMm1f
aW52YWxpZDsKCm1ha2UgdGhlIGNvZGUgaGFyZGVyIHRvIHVuZGVyc3RhbmQgdGhhbiBzaW1wbGUg
Y2hlY2tpbmcgYHRgIGZvciBudWwKYmVmb3JlIGFzc2lnbmluZyBpdCBhCnZhbHVlLgoKU2luY2Vy
ZWx5LApBbmRyaWkgQW5pc292LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
