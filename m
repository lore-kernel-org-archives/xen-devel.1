From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 21/34] x86/mm: p2m_flush and nvcpu_flush are
 HVM only
Date: Tue, 21 Aug 2018 02:01:12 -0600
Message-ID: <5B7BC6C802000078001E0467@prv1-mh.provo.novell.com>
References: <cover.f5351150954129956fcf53a7781206b6295df78d.1534518694.git-series.wei.liu2@citrix.com>
 <e8c4ff53a1b67c443b987cf77991787b53c30db0.1534518694.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ip0d=le=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fs1bL-0001Zk-P7
 for xen-devel@lists.xenproject.org; Tue, 21 Aug 2018 08:01:19 +0000
In-Reply-To: <e8c4ff53a1b67c443b987cf77991787b53c30db0.1534518694.git-series.wei.liu2@citrix.com>
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE3LjA4LjE4IGF0IDE3OjEyLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
cDJtX2ZsdXNoIGlzIG9ubHkgY2FsbGVkIGJ5IEhBUCBjb2RlLCBudmNwdV9mbHVzaCBpcyBvbmx5
IHVzZWZ1bCBmb3IKPiBuZXN0ZWRodm0sIGJvdGggb2Ygd2hpY2ggZGVwZW5kIG9uIEhWTSBzdXBw
b3J0Lgo+IAo+IEVuY2xvc2UgdGhlaXIgY29kZSBpbiBDT05GSUdfSFZNLiBBZGQgYXNzZXJ0aW9u
cy4KCkJ1dCB3aHkgZG8geW91IHB1dCB0aGUgI2lmZGVmLXMgaW5zaWRlIHRoZSBmdW5jdGlvbnMs
IHJhdGhlciB0aGFuCmFyb3VuZCB0aGVtPyBGcm9tIHdoYXQgeW91IHNheSwgd2l0aG91dCBDT05G
SUdfSFZNIG5vIGNhbGxlcgpzaG91bGQgZXhpc3QuCgpKYW4KCj4gU2lnbmVkLW9mZi1ieTogV2Vp
IExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KPiAtLS0KPiAgeGVuL2FyY2gveDg2L21tL3AybS5j
IHwgNiArKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYg
LS1naXQgYS94ZW4vYXJjaC94ODYvbW0vcDJtLmMgYi94ZW4vYXJjaC94ODYvbW0vcDJtLmMKPiBp
bmRleCAxMDg5Yjg2Li4xYTA0YjM0IDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9tbS9wMm0u
Ywo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9tbS9wMm0uYwo+IEBAIC0xNzg1LDEwICsxNzg1LDEzIEBA
IHAybV9mbHVzaF90YWJsZShzdHJ1Y3QgcDJtX2RvbWFpbiAqcDJtKQo+ICB2b2lkCj4gIHAybV9m
bHVzaChzdHJ1Y3QgdmNwdSAqdiwgc3RydWN0IHAybV9kb21haW4gKnAybSkKPiAgewo+ICsjaWYg
Q09ORklHX0hWTQo+ICsgICAgQVNTRVJUKGlzX2h2bV92Y3B1KHYpKTsKPiAgICAgIEFTU0VSVCh2
LT5kb21haW4gPT0gcDJtLT5kb21haW4pOwo+ICAgICAgdmNwdV9uZXN0ZWRodm0odikubnZfcDJt
ID0gTlVMTDsKPiAgICAgIHAybV9mbHVzaF90YWJsZShwMm0pOwo+ICAgICAgaHZtX2FzaWRfZmx1
c2hfdmNwdSh2KTsKPiArI2VuZGlmCj4gIH0KPiAgCj4gIHZvaWQKPiBAQCAtMTgzOSw4ICsxODQy
LDExIEBAIHN0YXRpYyB2b2lkIGFzc2lnbl9ucDJtKHN0cnVjdCB2Y3B1ICp2LCBzdHJ1Y3QgcDJt
X2RvbWFpbiAqcDJtKQo+ICAKPiAgc3RhdGljIHZvaWQgbnZjcHVfZmx1c2goc3RydWN0IHZjcHUg
KnYpCj4gIHsKPiArI2lmIENPTkZJR19IVk0KPiArICAgIEFTU0VSVChpc19odm1fdmNwdSh2KSk7
Cj4gICAgICBodm1fYXNpZF9mbHVzaF92Y3B1KHYpOwo+ICAgICAgdmNwdV9uZXN0ZWRodm0odiku
c3RhbGVfbnAybSA9IHRydWU7Cj4gKyNlbmRpZgo+ICB9Cj4gIAo+ICBzdHJ1Y3QgcDJtX2RvbWFp
biAqCj4gLS0gCj4gZ2l0LXNlcmllcyAwLjkuMQoKCgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
