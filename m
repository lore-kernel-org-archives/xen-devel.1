From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: [PATCH 03/20] xen/arm: processor: Use _BITUL
 instead of _AC(1, U) in SCTLR_ defines
Date: Fri, 3 May 2019 19:12:38 +0300
Message-ID: <bdd2418a-1009-54f9-8a76-91012b8180aa@gmail.com>
References: <20190422164937.21350-1-julien.grall@arm.com>
 <20190422164937.21350-4-julien.grall@arm.com>
 <450df8f5-676d-9b1d-814a-1888342bdacf@gmail.com>
 <a37467fd-d9b0-f8e4-e211-6e6160df645d@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=COEE=TD=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hManj-0002NM-EX
 for xen-devel@lists.xenproject.org; Fri, 03 May 2019 16:12:43 +0000
Received: by mail-lj1-x243.google.com with SMTP id q10so5694479ljc.6
 for <xen-devel@lists.xenproject.org>; Fri, 03 May 2019 09:12:42 -0700 (PDT)
In-Reply-To: <a37467fd-d9b0-f8e4-e211-6e6160df645d@arm.com>
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
Cc: Oleksandr_Tyshchenko@epam.com, sstabellini@kernel.org, Andrii_Anisov@epam.com
List-Id: xen-devel@lists.xenproject.org

CgpPbiAwMy4wNS4xOSAxOTowOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEkgZG9uJ3QgdW5kZXJz
dGFuZCB3aGF0IGlzIHlvdXIgInNlY29uZCIuIERvZXMgaXQgbWVhbiB5b3UgYXJlIGhhcHB5IHdp
dGggdGhlIGlkZWEgb2YgdGhlIHBhdGNoIGJ1dCB3ZSBzaG91bGQgYWdyZWUgb24gdGhlIG5hbWlu
ZyBmaXJzdD8KClllcywgcmlnaHQgeW91IGFyZS4KU29ycnkgZm9yIHRoZSBtZXNzLgoKLS0gClNp
bmNlcmVseSwKQW5kcmlpIEFuaXNvdi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
