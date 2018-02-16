From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH v2 2/2] vmx/hap: optimize CR4 trapping
Date: Fri, 16 Feb 2018 14:39:19 +0200
Message-ID: <c61588a3-9e98-8440-f895-fd3a75eef460@bitdefender.com>
References: <20180216121029.6872-1-roger.pau@citrix.com>
 <20180216121029.6872-3-roger.pau@citrix.com>
 <338ca9c5-d5f5-c0e9-4e35-154c9919ae75@bitdefender.com>
 <20180216123747.fqmqfgc7xqmof2oq@MacBook-Pro-de-Roger.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=wjjn=fk=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1emfIV-0005zE-Nm
 for xen-devel@lists.xenproject.org; Fri, 16 Feb 2018 12:39:27 +0000
Received: from smtp02.buh.bitdefender.net (smtp.bitdefender.biz [10.17.80.76])
 by mx-sr.buh.bitdefender.com (Postfix) with ESMTP id AE37C7FC77
 for <xen-devel@lists.xenproject.org>; Fri, 16 Feb 2018 14:39:19 +0200 (EET)
In-Reply-To: <20180216123747.fqmqfgc7xqmof2oq@MacBook-Pro-de-Roger.local>
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
Cc: Kevin Tian <kevin.tian@intel.com>, Tamas K Lengyel <tamas@tklengyel.com>, Jun Nakajima <jun.nakajima@intel.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gMDIvMTYvMjAxOCAwMjozNyBQTSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBGcmks
IEZlYiAxNiwgMjAxOCBhdCAwMjozMDo1NVBNICswMjAwLCBSYXp2YW4gQ29qb2NhcnUgd3JvdGU6
Cj4+IE9uIDAyLzE2LzIwMTggMDI6MTAgUE0sIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToKPj4+IGRp
ZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvbW9uaXRvci5jIGIveGVuL2FyY2gveDg2L21vbml0b3Iu
Ywo+Pj4gaW5kZXggZjIyOWU2OTk0OC4uNDMxNzY1OGM1NiAxMDA2NDQKPj4+IC0tLSBhL3hlbi9h
cmNoL3g4Ni9tb25pdG9yLmMKPj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9tb25pdG9yLmMKPj4+IEBA
IC0xODksMTAgKzE4OSwxMSBAQCBpbnQgYXJjaF9tb25pdG9yX2RvbWN0bF9ldmVudChzdHJ1Y3Qg
ZG9tYWluICpkLAo+Pj4gICAgICAgICAgICAgIGFkLT5tb25pdG9yLndyaXRlX2N0cmxyZWdfZW5h
YmxlZCAmPSB+Y3RybHJlZ19iaXRtYXNrOwo+Pj4gICAgICAgICAgfQo+Pj4gIAo+Pj4gLSAgICAg
ICAgaWYgKCBWTV9FVkVOVF9YODZfQ1IzID09IG1vcC0+dS5tb3ZfdG9fY3IuaW5kZXggKQo+Pj4g
KyAgICAgICAgaWYgKCBWTV9FVkVOVF9YODZfQ1IzID09IG1vcC0+dS5tb3ZfdG9fY3IuaW5kZXgg
fHwKPj4+ICsgICAgICAgICAgICAgVk1fRVZFTlRfWDg2X0NSNCA9PSBtb3AtPnUubW92X3RvX2Ny
LmluZGV4ICkKPj4+ICAgICAgICAgIHsKPj4+ICAgICAgICAgICAgICBzdHJ1Y3QgdmNwdSAqdjsK
Pj4+IC0gICAgICAgICAgICAvKiBMYXRjaGVzIG5ldyBDUjMgbWFzayB0aHJvdWdoIENSMCBjb2Rl
LiAqLwo+Pj4gKyAgICAgICAgICAgIC8qIExhdGNoZXMgbmV3IENSMyBvciBDUjQgbWFzayB0aHJv
dWdoIENSMCBjb2RlLiAqLwo+Pj4gICAgICAgICAgICAgIGZvcl9lYWNoX3ZjcHUgKCBkLCB2ICkK
Pj4+ICAgICAgICAgICAgICAgICAgaHZtX3VwZGF0ZV9ndWVzdF9jcih2LCAwKTsKPj4+ICAgICAg
ICAgIH0KPj4KPj4gRGlkIHlvdSwgYnkgYW55IGNoYW5jZSwgdGVzdCB0aGlzIGNvZGUgd2l0aCB4
ZW4tYWNjZXNzLmMgKGl0IGFscmVhZHkgaGFzCj4+IGEgdGVzdCBmb3IgQ1I0IGZvciB0aGUgUEdF
IHN0dWZmKT8gSSdtIG5vdCBjb252aW5jZWQgdGhlCj4+IGh2bV91cGRhdGVfZ3Vlc3RfY3Iodiwg
MCk7IGNhbGwgc3VmZmljZXMgdG8gZW5hYmxlIENSNCBsb2FkIGV4aXRzLgo+IAo+IGh2bV91cGRh
dGVfZ3Vlc3RfY3IgaXMganVzdCBhIHdyYXBwZXIgdG8gdm14X3VwZGF0ZV9ndWVzdF9jciB3aGVu
Cj4gdXNpbmcgdm14LCB3aGljaCB3aWxsIHVuY29uZGl0aW9uYWxseSByZS1jYWxjdWxhdGUgdGhl
IENSNCBtYXNrIHdoZW4KPiBjYWxsZWQgd2l0aCBjciA9PSAwIG9yIGNyID09IDQuCj4gCj4gSSBo
YXZlIG5vdCB0ZXN0ZWQgaXQgd2l0aCB4ZW4tYWNjZXNzLCBidXQgaXQgc2VlbXMgcXVpdGUKPiBz
dHJhaWdodGZvcndhcmQgdG8gbWUuIEFyZSB5b3Ugc2VlaW5nIGFueSBvdGhlciBwYXRoIHRoYXQg
Y291bGQKPiBlbmFibGUgQ1I0IGxvYWQgYWNjZXNzZXMgd2l0aG91dCBjYWxsaW5nIGh2bV91cGRh
dGVfZ3Vlc3RfY3I/CgpObywgSSB0aG91Z2h0IEkgZGlkIGJ1dCBhcyBpdCB0dXJucyBvdXQgaXQg
d2Fzbid0LiBJJ2xsIHJ1biBhIHF1aWNrIHRlc3QKb24gdGhlIHBhdGNoZXMganVzdCB0byBtYWtl
IHN1cmUgdGhvdWdoLiBUaGV5IHNob3VsZCBiZSBhbHJpZ2h0LgoKClRoYW5rcywKUmF6dmFuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
