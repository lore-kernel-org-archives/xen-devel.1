From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 09/14] xen: Introduce HAS_M2P config and use
 to protect mfn_to_gmfn call
Date: Thu, 9 May 2019 11:16:27 -0700 (PDT)
Message-ID: <alpine.DEB.2.21.1905091115560.25766@sstabellini-ThinkPad-T480s>
References: <20190507151458.29350-1-julien.grall@arm.com>
 <20190507151458.29350-10-julien.grall@arm.com>
 <alpine.DEB.2.21.1905091104530.25766@sstabellini-ThinkPad-T480s>
 <51dbab9b-b0a5-c207-f1ef-e70b997a0078@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UEDQ=TJ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hOnan-0007Kp-QK
 for xen-devel@lists.xenproject.org; Thu, 09 May 2019 18:16:29 +0000
In-Reply-To: <51dbab9b-b0a5-c207-f1ef-e70b997a0078@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, oleksandr_tyshchenko@epam.com, andrii_anisov@epam.com, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCA5IE1heSAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSGksCj4gCj4gT24gNS85
LzE5IDc6MDYgUE0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPiA+IE9uIFR1ZSwgNyBNYXkg
MjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+ID4gPiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUv
eGVuL2RvbWFpbi5oIGIveGVuL2luY2x1ZGUveGVuL2RvbWFpbi5oCj4gPiA+IGluZGV4IGQxYmZj
ODJmNTcuLmYxNzYxZmUxODMgMTAwNjQ0Cj4gPiA+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9kb21h
aW4uaAo+ID4gPiArKysgYi94ZW4vaW5jbHVkZS94ZW4vZG9tYWluLmgKPiA+ID4gQEAgLTExOCw0
ICsxMTgsMTIgQEAgc3RydWN0IHZudW1hX2luZm8gewo+ID4gPiAgICAgdm9pZCB2bnVtYV9kZXN0
cm95KHN0cnVjdCB2bnVtYV9pbmZvICp2bnVtYSk7Cj4gPiA+ICAgKyNpZmRlZiBDT05GSUdfSEFT
X00yUAo+ID4gPiArI2RlZmluZSBkb21haW5fc2hhcmVkX2luZm9fZ2ZuKGQpICh7ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIFwKPiA+ID4gKyAgICBjb25zdCBzdHJ1Y3QgZG9tYWluICpkXyA9
IChkKTsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ID4g
PiArICAgIG1mbl90b19nZm4oZF8sIF9tZm4oX192aXJ0X3RvX21mbihkXy0+c2hhcmVkX2luZm8p
KSk7ICAgICAgIFwKPiA+IAo+ID4gQXJlbid0IHlvdSBtaXNzaW5nIGEgX2dmbiBoZXJlPwo+ID4g
Cj4gPiAgICBfZ2ZuKG1mbl90b19nZm4oZCwgX21mbihfX3ZpcnRfdG9fbWZuKGQtPnNoYXJlZF9p
bmZvKSkpKTsKPiAKPiBQYXRjaCAjMyBvZiB0aGlzIHNlcmllcyBjb252ZXJ0IG1mbl90b19nZm4g
dG8gdXNlIHR5cGVzYWZlIE1GTiAmIEdGTi4gU28gdGhlCj4gZnVuY3Rpb24gbm93IHJldHVybiBh
IGdmbl90LgoKQWghIFNvbWVob3cgSSBhbSBtaXNzaW5nIHBhdGNoZXMgMi0zLTQgaW4gbXkgaW5i
b3guIEknbGwgdHJ5IHRvIGdldCB0aGVtCmZyb20gdGhlIGFyY2hpdmUuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
