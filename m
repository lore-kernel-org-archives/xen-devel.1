From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 1/2] x86: consider effective protection
 attributes in W+X check
Date: Thu, 14 Dec 2017 07:15:37 -0700
Message-ID: <5A32959902000078001975D6__12608.6979908452$1513260992$gmane$org@prv-mh.provo.novell.com>
References: <5A2FBC570200007800196B3E@prv-mh.provo.novell.com>
 <5A2FBE0A0200007800196B4F@suse.com>
 <fcb65c2e-d0eb-24c2-ad2b-e956291db01a@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=vj35=dk=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ePUIb-0004yH-JM
 for xen-devel@lists.xenproject.org; Thu, 14 Dec 2017 14:15:45 +0000
In-Reply-To: <fcb65c2e-d0eb-24c2-ad2b-e956291db01a@suse.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, hpa@zytor.com, xen-devel <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, sds@tycho.nsa.gov, mingo@elte.hu
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE0LjEyLjE3IGF0IDE1OjA0LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBPbiAx
Mi8xMi8xNyAxMTozMSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IEBAIC0zMzUsNDIgKzM0Niw0NSBA
QCBzdGF0aWMgaW5saW5lIGJvb2wga2FzYW5fcGFnZV90YWJsZShzdHJ1Cj4+ICAKPj4gICNpZiBQ
VFJTX1BFUl9QTUQgPiAxCj4+ICAKPj4gLXN0YXRpYyB2b2lkIHdhbGtfcG1kX2xldmVsKHN0cnVj
dCBzZXFfZmlsZSAqbSwgc3RydWN0IHBnX3N0YXRlICpzdCwgcHVkX3QgYWRkciwgdW5zaWduZWQg
bG9uZyBQKQo+PiArc3RhdGljIHZvaWQgd2Fsa19wbWRfbGV2ZWwoc3RydWN0IHNlcV9maWxlICpt
LCBzdHJ1Y3QgcGdfc3RhdGUgKnN0LCBwdWRfdCBhZGRyLAo+PiArCQkJICAgcGdwcm90dmFsX3Qg
ZWZmX2luLCB1bnNpZ25lZCBsb25nIFApCj4+ICB7Cj4+ICAJaW50IGk7Cj4+ICAJcG1kX3QgKnN0
YXJ0LCAqcG1kX3N0YXJ0Owo+PiAtCXBncHJvdHZhbF90IHByb3Q7Cj4+ICsJcGdwcm90dmFsX3Qg
cHJvdCwgZWZmOwo+PiAgCj4+ICAJcG1kX3N0YXJ0ID0gc3RhcnQgPSAocG1kX3QgKilwdWRfcGFn
ZV92YWRkcihhZGRyKTsKPj4gIAlmb3IgKGkgPSAwOyBpIDwgUFRSU19QRVJfUE1EOyBpKyspIHsK
Pj4gIAkJc3QtPmN1cnJlbnRfYWRkcmVzcyA9IG5vcm1hbGl6ZV9hZGRyKFAgKyBpICogUE1EX0xF
VkVMX01VTFQpOwo+PiAgCQlpZiAoIXBtZF9ub25lKCpzdGFydCkpIHsKPj4gKwkJCXByb3QgPSBw
bWRfZmxhZ3MoKnN0YXJ0KTsKPj4gKwkJCWVmZiA9IGVmZmVjdGl2ZV9wcm90KGVmZl9pbiwgcHJv
dCk7Cj4+ICAJCQlpZiAocG1kX2xhcmdlKCpzdGFydCkgfHwgIXBtZF9wcmVzZW50KCpzdGFydCkp
IHsKPj4gLQkJCQlwcm90ID0gcG1kX2ZsYWdzKCpzdGFydCk7Cj4+IC0JCQkJbm90ZV9wYWdlKG0s
IHN0LCBfX3BncHJvdChwcm90KSwgNCk7Cj4+ICsJCQkJbm90ZV9wYWdlKG0sIHN0LCBfX3BncHJv
dChwcm90KSwgZWZmLCA0KTsKPj4gIAkJCX0gZWxzZSBpZiAoIWthc2FuX3BhZ2VfdGFibGUobSwg
c3QsIHBtZF9zdGFydCkpIHsKPj4gLQkJCQl3YWxrX3B0ZV9sZXZlbChtLCBzdCwgKnN0YXJ0LAo+
PiArCQkJCXdhbGtfcHRlX2xldmVsKG0sIHN0LCAqc3RhcnQsIGVmZiwKPj4gIAkJCQkJICAgICAg
IFAgKyBpICogUE1EX0xFVkVMX01VTFQpOwo+PiAgCQkJfQo+IAo+IFlvdSBjYW4gZHJvcCB0aGUg
YnJhY2VzIGZvciBib3RoIGNhc2VzLiBBcHBsaWVzIHRvIHNpbWlsYXIKPiBjb25zdHJ1Y3RzIGJl
bG93LCB0b28uCgpJIGRpZCBjb25zaWRlciB0aGF0LCBidXQgZGVjaWRlZCBhZ2FpbnN0IHRvIGFs
bG93IHRoZSBwYXRjaCB0byBzaG93Cm1vcmUgY2xlYXJseSB3aGF0IGl0IGlzIHRoYXQgaXMgYWN0
dWFsbHkgYmVpbmcgY2hhbmdlZC4KCj4gV2l0aCB0aGF0IGZpeGVkIHlvdSBjYW4gYWRkIG15Ogo+
IAo+IFJldmlld2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CgpUaGFua3Mu
IEknZCBsaWtlIHRvIHdhaXQgZm9yIHRoZSB4ODYgbWFpbnRhaW5lcidzIG9waW5pb24sIGFuZCBo
ZW5jZQp3b24ndCBhZGQgeW91ciBSLWIgdW5sZXNzIHlvdSB0ZWxsIG1lIHRoYXQncyBmaW5lIGVp
dGhlciB3YXksIG9yCnVubGVzcyB0aGV5IHRvbyB3b3VsZCBwcmVmZXIgcmVzdWx0aW5nIGNvZGUg
Y2xlYW5saW5lc3Mgb3ZlciBwYXRjaApyZWFkYWJpbGl0eS4KCkphbgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
