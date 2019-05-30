From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: [PATCH v2] gic: drop interrupts enabling on
 interrupts processing
Date: Thu, 30 May 2019 19:14:34 +0300
Message-ID: <ab8ec9ce-c602-fe5d-b76b-3ee096a8bf9f@gmail.com>
References: <1558949370-14331-1-git-send-email-andrii.anisov@gmail.com>
 <d63ff1d7-963a-bd1a-7835-ee5b30504628@arm.com>
 <20d30591-bc90-5321-2de9-a11f7d36cb11@gmail.com>
 <f0e27dd4-fc59-05d8-e910-b63c0d398c00@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dPnK=T6=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hWNhO-0005at-OU
 for xen-devel@lists.xenproject.org; Thu, 30 May 2019 16:14:38 +0000
Received: by mail-lj1-x243.google.com with SMTP id q16so6622286ljj.8
 for <xen-devel@lists.xenproject.org>; Thu, 30 May 2019 09:14:37 -0700 (PDT)
In-Reply-To: <f0e27dd4-fc59-05d8-e910-b63c0d398c00@arm.com>
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
Cc: Andre Przywara <andre.przywara@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Andrii Anisov <andrii_anisov@epam.com>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAyOS4wNS4xOSAxODozMiwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBCVFcsIGRvIHlvdSBo
ZWFyIGFib3V0IHBsYW5zIGZvciB0aGUgbmV3IHZnaWM/IFNvbWUgdGltZSBhZ28gaXQgd2FzIHNh
aWQgdGhhdCBuZXcgdmdpYyBpbXBsZW1lbnRhdGlvbiBnb2luZyB0byByZXBsYWNlIHRoZSBvbGQg
b25lLCBhbmQgb3B0aW1pemluZyB0aGUgb2xkIGlzIHdvcnRobGVzcy4gQnV0IGFzIEkgc2VlLCB0
aGVyZSBhcmUgbm8gdXBkYXRlcyBpbnRvIHRoYXQgYXJlYSB5ZXQuCj4gCj4gV2UgbmVlZCBoZWxw
IHRvIG1ha2UgaXQgaGFwcGVuLgpJJ20gbm90IHN1cmUgSSdsbCBoYXZlIHNwYXJlIHRpbWUgc29v
biwgYnV0IHdoYXQga2luZCBvZiBoZWxwIHlvdSBuZWVkPyBEbyB5b3UgaGF2ZSBhIFRPRE8gbGlz
dD8KCi0tIApTaW5jZXJlbHksCkFuZHJpaSBBbmlzb3YuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
