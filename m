From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH 05/34] xen: is_hvm_domain should evaluate to
 0 when !CONFIG_HVM
Date: Tue, 21 Aug 2018 19:33:56 +0100
Message-ID: <faa2beb9-f589-a396-5133-2f76c2837349@arm.com>
References: <cover.f5351150954129956fcf53a7781206b6295df78d.1534518694.git-series.wei.liu2@citrix.com>
 <32dc160e20e574c7ec736fad43157928de86962e.1534518694.git-series.wei.liu2@citrix.com>
 <5B7AAB4002000078001DFFF7@prv1-mh.provo.novell.com>
 <20180821163127.fmzdxpj5kedmvecl@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=hivl=le=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1fsBTf-0004sw-2c
 for xen-devel@lists.xenproject.org; Tue, 21 Aug 2018 18:34:03 +0000
In-Reply-To: <20180821163127.fmzdxpj5kedmvecl@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

SGkgV2VpLAoKT24gMDgvMjEvMjAxOCAwNTozMSBQTSwgV2VpIExpdSB3cm90ZToKPiBPbiBNb24s
IEF1ZyAyMCwgMjAxOCBhdCAwNTo1MToyOEFNIC0wNjAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+
Pj4gT24gMTcuMDguMTggYXQgMTc6MTIsIDx3ZWkubGl1MkBjaXRyaXguY29tPiB3cm90ZToKPj4+
IFNpbmNlIGl0IGlzIGRlZmluZWQgaW4gY29tbW9uIGhlYWRlciBmaWxlLCBpbnRyb2R1Y2UgQ09O
RklHX0hWTSB0bwo+Pj4gQXJtIHRvIGF2b2lkIGJyZWFrYWdlLgo+Pj4KPj4+IFNpZ25lZC1vZmYt
Ynk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Cj4+PiAtLS0KPj4+ICAgeGVuL2FyY2gv
YXJtL0tjb25maWcgICAgfCAzICsrKwo+Pj4gICB4ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaCB8IDYg
KysrKysrCj4+PiAgIDIgZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspCj4+PiwKPj4+IGRp
ZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vS2NvbmZpZyBiL3hlbi9hcmNoL2FybS9LY29uZmlnCj4+
PiBpbmRleCA1ODZiYzYyLi5jMGU5NjllIDEwMDY0NAo+Pj4gLS0tIGEveGVuL2FyY2gvYXJtL0tj
b25maWcKPj4+ICsrKyBiL3hlbi9hcmNoL2FybS9LY29uZmlnCj4+PiBAQCAtNTIsNiArNTIsOSBA
QCBjb25maWcgSEFTX0lUUwo+Pj4gICAgICAgICAgIHByb21wdCAiR0lDdjMgSVRTIE1TSSBjb250
cm9sbGVyIHN1cHBvcnQiIGlmIEVYUEVSVCA9ICJ5Igo+Pj4gICAgICAgICAgIGRlcGVuZHMgb24g
R0lDVjMgJiYgIU5FV19WR0lDCj4+PiAgIAo+Pj4gK2NvbmZpZyBIVk0KPj4+ICsgICAgICAgIGRl
Zl9ib29sIHkKPj4KPj4gSSdtIG5vdCBjb252aW5jZWQgdGhpcyBpcyBhIGdvb2QgaWRlYSwgYnV0
IEknbGwgbGV0IHRoZSBBUk0gbWFpbnRhaW5lcnMKPj4ganVkZ2UuCj4gCj4gQW5kcmV3IGRpc2Nv
dmVyZWQgdGhhdCBodm0gZmxhZyBpcyBub3Qgc2V0IGJ5IHRvb2xzdGFjayBzbyBBUk0gZ3Vlc3Rz
Cj4gYXJlIFBWIGd1ZXN0cyB0byBYZW4uIEkgdGhpbmsgdGhlIGFkZGl0aW9uIGhlcmUgY2FuIGJl
IG9taXR0ZWQuCj4gCj4gSG93ZXZlciBJIHdvdWxkIHN0aWxsIGxpa2UgdG8gaGVhciBmcm9tIEFS
TSBtYWludGFpbmVycyB3aGF0IGd1ZXN0IHR5cGUKPiBzaG91bGQgYmUgc2V0IGZvciBBUk0sIGJl
Y2F1c2Ugc29vbmVyIG9yIGxhdGVyIEkgd2lsbCBuZWVkIHRvIGNoYW5nZSBQVgo+IGNvZGUgYXMg
d2VsbC4KPiAKPiBHcmVwcGluZyBmb3IgaXNfe2h2bSxwdn1fKiBpbiBhcmNoL2FybSB5aWVsZHMg
bm8gcmVzdWx0LCBidXQgdGhlbiB0aGVyZQo+IGlzIGNvbW1vbiBjb2RlIHRoYXQgd2UgbmVlZCB0
byB0YWtlIGNhcmUgb2YuCgpVc2luZyBQViB3YXMgbW9yZSBhIGNvbnZlbmllbmNlIGF0IHRoZSB0
aW1lIGJlY2F1c2Ugd2FzIG5vdCB0aGVyZS4gVGhlIApwbGFuIGlzIHRvIHN3aXRjaCB0byBQVkgg
KHNlZSBSRkMgWzFdKS4KCkkgd2lsbCB0cnkgdG8gZmluZCBzb21lIHRpbWVzIHRoaXMgd2VlayB0
byByZXdvcmsgdGhlIHBhdGNoIGJhc2VkIG9uIHRoZSAKY29tbWVudHMuCgpDaGVlcnMsCgpbMV0g
aHR0cHM6Ly9saXN0cy54ZW4ub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMTgtMDYvbXNn
MDE1MzcuaHRtbAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
