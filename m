From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v12 03/11] x86/hvm: Introduce
 hvm_save_cpu_ctxt_one func
Date: Tue, 17 Jul 2018 08:03:00 -0600
Message-ID: <5B4DF71402000078001D4F5E@prv1-mh.provo.novell.com>
References: <1531752937-10478-1-git-send-email-aisaila@bitdefender.com>
 <1531752937-10478-4-git-send-email-aisaila@bitdefender.com>
 <492015aaf7164a48bc2a2e635ef0277d@AMSPEX02CL02.citrite.net>
 <1531830332.10865.4.camel@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1531830332.10865.4.camel@bitdefender.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: aisaila@bitdefender.com
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xen.org, Paul Durrant <paul.durrant@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <Ian.Jackson@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE3LjA3LjE4IGF0IDE0OjI1LCA8YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+IHdyb3Rl
Ogo+IE9uIEx1LCAyMDE4LTA3LTE2IGF0IDE1OjI5ICswMDAwLCBQYXVsIER1cnJhbnQgd3JvdGU6
Cj4+ID4gRnJvbTogQWxleGFuZHJ1IElzYWlsYSBbbWFpbHRvOmFpc2FpbGFAYml0ZGVmZW5kZXIu
Y29tXQo+PiA+IFNlbnQ6IDE2IEp1bHkgMjAxOCAxNTo1NQo+PiA+IC0tLSBhL3hlbi9hcmNoL3g4
Ni9odm0vaHZtLmMKPj4gPiArKysgYi94ZW4vYXJjaC94ODYvaHZtL2h2bS5jCj4+ID4gQEAgLTc4
NywxMTkgKzc4NywxMjkgQEAgc3RhdGljIGludCBodm1fbG9hZF90c2NfYWRqdXN0KHN0cnVjdAo+
PiA+IGRvbWFpbiAqZCwKPj4gPiBodm1fZG9tYWluX2NvbnRleHRfdCAqaCkKPj4gPiAgSFZNX1JF
R0lTVEVSX1NBVkVfUkVTVE9SRShUU0NfQURKVVNULCBodm1fc2F2ZV90c2NfYWRqdXN0LAo+PiA+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGh2bV9sb2FkX3RzY19hZGp1c3QsIDEsIEhWTVNS
X1BFUl9WQ1BVKTsKPj4gPiAKPj4gPiArc3RhdGljIGludCBodm1fc2F2ZV9jcHVfY3R4dF9vbmUo
c3RydWN0IHZjcHUgKnYsCj4+ID4gaHZtX2RvbWFpbl9jb250ZXh0X3QKPj4gPiAqaCkKPj4gPiAr
ewo+PiA+ICsgICAgc3RydWN0IHNlZ21lbnRfcmVnaXN0ZXIgc2VnOwo+PiA+ICsgICAgc3RydWN0
IGh2bV9od19jcHUgY3R4dDsKPj4gPiArCj4+ID4gKyAgICBtZW1zZXQoJmN0eHQsIDAsIHNpemVv
ZihjdHh0KSk7Cj4+IFdoeSBub3QgdXNlIGFuID0ge30gaW5pdGlhbGl6ZXIgaW5zdGVhZCBvZiB0
aGUgbWVtc2V0IGhlcmUgbGlrZQo+PiBlbHNld2hlcmU/Cj4gCj4gSSB3YW50ZWQgdG8gbWFrZSBs
ZXNzIGNoYW5nZSBhcyBwb3NzaWJsZSBhbmQgSSBvbmx5IGFkZGVkIGEgaW5pdGlhbGl6ZXIKPiB3
aGVyZSB0aGVyZSB3YXMgbm9uZS4gCgpUcnlpbmcgdG8gbGltaXQgcGF0Y2ggaW1wYWN0IGlzIGNl
cnRhaW5seSBhcHByZWNpYXRlZCwgYnV0IHBsZWFzZSB0YWtlIGEKbG9vayBhdCB5b3VyIHBhdGNo
IHRvIHNlZSB3aGV0aGVyIHRoaXMgd291bGQgcmVhbGx5IGhhdmUgbWFkZSBtdWNoCm9mIGEgZGlm
ZmVyZW5jZS4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
