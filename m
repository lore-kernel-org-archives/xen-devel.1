From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 09/14] xen: Introduce HAS_M2P config and use
 to protect mfn_to_gmfn call
Date: Thu, 9 May 2019 12:49:37 -0700 (PDT)
Message-ID: <alpine.DEB.2.21.1905091249180.25766@sstabellini-ThinkPad-T480s>
References: <20190507151458.29350-1-julien.grall@arm.com>
 <20190507151458.29350-10-julien.grall@arm.com>
 <alpine.DEB.2.21.1905091104530.25766@sstabellini-ThinkPad-T480s>
 <51dbab9b-b0a5-c207-f1ef-e70b997a0078@arm.com>
 <alpine.DEB.2.21.1905091115560.25766@sstabellini-ThinkPad-T480s>
 <bdd8f1c9-e51d-1084-a2da-3f3e89edc690@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UEDQ=TJ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hOp2y-0006IZ-3y
 for xen-devel@lists.xenproject.org; Thu, 09 May 2019 19:49:40 +0000
In-Reply-To: <bdd8f1c9-e51d-1084-a2da-3f3e89edc690@arm.com>
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

T24gVGh1LCA5IE1heSAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSGkgU3RlZmFubywKPiAK
PiBPbiA1LzkvMTkgNzoxNiBQTSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+ID4gT24gVGh1
LCA5IE1heSAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gPiA+IEhpLAo+ID4gPiAKPiA+ID4g
T24gNS85LzE5IDc6MDYgUE0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPiA+ID4gPiBPbiBU
dWUsIDcgTWF5IDIwMTksIEp1bGllbiBHcmFsbCB3cm90ZToKPiA+ID4gPiA+IGRpZmYgLS1naXQg
YS94ZW4vaW5jbHVkZS94ZW4vZG9tYWluLmggYi94ZW4vaW5jbHVkZS94ZW4vZG9tYWluLmgKPiA+
ID4gPiA+IGluZGV4IGQxYmZjODJmNTcuLmYxNzYxZmUxODMgMTAwNjQ0Cj4gPiA+ID4gPiAtLS0g
YS94ZW4vaW5jbHVkZS94ZW4vZG9tYWluLmgKPiA+ID4gPiA+ICsrKyBiL3hlbi9pbmNsdWRlL3hl
bi9kb21haW4uaAo+ID4gPiA+ID4gQEAgLTExOCw0ICsxMTgsMTIgQEAgc3RydWN0IHZudW1hX2lu
Zm8gewo+ID4gPiA+ID4gICAgICB2b2lkIHZudW1hX2Rlc3Ryb3koc3RydWN0IHZudW1hX2luZm8g
KnZudW1hKTsKPiA+ID4gPiA+ICAgICsjaWZkZWYgQ09ORklHX0hBU19NMlAKPiA+ID4gPiA+ICsj
ZGVmaW5lIGRvbWFpbl9zaGFyZWRfaW5mb19nZm4oZCkgKHsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgXAo+ID4gPiA+ID4gKyAgICBjb25zdCBzdHJ1Y3QgZG9tYWluICpkXyA9IChkKTsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gPiA+ID4gPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+ID4gPiA+
ICsgICAgbWZuX3RvX2dmbihkXywgX21mbihfX3ZpcnRfdG9fbWZuKGRfLT5zaGFyZWRfaW5mbykp
KTsgICAgICAgXAo+ID4gPiA+IAo+ID4gPiA+IEFyZW4ndCB5b3UgbWlzc2luZyBhIF9nZm4gaGVy
ZT8KPiA+ID4gPiAKPiA+ID4gPiAgICAgX2dmbihtZm5fdG9fZ2ZuKGQsIF9tZm4oX192aXJ0X3Rv
X21mbihkLT5zaGFyZWRfaW5mbykpKSk7Cj4gPiA+IAo+ID4gPiBQYXRjaCAjMyBvZiB0aGlzIHNl
cmllcyBjb252ZXJ0IG1mbl90b19nZm4gdG8gdXNlIHR5cGVzYWZlIE1GTiAmIEdGTi4gU28KPiA+
ID4gdGhlCj4gPiA+IGZ1bmN0aW9uIG5vdyByZXR1cm4gYSBnZm5fdC4KPiA+IAo+ID4gQWghIFNv
bWVob3cgSSBhbSBtaXNzaW5nIHBhdGNoZXMgMi0zLTQgaW4gbXkgaW5ib3guIEknbGwgdHJ5IHRv
IGdldCB0aGVtCj4gPiBmcm9tIHRoZSBhcmNoaXZlLgo+IAo+IEJlY2F1c2UgdGhleSBhcmUgeDg2
IHNwZWNpZmljIDopLiBUaGUgcmF0aW9uYWxlIG9mIGltcGxlbWVudGluZwo+IGRvbWFpbl9zaGFy
ZWRfaW5mb19nZm4oKSBpbiBjb21tb24gY29kZSBpcyBhbnkgYXJjaCB1c2luZyBNMlAgc2hvdWxk
IHByb3ZpZGUgYQo+IHNpbWlsYXIgaGVscGVyLgo+IAo+IEFybSBkb2Vzbid0IGhhdmUgYW4gTTJQ
LCBoZW5jZSB3aHkgbWZuX3RvX2dmbiBpcyBub3QgZXhpc3RlbnQuCgpBbGwgcmlnaHQuIEFkZCBt
eSBhY2tlZC1ieSB0byB0aGlzIHBhdGNoLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
