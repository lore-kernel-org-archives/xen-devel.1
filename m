From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [RFC PATCH 08/12] libxl: Q35 support (new option
 device_model_machine)
Date: Wed, 21 Mar 2018 16:25:03 +0000
Message-ID: <20180321162503.fzfmift75347ztah@citrix.com>
References: <cover.1520867740.git.x1917x@gmail.com>
 <f553830567e76bd02fbeef431156d3189dd80aa7.1520867741.git.x1917x@gmail.com>
 <20180319170118.uf7uvyge63guo3aw@MacBook-Pro-de-Roger.local>
 <20180320081149.00003f2c@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=24tk=gl=citrix.com=prvs=6111f1d8b=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1eyghV-0005Qv-Ci
 for xen-devel@lists.xenproject.org; Wed, 21 Mar 2018 16:34:57 +0000
Content-Disposition: inline
In-Reply-To: <20180320081149.00003f2c@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Alexey G <x1917x@gmail.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBNYXIgMjAsIDIwMTggYXQgMDg6MTE6NDlBTSArMTAwMCwgQWxleGV5IEcgd3JvdGU6
Cj4gPj4gICAgICAgICAgaWYgKGJfaW5mby0+dS5odm0ubW1pb19ob2xlX21lbWtiKSB7Cj4gPj4g
ICAgICAgICAgICAgIHVpbnQ2NF90IG1heF9yYW1fYmVsb3dfNGcgPSAoMVVMTCA8PCAzMikgLQo+
ID4+IGRpZmYgLS1naXQgYS90b29scy9saWJ4bC9saWJ4bF90eXBlcy5pZGwKPiA+PiBiL3Rvb2xz
L2xpYnhsL2xpYnhsX3R5cGVzLmlkbCBpbmRleCAzNTAzODEyMGNhLi5mM2VmM2NiZGRlIDEwMDY0
NAo+ID4+IC0tLSBhL3Rvb2xzL2xpYnhsL2xpYnhsX3R5cGVzLmlkbAo+ID4+ICsrKyBiL3Rvb2xz
L2xpYnhsL2xpYnhsX3R5cGVzLmlkbAo+ID4+IEBAIC0xMDEsNiArMTAxLDEyIEBAIGxpYnhsX2Rl
dmljZV9tb2RlbF92ZXJzaW9uID0KPiA+PiBFbnVtZXJhdGlvbigiZGV2aWNlX21vZGVsX3ZlcnNp
b24iLCBbICgyLCAiUUVNVV9YRU4iKSwgICAgICAgICAgICAgIwo+ID4+IFVwc3RyZWFtIGJhc2Vk
IHFlbXUteGVuIGRldmljZSBtb2RlbCBdKQo+ID4+ICAKPiA+PiArbGlieGxfZGV2aWNlX21vZGVs
X21hY2hpbmUgPSBFbnVtZXJhdGlvbigiZGV2aWNlX21vZGVsX21hY2hpbmUiLCBbCj4gPj4gKyAg
ICAoMCwgIlVOS05PV04iKSwgIAo+ID4KPiA+U2hvdWxkbid0IHRoaXMgYmUgbmFtZWQgREVGQVVM
VD8KPiAKPiAiVW5rbm93biIgaGVyZSBzaG91bGQgYmUgcmVhZCBhcyAidW5zcGVjaWZpZWQiLCBi
dXQgSSBndWVzcyBERUZBVUxUCj4gd2lsbCBiZSBjbGVhcmVyIGFueXdheS4KPiAKCkknbSBhZnJh
aWQgdGhlIHNoaXAgaGFzIGFscmVhZHkgc2FpbGVkLiBUaGVyZSBhcmUgZmFyIHRvbyBtYW55IFVO
S05PV05zCmluIGxpYnhsX3R5cGVzLmlkbCBzbyB3ZSBtaWdodCBhcyB3ZWxsIHN0aWNrIHRvIGl0
IGhlcmUuCgpXZWkuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
