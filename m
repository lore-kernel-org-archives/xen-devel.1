From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [PATCH 2/3] tools: No longer advertise GIT_HTTP env
 var
Date: Tue, 6 Nov 2018 08:43:14 +0000
Message-ID: <d8bcd9537f11473389be669eb9b478d7@AMSPEX02CL03.citrite.net>
References: <20181105184234.31603-1-ian.jackson@eu.citrix.com>
 <20181105184234.31603-2-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=9pgl=nr=citrix.com=prvs=84117823e=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1gJwxB-0002Mm-BW
 for xen-devel@lists.xenproject.org; Tue, 06 Nov 2018 08:43:17 +0000
In-Reply-To: <20181105184234.31603-2-ian.jackson@eu.citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Ian Jackson <Ian.Jackson@citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IElhbiBKYWNrc29uIFttYWlsdG86
aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbV0KPiBTZW50OiAwNSBOb3ZlbWJlciAyMDE4IDE4OjQz
Cj4gVG86IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwo+IENjOiBJYW4gSmFja3NvbiA8
SWFuLkphY2tzb25AY2l0cml4LmNvbT47IFBhdWwgRHVycmFudAo+IDxQYXVsLkR1cnJhbnRAY2l0
cml4LmNvbT47IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Cj4gU3ViamVjdDogW1BBVENI
IDIvM10gdG9vbHM6IE5vIGxvbmdlciBhZHZlcnRpc2UgR0lUX0hUVFAgZW52IHZhcgo+IAo+IElu
ICJidWlsZDogYWRkIGF1dG9jb25mIHRvIHJlcGxhY2UgY3VzdG9tIGNoZWNrcyBpbiB0b29scy9j
aGVjayIKPiAtLWVuYWJsZS1naXRodHRwIHdhcyBpbnRyb2R1Y2VkLiAgQnV0IHdlIG1pc3NlZCB0
aGlzIGNvbW1lbnQgd2hlcmUgaXQKPiB3YXMgYWR2ZXJ0aXNlZC4KPiAKPiBTaWduZWQtb2ZmLWJ5
OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KPiBDQzogUGF1bCBEdXJy
YW50IDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4KPiBDQzogV2VpIExpdSA8d2VpLmxpdTJAY2l0
cml4LmNvbT4KClRCSCBJJ2Qgc3F1YXNoIHRoaXMgaW50byB0aGUgcHJldmlvdXMgcGF0Y2guIEkg
dGhpbmsgaXQncyBiZXR0ZXIgdG8gbW9kaWZ5IHRoZSBjb21tZW50IGF0IHRoZSBzYW1lIHRpbWUg
YXMgdGhlIGJlaGF2aW91ci4KCiAgUGF1bAoKPiAtLS0KPiAgY29uZmlnL1Rvb2xzLm1rLmluIHwg
MiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAK
PiBkaWZmIC0tZ2l0IGEvY29uZmlnL1Rvb2xzLm1rLmluIGIvY29uZmlnL1Rvb2xzLm1rLmluCj4g
aW5kZXggZDU5ODVjMGQwOS4uOTgyNDVmNjNjOSAxMDA2NDQKPiAtLS0gYS9jb25maWcvVG9vbHMu
bWsuaW4KPiArKysgYi9jb25maWcvVG9vbHMubWsuaW4KPiBAQCAtNDAsNyArNDAsNyBAQCBYRU5f
VE9PTFNfUlBBVEggICAgIDo9IEBycGF0aEAKPiAgIyBEb3dubG9hZCBHSVQgcmVwb3NpdG9yaWVz
IHZpYSBIVFRQIG9yIEdJVCdzIG93biBwcm90b2NvbD8KPiAgIyBHSVQncyBwcm90b2NvbCBpcyBm
YXN0ZXIgYW5kIG1vcmUgcm9idXN0LCB3aGVuIGl0IHdvcmtzIGF0IGFsbAo+IChmaXJld2FsbHMK
PiAgIyBtYXkgYmxvY2sgaXQpLiBXZSBtYWtlIGl0IHRoZSBkZWZhdWx0LCBidXQgaWYgeW91ciBH
SVQgcmVwb3NpdG9yeQo+IGRvd25sb2Fkcwo+IC0jIGZhaWwgb3IgaGFuZywgcGxlYXNlIHNwZWNp
ZnkgR0lUX0hUVFA9eSBpbiB5b3VyIGVudmlyb25tZW50Lgo+ICsjIGZhaWwgb3IgaGFuZywgcGxl
YXNlIHBhc3MgLS1lbmFibGUtZ2l0aHR0cCB0byBjb25maWd1cmUuCj4gIEdJVF9IVFRQICAgICAg
ICAgICAgPz0gQGdpdGh0dHBACj4gCj4gICMgT3B0aW9uYWwgY29tcG9uZW50cwo+IC0tCj4gMi4x
MS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
