From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: [RFC 13/16] gic-vgic: skip irqs locking
Date: Wed, 12 Dec 2018 14:35:03 +0200
Message-ID: <1a3c781d-e514-2463-5319-6b3293bf2e92@gmail.com>
References: <1543440731-21947-1-git-send-email-andrii.anisov@gmail.com>
 <1543440731-21947-14-git-send-email-andrii.anisov@gmail.com>
 <445b8bb4-78fb-124a-647b-8e8d253b7ba1@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=X41P=OV=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1gX3jH-0002Gg-OF
 for xen-devel@lists.xenproject.org; Wed, 12 Dec 2018 12:35:07 +0000
Received: by mail-lj1-x244.google.com with SMTP id x85-v6so16151904ljb.2
 for <xen-devel@lists.xenproject.org>; Wed, 12 Dec 2018 04:35:06 -0800 (PST)
In-Reply-To: <445b8bb4-78fb-124a-647b-8e8d253b7ba1@arm.com>
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

CgpPbiAxMi4xMi4xOCAxNDowNywgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IFRoaXMgY2h1bmsgcmVs
aWVzIG9uIHBhdGNoICMxLCBhbSBJIGNvcnJlY3Q/CkZvciBzdXJlLCBpdCBpcy4KCj4gIElmIHNv
LCB0aGlzIHNob3VsZCBiZSB3cml0dGVuIGluIHRoZSBjb21taXQgbWVzc2FnZSB0aGF0IHRoaXMg
d2FzIGludHJvZHVjZWQgcmVjZW50bHkuCj4gIFRoaXMgaGVscHMgdG8gZmlndXJlIG91dCB3aGV0
aGVyIHRoZSBwYXRjaCBjYW4gYmUgbWVyZ2VkIGJlZm9yZSB0aGUgcmVzdC4KRG8geW91IG1lYW4g
SSBjYW4gcHJlcGFyZSBpdCBmb3IgNC4xMiB0b2dldGhlciB3aXRoICMxPwoKSSBwbGFuIHRvIHNl
bmQgc2VwYXJhdGVseSBwYXRjaGVzIHlvdSBoYXZlIHJldmlld2VkIGZpcnN0LiBUaGVuIGV2YWx1
YXRlIHRoZSByZXN0IHdpdGggVEJNLiBEb2VzIGl0IGZpdCB5b3VyIHZpc2lvbj8KCj4gSSB3b3Vs
ZCBhZGQgYW4gQVNTRVJUKCFsb2NhbF9pc19pcnFfZW5hYmxlZCgpKSBvbiB0b3AgdG8gc2hvdyB0
aGF0IHRoaXMgc2hvdWxkIGJlIGNhbGxlZCB3aXRoIGludGVycnVwdCBkaXNhYmxlZC4KT0suCgot
LSAKU2luY2VyZWx5LApBbmRyaWkgQW5pc292LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
