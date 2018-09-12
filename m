From: Adrian Pop <apop@bitdefender.com>
Subject: Re: [PATCH v5 1/3] x86/mm: Change default value for
 suppress #VE in set_mem_access()
Date: Wed, 12 Sep 2018 07:02:45 +0300
Message-ID: <20180912040244.GB17195@hel>
References: <20180903154836.25708-1-apop@bitdefender.com>
 <20180903154836.25708-2-apop@bitdefender.com>
 <CABfawhmzq2hB5Mg0=20pN3xsCBE0XR=mO0rg6g0QRWucZcm=XA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=mfac=l2=bitdefender.com=apop@srs-us1.protection.inumbo.net>)
 id 1fzwMZ-0005HK-0S
 for xen-devel@lists.xenproject.org; Wed, 12 Sep 2018 04:02:47 +0000
Received: from mx-sr.buh.bitdefender.com (mx-sr.buh.bitdefender.biz
 [10.17.80.103])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id E253D301AB28
 for <xen-devel@lists.xenproject.org>; Wed, 12 Sep 2018 07:02:45 +0300 (EEST)
Received: from smtp01.buh.bitdefender.com (smtp.bitdefender.biz [10.17.80.75])
 by mx-sr.buh.bitdefender.com (Postfix) with ESMTP id D5F077FB7C
 for <xen-devel@lists.xenproject.org>; Wed, 12 Sep 2018 07:02:45 +0300 (EEST)
Content-Disposition: inline
In-Reply-To: <CABfawhmzq2hB5Mg0=20pN3xsCBE0XR=mO0rg6g0QRWucZcm=XA@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Tamas K Lengyel <tamas@tklengyel.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Vlad-Ioan TOPAN <itopan@bitdefender.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Sergej Proskurin <proskurin@sec.in.tum.de>, Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBTZXAgMTEsIDIwMTggYXQgMTI6MDg6NDJQTSAtMDYwMCwgVGFtYXMgSyBMZW5neWVs
IHdyb3RlOgo+IE9uIE1vbiwgU2VwIDMsIDIwMTggYXQgOTo0OCBBTSBBZHJpYW4gUG9wIDxhcG9w
QGJpdGRlZmVuZGVyLmNvbT4gd3JvdGU6Cj4gPgo+ID4gRnJvbTogVmxhZCBJb2FuIFRvcGFuIDxp
dG9wYW5AYml0ZGVmZW5kZXIuY29tPgo+ID4KPiA+IFRoZSBkZWZhdWx0IHZhbHVlIGZvciB0aGUg
InN1cHByZXNzICNWRSIgYml0IHNldCBieSBzZXRfbWVtX2FjY2VzcygpCj4gPiBjdXJyZW50bHkg
ZGVwZW5kcyBvbiB3aGV0aGVyIHRoZSBjYWxsIGlzIG1hZGUgZnJvbSB0aGUgc2FtZSBkb21haW4g
KHRoZQo+ID4gYml0IGlzIHNldCB3aGVuIGNhbGxlZCBmcm9tIGFub3RoZXIgZG9tYWluIGFuZCBj
bGVhcmVkIGlmIGNhbGxlZCBmcm9tCj4gPiB0aGUgc2FtZSBkb21haW4pLiBUaGlzIHBhdGNoIGNo
YW5nZXMgdGhhdCBiZWhhdmlvciB0byBpbmhlcml0IHRoZSBvbGQKPiA+IHN1cHByZXNzICNWRSBi
aXQgdmFsdWUgaWYgaXQgaXMgYWxyZWFkeSBzZXQgYW5kIHRvIHNldCBpdCB0byAxCj4gPiBvdGhl
cndpc2UsIHdoaWNoIGlzIHNhZmVyIGFuZCBtb3JlIHJlbGlhYmxlLgo+ID4KPiA+IFNpZ25lZC1v
ZmYtYnk6IFZsYWQgSW9hbiBUb3BhbiA8aXRvcGFuQGJpdGRlZmVuZGVyLmNvbT4KPiA+IFNpZ25l
ZC1vZmYtYnk6IEFkcmlhbiBQb3AgPGFwb3BAYml0ZGVmZW5kZXIuY29tPgo+ID4gLS0tCj4gPiAg
eGVuL2FyY2gveDg2L21tL21lbV9hY2Nlc3MuYyB8IDMgKy0tCj4gPiAgMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS94ZW4v
YXJjaC94ODYvbW0vbWVtX2FjY2Vzcy5jIGIveGVuL2FyY2gveDg2L21tL21lbV9hY2Nlc3MuYwo+
ID4gaW5kZXggODRkMjYwZWJkOC4uZTE1MjJhMGI3NSAxMDA2NDQKPiA+IC0tLSBhL3hlbi9hcmNo
L3g4Ni9tbS9tZW1fYWNjZXNzLmMKPiA+ICsrKyBiL3hlbi9hcmNoL3g4Ni9tbS9tZW1fYWNjZXNz
LmMKPiA+IEBAIC0yODQsOCArMjg0LDcgQEAgaW50IHAybV9zZXRfYWx0cDJtX21lbV9hY2Nlc3Mo
c3RydWN0IGRvbWFpbiAqZCwgc3RydWN0IHAybV9kb21haW4gKmhwMm0sCj4gPiAgICAgICAgICB9
Cj4gPiAgICAgIH0KPiA+Cj4gPiAtICAgIHJldHVybiBhcDJtLT5zZXRfZW50cnkoYXAybSwgZ2Zu
LCBtZm4sIFBBR0VfT1JERVJfNEssIHQsIGEsCj4gPiAtICAgICAgICAgICAgICAgICAgICAgICAg
ICAgY3VycmVudC0+ZG9tYWluICE9IGQpOwo+IAo+IENvdWxkIHlvdSBhZGQgYSBjb21tZW50IGhl
cmUgc2F5aW5nICJpbmhlcml0IHRoZSBvbGQgc3VwcHJlc3MgI1ZFIGJpdAo+IHZhbHVlIGlmIGl0
IGlzIGFscmVhZHkgc2V0IGFuZCB0byBzZXQgaXQgdG8gMSBvdGhlcndpc2UiIHRvIGV4cGxhaW4K
PiB0aGUgbWVhbmluZyBvZiB0aGUgbWFnaWMgLTEgdmFsdWU/CgpTdXJlLiAgVGhhbmsgeW91IQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
