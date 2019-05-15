From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: [PATCH v2 2/2] xen: implement
 VCPUOP_register_runstate_phys_memory_area
Date: Wed, 15 May 2019 12:04:09 +0300
Message-ID: <c58b5000-623d-766e-eba8-a4df1fbe1a44@gmail.com>
References: <1556007026-31057-1-git-send-email-andrii.anisov@gmail.com>
 <1556007026-31057-3-git-send-email-andrii.anisov@gmail.com>
 <e248dae9-c91c-c735-ea16-9bcb70c65e9d@arm.com>
 <959c8975-ec44-a788-25b3-84ee17520abc@gmail.com>
 <24f3e2b1-4889-1780-0e48-0c909f555997@arm.com>
 <4ac886b5-ad15-f0cf-5af8-91aaf7d2460e@gmail.com>
 <7bbea412-f4af-4dc8-199a-1c02ac02a7af@arm.com>
 <f71bdb25-ebd3-31fc-f5fc-b8d591c3cc28@gmail.com>
 <5CDAAE4F020000780022E941@prv1-mh.provo.novell.com>
 <945c7543-7c49-f278-0b0d-5b6492ce93ca@gmail.com>
 <8f1d8d76-b2a6-7443-a38b-201058b6e84d@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HoWo=TP=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hQppe-0006fZ-Sm
 for xen-devel@lists.xenproject.org; Wed, 15 May 2019 09:04:14 +0000
Received: by mail-lj1-x242.google.com with SMTP id w1so1821305ljw.0
 for <xen-devel@lists.xenproject.org>; Wed, 15 May 2019 02:04:13 -0700 (PDT)
