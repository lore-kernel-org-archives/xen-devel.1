From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH v5 2/3] x86/altp2m: Add a hvmop for setting
 the suppress #VE bit
Date: Thu, 20 Sep 2018 14:38:36 +0300
Message-ID: <de1b71fc-2cdd-3a3a-eb29-f67034493f07@bitdefender.com>
References: <20180903154836.25708-1-apop@bitdefender.com>
 <20180903154836.25708-3-apop@bitdefender.com>
 <4e54473d-1233-7d8c-17b8-b4bd949bf380@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=tdcx=mc=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1g2xIO-0006W2-Ai
 for xen-devel@lists.xenproject.org; Thu, 20 Sep 2018 11:38:56 +0000
Received: from mx-sr.buh.bitdefender.com (mx-sr.buh.bitdefender.biz
 [10.17.80.103])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id C745A301B939
 for <xen-devel@lists.xenproject.org>; Thu, 20 Sep 2018 14:38:53 +0300 (EEST)
Received: from smtp02.buh.bitdefender.net (smtp.bitdefender.biz [10.17.80.76])
 by mx-sr.buh.bitdefender.com (Postfix) with ESMTP id A11047FE6A
 for <xen-devel@lists.xenproject.org>; Thu, 20 Sep 2018 14:38:53 +0300 (EEST)
In-Reply-To: <4e54473d-1233-7d8c-17b8-b4bd949bf380@citrix.com>
Content-Language: en-US-large
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>, Adrian Pop <apop@bitdefender.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Tamas K Lengyel <tamas@tklengyel.com>, Jan Beulich <jbeulich@suse.com>, Sergej Proskurin <proskurin@sec.in.tum.de>
List-Id: xen-devel@lists.xenproject.org

