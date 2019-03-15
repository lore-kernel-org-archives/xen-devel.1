From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v7 10/11] viridian: add implementation of
 synthetic timers
Date: Fri, 15 Mar 2019 10:16:44 -0600
Message-ID: <5C8BCFEC020000780021F635@prv1-mh.provo.novell.com>
References: <20190314181117.1531-1-paul.durrant@citrix.com>
 <20190314181117.1531-11-paul.durrant@citrix.com>
 <5C8B7608020000780021F0B1@prv1-mh.provo.novell.com>
 <f8a9964bf2e94b3ba2d17b1037c7d31c@AMSPEX02CL02.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=64UD=RS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1h4pVn-0006wu-LJ
 for xen-devel@lists.xenproject.org; Fri, 15 Mar 2019 16:16:47 +0000
In-Reply-To: <f8a9964bf2e94b3ba2d17b1037c7d31c@AMSPEX02CL02.citrite.net>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, george.dunlap@citrix.com, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson <Ian.Jackson@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE1LjAzLjE5IGF0IDE2OjQwLCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+IFNvLCBBSVVJIHRoZSByZWFzb24geW91IHdhbnRlZCBpdCBhZGRlZCB3YXMgdGhhdCB5b3Ug
d2FudGVkIHRvIGF2b2lkIAo+IG11bHRpcGxlIGNhbGxzIGh2bV92Y3B1X2hhc19wZW5kaW5nX2ly
cSgpIGZyb20gcmV0dXJuaW5nIGRpZmZlcmVudCBpbnRhY2sgCj4gdmFsdWVzPyBCdXQgbG9va2lu
ZyBhZ2FpbiwgdGhpcyBjb3VsZCBlYXNpbHkgaGFwcGVuIGlmIGEgaGlnaGVyIGlyciBiaXQgZ2V0
cyAKPiBzZXQgYmV0d2VlbiBjYWxscyAod2hpY2ggY2FuIGFwcGFyZW50bHkgaGFwcGVuIGFzeW5j
aHJvbm91c2x5KSBzbyBJJ20gcmVhbGx5IAo+IG5vIGxvbmdlciBzdXJlIHdoeSBJIG5lZWQgdG8g
YXZvaWQgbXVsdGlwbGUgcG9sbHMuIFdoYXQgaXMgdGhlIHByb2JsZW0gdGhhdCAKPiBuZWVkcyB0
byBiZSBhdm9pZGVkPwoKSG1tLCB0cnVlLiBMb29rcyBsaWtlIEkndmUgbWlzLWd1aWRlZCB5b3Us
IEknbSBzb3JyeSBmb3IgdGhhdC4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
