From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86/altp2m: move
 altp2m_get_effective_entry() under CONFIG_HVM
Date: Tue, 14 May 2019 10:27:45 -0600
Message-ID: <5CDAEC81020000780022ED86@prv1-mh.provo.novell.com>
References: <1557850437-27656-1-git-send-email-rcojocaru@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=NyQH=TO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hQaHR-0002ir-Lr
 for xen-devel@lists.xenproject.org; Tue, 14 May 2019 16:27:53 +0000
In-Reply-To: <1557850437-27656-1-git-send-email-rcojocaru@bitdefender.com>
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE0LjA1LjE5IGF0IDE4OjEzLCA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4gd3Jv
dGU6Cj4gQWxsIGl0cyBjYWxsZXJzIGxpdmUgaW5zaWRlICNpZmRlZiBDT05GSUdfSFZNIHNlY3Rp
b25zLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFJhenZhbiBDb2pvY2FydSA8cmNvam9jYXJ1QGJpdGRl
ZmVuZGVyLmNvbT4KClRoYW5rcyEKCj4gLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9wMm0uaAo+
ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvcDJtLmgKPiBAQCAtNTE0LDYgKzUxNCw3IEBAIHN0
YXRpYyBpbmxpbmUgdW5zaWduZWQgbG9uZyBtZm5fdG9fZ2ZuKHN0cnVjdCBkb21haW4gKmQsIG1m
bl90IG1mbikKPiAgICAgICAgICByZXR1cm4gbWZuX3gobWZuKTsKPiAgfQo+ICAKPiArI2lmZGVm
IENPTkZJR19IVk0KPiAgI2RlZmluZSBBUDJNR0VUX3ByZXBvcHVsYXRlIHRydWUKPiAgI2RlZmlu
ZSBBUDJNR0VUX3F1ZXJ5IGZhbHNlCj4gIAo+IEBAIC01MjUsNiArNTI2LDcgQEAgc3RhdGljIGlu
bGluZSB1bnNpZ25lZCBsb25nIG1mbl90b19nZm4oc3RydWN0IGRvbWFpbiAqZCwgbWZuX3QgbWZu
KQo+ICBpbnQgYWx0cDJtX2dldF9lZmZlY3RpdmVfZW50cnkoc3RydWN0IHAybV9kb21haW4gKmFw
Mm0sIGdmbl90IGdmbiwgbWZuX3QgKm1mbiwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHAybV90eXBlX3QgKnQsIHAybV9hY2Nlc3NfdCAqYSwKPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGJvb2wgcHJlcG9wdWxhdGUpOwo+ICsjZW5kaWYKPiAgCj4gIC8qIERlYWRs
b2NrLWF2b2lkYW5jZSBzY2hlbWUgd2hlbiBjYWxsaW5nIGdldF9nZm4gb24gZGlmZmVyZW50IGdm
bidzICovCj4gIHN0cnVjdCB0d29fZ2ZucyB7CgpJIGRvbid0IHRoaW5rIHRoZXNlIGFkanVzdG1l
bnRzIGFyZSBzdHJpY3RseSBuZWVkZWQsIGJ1dCBhdCBsZWFzdCBmb3IKbm93IHRoZXkgb2YgY291
cnNlIGFsc28gZG9uJ3QgaHVydC4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
