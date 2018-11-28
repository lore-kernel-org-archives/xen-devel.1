From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH V9 5/7] x86/altp2m: fix display frozen when
 switching to a new view early
Date: Wed, 28 Nov 2018 21:44:24 +0200
Message-ID: <7885af24-a801-46e2-d9c4-c010b7841488@bitdefender.com>
References: <1542886828-11241-1-git-send-email-rcojocaru@bitdefender.com>
 <1542886828-11241-6-git-send-email-rcojocaru@bitdefender.com>
 <5BFBE23102000078001FFF07@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gQRe=OH=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1gS5lI-0000gI-QY
 for xen-devel@lists.xenproject.org; Wed, 28 Nov 2018 19:44:40 +0000
In-Reply-To: <5BFBE23102000078001FFF07@prv1-mh.provo.novell.com>
Content-Language: en-US-large
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTEvMjYvMTggMjowOCBQTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMjIuMTEuMTgg
YXQgMTI6NDAsIDxyY29qb2NhcnVAYml0ZGVmZW5kZXIuY29tPiB3cm90ZToKPj4gQEAgLTk1Niwx
OCArMTAwMywxNCBAQCBpbnQgcDJtX2NoYW5nZV90eXBlX29uZShzdHJ1Y3QgZG9tYWluICpkLCB1
bnNpZ25lZCBsb25nIGdmbl9sLAo+PiAgfQo+PiAgCj4+ICAvKiBNb2RpZnkgdGhlIHAybSB0eXBl
IG9mIGEgcmFuZ2Ugb2YgZ2ZucyBmcm9tIG90IHRvIG50LiAqLwo+PiAtdm9pZCBwMm1fY2hhbmdl
X3R5cGVfcmFuZ2Uoc3RydWN0IGRvbWFpbiAqZCwgCj4+IC0gICAgICAgICAgICAgICAgICAgICAg
ICAgICB1bnNpZ25lZCBsb25nIHN0YXJ0LCB1bnNpZ25lZCBsb25nIGVuZCwKPj4gLSAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHAybV90eXBlX3Qgb3QsIHAybV90eXBlX3QgbnQpCj4+ICtzdGF0
aWMgdm9pZCBjaGFuZ2VfdHlwZV9yYW5nZShzdHJ1Y3QgcDJtX2RvbWFpbiAqcDJtLAo+PiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBzdGFydCwgdW5zaWduZWQg
bG9uZyBlbmQsCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwMm1fdHlwZV90IG90
LCBwMm1fdHlwZV90IG50KQo+PiAgewo+PiAgICAgIHVuc2lnbmVkIGxvbmcgZ2ZuID0gc3RhcnQ7
Cj4+IC0gICAgc3RydWN0IHAybV9kb21haW4gKnAybSA9IHAybV9nZXRfaG9zdHAybShkKTsKPj4g
KyAgICBzdHJ1Y3QgZG9tYWluICpkID0gcDJtLT5kb21haW47Cj4+ICAgICAgaW50IHJjID0gMDsK
Pj4gIAo+PiAtICAgIEFTU0VSVChvdCAhPSBudCk7Cj4+IC0gICAgQVNTRVJUKHAybV9pc19jaGFu
Z2VhYmxlKG90KSAmJiBwMm1faXNfY2hhbmdlYWJsZShudCkpOwo+PiAtCj4+IC0gICAgcDJtX2xv
Y2socDJtKTsKPj4gICAgICBwMm0tPmRlZmVyX25lc3RlZF9mbHVzaCA9IDE7Cj4gCj4gV2hpbGUg
cmV2aWV3aW5nIHRoZSBmaXJzdCBvZiBHZW9yZ2UncyBwYXRjaGVzIEkgc3RhcnRlZCB3b25kZXJp
bmcKPiB3aHkgeW91IGtlZXAgdGhpcyBhbmQgLi4uCj4gCj4+IEBAIC0xMDExLDIzICsxMDU0LDU0
IEBAIHZvaWQgcDJtX2NoYW5nZV90eXBlX3JhbmdlKHN0cnVjdCBkb21haW4gKmQsCj4+ICAgICAg
cDJtLT5kZWZlcl9uZXN0ZWRfZmx1c2ggPSAwOwo+PiAgICAgIGlmICggbmVzdGVkaHZtX2VuYWJs
ZWQoZCkgKQo+PiAgICAgICAgICBwMm1fZmx1c2hfbmVzdGVkcDJtKGQpOwo+IAo+IC4uLiB0aGlz
IGhlcmUsIHN1Y2ggdGhhdCBpdCB3b3VsZCBiZSBjYWxsZWQgbXVsdGlwbGUgdGltZXMsIGRlc3Bp
dGUKPiBwMm1fZmx1c2hfbmVzdGVkcDJtKCkgdGFraW5nIGEgc3RydWN0IGRvbWFpbiwgbm90IGEg
c3RydWN0IHAybQo+IGFzIGlucHV0LgoKR29vZCBwb2ludCwgSSdsbCB1c2UgcDJtLT5kZWZlcl9u
ZXN0ZWRfZmx1c2ggb25seSBmb3IgdGhlIGhvc3RwMm0gKHRoZQpvbmx5IGV4cGxpY2l0IGNoZWNr
IEkgc2VlIGluIHRoZSBjb2RlIGlzICImJgohcDJtX2dldF9ob3N0cDJtKGQpLT5kZWZlcl9uZXN0
ZWRfZmx1c2ggKSB7IiBpbiBoYXAuYykgYW5kIGNhbGwKcDJtX2ZsdXNoX25lc3RlZHAybShkKSBv
bmx5IGluIHAybV9jaGFuZ2VfdHlwZV9yYW5nZSgpLgoKClRoYW5rcywKUmF6dmFuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
