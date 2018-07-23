From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH] Drivers: Xen: xlate_mmu.c: Fixed comment
 layout
Date: Mon, 23 Jul 2018 14:38:20 -0700
Message-ID: <e0b30ab8-d418-cbe0-d03c-a0aee1d48367__49228.2963860363$1532381850$gmane$org@infradead.org>
References: <20180723213404.20720-1-mark@markrailton.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=t1fs=kh=infradead.org=rdunlap@srs-us1.protection.inumbo.net>)
 id 1fhiX9-0003nr-NZ
 for xen-devel@lists.xenproject.org; Mon, 23 Jul 2018 21:38:24 +0000
In-Reply-To: <20180723213404.20720-1-mark@markrailton.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Mark Railton <mark@markrailton.com>, boris.ostrovsky@oracle.com, jgross@suse.com
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gMDcvMjMvMjAxOCAwMjozNCBQTSwgTWFyayBSYWlsdG9uIHdyb3RlOgo+IEZpeGVkIGlzc3Vl
IHdpdGggbXVsdGkgbGluZSBjb21tZW50CgpGaXggW25vdCBGaXhlZF0KCj4gCj4gU2lnbmVkLW9m
Zi1ieTogTWFyayBSYWlsdG9uIDxtYXJrQG1hcmtyYWlsdG9uLmNvbT4KPiAtLS0KPiAgZHJpdmVy
cy94ZW4veGxhdGVfbW11LmMgfCA1ICsrKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlv
bnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMveGVuL3hsYXRl
X21tdS5jIGIvZHJpdmVycy94ZW4veGxhdGVfbW11LmMKPiBpbmRleCAyM2YxMzg3YjNlZjcuLjNi
MDNiYzE2NDFlZCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3hlbi94bGF0ZV9tbXUuYwo+ICsrKyBi
L2RyaXZlcnMveGVuL3hsYXRlX21tdS5jCj4gQEAgLTE1MSw4ICsxNTEsOSBAQCBpbnQgeGVuX3hs
YXRlX3JlbWFwX2dmbl9hcnJheShzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwKPiAgCXN0cnVj
dCByZW1hcF9kYXRhIGRhdGE7Cj4gIAl1bnNpZ25lZCBsb25nIHJhbmdlID0gRElWX1JPVU5EX1VQ
KG5yLCBYRU5fUEZOX1BFUl9QQUdFKSA8PCBQQUdFX1NISUZUOwo+ICAKPiAtCS8qIEtlcHQgaGVy
ZSBmb3IgdGhlIHB1cnBvc2Ugb2YgbWFraW5nIHN1cmUgY29kZSBkb2Vzbid0IGJyZWFrCj4gLQkg
ICB4ODYgUFZPUFMgKi8KPiArCS8qIEtlcHQgaGVyZSBmb3IgdGhlIHB1cnBvc2Ugb2YgbWFraW5n
IHN1cmUgY29kZSBkb2Vzbid0Cj4gKwkgKiBicmVhayB4ODYgUFZPUFMKPiArCSAqLwoKVGhhdCBp
cyBzdGlsbCBub3QgdGhlIHByZWZlcnJlZCBrZXJuZWwgbXVsdGktbGluZSBjb21tZW50IHN0eWxl
LgpEb2N1bWVudGF0aW9uL3Byb2Nlc3MvY29kaW5nLXN0eWxlLnJzdCBzYXlzOgoKCS8qCgkgKiBU
aGlzIGlzIHRoZSBwcmVmZXJyZWQgc3R5bGUgZm9yIG11bHRpLWxpbmUKCSAqIGNvbW1lbnRzIGlu
IHRoZSBMaW51eCBrZXJuZWwgc291cmNlIGNvZGUuCgkgKiBQbGVhc2UgdXNlIGl0IGNvbnNpc3Rl
bnRseS4KCSAqCgkgKiBEZXNjcmlwdGlvbjogIEEgY29sdW1uIG9mIGFzdGVyaXNrcyBvbiB0aGUg
bGVmdCBzaWRlLAoJICogd2l0aCBiZWdpbm5pbmcgYW5kIGVuZGluZyBhbG1vc3QtYmxhbmsgbGlu
ZXMuCgkgKi8KCmFsdGhvdWdoIE5ldHdvcmtpbmcgY29kZSBoYXMgYSBzbGlnaHRseSBkaWZmZXJl
bnQgcHJlZmVycmVkIHN0eWxlIChhcyBpbgp5b3VyIHBhdGNoKS4KCj4gIAlCVUdfT04oISgodm1h
LT52bV9mbGFncyAmIChWTV9QRk5NQVAgfCBWTV9JTykpID09IChWTV9QRk5NQVAgfCBWTV9JTykp
KTsKPiAgCj4gIAlkYXRhLmZnZm4gPSBnZm47Cj4gCgoKLS0gCn5SYW5keQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
