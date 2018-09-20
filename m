From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH v5 2/3] x86/altp2m: Add a hvmop for setting
 the suppress #VE bit
Date: Thu, 20 Sep 2018 18:52:16 +0300
Message-ID: <2530a1bc-aa84-87ea-5ba2-8141747d6500@bitdefender.com>
References: <20180903154836.25708-1-apop@bitdefender.com>
 <20180903154836.25708-3-apop@bitdefender.com>
 <4e54473d-1233-7d8c-17b8-b4bd949bf380@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=tdcx=mc=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1g31G3-0005q6-NX
 for xen-devel@lists.xenproject.org; Thu, 20 Sep 2018 15:52:47 +0000
Received: from mx-sr.buh.bitdefender.com (mx-sr.buh.bitdefender.biz
 [10.17.80.103])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id BFE47305FFB4
 for <xen-devel@lists.xenproject.org>; Thu, 20 Sep 2018 18:52:45 +0300 (EEST)
Received: from smtp02.buh.bitdefender.net (smtp.bitdefender.biz [10.17.80.76])
 by mx-sr.buh.bitdefender.com (Postfix) with ESMTP id 880027FE6B
 for <xen-devel@lists.xenproject.org>; Thu, 20 Sep 2018 18:52:45 +0300 (EEST)
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

T24gOS8yMC8xOCAyOjM0IFBNLCBHZW9yZ2UgRHVubGFwIHdyb3RlOgo+PiAraW50IHAybV9zZXRf
c3VwcHJlc3NfdmUoc3RydWN0IGRvbWFpbiAqZCwgZ2ZuX3QgZ2ZuLCBib29sIHN1cHByZXNzX3Zl
LAo+PiArICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IGFsdHAybV9pZHgpCj4g
VGhpcyBzaG91bGQgY2xlYXJseSBiZSBpbiBwMm0uYywgYW5kLi4uCj4gCj4+ICt7Cj4+ICsgICAg
c3RydWN0IHAybV9kb21haW4gKmhvc3RfcDJtID0gcDJtX2dldF9ob3N0cDJtKGQpOwo+PiArICAg
IHN0cnVjdCBwMm1fZG9tYWluICphcDJtID0gTlVMTDsKPj4gKyAgICBzdHJ1Y3QgcDJtX2RvbWFp
biAqcDJtOwo+PiArICAgIG1mbl90IG1mbjsKPj4gKyAgICBwMm1fYWNjZXNzX3QgYTsKPj4gKyAg
ICBwMm1fdHlwZV90IHQ7Cj4+ICsgICAgaW50IHJjOwo+PiArCj4+ICsgICAgaWYgKCAhY3B1X2hh
c192bXhfdmlydF9leGNlcHRpb25zICkKPj4gKyAgICAgICAgcmV0dXJuIC1FT1BOT1RTVVBQOwo+
IFdlIHNob3VsZCBhdm9pZCBJbnRlbC1zcGVjaWZpYyBjaGVja3MgaW4gY29tbW9uIGNvZGUuCj4g
Cj4gSW4gZmFjdCwgdGhpcyBpcyB3cm9uZywgYmVjYXVzZSB5b3UgY2FuIGNob29zZSB0byBydW4g
YSBndWVzdCBpbiBzaGFkb3cKPiBtb2RlIGV2ZW4gb24gYSBzeXN0ZW0gd2l0aCB2aXJ0IGV4Y2Vw
dGlvbnMgLS0gaW4gd2hpY2ggY2FzZSB5b3UnZAo+IHRyaWdnZXIgdGhlIEFTU0VSVCgpIGluIHAy
bS1wdC5jOnAybV9wdF9zZXRfZW50cnkoKS4KPiAKPiBQcm9iYWJseSB3aGF0IHNob3VsZCBoYXBw
ZW4gaXMgdGhhdCB3ZSBzaG91bGQgbW92ZSB0aGUgdm14IGNoZWNrIGludG8KPiBwMm0tZXB0LmM6
cDJtX2VwdF9zZXRfZW50cnkoKSwgYW5kIHJlcGxhY2UgdGhlIEFTU0VSVChzdmUgPSAwKSBpbgo+
IHAybS1wdC5jOnAybV9wdF9zZXRfZW50cnkoKSB3aXRoICJpZiAoIHN2ZSAhPSAwICkgcmV0dXJu
IC1FTk9UU1VQUDsiLgo+IAo+IEFsdGhvdWdoIHdoYXQgc2hvdWxkIHByb2JhYmx5ICpyZWFsbHkq
IGhhcHBlbiBpcyB0aGF0Cj4gYEhWTU9QX2FsdHAybV92Y3B1X2VuYWJsZV9ub3RpZnlgIHNob3Vs
ZCBmYWlsIHdpdGggLUVPUE5PVFNVUFAgaW5zdGVhZAo+IG9mIHNpbGVudGx5IHN1Y2NlZWRpbmcu
CgpEbyB5b3UgbWVhbiBIVk1PUF9hbHRwMm1fc2V0X3N1cHByZXNzX3ZlIGhlcmUsIG9yIGFtIEkg
bWlzdW5kZXJzdGFuZGluZwp5b3VyIGNvbW1lbnQ/IEknbSBoYXBweSB0byBkbyB0aGUgZXhhY3Qg
bW9kaWZpY2F0aW9ucyB5b3UndmUgcmVxdWVzdGVkCmFib3ZlIGJ1dCBJJ20gYWZyYWlkIEkgZG9u
J3QgZm9sbG93IHRoZSBIVk1PUF9hbHRwMm1fdmNwdV9lbmFibGVfbm90aWZ5CmNvbW1lbnQuCgoK
VGhhbmtzLApSYXp2YW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
