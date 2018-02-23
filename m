From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v8 01/11] vpci: introduce basic handlers to
 trap accesses to the PCI config space
Date: Fri, 23 Feb 2018 16:02:17 +0000
Message-ID: <88293102-cebe-1ad6-5335-741fd0c97051@arm.com>
References: <20180123150735.74779-1-roger.pau@citrix.com>
 <20180123150735.74779-2-roger.pau@citrix.com>
 <5A90476802000078001AAFF1@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=gg1g=fr=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1epFnp-0007LS-4G
 for xen-devel@lists.xenproject.org; Fri, 23 Feb 2018 16:02:29 +0000
In-Reply-To: <5A90476802000078001AAFF1@prv-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Cc: Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Paul Durrant <paul.durrant@citrix.com>, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiAyMy8wMi8xOCAxNTo1NSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMjMuMDEu
MTggYXQgMTY6MDcsIDxyb2dlci5wYXVAY2l0cml4LmNvbT4gd3JvdGU6Cj4+IGRpZmYgLS1naXQg
YS94ZW4vYXJjaC9hcm0veGVuLmxkcy5TIGIveGVuL2FyY2gvYXJtL3hlbi5sZHMuUwo+PiBpbmRl
eCBjOWI5NTQ2NDM1Li45OGI4MjY4MGM2IDEwMDY0NAo+PiAtLS0gYS94ZW4vYXJjaC9hcm0veGVu
Lmxkcy5TCj4+ICsrKyBiL3hlbi9hcmNoL2FybS94ZW4ubGRzLlMKPj4gQEAgLTY1LDYgKzY1LDEz
IEBAIFNFQ1RJT05TCj4+ICAgICAgICAgIF9fcGFyYW1fc3RhcnQgPSAuOwo+PiAgICAgICAgICAq
KC5kYXRhLnBhcmFtKQo+PiAgICAgICAgICBfX3BhcmFtX2VuZCA9IC47Cj4+ICsKPj4gKyNpZiBk
ZWZpbmVkKENPTkZJR19IQVNfUENJKSAmJiBkZWZpbmVkKENPTkZJR19MQVRFX0hXRE9NKQoKV2h5
IHRoaXMgaXMgY29uZGl0aW9uYWwgdG8gQ09ORklHX0xBVEVfSFdET00/CgpBbHNvLCBhbnkgcmVh
c29uIHRvIGltcG9zZSBWUENJIHdoZW4gQ09ORklHX0hBU19QQ0kgaXMgc2V0IGFuZCBub3QgCmlu
dHJvZHVjZSBhbm90aGVyIGNvbmZpZz8gVGhlIG5ldyBjb25maWcgd291bGQgaGVscCB0byBhZGQg
c3VwcG9ydCBmb3IgClBDSSBpbiBzdGVwcyBpbiBvdGhlciBhcmNoaXRlY3R1cmVzLgoKPj4gKyAg
ICAgICAuID0gQUxJR04oUE9JTlRFUl9BTElHTik7Cj4+ICsgICAgICAgX19zdGFydF92cGNpX2Fy
cmF5ID0gLjsKPj4gKyAgICAgICAqKC5kYXRhLnZwY2kpCj4+ICsgICAgICAgX19lbmRfdnBjaV9h
cnJheSA9IC47Cj4+ICsjZW5kaWYKPj4gICAgIH0gOnRleHQKPj4gICAKPj4gICAjaWYgZGVmaW5l
ZChCVUlMRF9JRCkKPj4gQEAgLTE3Myw2ICsxODAsMTMgQEAgU0VDVElPTlMKPj4gICAgICAgICAg
KiguaW5pdF9hcnJheSkKPj4gICAgICAgICAgKihTT1JUKC5pbml0X2FycmF5LiopKQo+PiAgICAg
ICAgICBfX2N0b3JzX2VuZCA9IC47Cj4+ICsKPj4gKyNpZiBkZWZpbmVkKENPTkZJR19IQVNfUENJ
KSAmJiAhZGVmaW5lZChDT05GSUdfTEFURV9IV0RPTSkKPj4gKyAgICAgICAuID0gQUxJR04oUE9J
TlRFUl9BTElHTik7Cj4+ICsgICAgICAgX19zdGFydF92cGNpX2FycmF5ID0gLjsKPj4gKyAgICAg
ICAqKC5kYXRhLnZwY2kpCj4+ICsgICAgICAgX19lbmRfdnBjaV9hcnJheSA9IC47Cj4+ICsjZW5k
aWYKPj4gICAgIH0gOnRleHQKPj4gICAgIF9faW5pdF9lbmRfZWZpID0gLjsKPj4gICAgIC4gPSBB
TElHTihTVEFDS19TSVpFKTsKPiAKPiBTYWRseSB5b3UgZm9yZ290IHRvIENjIHRoZSBBUk0gbWFp
bnRhaW5lcnMuIFN0ZWZhbm8sIEp1bGllbiwgdGhlCj4gYWJvdmUgd291bGQgcmVxdWlyZSB5b3Vy
IGFjay4KPiAKPiBKYW4KPiAKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