T24gOS8yMC8xOCAyOjM0IFBNLCBHZW9yZ2UgRHVubGFwIHdyb3RlOgo+IE9uIDA5LzAzLzIwMTgg
MDQ6NDggUE0sIEFkcmlhbiBQb3Agd3JvdGU6Cj4+IEludHJvZHVjZSBhIG5ldyBodm1vcCwgSFZN
T1BfYWx0cDJtX3NldF9zdXBwcmVzc192ZSwgd2hpY2ggYWxsb3dzIGEKPj4gZG9tYWluIHRvIGNo
YW5nZSB0aGUgdmFsdWUgb2YgdGhlICNWRSBzdXBwcmVzcyBiaXQgZm9yIGEgcGFnZS4KPj4KPj4g
QWRkIGEgbGlieGMgd3JhcHBlciBmb3IgaW52b2tpbmcgdGhpcyBodm1vcC4KPj4KPj4gU2lnbmVk
LW9mZi1ieTogQWRyaWFuIFBvcCA8YXBvcEBiaXRkZWZlbmRlci5jb20+Cj4+IEFja2VkLWJ5OiBX
ZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgo+PiBBY2tlZC1ieTogVGFtYXMgSyBMZW5neWVs
IDx0YW1hc0B0a2xlbmd5ZWwuY29tPgo+IAo+IFNvcnJ5IEkgaGF2ZW4ndCBoYWQgYSBjaGFuY2Ug
dG8gd2VpZ2ggaW4gb24gdGhpcyBvbmUgeWV0LiAgQSBjb3VwbGUgZm8KPiBjb21tZW50cy4uLgo+
IAo+IAo+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L21tL21lbV9hY2Nlc3MuYyBiL3hlbi9h
cmNoL3g4Ni9tbS9tZW1fYWNjZXNzLmMKPj4gaW5kZXggZTE1MjJhMGI3NS4uNGQ0OTAyNWNiZSAx
MDA2NDQKPj4gLS0tIGEveGVuL2FyY2gveDg2L21tL21lbV9hY2Nlc3MuYwo+PiArKysgYi94ZW4v
YXJjaC94ODYvbW0vbWVtX2FjY2Vzcy5jCj4+IEBAIC00OTUsNiArNDk1LDYxIEBAIHZvaWQgYXJj
aF9wMm1fc2V0X2FjY2Vzc19yZXF1aXJlZChzdHJ1Y3QgZG9tYWluICpkLCBib29sIGFjY2Vzc19y
ZXF1aXJlZCkKPj4gICAgICB9Cj4+ICB9Cj4+ICAKPj4gKy8qCj4+ICsgKiBTZXQvY2xlYXIgdGhl
ICNWRSBzdXBwcmVzcyBiaXQgZm9yIGEgcGFnZS4gIE9ubHkgYXZhaWxhYmxlIG9uIFZNWC4KPj4g
KyAqLwo+PiAraW50IHAybV9zZXRfc3VwcHJlc3NfdmUoc3RydWN0IGRvbWFpbiAqZCwgZ2ZuX3Qg
Z2ZuLCBib29sIHN1cHByZXNzX3ZlLAo+PiArICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWdu
ZWQgaW50IGFsdHAybV9pZHgpCj4gCj4gVGhpcyBzaG91bGQgY2xlYXJseSBiZSBpbiBwMm0uYywg
YW5kLi4uCj4gCj4+ICt7Cj4+ICsgICAgc3RydWN0IHAybV9kb21haW4gKmhvc3RfcDJtID0gcDJt
X2dldF9ob3N0cDJtKGQpOwo+PiArICAgIHN0cnVjdCBwMm1fZG9tYWluICphcDJtID0gTlVMTDsK
Pj4gKyAgICBzdHJ1Y3QgcDJtX2RvbWFpbiAqcDJtOwo+PiArICAgIG1mbl90IG1mbjsKPj4gKyAg
ICBwMm1fYWNjZXNzX3QgYTsKPj4gKyAgICBwMm1fdHlwZV90IHQ7Cj4+ICsgICAgaW50IHJjOwo+
PiArCj4+ICsgICAgaWYgKCAhY3B1X2hhc192bXhfdmlydF9leGNlcHRpb25zICkKPj4gKyAgICAg
ICAgcmV0dXJuIC1FT1BOT1RTVVBQOwo+IAo+IFdlIHNob3VsZCBhdm9pZCBJbnRlbC1zcGVjaWZp
YyBjaGVja3MgaW4gY29tbW9uIGNvZGUuCj4gCj4gSW4gZmFjdCwgdGhpcyBpcyB3cm9uZywgYmVj
YXVzZSB5b3UgY2FuIGNob29zZSB0byBydW4gYSBndWVzdCBpbiBzaGFkb3cKPiBtb2RlIGV2ZW4g
b24gYSBzeXN0ZW0gd2l0aCB2aXJ0IGV4Y2VwdGlvbnMgLS0gaW4gd2hpY2ggY2FzZSB5b3UnZAo+
IHRyaWdnZXIgdGhlIEFTU0VSVCgpIGluIHAybS1wdC5jOnAybV9wdF9zZXRfZW50cnkoKS4KPiAK
PiBQcm9iYWJseSB3aGF0IHNob3VsZCBoYXBwZW4gaXMgdGhhdCB3ZSBzaG91bGQgbW92ZSB0aGUg
dm14IGNoZWNrIGludG8KPiBwMm0tZXB0LmM6cDJtX2VwdF9zZXRfZW50cnkoKSwgYW5kIHJlcGxh
Y2UgdGhlIEFTU0VSVChzdmUgPSAwKSBpbgo+IHAybS1wdC5jOnAybV9wdF9zZXRfZW50cnkoKSB3
aXRoICJpZiAoIHN2ZSAhPSAwICkgcmV0dXJuIC1FTk9UU1VQUDsiLgo+IAo+IEFsdGhvdWdoIHdo
YXQgc2hvdWxkIHByb2JhYmx5ICpyZWFsbHkqIGhhcHBlbiBpcyB0aGF0Cj4gYEhWTU9QX2FsdHAy
bV92Y3B1X2VuYWJsZV9ub3RpZnlgIHNob3VsZCBmYWlsIHdpdGggLUVPUE5PVFNVUFAgaW5zdGVh
ZAo+IG9mIHNpbGVudGx5IHN1Y2NlZWRpbmcuCj4gCj4gRXZlcnl0aGluZyBlbHNlIGxvb2tzIGdv
b2QuCj4gCj4gSSByZWFsaXplIHRoaXMgaGFzIGJlZW4gY2hlY2tlZCBpbiBhbHJlYWR5OyBubyBu
ZWVkIHRvIHJldmVydCBpZiB5b3UgY2FuCj4gc2VuZCBhIGZvbGxvdy11cCBwYXRjaCBpbiB0aGUg
bmV4dCBjb3VwbGUgb2YgKGJ1c2luZXNzKSBkYXlzLgoKVGhhbmtzIGZvciB0aGUgcmV2aWV3ISBJ
J2xsIHN1Ym1pdCBhIGZvbGxvdyB1cCBwYXRjaCBhcyBzb29uIGFzIHBvc3NpYmxlLgoKClRoYW5r
cywKUmF6dmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
