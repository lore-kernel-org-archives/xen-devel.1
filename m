From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 16/34] x86/hvm: enclose hvm_enabled and
 hvm_funcs in CONFIG_HVM
Date: Fri, 24 Aug 2018 17:25:01 +0100
Message-ID: <20180824162501.yn7iaezgq2dqddwd@citrix.com>
References: <cover.f5351150954129956fcf53a7781206b6295df78d.1534518694.git-series.wei.liu2@citrix.com>
 <f0815f2aea320a634f63f503534d0e8abdc2c1ee.1534518694.git-series.wei.liu2@citrix.com>
 <5B7ABC4902000078001E0100@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=n8yf=lh=citrix.com=prvs=76773b150=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1ftEtV-0004fZ-So
 for xen-devel@lists.xenproject.org; Fri, 24 Aug 2018 16:25:05 +0000
Content-Disposition: inline
In-Reply-To: <5B7ABC4902000078001E0100@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBBdWcgMjAsIDIwMTggYXQgMDc6MDQ6MDlBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDE3LjA4LjE4IGF0IDE3OjEyLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gPiBUaGlzIGhlbHBzIHRvIHRha2UgYWR2YW50YWdlIG9mIGRlYWQgY29kZSBlbGltaW5h
dGlvbi4gVHVybgo+ID4gaHZtX2VuYWJsZWQgaW50byBwcm9wZXIgYm9vbCB3aGlsZSBhdCBpdC4K
PiA+IAo+ID4gUHJvdmlkaW5nIGFuIGVtcHR5IGh2bV9mdW5jcyByZXNvbHZlcyBhIGxvdCBvZiB1
bmRlZmluZWQgcmVmZXJlbmNlcyB0bwo+ID4gaXQgaW4gdGhlIGhlYWRlci4gSXQgaXMgc2FmZSB0
byBkbyBzbyBiZWNhdXNlIHRob3NlIGZ1bmN0aW9ucyAvIG1hY3Jvcwo+ID4gYXJlIG5vdCBleHBl
Y3RlZCB0byBiZSB1c2VkLgo+IAo+ICJub3QgZXhwZWN0ZWQgdG8gYmUgdXNlZCIgIT0gIm5vdCB1
c2VkIi4gVGhpcyAuLi4KPiAKPiA+IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvaHZtL2h2bS5o
Cj4gPiArKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L2h2bS9odm0uaAo+ID4gQEAgLTIzNCw4ICsy
MzQsMTQgQEAgc3RydWN0IGh2bV9mdW5jdGlvbl90YWJsZSB7Cj4gPiAgICAgIH0gdHNjX3NjYWxp
bmc7Cj4gPiAgfTsKPiA+ICAKPiA+ICsjaWYgQ09ORklHX0hWTQo+ID4gK2V4dGVybiBib29sIGh2
bV9lbmFibGVkOwo+ID4gIGV4dGVybiBzdHJ1Y3QgaHZtX2Z1bmN0aW9uX3RhYmxlIGh2bV9mdW5j
czsKPiA+IC1leHRlcm4gYm9vbF90IGh2bV9lbmFibGVkOwo+ID4gKyNlbHNlCj4gPiArI2RlZmlu
ZSBodm1fZW5hYmxlZCBmYWxzZQo+ID4gK3N0YXRpYyBzdHJ1Y3QgaHZtX2Z1bmN0aW9uX3RhYmxl
IGh2bV9mdW5jcyA9IHt9Owo+IAo+IC4uLiBpcyBhIG5vLWdvIGltby4gRWl0aGVyIGtlZXAgdGhl
IGV4dGVybiB2aXNpYmxlIChidXQgZG9uJ3QgaGF2ZSBhCj4gZGVmaW5pdGlvbiBhbnl3aGVyZSwg
cmVseWluZyBvbiBEQ0Ugb25jZSBhZ2FpbiksIG9yIG1ha2Ugc3VyZSB0aGUKPiBzdHJ1Y3R1cmUg
aGFzIG5vIG1lbWJlcnMgYXQgYWxsIGluIHRoZSAhSFZNIGNhc2UgKGJ1dCB0aGF0IHdvdWxkCj4g
YXNzdW1lIHRoZSByZWZlcmVuY2VzIHlvdSB0YWxrIGFib3V0IGFyZW4ndCBmaWVsZCBhY2Nlc3Nl
cywgYnV0Cj4gb25seSBhY2Nlc3NlcyB0byB0aGUgZW50aXJlIHN0cnVjdHVyZSkuIE90aGVyd2lz
ZSB3ZSdkIGVuZCB1cAo+IHdpdGggYSBzaWduaWZpY2FudCBhbW91bnQgb2YgTlVMTCBwb2ludGVy
cy4KPiAKPiBCdXQgaW4gdGhlIGVuZCBpdCdzIG5vdCByZWFsbHkgY2xlYXIgdG8gbWUgd2hhdCBw
cm9ibGVtIHlvdSdyZSB0cnlpbmcKPiB0byBzb2x2ZTogVGhlIGhlYWRlciBoZXJlIHNob3VsZCBu
b3QgYmUgaW5jbHVkZWQgYXQgYWxsIHdoZW4gSFZNCj4gaXMgbm90IGVuYWJsZWQgKG9yIG1vc3Qg
b2YgaXQgYmUgaW5zaWRlICIjaWZkZWYgQ09ORklHX0hWTSIpLgoKVGhpcyBwYXRjaCBoYXMgYmVl
biByZXdyaXR0ZW4gdG8gcHJvdmlkZSBtb3JlIHN0dWJzIGV0Yy4KCldlaS4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
