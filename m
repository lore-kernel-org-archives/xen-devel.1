From: Tamas K Lengyel <tamas@tklengyel.com>
Subject: Re: [PATCH v6 1/3] x86/mm: Change default value for
 suppress #VE in set_mem_access()
Date: Wed, 12 Sep 2018 07:57:51 -0600
Message-ID: <CABfawhnXiFo535swJS50-naL3VjQsSRNLwSo5-KpYgpu4qUaWQ@mail.gmail.com>
References: <20180912075006.31791-1-apop@bitdefender.com>
 <20180912075006.31791-2-apop@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=w83q=l2=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1g05f8-0002ga-RX
 for xen-devel@lists.xenproject.org; Wed, 12 Sep 2018 13:58:34 +0000
Received: by mail-ed1-f67.google.com with SMTP id k14-v6so1827065edr.13
 for <xen-devel@lists.xenproject.org>; Wed, 12 Sep 2018 06:58:33 -0700 (PDT)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com.
 [209.85.221.51])
 by smtp.gmail.com with ESMTPSA id t44-v6sm647360edd.96.2018.09.12.06.58.30
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 12 Sep 2018 06:58:30 -0700 (PDT)
Received: by mail-wr1-f51.google.com with SMTP id z96-v6so2160732wrb.8
 for <xen-devel@lists.xenproject.org>; Wed, 12 Sep 2018 06:58:30 -0700 (PDT)
In-Reply-To: <20180912075006.31791-2-apop@bitdefender.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Adrian Pop <apop@bitdefender.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Vlad-Ioan TOPAN <itopan@bitdefender.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Sergej Proskurin <proskurin@sec.in.tum.de>, Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBTZXAgMTIsIDIwMTggYXQgMTo1MCBBTSBBZHJpYW4gUG9wIDxhcG9wQGJpdGRlZmVu
ZGVyLmNvbT4gd3JvdGU6Cj4KPiBGcm9tOiBWbGFkIElvYW4gVG9wYW4gPGl0b3BhbkBiaXRkZWZl
bmRlci5jb20+Cj4KPiBUaGUgZGVmYXVsdCB2YWx1ZSBmb3IgdGhlICJzdXBwcmVzcyAjVkUiIGJp
dCBzZXQgYnkgc2V0X21lbV9hY2Nlc3MoKQo+IGN1cnJlbnRseSBkZXBlbmRzIG9uIHdoZXRoZXIg
dGhlIGNhbGwgaXMgbWFkZSBmcm9tIHRoZSBzYW1lIGRvbWFpbiAodGhlCj4gYml0IGlzIHNldCB3
aGVuIGNhbGxlZCBmcm9tIGFub3RoZXIgZG9tYWluIGFuZCBjbGVhcmVkIGlmIGNhbGxlZCBmcm9t
Cj4gdGhlIHNhbWUgZG9tYWluKS4gVGhpcyBwYXRjaCBjaGFuZ2VzIHRoYXQgYmVoYXZpb3IgdG8g
aW5oZXJpdCB0aGUgb2xkCj4gc3VwcHJlc3MgI1ZFIGJpdCB2YWx1ZSBpZiBpdCBpcyBhbHJlYWR5
IHNldCBhbmQgdG8gc2V0IGl0IHRvIDEKPiBvdGhlcndpc2UsIHdoaWNoIGlzIHNhZmVyIGFuZCBt
b3JlIHJlbGlhYmxlLgo+Cj4gU2lnbmVkLW9mZi1ieTogVmxhZCBJb2FuIFRvcGFuIDxpdG9wYW5A
Yml0ZGVmZW5kZXIuY29tPgo+IFNpZ25lZC1vZmYtYnk6IEFkcmlhbiBQb3AgPGFwb3BAYml0ZGVm
ZW5kZXIuY29tPgoKQWNrZWQtYnk6IFRhbWFzIEsgTGVuZ3llbCA8dGFtYXNAdGtsZW5neWVsLmNv
bT4KCj4gLS0tCj4gQ2hhbmdlcyBpbiB2NjoKPiAtIGFkZCBhIGNvbW1lbnQgaW4gdGhlIGNvZGUg
dG8gZXhwbGFpbiB0aGUgbWVhbmluZyBvZiB0aGUgLTEgbWFnaWMgdmFsdWUKPiAtLS0KPiAgeGVu
L2FyY2gveDg2L21tL21lbV9hY2Nlc3MuYyB8IDcgKysrKystLQo+ICAxIGZpbGUgY2hhbmdlZCwg
NSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNo
L3g4Ni9tbS9tZW1fYWNjZXNzLmMgYi94ZW4vYXJjaC94ODYvbW0vbWVtX2FjY2Vzcy5jCj4gaW5k
ZXggYThiM2U5OWVjNC4uYzk4MGYxNzQ0ZCAxMDA2NDQKPiAtLS0gYS94ZW4vYXJjaC94ODYvbW0v
bWVtX2FjY2Vzcy5jCj4gKysrIGIveGVuL2FyY2gveDg2L21tL21lbV9hY2Nlc3MuYwo+IEBAIC0y
ODUsOCArMjg1LDExIEBAIGludCBwMm1fc2V0X2FsdHAybV9tZW1fYWNjZXNzKHN0cnVjdCBkb21h
aW4gKmQsIHN0cnVjdCBwMm1fZG9tYWluICpocDJtLAo+ICAgICAgICAgIH0KPiAgICAgIH0KPgo+
IC0gICAgcmV0dXJuIGFwMm0tPnNldF9lbnRyeShhcDJtLCBnZm4sIG1mbiwgUEFHRV9PUkRFUl80
SywgdCwgYSwKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgY3VycmVudC0+ZG9tYWluICE9
IGQpOwo+ICsgICAgLyoKPiArICAgICAqIEluaGVyaXQgdGhlIG9sZCBzdXBwcmVzcyAjVkUgYml0
IHZhbHVlIGlmIGl0IGlzIGFscmVhZHkgc2V0LCBvciBzZXQgaXQKPiArICAgICAqIHRvIDEgb3Ro
ZXJ3aXNlCj4gKyAgICAgKi8KPiArICAgIHJldHVybiBhcDJtLT5zZXRfZW50cnkoYXAybSwgZ2Zu
LCBtZm4sIFBBR0VfT1JERVJfNEssIHQsIGEsIC0xKTsKPiAgfQo+Cj4gIHN0YXRpYyBpbnQgc2V0
X21lbV9hY2Nlc3Moc3RydWN0IGRvbWFpbiAqZCwgc3RydWN0IHAybV9kb21haW4gKnAybSwKPiAt
LQo+IDIuMTguMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
