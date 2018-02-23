From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v8 01/11] vpci: introduce basic handlers to
 trap accesses to the PCI config space
Date: Fri, 23 Feb 2018 17:45:43 +0000
Message-ID: <df60cc87-92cf-da70-6534-6efb92174f32@arm.com>
References: <20180123150735.74779-1-roger.pau@citrix.com>
 <20180123150735.74779-2-roger.pau@citrix.com>
 <5A90476802000078001AAFF1@prv-mh.provo.novell.com>
 <88293102-cebe-1ad6-5335-741fd0c97051@arm.com>
 <20180223172511.yifvuflrpjfwgpzs@MacBook-Pro-de-Roger.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=gg1g=fr=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1epHPy-0003sR-9G
 for xen-devel@lists.xenproject.org; Fri, 23 Feb 2018 17:45:58 +0000
In-Reply-To: <20180223172511.yifvuflrpjfwgpzs@MacBook-Pro-de-Roger.local>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <JBeulich@suse.com>, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

SGkgUm9nZXIsCgpPbiAyMy8wMi8xOCAxNzoyNSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBP
biBGcmksIEZlYiAyMywgMjAxOCBhdCAwNDowMjoxN1BNICswMDAwLCBKdWxpZW4gR3JhbGwgd3Jv
dGU6Cj4+IEhpLAo+Pgo+PiBPbiAyMy8wMi8xOCAxNTo1NSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+
Pj4+PiBPbiAyMy4wMS4xOCBhdCAxNjowNywgPHJvZ2VyLnBhdUBjaXRyaXguY29tPiB3cm90ZToK
Pj4+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL3hlbi5sZHMuUyBiL3hlbi9hcmNoL2FybS94
ZW4ubGRzLlMKPj4+PiBpbmRleCBjOWI5NTQ2NDM1Li45OGI4MjY4MGM2IDEwMDY0NAo+Pj4+IC0t
LSBhL3hlbi9hcmNoL2FybS94ZW4ubGRzLlMKPj4+PiArKysgYi94ZW4vYXJjaC9hcm0veGVuLmxk
cy5TCj4+Pj4gQEAgLTY1LDYgKzY1LDEzIEBAIFNFQ1RJT05TCj4+Pj4gICAgICAgICAgIF9fcGFy
YW1fc3RhcnQgPSAuOwo+Pj4+ICAgICAgICAgICAqKC5kYXRhLnBhcmFtKQo+Pj4+ICAgICAgICAg
ICBfX3BhcmFtX2VuZCA9IC47Cj4+Pj4gKwo+Pj4+ICsjaWYgZGVmaW5lZChDT05GSUdfSEFTX1BD
SSkgJiYgZGVmaW5lZChDT05GSUdfTEFURV9IV0RPTSkKPj4KPj4gV2h5IHRoaXMgaXMgY29uZGl0
aW9uYWwgdG8gQ09ORklHX0xBVEVfSFdET00/Cj4gCj4gQ3VycmVudGx5IFBDSSBjb25maWcgc3Bh
Y2UgZW11bGF0aW9uIGlzIGxpbWl0ZWQgdG8gRG9tMCB1c2FnZSwgaGVuY2UKPiB0aGUgc2V0dXAg
cGFydCBvZiBpdCBjYW4gbGl2ZSBpbiB0aGUgaW5pdCBzZWN0aW9uIGlmIG5vdCB1c2luZyBhIGxh
dGUKPiBoYXJkd2FyZSBkb21haW4uCgpPaCwgSSBtaXNzZWQgdGhhdCBiaXRzLiBNYWtlIHNlbnNl
IHRoZW4uCgpDaGVlcnMsCgo+Pgo+PiBBbHNvLCBhbnkgcmVhc29uIHRvIGltcG9zZSBWUENJIHdo
ZW4gQ09ORklHX0hBU19QQ0kgaXMgc2V0IGFuZCBub3QgaW50cm9kdWNlCj4+IGFub3RoZXIgY29u
ZmlnPyBUaGUgbmV3IGNvbmZpZyB3b3VsZCBoZWxwIHRvIGFkZCBzdXBwb3J0IGZvciBQQ0kgaW4g
c3RlcHMgaW4KPj4gb3RoZXIgYXJjaGl0ZWN0dXJlcy4KPiAKPiBJIGNvdWxkIGRvIHRoYXQgSSBn
dWVzcywgdW5sZXNzIGFueW9uZSBvYmplY3RzIEkgd2lsbCBhZGQgYQo+IENPTkZJR19WUENJIG9w
dGlvbi4KPiAKPiBSb2dlci4KPiAKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
