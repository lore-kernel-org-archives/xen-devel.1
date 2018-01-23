From: Julien Grall <julien.grall@linaro.org>
Subject: Re: [RFC v4 7/8] xen/smmu: Add a new config define for
 legacy SMMU
Date: Tue, 23 Jan 2018 15:26:05 +0000
Message-ID: <c5c7fa4d-e886-7f4f-1fd6-0c0b65c217d2@linaro.org>
References: <20171219031703.23420-1-sameer.goel@linaro.org>
 <20171219031703.23420-8-sameer.goel@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=jwx3=es=linaro.org=julien.grall@srs-us1.protection.inumbo.net>)
 id 1ee0Sf-0007dv-SQ
 for xen-devel@lists.xenproject.org; Tue, 23 Jan 2018 15:26:09 +0000
Received: by mail-wr0-x241.google.com with SMTP id 16so961691wry.12
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jan 2018 07:26:08 -0800 (PST)
In-Reply-To: <20171219031703.23420-8-sameer.goel@linaro.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Sameer Goel <sameer.goel@linaro.org>, xen-devel@lists.xenproject.org, julien.grall@arm.com, mjaggi@caviumnetworks.com
Cc: sstabellini@kernel.org, andre.przywara@linaro.org, shankerd@codeaurora.org
List-Id: xen-devel@lists.xenproject.org

SGkgU2FtZWVyLAoKT24gMTkvMTIvMTcgMDM6MTcsIFNhbWVlciBHb2VsIHdyb3RlOgo+IEFkZCBh
IG5ldyBjb25maWcgaXRlbSB0byBjb250cm9sIGNvbXBpbGF0aW9uIGZvciBsZWdhY3kgYXJtIFNN
TVUuCj4gCj4gU2lnbmVkLW9mZi1ieTogU2FtZWVyIEdvZWwgPHNhbWVlci5nb2VsQGxpbmFyby5v
cmc+Cj4gLS0tCj4gICB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vS2NvbmZpZyAgfCA2ICsr
KysrKwo+ICAgeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYXJtL01ha2VmaWxlIHwgMiArLQo+ICAg
MiBmaWxlcyBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZm
IC0tZ2l0IGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYXJtL0tjb25maWcgYi94ZW4vZHJpdmVy
cy9wYXNzdGhyb3VnaC9hcm0vS2NvbmZpZwo+IGluZGV4IGNkYTg5OWY2MDguLjU5N2Y1OGYxMGIg
MTAwNjQ0Cj4gLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYXJtL0tjb25maWcKPiArKysg
Yi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vS2NvbmZpZwo+IEBAIC02LDMgKzYsOSBAQCBj
b25maWcgQVJNX1NNTVVfdjMKPiAgIAkgU3VwcG9ydCBmb3IgaW1wbGVtZW50YXRpb25zIG9mIHRo
ZSBBUk0gU3lzdGVtIE1NVSBhcmNoaXRlY3R1cmUKPiAgIAkgdmVyc2lvbiAzLgo+ICAgCj4gK2Nv
bmZpZyBBUk1fU01NVQo+ICsJYm9vbCAiQVJNIExlZ2FjeSBTTU1VIFN1cHBvcnQiCj4gKwlkZXBl
bmRzIG9uIChBUk1fNjQgfHwgQVJNKQoKQVJNXzY0IHdpbGwgc2VsZWN0IEFSTS4gU28gQVJNIGlz
IGVub3VnaCBoZXJlLgoKQ2hlZXJzLAoKPiArCWhlbHAKPiArCSBTdXBwb3J0IGZvciBpbXBsZW1l
bnRhdGlvbnMgb2YgdGhlIEFSTSBTeXN0ZW0gTU1VIGFyY2hpdGVjdHVyZQo+ICsJIHZlcnNpb24g
MSBhbmQgMi4KPiBkaWZmIC0tZ2l0IGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYXJtL01ha2Vm
aWxlIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYXJtL01ha2VmaWxlCj4gaW5kZXggZTE0NzMy
YjU1Yy4uNWIzZWIxNTQ1ZSAxMDA2NDQKPiAtLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9h
cm0vTWFrZWZpbGUKPiArKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vTWFrZWZpbGUK
PiBAQCAtMSwzICsxLDMgQEAKPiAgIG9iai15ICs9IGlvbW11Lm8KPiAtb2JqLXkgKz0gc21tdS5v
Cj4gK29iai0kKENPTkZJR19BUk1fU01NVSkgKz0gc21tdS5vCj4gICBvYmotJChDT05GSUdfQVJN
X1NNTVVfdjMpICs9IHNtbXUtdjMubwo+IAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
