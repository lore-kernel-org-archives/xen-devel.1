From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH for-4.12 V3] x86/altp2m: fix
 HVMOP_altp2m_set_domain_state race
Date: Mon, 11 Feb 2019 03:10:35 -0700
Message-ID: <5C614A1B02000078002158A5@prv1-mh.provo.novell.com>
References: <1549876422-22274-1-git-send-email-rcojocaru@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=gc09=QS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gt8Y2-0006Rf-L9
 for xen-devel@lists.xenproject.org; Mon, 11 Feb 2019 10:10:46 +0000
In-Reply-To: <1549876422-22274-1-git-send-email-rcojocaru@bitdefender.com>
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
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDExLjAyLjE5IGF0IDEwOjEzLCA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4gd3Jv
dGU6Cj4gLS0tIGEveGVuL2FyY2gveDg2L2h2bS92bXgvdm14LmMKPiArKysgYi94ZW4vYXJjaC94
ODYvaHZtL3ZteC92bXguYwo+IEBAIC0yMTUwLDEzICsyMTUwLDEzIEBAIHN0YXRpYyBib29sX3Qg
dm14X2lzX3NpbmdsZXN0ZXBfc3VwcG9ydGVkKHZvaWQpCj4gICAgICByZXR1cm4gISFjcHVfaGFz
X21vbml0b3JfdHJhcF9mbGFnOwo+ICB9Cj4gIAo+IC1zdGF0aWMgdm9pZCB2bXhfdmNwdV91cGRh
dGVfZXB0cChzdHJ1Y3QgdmNwdSAqdikKPiArc3RhdGljIHZvaWQgdm14X3ZjcHVfdXBkYXRlX2Vw
dHAoc3RydWN0IHZjcHUgKnYsIGJvb2wgYWx0cDJtX2VuYWJsZWQpCj4gIHsKPiAgICAgIHN0cnVj
dCBkb21haW4gKmQgPSB2LT5kb21haW47Cj4gICAgICBzdHJ1Y3QgcDJtX2RvbWFpbiAqcDJtID0g
TlVMTDsKPiAgICAgIHN0cnVjdCBlcHRfZGF0YSAqZXB0Owo+ICAKPiAtICAgIGlmICggYWx0cDJt
X2FjdGl2ZShkKSApCj4gKyAgICBpZiAoIGFsdHAybV9lbmFibGVkICkKPiAgICAgICAgICBwMm0g
PSBwMm1fZ2V0X2FsdHAybSh2KTsKPiAgICAgIGlmICggIXAybSApCj4gICAgICAgICAgcDJtID0g
cDJtX2dldF9ob3N0cDJtKGQpOwoKV2l0aCB0aGUgY2hhbmdlIHlvdSBub3cgbWFrZSB0byBwMm1f
Z2V0X2FsdHAybSgpLCB0aGlzIGxvb2tzIHRvIGJlCmEgYmVuaWduIGNoYW5nZS4gV2hpY2ggdG8g
bWUgd291bGQgc3VnZ2VzdCB0byBlaXRoZXIgbGVhdmUgdGhlIGNvZGUKYWxvbmUsIG9yIHRvIGRy
b3AgdGhlIGlmKCkgKGJ1dCAtIGFnYWluIC0gbm90IGl0cyBib2R5KSBhbHRvZ2V0aGVyLiBBdAp3
aGljaCBwb2ludCB0aGUgY29kZSBjb3VsZCBiZSBmdXJ0aGVyIHN0cmVhbWxpbmVkLCBhcyB0aGVu
IHRoZSBOVUxMCmluaXRpYWxpemVyIGNhbiBnbyBhd2F5IGFuZCB0aGUgYXNzaWdubWVudCAob3Ig
dGhlbiBwZXJoYXBzIGluaXRpYWxpemVyKQpjb3VsZCBiZWNvbWUgInAybSA9IHAybV9nZXRfYWx0
cDJtKHYpID86IHAybV9nZXRfaG9zdHAybShkKSIuCihHZW5lcmFsbHkgSSdkIHJlY29tbWVuZCB0
byBsZWF2ZSBvdXQgdGhlIGNoYW5nZSBoZXJlLCBhbmQgZG8gdGhlCnRyYW5zZm9ybWF0aW9uIGlu
IGEgZm9sbG93LW9uIHBhdGNoLikKCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
