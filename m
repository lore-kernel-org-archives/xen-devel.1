From: Julien Grall <julien.grall@linaro.org>
Subject: Re: [PATCH 1/7] tools: ARM: vGICv3: avoid inserting
 optional DT properties
Date: Wed, 24 Jan 2018 16:39:24 +0000
Message-ID: <975c58d7-61c0-321c-33b7-cabeeb56abf7@linaro.org>
References: <20180124143517.18469-1-andre.przywara@linaro.org>
 <20180124143517.18469-2-andre.przywara@linaro.org>
 <72f88f8d-f672-e1c9-7975-0392d0805039@linaro.org>
 <63067c49-e12a-16ca-27ae-b7dea7380361@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=szm7=et=linaro.org=julien.grall@srs-us1.protection.inumbo.net>)
 id 1eeO5E-0005YJ-UD
 for xen-devel@lists.xenproject.org; Wed, 24 Jan 2018 16:39:32 +0000
Received: by mail-wm0-x235.google.com with SMTP id i186so9578654wmi.4
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jan 2018 08:39:30 -0800 (PST)
In-Reply-To: <63067c49-e12a-16ca-27ae-b7dea7380361@linaro.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andre Przywara <andre.przywara@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SGkgQW5kcmUsCgpPbiAyNC8wMS8xOCAxNjozNSwgQW5kcmUgUHJ6eXdhcmEgd3JvdGU6Cj4gT24g
MjQvMDEvMTggMTY6MDgsIEp1bGllbiBHcmFsbCB3cm90ZToKPj4gKCsgVG9vbHMgbWFpbnRhaW5l
cnMpCj4+Cj4+IEhpIEFuZHJlLAo+Pgo+PiBPbiAyNC8wMS8xOCAxNDozNSwgQW5kcmUgUHJ6eXdh
cmEgd3JvdGU6Cj4+PiBXaGVuIGNyZWF0aW5nIGEgR0lDdjMgZGV2aWNldHJlZSBub2RlLCB3ZSBj
dXJyZW50bHkgaW5zZXJ0IHRoZQo+Pj4gcmVkaXN0cmlidXRvci1zdHJpZGUgYW5kICNyZWRpc3Ry
aWJ1dG9yLXJlZ2lvbnMgcHJvcGVydGllcywgd2l0aCBmaXhlZAo+Pj4gdmFsdWVzIHdoaWNoIGFy
ZSBhY3R1YWxseSB0aGUgYXJjaGl0ZWN0ZWQgb25lcy4gQnV0IHRob3NlIHByb3BlcnRpZXMgYXJl
Cj4+PiBvcHRpb25hbCBhbmQgb25seSBuZWVkZWQgdG8gY292ZXIgZm9yIGJyb2tlbiBwbGF0Zm9y
bXMsIHdoZXJlIHRoZSB2YWx1ZXMKPj4+IGRpZmZlciBmcm9tIHRoZSBhcmNoaXRlY3RlZCBvbmUu
IFRoaXMgd2lsbCBuZXZlciBiZSB0aGUgY2FzZSBmb3IgdGhlCj4+Cj4+IEkgdW5kZXJzdGFuZCB0
aGF0IHRoZSBzdHJpZGUgaXMgZGVmaW5lZCBieSBHSUN2My4gQnV0IEkgZG9uJ3QgdGhpbmsgdGhp
cwo+PiBpcyB0cnVlIGZvciB0aGUgbnVtYmVyIG9mIHJlZ2lvbnMuIExvb2tpbmcgYXQgdGhlIHNw
ZWMsIG11bHRpcGxlIHJlZ2lvbnMKPj4gc2VlbXMgdG8gYmUgYWxsb3dlZCAoc2VlIEdJQ1JfVFlQ
RVIuTGFzdCkuIERpZCBJIG1pc3MgYW55dGhpbmc/Cj4gCj4gV2VsbCwgdGhlIHNwZWMgZG9lcyBp
bmRlZWQgbm90IHNheSBhbnl0aGluZyBhYm91dCBpdCwgYnV0IHRoZSBEVCBiaW5kaW5nCj4gZGVz
Y3JpcHRpb24gZG9lczoKPiA9PT09PT09PT09PT09PQo+IE9wdGlvbmFsOgo+IC4uLgo+IC0gI3Jl
ZGlzdHJpYnV0b3ItcmVnaW9uczogVGhlIG51bWJlciBvZiBpbmRlcGVuZGVudCBjb250aWd1b3Vz
IHJlZ2lvbnMKPiAgICBvY2N1cGllZCBieSB0aGUgcmVkaXN0cmlidXRvcnMuIFJlcXVpcmVkIGlm
IG1vcmUgdGhhbiBvbmUgc3VjaAo+ICAgIHJlZ2lvbiBpcyBwcmVzZW50Lgo+ID09PT09PT09PT09
PT09Cj4gCj4gU28gd2UgZG9uJ3QgbmVlZCBpdCBpbiBvdXIgY2FzZSwgYW5kIGluIGZhY3Qgd2Ug
ZG9uJ3QgaW1wbGVtZW50Cj4gKmFueXRoaW5nKiB0byBhY3R1YWxseSBnaXZlIHRoZSB0b29sc3Rh
Y2sgYSBjaG9pY2UuIFNvIHdlIHNob3VsZAo+IGNvbnNlcXVlbnRseSByZW1vdmUgdGhlc2UgbGlu
ZXMsIGFzIHRoZXkgYXJlIHBvaW50bGVzcyByaWdodCBub3cuIFNob3VsZAo+IHdlIGV2ZXIgbmVl
ZCB0byBpbXBsZW1lbnQgc3VwcG9ydCBmb3IgbXVsdGlwbGUgcmVnaW9ucywgYnJpbmdpbmcgdGhp
cwo+IGJhY2sgaXMgcmVhbGx5IG91ciBsZWFzdCBjb25jZXJuLgoKSSBhbSBub3QgYWdhaW5zdCB0
aGlzIHBhdGNoLiBIb3dldmVyLCB0aGUgY29tbWl0IG1lc3NhZ2Ugc2hvdWxkIG5vdCAKaW5kdWNl
IHRoYXQgcGxhdGZvcm0gd2l0aCBtb3JlIHRoYW4gMSByZS1kaXN0cmlidXRvciByZWdpb25zIGFy
ZSBicm9rZW4uCgpTbyBJIGRvbid0IHNlZSBhbnl0aGluZyB3aGljaCB3b3VsZCBwcmV2ZW50IHVz
IHRvIHByb3ZpZGUgYSBndWVzdCBtZW1vcnkgCm1hcCB3aXRoIG11bHRpcGxlIHJlLWRpc3RyaWJ1
dG9yIHJlZ2lvbnMuCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
