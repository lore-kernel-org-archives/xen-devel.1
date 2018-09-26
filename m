From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH V5] x86/altp2m: Add a subop for obtaining
 the mem access of a page
Date: Wed, 26 Sep 2018 07:20:56 -0600
Message-ID: <5BAB87B802000078001EC33E@prv1-mh.provo.novell.com>
References: <1537947263-8469-1-git-send-email-rcojocaru@bitdefender.com>
 <f04e2217-ee7b-6ade-af17-f87952fe72c5@bitdefender.com>
 <1deabccf-a9e9-186a-9595-5a9790de37d2@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=an3h=mi=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1g59kT-0005Um-3V
 for xen-devel@lists.xenproject.org; Wed, 26 Sep 2018 13:21:01 +0000
In-Reply-To: <1deabccf-a9e9-186a-9595-5a9790de37d2@bitdefender.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Adrian Pop <apop@bitdefender.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Tamas K Lengyel <tamas@tklengyel.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI2LjA5LjE4IGF0IDE0OjI2LCA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4gd3Jv
dGU6Cj4gVG8gY2xhcmlmeSB0aGUgcXVlc3Rpb24sIEknbGwgb2YgY291cnNlIGRvIHRoaXM6Cj4g
Cj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9tbS9tZW1fYWNjZXNzLmMgYi94ZW4vYXJjaC94
ODYvbW0vbWVtX2FjY2Vzcy5jCj4gaW5kZXggNjdiNGExZC4uMmI1YTYyMSAxMDA2NDQKPiAtLS0g
YS94ZW4vYXJjaC94ODYvbW0vbWVtX2FjY2Vzcy5jCj4gKysrIGIveGVuL2FyY2gveDg2L21tL21l
bV9hY2Nlc3MuYwo+IEBAIC00ODksMTQgKzQ4OSwxMyBAQCBsb25nIHAybV9zZXRfbWVtX2FjY2Vz
c19tdWx0aShzdHJ1Y3QgZG9tYWluICpkLAo+ICBpbnQgcDJtX2dldF9tZW1fYWNjZXNzKHN0cnVj
dCBkb21haW4gKmQsIGdmbl90IGdmbiwgeGVubWVtX2FjY2Vzc190Cj4gKmFjY2VzcywKPiAgICAg
ICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgYWx0cDJtX2lkeCkKPiAgewo+IC0gICAg
c3RydWN0IHAybV9kb21haW4gKnAybTsKPiArICAgIHN0cnVjdCBwMm1fZG9tYWluICpwMm0gPSBw
Mm1fZ2V0X2hvc3RwMm0oZCk7Cj4gCj4gKyNpZmRlZiBDT05GSUdfSFZNCj4gICAgICBpZiAoICFh
bHRwMm1fYWN0aXZlKGQpICkKPiAgICAgIHsKPiAgICAgICAgICBpZiAoIGFsdHAybV9pZHggKQo+
ICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPiAtCj4gLSAgICAgICAgcDJtID0gcDJtX2dl
dF9ob3N0cDJtKGQpOwo+ICAgICAgfQo+ICAgICAgZWxzZQo+ICAgICAgewo+IEBAIC01MDYsNiAr
NTA1LDkgQEAgaW50IHAybV9nZXRfbWVtX2FjY2VzcyhzdHJ1Y3QgZG9tYWluICpkLCBnZm5fdCBn
Zm4sCj4geGVubWVtX2FjY2Vzc190ICphY2Nlc3MsCj4gCj4gICAgICAgICAgcDJtID0gZC0+YXJj
aC5hbHRwMm1fcDJtW2FsdHAybV9pZHhdOwo+ICAgICAgfQo+ICsjZWxzZQo+ICsgICAgQVNTRVJU
KCFhbHRwMm1faWR4KTsKPiArI2VuZGlmCj4gCj4gICAgICByZXR1cm4gX3AybV9nZXRfbWVtX2Fj
Y2VzcyhwMm0sIGdmbiwgYWNjZXNzKTsKPiAgfQo+IAo+IGJ1dCBpcyBpdCBPSyB0aGF0IHRoZSBo
eXBlcnZpc29yIGJ1aWxkcyB3aXRoIGEgc2V0IG9mIGZsYWdzIHRoYXQKPiBpbmNsdWRlcyBDT05G
SUdfSFZNIGFuZCB0aGUgZmlybXdhcmUgY29kZSB3aXRoIGEgc2V0IHRoYXQgZG9lc24ndD8KCklz
IHRoaXMgcGVyaGFwcyBzaW1wbHkgKHNvIGZhciB1bm5vdGljZWQpIGZhbGxvdXQgZnJvbSBXZWkn
cyBDT05GSUdfSFZNLQpkaXNhYmxpbmcgd29yaz8gT3IgaW5zdWZmaWNpZW50IHJlLWJhc2luZyBv
ZiB5b3VyIGNoYW5nZSBvbiB0b3Agb2YgaGlzCndvcms/IFRoZSBzaGltIG5vdyBidWlsZHMgd2l0
aCBIVk09biwgd2hpbGUgdGhlIGh5cGVydmlzb3IgKHVubGVzcwp5b3UndmUgb3ZlcnJpZGRlbiB0
aGUgZGVmYXVsdCkgdXNlcyBIVk09eS4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
