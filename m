From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v2 2/6] libxl: add backend type and id to vkb
Date: Thu, 5 Jul 2018 16:08:14 +0100
Message-ID: <20180705150814.nbregis36micu5c2@citrix.com>
References: <20180612133147.807-1-al1img@gmail.com>
 <20180612133147.807-3-al1img@gmail.com>
 <20180705150635.cfozvvficshbfzpv@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=rzas=jv=citrix.com=prvs=717a9f9c1=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fb5s8-00045I-I0
 for xen-devel@lists.xenproject.org; Thu, 05 Jul 2018 15:08:40 +0000
Content-Disposition: inline
In-Reply-To: <20180705150635.cfozvvficshbfzpv@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Oleksandr Grytsov <al1img@gmail.com>
Cc: xen-devel@lists.xenproject.org, wei.liu2@citrix.com, ian.jackson@eu.citrix.com, Oleksandr Grytsov <oleksandr_grytsov@epam.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBKdWwgMDUsIDIwMTggYXQgMDQ6MDY6MzVQTSArMDEwMCwgV2VpIExpdSB3cm90ZToK
PiBPbiBUdWUsIEp1biAxMiwgMjAxOCBhdCAwNDozMTo0M1BNICswMzAwLCBPbGVrc2FuZHIgR3J5
dHNvdiB3cm90ZToKPiA+IEZyb206IE9sZWtzYW5kciBHcnl0c292IDxvbGVrc2FuZHJfZ3J5dHNv
dkBlcGFtLmNvbT4KPiBbLi4uXQo+ID4gZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhsL2xpYnhsX3Zr
Yi5jIGIvdG9vbHMvbGlieGwvbGlieGxfdmtiLmMKPiA+IGluZGV4IDc2NTJhZDIzY2UuLmJlYWYx
NzQ3NWQgMTAwNjQ0Cj4gPiAtLS0gYS90b29scy9saWJ4bC9saWJ4bF92a2IuYwo+ID4gKysrIGIv
dG9vbHMvbGlieGwvbGlieGxfdmtiLmMKPiA+IEBAIC0xNCwxMiArMTQsNDIgQEAKPiA+ICAKPiA+
ICAjaW5jbHVkZSAibGlieGxfaW50ZXJuYWwuaCIKPiA+ICAKPiA+ICsjaW5jbHVkZSA8eGVuL2lv
L2tiZGlmLmg+Cj4gPiArCj4gPiAgc3RhdGljIGludCBsaWJ4bF9fZGV2aWNlX3ZrYl9zZXRkZWZh
dWx0KGxpYnhsX19nYyAqZ2MsIHVpbnQzMl90IGRvbWlkLAo+ID4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBsaWJ4bF9kZXZpY2VfdmtiICp2a2IsIGJvb2wgaG90cGx1
ZykKPiA+ICB7Cj4gPiArICAgIGlmICh2a2ItPmJhY2tlbmRfdHlwZSA9PSBMSUJYTF9WS0JfQkFD
S0VORF9VTktOT1dOKSB7Cj4gPiArICAgICAgICB2a2ItPmJhY2tlbmRfdHlwZSA9IExJQlhMX1ZL
Ql9CQUNLRU5EX1FFTVU7Cj4gPiArICAgIH0KPiA+ICsKPiA+ICAgICAgcmV0dXJuIGxpYnhsX19y
ZXNvbHZlX2RvbWlkKGdjLCB2a2ItPmJhY2tlbmRfZG9tbmFtZSwgJnZrYi0+YmFja2VuZF9kb21p
ZCk7Cj4gPiAgfQo+ID4gIAo+ID4gK3N0YXRpYyBpbnQgbGlieGxfX2RldmljZV92a2JfZG1fbmVl
ZGVkKGxpYnhsX2RldmljZV92a2IgKnZrYiwgdWludDMyX3QgZG9taWQpCj4gPiArewo+ID4gKyAg
IGlmICh2a2ItPmJhY2tlbmRfdHlwZSA9PSBMSUJYTF9WS0JfQkFDS0VORF9RRU1VKSB7Cj4gPiAr
ICAgICAgICByZXR1cm4gMTsKPiA+ICsgICB9Cj4gCj4gSW5kZW50YXRpb24gaXMgd3JvbmcgaGVy
ZS4KPiAKPiA+ICsKPiA+ICsgICAgcmV0dXJuIDA7Cj4gCj4gVGhpcyBmdW5jdGlvbiBjYW4gYmUg
c2ltcGxpZmllZCBhcwo+IAo+ICAgIHJldHVybiB2a2ItPmJhY2tlbmRfdHlwZSA9PSBMSUJYTF9W
S0JfQkFDS0VORF9RRU1VOwo+IAo+IEkgdGhpbmsgdGhpcyBwYXRjaCBpcyBhbHNvIG1pc3Npbmcg
YWRkaW5nIExJQlhMX0hBVkUgaW4gbGlieGwuaC4KCllvdSBjYW4gb25seSBhZGQgb25lIExJQlhM
X0hBVkUgd2hlbiB5b3UgZmluaXNoIGFkZGluZyBhbGwgdGhlIG5ldwpmaWVsZHMgYnR3LgoKV2Vp
LiAgCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
