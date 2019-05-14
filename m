From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: [PATCH v2 2/2] xen: implement
 VCPUOP_register_runstate_phys_memory_area
Date: Tue, 14 May 2019 16:05:10 +0300
Message-ID: <945c7543-7c49-f278-0b0d-5b6492ce93ca@gmail.com>
References: <1556007026-31057-1-git-send-email-andrii.anisov@gmail.com>
 <1556007026-31057-3-git-send-email-andrii.anisov@gmail.com>
 <e248dae9-c91c-c735-ea16-9bcb70c65e9d@arm.com>
 <959c8975-ec44-a788-25b3-84ee17520abc@gmail.com>
 <24f3e2b1-4889-1780-0e48-0c909f555997@arm.com>
 <4ac886b5-ad15-f0cf-5af8-91aaf7d2460e@gmail.com>
 <7bbea412-f4af-4dc8-199a-1c02ac02a7af@arm.com>
 <f71bdb25-ebd3-31fc-f5fc-b8d591c3cc28@gmail.com>
 <5CDAAE4F020000780022E941@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=b0nL=TO=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hQX7M-0000kG-Ku
 for xen-devel@lists.xenproject.org; Tue, 14 May 2019 13:05:16 +0000
Received: by mail-lj1-x241.google.com with SMTP id z1so14248142ljb.3
 for <xen-devel@lists.xenproject.org>; Tue, 14 May 2019 06:05:15 -0700 (PDT)
In-Reply-To: <5CDAAE4F020000780022E941@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, "andrii_anisov@epam.com" <andrii_anisov@epam.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAxNC4wNS4xOSAxNTowMiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gV2VsbCwgSSB0aGluayBK
dWxpYW4ncyBpbXBsaWNhdGlvbiB3YXMgdGhhdCB3ZSBjYW4ndCBzdXBwb3J0IGluIHBhcnRpY3Vs
YXIKPiB0aGUgYm9vdCBsb2FkZXIgLT4ga2VybmVsIGhhbmRvdmVyIGNhc2Ugd2l0aG91dCBleHRy
YSBtZWFzdXJlcyAoaWYKPiBhdCBhbGwpLCBhbmQgaGVuY2UgaGUgYWRkZWQgdGhpbmdzIHRvZ2V0
aGVyIGFuZCBzYWlkIHdoYXQgcmVzdWx0cwo+IGZyb20gdGhpcy4gT2YgY291cnNlIGlkZWFsbHkg
d2UnZCByZWplY3QgbWl4ZWQgcmVxdWVzdHMsIGJ1dCB1bmxlc3MKPiBzb21lb25lIGNhbiBjb21l
IHVwIHdpdGggYSBjbGV2ZXIgbWVhbnMgb2YgaG93IHRvIGRldGVybWluZSBlbnRpdHkKPiBib3Vu
ZGFyaWVzIEknbSBhZnJhaWQgdGhpcyBpcyBub3QgZ29pbmcgdG8gYmUgcG9zc2libGUgd2l0aG91
dCBicmVha2luZwo+IGNlcnRhaW4gc2V0dXBzLgoKIEZyb20gbXkgdW5kZXJzdGFuZGluZywgaWYg
d2UgYXJlIHNwZWFraW5nIG9mIGRpZmZlcmVudCBlbnRpdGllcyBpbiBhIGRvbWFpbiBhbmQgdGhl
aXIgYm91bmRhcmllcywgd2UgaGF2ZSB0byBkZWZpbmUgdW5yZWdpc3RlciBpbnRlcmZhY2UgYXMg
d2VsbC4gU28gdGhhdCB0aG9zZSBlbnRpdGllcyB3b3VsZCBiZSBhYmxlIHRvIHRha2UgY2FyZSBv
ZiB0aGVtc2VsdmVzIGV4cGxpY2l0bHkuCgotLSAKU2luY2VyZWx5LApBbmRyaWkgQW5pc292LgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
