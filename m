From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 1/2] x86: consider effective protection
 attributes in W+X check
Date: Thu, 14 Dec 2017 15:21:39 +0100
Message-ID: <27f41ad1-1ad4-dfb7-a1b4-7b405ffadd78__46732.3178462268$1513261356$gmane$org@suse.com>
References: <5A2FBC570200007800196B3E@prv-mh.provo.novell.com>
 <5A2FBE0A0200007800196B4F@suse.com>
 <fcb65c2e-d0eb-24c2-ad2b-e956291db01a@suse.com>
 <5A32959902000078001975D6@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=jvkc=dk=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ePUOO-0005uc-54
 for xen-devel@lists.xenproject.org; Thu, 14 Dec 2017 14:21:44 +0000
In-Reply-To: <5A32959902000078001975D6@prv-mh.provo.novell.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, hpa@zytor.com, xen-devel <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, sds@tycho.nsa.gov, mingo@elte.hu
List-Id: xen-devel@lists.xenproject.org

T24gMTQvMTIvMTcgMTU6MTUsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDE0LjEyLjE3IGF0
IDE1OjA0LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPj4gT24gMTIvMTIvMTcgMTE6MzEsIEph
biBCZXVsaWNoIHdyb3RlOgo+Pj4gQEAgLTMzNSw0MiArMzQ2LDQ1IEBAIHN0YXRpYyBpbmxpbmUg
Ym9vbCBrYXNhbl9wYWdlX3RhYmxlKHN0cnUKPj4+ICAKPj4+ICAjaWYgUFRSU19QRVJfUE1EID4g
MQo+Pj4gIAo+Pj4gLXN0YXRpYyB2b2lkIHdhbGtfcG1kX2xldmVsKHN0cnVjdCBzZXFfZmlsZSAq
bSwgc3RydWN0IHBnX3N0YXRlICpzdCwgcHVkX3QgYWRkciwgdW5zaWduZWQgbG9uZyBQKQo+Pj4g
K3N0YXRpYyB2b2lkIHdhbGtfcG1kX2xldmVsKHN0cnVjdCBzZXFfZmlsZSAqbSwgc3RydWN0IHBn
X3N0YXRlICpzdCwgcHVkX3QgYWRkciwKPj4+ICsJCQkgICBwZ3Byb3R2YWxfdCBlZmZfaW4sIHVu
c2lnbmVkIGxvbmcgUCkKPj4+ICB7Cj4+PiAgCWludCBpOwo+Pj4gIAlwbWRfdCAqc3RhcnQsICpw
bWRfc3RhcnQ7Cj4+PiAtCXBncHJvdHZhbF90IHByb3Q7Cj4+PiArCXBncHJvdHZhbF90IHByb3Qs
IGVmZjsKPj4+ICAKPj4+ICAJcG1kX3N0YXJ0ID0gc3RhcnQgPSAocG1kX3QgKilwdWRfcGFnZV92
YWRkcihhZGRyKTsKPj4+ICAJZm9yIChpID0gMDsgaSA8IFBUUlNfUEVSX1BNRDsgaSsrKSB7Cj4+
PiAgCQlzdC0+Y3VycmVudF9hZGRyZXNzID0gbm9ybWFsaXplX2FkZHIoUCArIGkgKiBQTURfTEVW
RUxfTVVMVCk7Cj4+PiAgCQlpZiAoIXBtZF9ub25lKCpzdGFydCkpIHsKPj4+ICsJCQlwcm90ID0g
cG1kX2ZsYWdzKCpzdGFydCk7Cj4+PiArCQkJZWZmID0gZWZmZWN0aXZlX3Byb3QoZWZmX2luLCBw
cm90KTsKPj4+ICAJCQlpZiAocG1kX2xhcmdlKCpzdGFydCkgfHwgIXBtZF9wcmVzZW50KCpzdGFy
dCkpIHsKPj4+IC0JCQkJcHJvdCA9IHBtZF9mbGFncygqc3RhcnQpOwo+Pj4gLQkJCQlub3RlX3Bh
Z2UobSwgc3QsIF9fcGdwcm90KHByb3QpLCA0KTsKPj4+ICsJCQkJbm90ZV9wYWdlKG0sIHN0LCBf
X3BncHJvdChwcm90KSwgZWZmLCA0KTsKPj4+ICAJCQl9IGVsc2UgaWYgKCFrYXNhbl9wYWdlX3Rh
YmxlKG0sIHN0LCBwbWRfc3RhcnQpKSB7Cj4+PiAtCQkJCXdhbGtfcHRlX2xldmVsKG0sIHN0LCAq
c3RhcnQsCj4+PiArCQkJCXdhbGtfcHRlX2xldmVsKG0sIHN0LCAqc3RhcnQsIGVmZiwKPj4+ICAJ
CQkJCSAgICAgICBQICsgaSAqIFBNRF9MRVZFTF9NVUxUKTsKPj4+ICAJCQl9Cj4+Cj4+IFlvdSBj
YW4gZHJvcCB0aGUgYnJhY2VzIGZvciBib3RoIGNhc2VzLiBBcHBsaWVzIHRvIHNpbWlsYXIKPj4g
Y29uc3RydWN0cyBiZWxvdywgdG9vLgo+IAo+IEkgZGlkIGNvbnNpZGVyIHRoYXQsIGJ1dCBkZWNp
ZGVkIGFnYWluc3QgdG8gYWxsb3cgdGhlIHBhdGNoIHRvIHNob3cKPiBtb3JlIGNsZWFybHkgd2hh
dCBpdCBpcyB0aGF0IGlzIGFjdHVhbGx5IGJlaW5nIGNoYW5nZWQuCj4gCj4+IFdpdGggdGhhdCBm
aXhlZCB5b3UgY2FuIGFkZCBteToKPj4KPj4gUmV2aWV3ZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpn
cm9zc0BzdXNlLmNvbT4KPiAKPiBUaGFua3MuIEknZCBsaWtlIHRvIHdhaXQgZm9yIHRoZSB4ODYg
bWFpbnRhaW5lcidzIG9waW5pb24sIGFuZCBoZW5jZQo+IHdvbid0IGFkZCB5b3VyIFItYiB1bmxl
c3MgeW91IHRlbGwgbWUgdGhhdCdzIGZpbmUgZWl0aGVyIHdheSwgb3IKPiB1bmxlc3MgdGhleSB0
b28gd291bGQgcHJlZmVyIHJlc3VsdGluZyBjb2RlIGNsZWFubGluZXNzIG92ZXIgcGF0Y2gKPiBy
ZWFkYWJpbGl0eS4KCkknbSBmaW5lIHdpdGggdGhlIGJyYWNlcyBrZXB0LCB0b28uCgoKSnVlcmdl
bgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
