From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v3 4/7] kconfig/gcov: rename to coverage
Date: Wed, 24 Jan 2018 11:17:55 +0000
Message-ID: <20180124111755.l5dqgrimrx47g2e3@citrix.com>
References: <20180124100125.80443-1-roger.pau@citrix.com>
 <20180124100125.80443-5-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=vftr=et=citrix.com=prvs=555ec31fe=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1eeJ42-0007HY-9b
 for xen-devel@lists.xenproject.org; Wed, 24 Jan 2018 11:17:58 +0000
Content-Disposition: inline
In-Reply-To: <20180124100125.80443-5-roger.pau@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBKYW4gMjQsIDIwMTggYXQgMTA6MDE6MjJBTSArMDAwMCwgUm9nZXIgUGF1IE1vbm5l
IHdyb3RlOgo+IFNvIGl0IGNhbiBiZSB1c2VkIGJ5IGJvdGggZ2NjIGFuZCBjbGFuZy4gSnVzdCBh
ZGQgdGhlIEtjb25maWcgb3B0aW9uCj4gYW5kIG1vZGlmeSB0aGUgbWFrZWZpbGVzIHNvIHRoZSBs
bHZtIGNvdmVyYWdlIHNwZWNpZmljIGNvZGUgY2FuIGJlCj4gYWRkZWQgaW4gYSBmb2xsb3cgdXAg
cGF0Y2guCj4gCj4gU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNp
dHJpeC5jb20+Cj4gZGlmZiAtLWdpdCBhL3hlbi9SdWxlcy5tayBiL3hlbi9SdWxlcy5tawo+IGlu
ZGV4IDNjZjQwNzU0YTYuLjBiYzQwZmQwZTYgMTAwNjQ0Cj4gLS0tIGEveGVuL1J1bGVzLm1rCj4g
KysrIGIveGVuL1J1bGVzLm1rCj4gQEAgLTExNSw4ICsxMTUsMTMgQEAgc3ViZGlyLWFsbCA6PSAk
KHN1YmRpci15KSAkKHN1YmRpci1uKQo+ICAKPiAgJChmaWx0ZXIgJS5pbml0Lm8sJChvYmoteSkg
JChvYmotYmluLXkpICQoZXh0cmEteSkpOiBDRkxBR1MgKz0gLURJTklUX1NFQ1RJT05TX09OTFkK
PiAgCj4gLWlmZXEgKCQoQ09ORklHX0dDT1YpLHkpCj4gLSQoZmlsdGVyLW91dCAlLmluaXQubyAk
KG5vZ2Nvdi15KSwkKG9iai15KSAkKG9iai1iaW4teSkgJChleHRyYS15KSk6IENGTEFHUyArPSAt
ZnByb2ZpbGUtYXJjcyAtZnRlc3QtY292ZXJhZ2UKPiAraWZlcSAoJChDT05GSUdfQ09WRVJBR0Up
LHkpCj4gK2lmZXEgKCQoY2xhbmcpLHkpCj4gKyAgICBDT1ZfRkxBR1MgOj0gLWZwcm9maWxlLWlu
c3RyLWdlbmVyYXRlIC1mY292ZXJhZ2UtbWFwcGluZwo+ICtlbHNlCj4gKyAgICBDT1ZfRkxBR1Mg
Oj0gLWZwcm9maWxlLWFyY3MgLWZ0ZXN0LWNvdmVyYWdlCj4gK2VuZGlmCj4gKyAgICAkKGZpbHRl
ci1vdXQgJS5pbml0Lm8gJChub2djb3YteSksJChvYmoteSkgJChvYmotYmluLXkpICQoZXh0cmEt
eSkpOiBDRkxBR1MgKz0gJChDT1ZfRkxBR1MpCgpQbGVhc2UgYWxzbyBjaGFuZ2Ugbm9nY292IHRv
IG5vY292LiBBbHNvIHJlbW92ZSB0aGUgbGVhZGluZyBzcGFjZXMgZnJvbQp0aGlzIGxpbmUuCgpP
dGhlciB0aGFuIHRoaXMsIHRoaXMgcGF0Y2ggbG9va3MgZ29vZC4KCldlaS4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
