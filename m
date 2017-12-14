From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH 1/2] x86: consider effective protection
 attributes in W+X check
Date: Thu, 14 Dec 2017 15:12:03 +0100 (CET)
Message-ID: <alpine.DEB.2.20.1712141505180.4998__8162.68998100913$1513260834$gmane$org@nanos>
References: <5A2FBC570200007800196B3E@prv-mh.provo.novell.com>
 <5A2FBE0A0200007800196B4F@suse.com>
 <fcb65c2e-d0eb-24c2-ad2b-e956291db01a@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=xrw2=dk=linutronix.de=tglx@srs-us1.protection.inumbo.net>)
 id 1ePUG4-0004ci-Co
 for xen-devel@lists.xenproject.org; Thu, 14 Dec 2017 14:13:08 +0000
In-Reply-To: <fcb65c2e-d0eb-24c2-ad2b-e956291db01a@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: linux-kernel@vger.kernel.org, Jan Beulich <JBeulich@suse.com>, hpa@zytor.com, xen-devel <xen-devel@lists.xenproject.org>, mingo@elte.hu, sds@tycho.nsa.gov, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCAxNCBEZWMgMjAxNywgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBPbiAxMi8xMi8xNyAx
MTozMSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gPiAgCWZvciAoaSA9IDA7IGkgPCBQVFJTX1BFUl9Q
TUQ7IGkrKykgewo+ID4gIAkJc3QtPmN1cnJlbnRfYWRkcmVzcyA9IG5vcm1hbGl6ZV9hZGRyKFAg
KyBpICogUE1EX0xFVkVMX01VTFQpOwo+ID4gIAkJaWYgKCFwbWRfbm9uZSgqc3RhcnQpKSB7Cj4g
PiArCQkJcHJvdCA9IHBtZF9mbGFncygqc3RhcnQpOwo+ID4gKwkJCWVmZiA9IGVmZmVjdGl2ZV9w
cm90KGVmZl9pbiwgcHJvdCk7Cj4gPiAgCQkJaWYgKHBtZF9sYXJnZSgqc3RhcnQpIHx8ICFwbWRf
cHJlc2VudCgqc3RhcnQpKSB7Cj4gPiAtCQkJCXByb3QgPSBwbWRfZmxhZ3MoKnN0YXJ0KTsKPiA+
IC0JCQkJbm90ZV9wYWdlKG0sIHN0LCBfX3BncHJvdChwcm90KSwgNCk7Cj4gPiArCQkJCW5vdGVf
cGFnZShtLCBzdCwgX19wZ3Byb3QocHJvdCksIGVmZiwgNCk7Cj4gPiAgCQkJfSBlbHNlIGlmICgh
a2FzYW5fcGFnZV90YWJsZShtLCBzdCwgcG1kX3N0YXJ0KSkgewo+ID4gLQkJCQl3YWxrX3B0ZV9s
ZXZlbChtLCBzdCwgKnN0YXJ0LAo+ID4gKwkJCQl3YWxrX3B0ZV9sZXZlbChtLCBzdCwgKnN0YXJ0
LCBlZmYsCj4gPiAgCQkJCQkgICAgICAgUCArIGkgKiBQTURfTEVWRUxfTVVMVCk7Cj4gPiAgCQkJ
fQo+IAo+IFlvdSBjYW4gZHJvcCB0aGUgYnJhY2VzIGZvciBib3RoIGNhc2VzLiBBcHBsaWVzIHRv
IHNpbWlsYXIKPiBjb25zdHJ1Y3RzIGJlbG93LCB0b28uCgpOby4gU2VlOiBodHRwczovL21hcmMu
aW5mby8/bD1saW51eC1rZXJuZWwmbT0xNDg0Njc5ODA5MDU1MzcKClRoaXMgaXMgdGhlIHNhbWUg
aXNzdWU6CgoJaWYgKGZvbykKCQlibGEoKTsKCWVsc2UKCQlibHVyYihzb21lc3R1ZmYsIG1vcmVz
dHVmZiwgZXZlbm1vcmVzdHVmZiwKCQkgICAgICBjcmFwKTsKdnMuCgoJaWYgKGZvbykgewoJCWJs
YSgpOwoJfSBlbHNlIHsKCQlibHVyYihzb21lc3R1ZmYsIG1vcmVzdHVmZiwgZXZlbm1vcmVzdHVm
ZiwKCQkgICAgICBjcmFwKTsKCX0KClRoYW5rcywKCgl0Z2x4CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
