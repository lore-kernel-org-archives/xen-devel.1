From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] timers: move back migrate_timers_from_cpu()
 invocation
Date: Thu, 11 Apr 2019 21:03:04 +0100
Message-ID: <790227e0-921a-bf64-21c1-522e46d72fd5@citrix.com>
References: <5CAF1AD502000078002268CA@prv1-mh.provo.novell.com>
 <704b34f9-dbbf-45f4-4e96-2a38e7c942ac@citrix.com>
 <5CAF1D1902000078002268F3@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=YyQZ=SN=citrix.com=prvs=997b111c4=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hEfuv-0001bl-5o
 for xen-devel@lists.xenproject.org; Thu, 11 Apr 2019 20:03:25 +0000
In-Reply-To: <5CAF1D1902000078002268F3@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMTEvMDQvMjAxOSAxMTo1NSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMTEuMDQuMTkg
YXQgMTI6NDcsIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToKPj4gT24gMTEvMDQv
MjAxOSAxMTo0NSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+PiBAQCAtNjQ4LDYgKzY0Niw4IEBAIHN0
YXRpYyBpbnQgY3B1X2NhbGxiYWNrKAo+Pj4gICAgICBjYXNlIENQVV9VUF9DQU5DRUxFRDoKPj4+
ICAgICAgY2FzZSBDUFVfREVBRDoKPj4+ICAgICAgY2FzZSBDUFVfUkVTVU1FX0ZBSUxFRDoKPj4+
ICsgICAgICAgIG1pZ3JhdGVfdGltZXJzX2Zyb21fY3B1KGNwdSk7Cj4+PiArCj4+PiAgICAgICAg
ICBpZiAoICFwYXJrX29mZmxpbmVfY3B1cyAmJiBzeXN0ZW1fc3RhdGUgIT0gU1lTX1NUQVRFX3N1
c3BlbmQgKQo+Pj4gICAgICAgICAgICAgIGZyZWVfcGVyY3B1X3RpbWVycyhjcHUpOwo+Pj4gICAg
ICAgICAgYnJlYWs7Cj4+IEknbSBwcmV0dHkgc3VyZSB5b3UgYWxzbyBuZWVkIGEgY2FsbCBpbiB0
aGUgUkVNT1ZFX0NBU0UuICBUaGUgY3B1IGNvbWVzCj4+IG9ubGluZSBmb3IgbG9uZyBlbm91Z2gg
dG8gcG90ZW50aWFsbHkgZ2FpbiBhIHRpbWVyLgo+IFdoYXQgZG8geW91IG1lYW4gYnkgImNvbWVz
IG9ubGluZSBmb3IgbG9uZyBlbm91Z2giPyBUaGVyZSdzCj4gbm8gY2FsbCBzaXRlIGZvciB0aGUg
bm90aWZpZXIgd2l0aCBDUFVfUkVNT1ZFIHJpZ2h0IG5vdywgc28gd2hhdAo+IHRoZSBldmVudHVh
bCBiZWhhdmlvciBpcyBnb2luZyB0byBiZSBpcyBzaW1wbHkgdW5rbm93bi4gSSBmb3Igb25lCj4g
ZG9uJ3QgZXhwZWN0IHRoZSBDUFUgdG8gYmUgYnJvdWdodCBiYWNrIHVwIGFnYWluIGluIHRoYXQg
Y2FzZS4KPiBJJ20gd29uZGVyaW5nIGlmIHlvdSdyZSBtaXhpbmcgdGhpcyB1cCB3aXRoIENQVV9S
RVNVTUVfRkFJTEVELgoKTm93IEknbSBldmVuIG1vcmUgY29uZnVzZWQsIGJ1dCB5ZXMgY2xlYXJs
eSAtIGl0IHdhc24ndCB0aGUgQ1BVX1JFTU9WRSBjYXNlLgoKVGhhdCBzYWlkLCBieSBtYWtpbmcg
dGhpcyBhZGp1c3RtZW50LCB5b3UgYXJlIG5vdyBsaWFibGUgdG8gaGl0IGFuCmFzc2VydGlvbiBp
biB0aGUgUkVNT1ZFIGNhc2UsIHdoaWNoIG9uIGEgcmVsZWFzZSBidWlsZCB3aWxsIHJlc3VsdCBp
bgpjb21wbGV0ZSBtZW1vcnkgY29ycnVwdGlvbiwgYXMgaXQgZnJlZXMgYW4gaW4tdXNlIGRhdGFz
dHJ1Y3R1cmUuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
