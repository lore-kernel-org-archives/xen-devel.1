From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH 09/14] xen: Introduce HAS_M2P config and use
 to protect mfn_to_gmfn call
Date: Thu, 9 May 2019 19:12:17 +0100
Message-ID: <51dbab9b-b0a5-c207-f1ef-e70b997a0078@arm.com>
References: <20190507151458.29350-1-julien.grall@arm.com>
 <20190507151458.29350-10-julien.grall@arm.com>
 <alpine.DEB.2.21.1905091104530.25766@sstabellini-ThinkPad-T480s>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Kt3J=TJ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hOnWp-000799-RD
 for xen-devel@lists.xenproject.org; Thu, 09 May 2019 18:12:23 +0000
In-Reply-To: <alpine.DEB.2.21.1905091104530.25766@sstabellini-ThinkPad-T480s>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, oleksandr_tyshchenko@epam.com, andrii_anisov@epam.com, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiA1LzkvMTkgNzowNiBQTSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+IE9uIFR1
ZSwgNyBNYXkgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBkaWZmIC0tZ2l0IGEveGVuL2lu
Y2x1ZGUveGVuL2RvbWFpbi5oIGIveGVuL2luY2x1ZGUveGVuL2RvbWFpbi5oCj4+IGluZGV4IGQx
YmZjODJmNTcuLmYxNzYxZmUxODMgMTAwNjQ0Cj4+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9kb21h
aW4uaAo+PiArKysgYi94ZW4vaW5jbHVkZS94ZW4vZG9tYWluLmgKPj4gQEAgLTExOCw0ICsxMTgs
MTIgQEAgc3RydWN0IHZudW1hX2luZm8gewo+PiAgIAo+PiAgIHZvaWQgdm51bWFfZGVzdHJveShz
dHJ1Y3Qgdm51bWFfaW5mbyAqdm51bWEpOwo+PiAgIAo+PiArI2lmZGVmIENPTkZJR19IQVNfTTJQ
Cj4+ICsjZGVmaW5lIGRvbWFpbl9zaGFyZWRfaW5mb19nZm4oZCkgKHsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgXAo+PiArICAgIGNvbnN0IHN0cnVjdCBkb21haW4gKmRfID0gKGQpOyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIFwKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4+ICsgICAgbWZuX3RvX2dm
bihkXywgX21mbihfX3ZpcnRfdG9fbWZuKGRfLT5zaGFyZWRfaW5mbykpKTsgICAgICAgXAo+IAo+
IEFyZW4ndCB5b3UgbWlzc2luZyBhIF9nZm4gaGVyZT8KPiAKPiAgICBfZ2ZuKG1mbl90b19nZm4o
ZCwgX21mbihfX3ZpcnRfdG9fbWZuKGQtPnNoYXJlZF9pbmZvKSkpKTsKClBhdGNoICMzIG9mIHRo
aXMgc2VyaWVzIGNvbnZlcnQgbWZuX3RvX2dmbiB0byB1c2UgdHlwZXNhZmUgTUZOICYgR0ZOLiBT
byAKdGhlIGZ1bmN0aW9uIG5vdyByZXR1cm4gYSBnZm5fdC4KCkNoZWVycywKCi0tIApKdWxpZW4g
R3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
