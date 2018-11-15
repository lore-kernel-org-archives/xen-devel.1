From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: [PATCH 4/8] xen/arm: Add support for read-only
 foreign mappings
Date: Thu, 15 Nov 2018 14:02:44 +0200
Message-ID: <CAC1Wxdhy1Dnh3_rLFSX0Uj8e4+BLsfWqCQc__U8+bSwd+pCSHg@mail.gmail.com>
References: <20181106191454.22143-1-julien.grall@arm.com>
 <20181106191454.22143-5-julien.grall@arm.com>
 <CAC1WxdhvbNCfnaj=1pFJmqu-kwMuvvrW77FjOK22xAvaUAPqTA@mail.gmail.com>
 <27feb9a3-ad1b-aed9-7821-6367a3157ce9@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=abz7=n2=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1gNGML-0003v7-1w
 for xen-devel@lists.xenproject.org; Thu, 15 Nov 2018 12:02:57 +0000
Received: by mail-ot1-x344.google.com with SMTP id u3so12689952ota.5
 for <xen-devel@lists.xenproject.org>; Thu, 15 Nov 2018 04:02:55 -0800 (PST)
In-Reply-To: <27feb9a3-ad1b-aed9-7821-6367a3157ce9@arm.com>
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

0YfRgiwgMTUg0LvQuNGB0YIuIDIwMTgg0L4gMTM6NDAgSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3Jh
bGxAYXJtLmNvbT4g0L/QuNGI0LU6Cj4gSWYgSSBkcm9wIF90IHRoZW4gSSBuZWVkIHRvIGFkZCBp
ZiAoICp0ICkgaW4gMyBwbGFjZXMgaW4gdGhhdCBjb2RlLiBTbyBJCj4gZG9uJ3QgdGhpbmsgdGhl
IGFwcHJvYWNoIGlzIGFueSBiZXR0ZXIuCk91Y2gsIEkga2VwdCBpbiBteSBtaW5kIHR3byBwbGFj
ZXMuCgpTb21ldGhpbmcgbGlrZToKCmlmICggdCApCiAgICAqdCA9IHAybV9pbnZhbGlkOwouLi4u
CmlmICggdCApCiAgICAqdCA9ICggcGFnZS0+dS5pbnVzZS50eXBlX2luZm8gJiBQR1Rfd3JpdGFi
bGVfcGFnZSApID8gcDJtX3JhbV9ydwo6IHAybV9yYW1fcm87Ci4uLi4uCgpTaW5jZXJlbHksCkFu
ZHJpaSBBbmlzb3YuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
