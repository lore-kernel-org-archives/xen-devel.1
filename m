From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: [PATCH 6/7] xen/arm: tlbflush: Rework TLB helpers
Date: Fri, 26 Apr 2019 18:17:25 +0300
Message-ID: <2bbefbd9-b838-3581-810a-c4739d7d9713@gmail.com>
References: <20190417175815.16905-1-julien.grall@arm.com>
 <20190417175815.16905-7-julien.grall@arm.com>
 <4de7931e-27e0-be57-51e0-f2807aeff7bd@gmail.com>
 <d700c117-80b6-45c7-38f8-6193f92e2a63@arm.com>
 <122d7f0f-d209-6a7a-8092-64985797b383@gmail.com>
 <0308fa00-070f-cc98-2ef4-f109d94aa8b8@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TPdi=S4=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hK2bT-0008Qi-JP
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2019 15:17:31 +0000
Received: by mail-lj1-x242.google.com with SMTP id k2so3240575lje.10
 for <xen-devel@lists.xenproject.org>; Fri, 26 Apr 2019 08:17:29 -0700 (PDT)
In-Reply-To: <0308fa00-070f-cc98-2ef4-f109d94aa8b8@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "Oleksandr_Tyshchenko@epam.com" <Oleksandr_Tyshchenko@epam.com>, nd <nd@arm.com>, "Andrii_Anisov@epam.com" <Andrii_Anisov@epam.com>, "sstabellini@kernel.org" <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAyNi4wNC4xOSAxNzowNiwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpLAo+IAo+IE9uIDI2
LzA0LzIwMTkgMTQ6NDksIEFuZHJpaSBBbmlzb3Ygd3JvdGU6Cj4+Cj4+Cj4+IE9uIDI1LjA0LjE5
IDIzOjQyLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+PiBJIGFtIG5vdCBzdXJlIHdoeSBJIHVzZSBB
LmsgYmVjYXVzZSB0aGlzIGlzIGEgcHJldHR5IG9sZCBzcGVjLgo+PiBJIGRpZCBtZWFuIHRoYXQg
QS5rLiBpcyBub3QgcHVibGljbHkgYXZhaWxhYmxlLCBldmVuIG5vdywgc28gaXQgaXMgbm90IHF1
aXRlIHJpZ2h0IHRvIHJlZmVyIHN1Y2ggYSBkb2N1bWVudCwgYXQgbGVhc3Qgd2l0aG91dCBtZW50
aW9uaW5nIGl0IGlzIGludGVybmFsCj4gUGxlYXNlIGF2b2lkIHRvIHRha2UgbXkgd29yZHMgb3V0
IG9mIGNvbnRleHQuLi4gQXMgeW91IHJlYWQgdGhlIHNlbnRlbmNlIGFib3ZlLCB5b3UgcHJvYmFi
bHkgbm90aWNlZCB0aGF0IEEuayB3YXMgcHVibGlzaGVkIHdpdGggZGVmZWN0cyBpbiBpdCBhbmQg
cHJvYmFibHkgdGhlIHJlYXNvbnMgd2h5IGl0IGNhbid0IGJlIGZvdW5kIHRvZGF5Lgo+IAo+IEkg
ZG93bmxvYWQgYWxsIG15IHNwZWNzIGZyb20gcHVibGljIHdlYnNpdGUgdG8gYXZvaWQgcG90ZW50
aWFsIGRpc2Nsb3N1cmUgb2YgaW50ZXJuYWwgY29udGVudC4gSWYgeW91IGxvb2sgYXQgR29vZ2xl
LCB0aGUgc3BlYyB3YXMgYWN0dWFsbHkgcHVibGljIGF0IHNvbWUgcG9pbnQgKHNlZSBbMV0gZm9y
IGluc3RhbmNlKS4KCkkgdW5kZXJzdGFuZCB0aGF0LiBCdXQgbm93LCBhdCB0aGlzIHBhdGNoIHB1
YmxpY2F0aW9uIGFuZCByZXZpZXcgbW9tZW50LCB0aGUgQS5rLiBkb2N1bWVudCBpcyBub3QgYXZh
aWxhYmxlLiBBbmQgaXMgYSBiaXQgY29uZnVzaW5nLgoKPiBJbiB3aGF0IHlvdSBxdW90ZSwgSSBt
ZXJlbHkgcG9pbnRlZCBvdXQgdGhhdCBJIHNob3VsZCBub3QgaGF2ZSB1c2VkIGl0IGJlY2F1c2Ug
aXQgaXMgcHJldHR5IG9sZCAofjIgYW5kIGhhbGYgeWVhcnMpLgoKUmVmZXJyaW5nIHRoZSBtb3N0
IHVwLXRvLWRhdGUgZG9jdW1lbnQgaXMgYWx3YXkgYSBnb29kIGNob2ljZS4KCi0tIApTaW5jZXJl
bHksCkFuZHJpaSBBbmlzb3YuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