In-Reply-To: <8f1d8d76-b2a6-7443-a38b-201058b6e84d@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, xen-devel <xen-devel@lists.xenproject.org>, "andrii_anisov@epam.com" <andrii_anisov@epam.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAxNC4wNS4xOSAxNjo0OSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IFlvdSBoYXZlIHRvIGtl
ZXAgaW4gbWluZCB0aGF0IGV4aXN0aW5nIE9TIGhhdmUgdG8gcnVuIG9uIG5ld2VyIFhlbiB3aXRo
b3V0IGFueSBtb2RpZmljYXRpb24uCgpBcyBJIGp1c3Qgd3JpdHRlbiB0byBKYW4sIGl0IGlzIG9u
ZSBtb3JlIHJlYXNvbiB0byBrZWVwIHRob3NlIGludGVyZmFjZXMgbGl2aW5nIGluIHBhcmFsbGVs
IGFuZCBkbyBub3QgbWl4IHRoZWlyIGltcGxlbWVudGF0aW9uLgoKPiBUaGUgZXhpc3RpbmcgaHlw
ZXJjYWxsIGFsbG93cyB5b3UgdG86Cj4gIMKgwqAgMSkgRGUtcmVnaXN0ZXIgYW4gaW50ZXJmYWNl
IHVzaW5nIHRoZSB2YWx1ZSAwLgoKTXkgY3VycmVudCBpbXBsZW1lbnRhdGlvbiBjYW4gZWFzaWx5
IGJlIHVwZGF0ZWQgd2l0aCB0aGUgc2FtZSBiZWhhdmlvci4KCj4gIMKgwqAgMikgUmVwbGFjaW5n
IGEgY3VycmVudCBleGlzdGluZyBpbnRlcmZhY2UKCj4gWW91IHByb2JhYmx5IGNhbid0IHVzZSAy
KSBmb3IgYSBib290bG9hZGVyIC0+IGtlcm5lbCBoYW5kb3ZlciBiZWNhdXNlIHdlIGFyZSBkZWFs
aW5nIHdpdGggZ3Vlc3QgdmlydHVhbCBhZGRyZXNzLiBUaGVyZSBpcyBhbiBoaWdoIGNoYW5jZSB0
aGUgdmlydHVhbCBhZGRyZXNzIHNwYWNlIGxheW91dCBpcyBnb2luZyB0byBiZSBkaWZmZXJlbnQg
b3IgZXZlbiB0dXJuaW5nIG9mZiBNTVUgZm9yIGEgYml0IChkb25lIG9uIEFybSkuIFNvIHlvdSBo
YXZlIHRvIHVzZSAxKSBvdGhlcndpc2UgeW91IG1pZ2h0IHdyaXRlIGluIGEgcmFuZG9tIHBsYWNl
IGluIG1lbW9yeS4KClRoaXMgZGVmaW5pdGVseSBub3QgdGhlIHdheSB0byBoYW5kbGUgdHJhbnNp
dGlvbnMgYmV0d2VlbiBzeXN0ZW1zIGluIGEgZ3Vlc3QgZG9tYWluLgoKPiBJIGFtIG5vdCBlbnRp
cmVseSBzdXJlIHdoZXRoZXIgdGhlcmUgYXJlIGFjdHVhbCB2YWx1ZSBmb3IgMikuIFRoZSBvbmx5
IHJlYXNvbiBJIGNhbiB0aGluayBvZiBpcyBpZiB5b3Ugd2FudCB0byBtb3ZlIGFyb3VuZCB0aGUg
cnVuc3RhdGUgaW4geW91ciB2aXJ0dWFsIGFkZHJlc3Mgc3BhY2UuIEJ1dCB0aGF0J3Mgc291bmRz
IGEgYml0IHdlaXJkIGF0IGxlYXN0IG9uIEFybS4KPiBGb3IgdGhlIG5ldyBoeXBlcmNhbGwsIEkg
dGhpbmsgd2UgYXQgbGVhc3Qgd2FudCAxKSAod2l0aCBhIG1hZ2ljIHZhbHVlIFRCRCkuIAoKVGhl
IG1hZ2ljIHZhbHVlIDB4MCBjYW4gZWFzaWx5IGJlIGludHJvZHVjZWQuCgo+ICAyKSBtaWdodCBi
ZSBoZWxwZnVsIGluIHRoZSBjYXNlIHRoZSBib290bG9hZGVyIGRpZG4ndCBkbyB0aGUgcmlnaHQg
dGhpbmcgb3Igd2UgYXJlIHVzaW5nIEtleGVjIHRvIGJvb3QgYSBuZXcga2VybmVsLiBUaGlzIHdv
dWxkIGFsc28gYmUgc2FmZXIgYXMgcGh5c2ljYWwgYWRkcmVzcyBjb3VsZCBiZSBleGNsdWRlZCBt
b3JlIGVhc2lseS4KCkJ1dCB0aGUgbmV3IHN5c3RlbSBoYXZlIHRvIGdldCBzb21lIGtub3dsZWRn
ZSBhYm91dCB0aGUgcHJldmlvdXMgcGh5cyBhZGRyIGlzIHJlc2VydmVkICh1c2VkIGJ5IGh5cGVy
dmlzb3IpLCBhbmQgZG8gbm90IHVzZSBpdCBwcmlvciB0byByZWdpc3RlcmluZyBuZXcgcnVuc3Rh
dGUgYXJlYS4KUHJvdmlkaW5nIHN1Y2ggYSBrbm93bGVkZ2UgaXMgc29tZXRoaW5nIChlLmcuKSB0
aGUgYm9vdGxvYWRlciBzaG91bGQgdGFrZSBjYXJlIG9mLiBCdXQsIElNTywgaXQgaXMgYmV0dGVy
IHRvIHJlcXVpcmUgZnJvbSAoZS5nLikgdGhlIGJvb3Rsb2FkZXIgdG8gdW5yZWdpc3RlciBpdHMg
cnVuc3RhdGUgYXJlYSBwcmlvciB0byBzd2l0Y2hpbmcgdG8gdGhlIG5ldyBzeXN0ZW0uCgotLSAK
U2luY2VyZWx5LApBbmRyaWkgQW5pc292LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
