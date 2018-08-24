From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 22/34] x86/mm: put HVM only code under
 CONFIG_HVM
Date: Fri, 24 Aug 2018 18:05:23 +0100
Message-ID: <20180824170522.iefcfy7oweldzzm4@citrix.com>
References: <cover.f5351150954129956fcf53a7781206b6295df78d.1534518694.git-series.wei.liu2@citrix.com>
 <fda67a2a1da3fc7fdca0231352ef4989ebb0d81b.1534518694.git-series.wei.liu2@citrix.com>
 <5B7BC83A02000078001E0476@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=n8yf=lh=citrix.com=prvs=76773b150=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1ftFWa-0001i9-9p
 for xen-devel@lists.xenproject.org; Fri, 24 Aug 2018 17:05:28 +0000
Content-Disposition: inline
In-Reply-To: <5B7BC83A02000078001E0476@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBBdWcgMjEsIDIwMTggYXQgMDI6MDc6MjJBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gI2lmZGVmIChhbHNvIGVsc2V3aGVyZTsgZGlkIEkgb3Zlcmxvb2sgc2ltaWxhciBpc3N1
ZXMgaW4gZWFybGllciBwYXRjaGVzPykKPiAKPiA+IC0tLSBhL3hlbi9jb21tb24vdm1fZXZlbnQu
Ywo+ID4gKysrIGIveGVuL2NvbW1vbi92bV9ldmVudC5jCj4gPiBAQCAtNDI5LDkgKzQyOSwxMSBA
QCB2b2lkIHZtX2V2ZW50X3Jlc3VtZShzdHJ1Y3QgZG9tYWluICpkLCBzdHJ1Y3Qgdm1fZXZlbnRf
ZG9tYWluICp2ZWQpCj4gPiAgICAgICAgICAgICAgICovCj4gPiAgICAgICAgICAgICAgdm1fZXZl
bnRfdG9nZ2xlX3NpbmdsZXN0ZXAoZCwgdiwgJnJzcCk7Cj4gPiAgCj4gPiArI2lmIENPTkZJR19I
Vk0KPiA+ICAgICAgICAgICAgICAvKiBDaGVjayBmb3IgYWx0cDJtIHN3aXRjaCAqLwo+ID4gICAg
ICAgICAgICAgIGlmICggcnNwLmZsYWdzICYgVk1fRVZFTlRfRkxBR19BTFRFUk5BVEVfUDJNICkK
PiA+ICAgICAgICAgICAgICAgICAgcDJtX2FsdHAybV9jaGVjayh2LCByc3AuYWx0cDJtX2lkeCk7
Cj4gPiArI2VuZGlmCj4gCj4gUGVyaGFwcyBhZ2FpbiBiZXR0ZXIgdG8gaGF2ZSBhIHN0YXRpYyBp
bmxpbmUgc3R1Yj8KCkkgd2lsbCBsZWF2ZSB0aGlzIGFzLWlzLiBUaGUgY29kZSBjaHVybiB3b3Vs
ZCBiZSB0aGUgc2FtZS4KCldlaS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
