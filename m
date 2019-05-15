From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: [PATCH v2 2/2] xen: implement
 VCPUOP_register_runstate_phys_memory_area
Date: Wed, 15 May 2019 11:44:39 +0300
Message-ID: <9a285538-2c98-2b3d-9c1c-f7a21f9de890@gmail.com>
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
 <5CDAC779020000780022EBA7@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HoWo=TP=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hQpWm-0004qq-1x
 for xen-devel@lists.xenproject.org; Wed, 15 May 2019 08:44:44 +0000
Received: by mail-lf1-x142.google.com with SMTP id c17so1361455lfi.2
 for <xen-devel@lists.xenproject.org>; Wed, 15 May 2019 01:44:43 -0700 (PDT)
In-Reply-To: <5CDAC779020000780022EBA7@prv1-mh.provo.novell.com>
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

SGVsbG8gSmFuLAoKT24gMTQuMDUuMTkgMTY6NDksIEphbiBCZXVsaWNoIHdyb3RlOgo+IElmIHRo
aXMgd2FzIGEgY29uY2VybiBvbmx5IGZvciBuZXdseSB3cml0dGVuIGNvZGUsIHRoaXMgd291bGQg
YmUgZmluZS4KPiBCdXQgeW91IG5lZWQgdG8gbWFrZSBzdXJlIGFsbCBleGlzdGluZyBjb2RlIGFs
c28gY29udGludWVzIHRvIHdvcmsKPiB3aXRoIHdoYXRldmVyIG5ldyBpbnRlcmZhY2UgeW91IGlt
cGxlbWVudC4KCkFuZCB0aGF0IGlzIG9uZSBtb3JlIHJlYXNvbiB3aHkgSSB0ZW5kIHRvIGludHJv
ZHVjZSB0aGUgbmV3IGludGVyZmFjZSBpbiBwYXJhbGxlbCB0byBiZSBmdWxseSBpbmRlcGVuZGVu
dCBmcm9tIHRoZSBvbGQgb25lLgpCdXQgbm90IGRvIGEgbWl4ZWQgaW1wbGVtZW50YXRpb24gYXMg
eW91IGFuZCBKdWxpZW4gc3VnZ2VzdC4KCj4gSnVzdCBiZWNhdXNlIGEga2VybmVsCj4gdXNlcyB5
b3VyIG5ldyBwaHlzaWNhbCBhZGRyZXNzIGJhc2VkIG1lY2hhbmlzbSBkb2Vzbid0IG1lYW4gdGhl
Cj4gYm9vdCBsb2FkZXIga25vd3MgdG8gdW5yZWdpc3RlciB3aGF0IGl0IGhhcyByZWdpc3RlcmVk
LgoKQXMgSnVsaWVuIGFscmVhZHkgc2FpZCwgdGhlIGN1cnJlbnQgaW50ZXJmYWNlIGhhcyBhbiBp
bXBsaWNpdCBtZWNoYW5pc20gdG8gdW5yZWdpc3RlciBydW5zdGF0ZSBhcmVhLgpBbHNvIGlmIHRo
ZSBib290bG9hZGVyIG1pc3NlcyB1bnJlZ2lzdGVyaW5nIHJ1bnN0YXRlIGFyZWEgd2l0aCB0aGUg
Y3VycmVudCBpbnRlcmZhY2UsIHdlIGFscmVhZHkgaGF2ZSB0aGUgYnJva2VuIHN5c3RlbS4KU28g
aXQgaXMgcmVhbGx5IHVwIHRvIHRoZSBndWVzdCBzeXN0ZW0gdG8gdGFrZSBjYXJlIGFib3V0IGl0
cyBwb3NzaWJsZSB0cmFuc2l0aW9ucy4KCi0tIApTaW5jZXJlbHksCkFuZHJpaSBBbmlzb3YuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
