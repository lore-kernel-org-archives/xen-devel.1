From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] x86/cpu: Support a new cpu vendor,
 which is Shanghai. Shanghai cpu defines two msr registers to enable
 Random Number Generator and Advanced Cryprography Engine.The cpu supports
 iommu, which is designed according to Intel's specification.
Date: Fri, 23 Mar 2018 12:23:05 +0000
Message-ID: <20180323122305.b3h4orvg2jpa4swd@citrix.com>
References: <1521804536-2852-1-git-send-email-lifang110@126.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=48bv=gn=citrix.com=prvs=6131b936e=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1ezLiu-0008Ut-51
 for xen-devel@lists.xenproject.org; Fri, 23 Mar 2018 12:23:08 +0000
Content-Disposition: inline
In-Reply-To: <1521804536-2852-1-git-send-email-lifang110@126.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Fionali <lifang110@126.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, jbeulich@suse.com, Fiona Li <fionali@zhaoxin.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBNYXIgMjMsIDIwMTggYXQgMDc6Mjg6NTZQTSArMDgwMCwgRmlvbmFsaSB3cm90ZToK
PiBGcm9tOiBGaW9uYUxpIDxGaW9uYUxpQHpoYW94aW4uY29tPgo+IAo+IFNpZ25lZC1vZmYtYnk6
IEZpb25hIExpPGZpb25hbGlAemhhb3hpbi5jb20+Cj4gLS0tCj4gIHhlbi9hcmNoL3g4Ni9jcHUv
TWFrZWZpbGUgICAgICAgICB8ICAxICsKPiAgeGVuL2FyY2gveDg2L2NwdS9jb21tb24uYyAgICAg
ICAgIHwgIDEgKwo+ICB4ZW4vYXJjaC94ODYvY3B1L3NoYW5naGFpLmMgICAgICAgfCA2MSArKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgeGVuL2luY2x1ZGUvYXNtLXg4
Ni9pb21tdS5oICAgICAgIHwgIDIgKysKPiAgeGVuL2luY2x1ZGUvYXNtLXg4Ni9tc3ItaW5kZXgu
aCAgIHwgIDQgKysrCj4gIHhlbi9pbmNsdWRlL2FzbS14ODYvc2V0dXAuaCAgICAgICB8ICAxICsK
PiAgeGVuL2luY2x1ZGUvYXNtLXg4Ni94ODYtdmVuZG9ycy5oIHwgIDMgKy0KPiAgNyBmaWxlcyBj
aGFuZ2VkLCA3MiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gIGNyZWF0ZSBtb2RlIDEw
MDY0NCB4ZW4vYXJjaC94ODYvY3B1L3NoYW5naGFpLmMKPiAKPiBkaWZmIC0tZ2l0IGEveGVuL2Fy
Y2gveDg2L2NwdS9NYWtlZmlsZSBiL3hlbi9hcmNoL3g4Ni9jcHUvTWFrZWZpbGUKPiBpbmRleCA3
NGYyM2FlLi44ZmNmZmRkIDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9jcHUvTWFrZWZpbGUK
PiArKysgYi94ZW4vYXJjaC94ODYvY3B1L01ha2VmaWxlCj4gQEAgLTUsNiArNSw3IEBAIG9iai15
ICs9IGFtZC5vCj4gIG9iai15ICs9IGNlbnRhdXIubwo+ICBvYmoteSArPSBjb21tb24ubwo+ICBv
YmoteSArPSBpbnRlbC5vCj4gK29iai15ICs9IHNoYW5naGFpLm8KCkknbSBjb25mdXNlZC4gU2hv
dWxkbid0IHlvdSB1c2Ugemhhb3hpbiBpbnN0ZWFkPwoKV2VpLgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
