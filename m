From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 05/34] xen: is_hvm_domain should evaluate to
 0 when !CONFIG_HVM
Date: Tue, 21 Aug 2018 17:31:27 +0100
Message-ID: <20180821163127.fmzdxpj5kedmvecl@citrix.com>
References: <cover.f5351150954129956fcf53a7781206b6295df78d.1534518694.git-series.wei.liu2@citrix.com>
 <32dc160e20e574c7ec736fad43157928de86962e.1534518694.git-series.wei.liu2@citrix.com>
 <5B7AAB4002000078001DFFF7@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=7kme=le=citrix.com=prvs=7644f7420=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fs9Z5-0003Ms-UD
 for xen-devel@lists.xenproject.org; Tue, 21 Aug 2018 16:31:31 +0000
Content-Disposition: inline
In-Reply-To: <5B7AAB4002000078001DFFF7@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBBdWcgMjAsIDIwMTggYXQgMDU6NTE6MjhBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDE3LjA4LjE4IGF0IDE3OjEyLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gPiBTaW5jZSBpdCBpcyBkZWZpbmVkIGluIGNvbW1vbiBoZWFkZXIgZmlsZSwgaW50cm9k
dWNlIENPTkZJR19IVk0gdG8KPiA+IEFybSB0byBhdm9pZCBicmVha2FnZS4KPiA+IAo+ID4gU2ln
bmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KPiA+IC0tLQo+ID4gIHhl
bi9hcmNoL2FybS9LY29uZmlnICAgIHwgMyArKysKPiA+ICB4ZW4vaW5jbHVkZS94ZW4vc2NoZWQu
aCB8IDYgKysrKysrCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKykKPiA+IAo+
ID4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9LY29uZmlnIGIveGVuL2FyY2gvYXJtL0tjb25m
aWcKPiA+IGluZGV4IDU4NmJjNjIuLmMwZTk2OWUgMTAwNjQ0Cj4gPiAtLS0gYS94ZW4vYXJjaC9h
cm0vS2NvbmZpZwo+ID4gKysrIGIveGVuL2FyY2gvYXJtL0tjb25maWcKPiA+IEBAIC01Miw2ICs1
Miw5IEBAIGNvbmZpZyBIQVNfSVRTCj4gPiAgICAgICAgICBwcm9tcHQgIkdJQ3YzIElUUyBNU0kg
Y29udHJvbGxlciBzdXBwb3J0IiBpZiBFWFBFUlQgPSAieSIKPiA+ICAgICAgICAgIGRlcGVuZHMg
b24gR0lDVjMgJiYgIU5FV19WR0lDCj4gPiAgCj4gPiArY29uZmlnIEhWTQo+ID4gKyAgICAgICAg
ZGVmX2Jvb2wgeQo+IAo+IEknbSBub3QgY29udmluY2VkIHRoaXMgaXMgYSBnb29kIGlkZWEsIGJ1
dCBJJ2xsIGxldCB0aGUgQVJNIG1haW50YWluZXJzCj4ganVkZ2UuCgpBbmRyZXcgZGlzY292ZXJl
ZCB0aGF0IGh2bSBmbGFnIGlzIG5vdCBzZXQgYnkgdG9vbHN0YWNrIHNvIEFSTSBndWVzdHMKYXJl
IFBWIGd1ZXN0cyB0byBYZW4uIEkgdGhpbmsgdGhlIGFkZGl0aW9uIGhlcmUgY2FuIGJlIG9taXR0
ZWQuCgpIb3dldmVyIEkgd291bGQgc3RpbGwgbGlrZSB0byBoZWFyIGZyb20gQVJNIG1haW50YWlu
ZXJzIHdoYXQgZ3Vlc3QgdHlwZQpzaG91bGQgYmUgc2V0IGZvciBBUk0sIGJlY2F1c2Ugc29vbmVy
IG9yIGxhdGVyIEkgd2lsbCBuZWVkIHRvIGNoYW5nZSBQVgpjb2RlIGFzIHdlbGwuCgpHcmVwcGlu
ZyBmb3IgaXNfe2h2bSxwdn1fKiBpbiBhcmNoL2FybSB5aWVsZHMgbm8gcmVzdWx0LCBidXQgdGhl
biB0aGVyZQppcyBjb21tb24gY29kZSB0aGF0IHdlIG5lZWQgdG8gdGFrZSBjYXJlIG9mLgoKV2Vp
LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
