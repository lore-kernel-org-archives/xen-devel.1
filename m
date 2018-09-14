From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v4 1/7] x86/p2m/pod: make it build with
 !CONFIG_HVM
Date: Fri, 14 Sep 2018 06:41:49 -0600
Message-ID: <5B9BAC8D02000078001E8A9B@prv1-mh.provo.novell.com>
References: <cover.f883694550a3da3b95e2bf2a6f6777297b851b43.1536856592.git-series.wei.liu2@citrix.com>
 <692c143f75c48c83b7011147b1861e2c9b5f87f3.1536856592.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ck89=l4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1g0nQ0-00059s-Qe
 for xen-devel@lists.xenproject.org; Fri, 14 Sep 2018 12:41:52 +0000
In-Reply-To: <692c143f75c48c83b7011147b1861e2c9b5f87f3.1536856592.git-series.wei.liu2@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Razvan Cojocaru <rcojocaru@bitdefender.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Tamas K Lengyel <tamas@tklengyel.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEzLjA5LjE4IGF0IDE4OjM4LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
LS0tIGEveGVuL2FyY2gveDg2L21tL3AybS1wdC5jCj4gKysrIGIveGVuL2FyY2gveDg2L21tL3Ay
bS1wdC5jCj4gQEAgLTk3NCw3ICs5NzQsOSBAQCBsb25nIHAybV9wdF9hdWRpdF9wMm0oc3RydWN0
IHAybV9kb21haW4gKnAybSkKPiAgICAgIHVuc2lnbmVkIGxvbmcgbWZuLCBnZm4sIG0ycGZuOwo+
ICAKPiAgICAgIEFTU0VSVChwMm1fbG9ja2VkX2J5X21lKHAybSkpOwo+ICsjaWZkZWYgQ09ORklH
X0hWTQo+ICAgICAgQVNTRVJUKHBvZF9sb2NrZWRfYnlfbWUocDJtKSk7Cj4gKyNlbmRpZgo+ICAK
PiAgICAgIC8qIEF1ZGl0IHBhcnQgb25lOiB3YWxrIHRoZSBkb21haW4ncyBwMm0gdGFibGUsIGNo
ZWNraW5nIHRoZSBlbnRyaWVzLiAqLwo+ICAgICAgaWYgKCBwYWdldGFibGVfZ2V0X3BmbihwMm1f
Z2V0X3BhZ2V0YWJsZShwMm0pKSAhPSAwICkKPiBAQCAtMTEwNSw2ICsxMTA3LDcgQEAgbG9uZyBw
Mm1fcHRfYXVkaXRfcDJtKHN0cnVjdCBwMm1fZG9tYWluICpwMm0pCj4gICAgICAgICAgdW5tYXBf
ZG9tYWluX3BhZ2UobDRlKTsKPiAgICAgIH0KPiAgCj4gKyNpZmRlZiBDT05GSUdfSFZNCj4gICAg
ICBpZiAoIGVudHJ5X2NvdW50ICE9IHAybS0+cG9kLmVudHJ5X2NvdW50ICkKPiAgICAgIHsKPiAg
ICAgICAgICBwcmludGsoIiVzOiByZWZjb3VudGVkIGVudHJ5IGNvdW50ICVsZCwgYXVkaXQgY291
bnQgJWx1IVxuIiwKPiBAQCAtMTExMyw2ICsxMTE2LDcgQEAgbG9uZyBwMm1fcHRfYXVkaXRfcDJt
KHN0cnVjdCBwMm1fZG9tYWluICpwMm0pCj4gICAgICAgICAgICAgICAgIGVudHJ5X2NvdW50KTsK
PiAgICAgICAgICBCVUcoKTsKPiAgICAgIH0KPiArI2VuZGlmCj4gIAo+ICAgICAgcmV0dXJuIHBt
YmFkOwo+ICB9CgpBIHNpbmdsZSAjaWZkZWYgYXJvdW5kIHRoZSBlbnRpcmUgZnVuY3Rpb24gcGxl
YXNlLCB3aXRoCgojZWxzZQojIGRlZmluZSBwMm1fcHRfYXVkaXRfcDJtIE5VTEwKI2VuZGlmCgpv
ciBzb21lIHN1Y2ggKGxpa2UgbWFraW5nIHRoZSBhdWRpdF9wMm0gc3RydWN0dXJlIG1lbWJlciBn
byBhd2F5CmFsdG9nZXRoZXIpLCBhcyB5b3VyIGNoYW5nZSB0byB0aGUgY29uZGl0aW9uYWwgYXJv
dW5kIGF1ZGl0X3AybSgpCnN1cHByZXNzZXMgdGhlIG9ubHkgY2FsbGVyLgoKPiAtLS0gYS94ZW4v
YXJjaC94ODYvbW0vcDJtLmMKPiArKysgYi94ZW4vYXJjaC94ODYvbW0vcDJtLmMKPiBAQCAtNDks
MTggKzQ5LDI4IEBAIGJvb2xlYW5fcGFyYW0oImhhcF8ybWIiLCBvcHRfaGFwXzJtYik7Cj4gIAo+
ICBERUZJTkVfUEVSQ1BVX1JXTE9DS19HTE9CQUwocDJtX3BlcmNwdV9yd2xvY2spOwo+ICAKPiAr
c3RhdGljIHZvaWQgcDJtX3BvZF9pbml0KHN0cnVjdCBwMm1fZG9tYWluICpwMm0pCj4gK3sKPiAr
I2lmZGVmIENPTkZJR19IVk0KPiArICAgIHVuc2lnbmVkIGludCBpOwo+ICsKPiArICAgIG1tX2xv
Y2tfaW5pdCgmcDJtLT5wb2QubG9jayk7Cj4gKyAgICBJTklUX1BBR0VfTElTVF9IRUFEKCZwMm0t
PnBvZC5zdXBlcik7Cj4gKyAgICBJTklUX1BBR0VfTElTVF9IRUFEKCZwMm0tPnBvZC5zaW5nbGUp
Owo+ICsKPiArICAgIGZvciAoIGkgPSAwOyBpIDwgQVJSQVlfU0laRShwMm0tPnBvZC5tcnAubGlz
dCk7ICsraSApCj4gKyAgICAgICAgcDJtLT5wb2QubXJwLmxpc3RbaV0gPSBnZm5feChJTlZBTElE
X0dGTik7Cj4gKyNlbmRpZgo+ICt9CgpJIHRoaW5rIHRoaXMgcmVhbGx5IGJlbG9uZ3MgaW50byBw
Mm0tcG9kLmMuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
