From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: [PATCH 6/7] xen/arm: tlbflush: Rework TLB helpers
Date: Fri, 26 Apr 2019 16:49:25 +0300
Message-ID: <122d7f0f-d209-6a7a-8092-64985797b383@gmail.com>
References: <20190417175815.16905-1-julien.grall@arm.com>
 <20190417175815.16905-7-julien.grall@arm.com>
 <4de7931e-27e0-be57-51e0-f2807aeff7bd@gmail.com>
 <d700c117-80b6-45c7-38f8-6193f92e2a63@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TPdi=S4=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hK1EH-0000xz-Uf
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2019 13:49:29 +0000
Received: by mail-lj1-x234.google.com with SMTP id h16so2961985ljg.11
 for <xen-devel@lists.xenproject.org>; Fri, 26 Apr 2019 06:49:28 -0700 (PDT)
In-Reply-To: <d700c117-80b6-45c7-38f8-6193f92e2a63@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <Julien.Grall@arm.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "Oleksandr_Tyshchenko@epam.com" <Oleksandr_Tyshchenko@epam.com>, nd <nd@arm.com>, "Andrii_Anisov@epam.com" <Andrii_Anisov@epam.com>, "sstabellini@kernel.org" <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAyNS4wNC4xOSAyMzo0MiwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEkgYW0gbm90IHN1cmUg
d2h5IEkgdXNlIEEuayBiZWNhdXNlIHRoaXMgaXMgYSBwcmV0dHkgb2xkIHNwZWMuCkkgZGlkIG1l
YW4gdGhhdCBBLmsuIGlzIG5vdCBwdWJsaWNseSBhdmFpbGFibGUsIGV2ZW4gbm93LCBzbyBpdCBp
cyBub3QgcXVpdGUgcmlnaHQgdG8gcmVmZXIgc3VjaCBhIGRvY3VtZW50LCBhdCBsZWFzdCB3aXRo
b3V0IG1lbnRpb25pbmcgaXQgaXMgaW50ZXJuYWwuCgo+IEkgc2hvdWxkCj4gaGF2ZSB1c2VkIHRo
ZSBsYXN0IG9uZSAoaS5lIEQuYSkuCiAgCj4gQW55d2F5LCBJIGFtIGluZGVlZCByZWZlcnJpbmcg
dG8gYEVuc3VyaW5nIHRoZSB2aXNpYmlsaXR5IG9mIHVwZGF0ZXMgdG8KPiB0cmFuc2xhdGlvbiB0
YWJsZXMgZm9yIGEgbXVsdGlwcm9jZXNzb3JgLiBJIHdpbGwgdXBkYXRlIHRoZSBjb21taXQgbWVz
c2FnZS4KQ29vbC4KCi0tIApTaW5jZXJlbHksCkFuZHJpaSBBbmlzb3YuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
