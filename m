From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: [PATCH v2 2/2] xen: implement
 VCPUOP_register_runstate_phys_memory_area
Date: Tue, 14 May 2019 14:45:16 +0300
Message-ID: <f71bdb25-ebd3-31fc-f5fc-b8d591c3cc28@gmail.com>
References: <1556007026-31057-1-git-send-email-andrii.anisov@gmail.com>
 <1556007026-31057-3-git-send-email-andrii.anisov@gmail.com>
 <e248dae9-c91c-c735-ea16-9bcb70c65e9d@arm.com>
 <959c8975-ec44-a788-25b3-84ee17520abc@gmail.com>
 <24f3e2b1-4889-1780-0e48-0c909f555997@arm.com>
 <4ac886b5-ad15-f0cf-5af8-91aaf7d2460e@gmail.com>
 <7bbea412-f4af-4dc8-199a-1c02ac02a7af@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=b0nL=TO=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hQVs1-0003OJ-3e
 for xen-devel@lists.xenproject.org; Tue, 14 May 2019 11:45:21 +0000
Received: by mail-lf1-x144.google.com with SMTP id h13so11603647lfc.7
 for <xen-devel@lists.xenproject.org>; Tue, 14 May 2019 04:45:20 -0700 (PDT)
In-Reply-To: <7bbea412-f4af-4dc8-199a-1c02ac02a7af@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Andrii Anisov <andrii_anisov@epam.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Wei Liu <wei.liu2@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAxNC4wNS4xOSAxNDoyNCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+Pj4gSSB0aGluayB0aGVy
ZSBhcmUgYW4gYWdyZWVtZW50IHRoYXQgdGhlIHR3byBtZXRob2RzIHNob3VsZCBub3QgYmUgdXNl
ZCB0b2dldGhlci4KPj4KPj4gRm9yIGEgZG9tYWluIG9yIGZvciBhIHBhcnRpY3VsYXIgVkNQVT8K
Pj4gSG93IHNob3VsZCB3ZSByZXNwb25zZSBvbiB0aGUgcmVxdWVzdCB0byByZWdpc3RlciBwYWRk
ciB3aGVuIHdlIGFscmVhZHkgaGF2ZSByZWdpc3RlcmVkIHZhZGRyIGFuZCB2aWNlIHZlcnNhPwo+
IAo+ICBGcm9tIHRoZSBkaXNjdXNzaW9uIHdpdGggSmFuLCB5b3Ugd291bGQgdGVhciBkb3duIHRo
ZSBwcmV2aW91cyBzb2x1dGlvbiBhbmQgdGhlbgo+IHJlZ2lzdGVyIHRoZSBuZXcgdmVyc2lvbi4g
U28gdGhpcyBhbGxvd3MgY2FzZXMgbGlrZSBhIGJvb3Rsb2FkZXIgYW5kIGEga2VybmVsIHVzaW5n
IGRpZmZlcmVudCB2ZXJzaW9uIG9mIHRoZSBpbnRlcmZhY2UuCgpJJ20gbm90IHN1cmUgSmFuIHN0
YXRlZCB0aGF0LCBoZSByYXRoZXIgcXVlc3Rpb25lZCB0aGF0LgoKSmFuLCBjb3VsZCB5b3UgcGxl
YXNlIGNvbmZpcm0geW91IGFncmVlIHRoYXQgaXQgc2hvdWxkIGJlIGRyb3BwZWQgYWxyZWFkeSBy
ZWdpc3RlcmVkIHJ1bnN0YXRlIGFuZCAocG90ZW50aWFsbHkpIGNoYW5nZWQgdmVyc2lvbiBpbiBj
YXNlIG9mIHRoZSBuZXcgcmVnaXN0ZXIgcmVxdWVzdD8KCi0tIApTaW5jZXJlbHksCkFuZHJpaSBB
bmlzb3YuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
