From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [PATCH v9 7/7] vtd: add lookup_page method to
 iommu_ops
Date: Tue, 18 Sep 2018 16:03:47 +0000
Message-ID: <5dd7338e05d14310b95a35665414241e@AMSPEX02CL03.citrite.net>
References: <20180913152128.6114-1-paul.durrant@citrix.com>
 <20180913152128.6114-9-paul.durrant@citrix.com>
 <5BA0FB8F02000078001E9785@prv1-mh.provo.novell.com>
 <c248c490e4184888a312eeff70b3c1ed@AMSPEX02CL03.citrite.net>
 <5BA110B902000078001E97F8@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=i+rk=ma=citrix.com=prvs=7929e83f2=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1g2IUG-0007Kh-Ip
 for xen-devel@lists.xenproject.org; Tue, 18 Sep 2018 16:04:28 +0000
In-Reply-To: <5BA110B902000078001E97F8@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: 'Jan Beulich' <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@citrix.com>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEphbiBCZXVsaWNoIFttYWlsdG86
SkJldWxpY2hAc3VzZS5jb21dCj4gU2VudDogMTggU2VwdGVtYmVyIDIwMTggMTU6NTEKPiBUbzog
UGF1bCBEdXJyYW50IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT4KPiBDYzogR2VvcmdlIER1bmxh
cCA8R2VvcmdlLkR1bmxhcEBjaXRyaXguY29tPjsgV2VpIExpdQo+IDx3ZWkubGl1MkBjaXRyaXgu
Y29tPjsgS2V2aW4gVGlhbiA8a2V2aW4udGlhbkBpbnRlbC5jb20+OyB4ZW4tZGV2ZWwgPHhlbi0K
PiBkZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZz4KPiBTdWJqZWN0OiBSRTogW1BBVENIIHY5IDcv
N10gdnRkOiBhZGQgbG9va3VwX3BhZ2UgbWV0aG9kIHRvIGlvbW11X29wcwo+IAo+ID4+PiBPbiAx
OC4wOS4xOCBhdCAxNjowMCwgPFBhdWwuRHVycmFudEBjaXRyaXguY29tPiB3cm90ZToKPiA+PiBG
cm9tOiBKYW4gQmV1bGljaCBbbWFpbHRvOkpCZXVsaWNoQHN1c2UuY29tXQo+ID4+IFNlbnQ6IDE4
IFNlcHRlbWJlciAyMDE4IDE0OjIwCj4gPj4KPiA+PiA+Pj4gT24gMTMuMDkuMTggYXQgMTc6MjEs
IDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4gd3JvdGU6Cj4gPj4gPiBAQCAtMTc5LDkgKzE4MSwx
NyBAQCBzdHJ1Y3QgaW9tbXVfb3BzIHsKPiA+PiA+ICAjZW5kaWYgLyogSEFTX1BDSSAqLwo+ID4+
ID4KPiA+PiA+ICAgICAgdm9pZCAoKnRlYXJkb3duKShzdHJ1Y3QgZG9tYWluICpkKTsKPiA+PiA+
ICsKPiA+PiA+ICsgICAgLyoKPiA+PiA+ICsgICAgICogVGhpcyBibG9jayBvZiBvcGVyYXRpb25z
IG11c3QgYmUgYXBwcm9wcmlhdGVseSBsb2NrZWQgYWdhaW5zdAo+ID4+IGVhY2gKPiA+PiA+ICsg
ICAgICogb3RoZXIgdG8gaGF2ZSBtZWFuaW5nZnVsIHJlc3VsdHMuCj4gPj4gPiArICAgICAqLwo+
ID4+ID4gICAgICBpbnQgX19tdXN0X2NoZWNrICgqbWFwX3BhZ2UpKHN0cnVjdCBkb21haW4gKmQs
IGRmbl90IGRmbiwgbWZuX3QKPiA+PiBtZm4sCj4gPj4gPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgdW5zaWduZWQgaW50IGZsYWdzKTsKPiA+PiA+ICAgICAgaW50IF9fbXVzdF9j
aGVjayAoKnVubWFwX3BhZ2UpKHN0cnVjdCBkb21haW4gKmQsIGRmbl90IGRmbik7Cj4gPj4gPiAr
ICAgIGludCBfX211c3RfY2hlY2sgKCpsb29rdXBfcGFnZSkoc3RydWN0IGRvbWFpbiAqZCwgZGZu
X3QgZGZuLAo+IG1mbl90Cj4gPj4gKm1mbiwKPiA+PiA+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgKmZsYWdzKTsKPiA+Pgo+ID4+IEknbSBhZnJhaWQg
dGhlIGNvbW1lbnQgaXMgYW1iaWd1b3VzOiBJdCBtYXkgbWVhbiB0aGUgaW1wbGVtZW50YXRpb25z
Cj4gPj4gb2YgdGhlIGhvb2tzIGhhdmUgdG8gaGF2ZSBzdWl0YWJsZSBsb2NraW5nIGluIHBsYWNl
LCBvciBjYWxsZXJzIGhhdmUgdG8KPiA+PiB0YWtlIGNhcmUgb2YgbG9ja2luZy4gSSB0aGluayB0
aGUgbGF0dGVyIGlzIG1lYW50LCB3aGljaCBJIHRoaW5rIG5lZWRzCj4gdG8KPiA+PiBiZSBtYWRl
IGV4cGxpY2l0LiBXaXRoIHRoYXQKPiA+PiBSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVs
aWNoQHN1c2UuY29tPgo+ID4+Cj4gPgo+ID4gVGhhbmtzLiBZZXMsIHRoZSBsYXR0ZXIgaXMgd2hh
dCBJIG1lYW50LiBDYW4geW91IGZpeCB0aGUgd29yZGluZyBhcyB5b3UKPiBzZWUKPiA+IGZpdCBk
dXJpbmcgY29tbWl0Pwo+IAo+IFdlbGwsIEkgZGlkbid0IG9mZmVyIGRvaW5nIHNvIGJlY2F1c2Ug
aXQgc2VlbWVkIHRvIG1lIHRoYXQgc21hbGwKPiBhZGp1c3RtZW50cwo+IHRvIGF0IGxlYXN0IG9u
ZSBvZiBlYXJsaWVyIHBhdGNoZXMgd291bGQgc3RpbGwgYmUgbmVlZGVkLiBXYXMgdGhhdCB3cm9u
Zz8KPiAKCk5vLCBJIGp1c3QgcmVhZCB0aGUgZW1haWxzIGluIHJldmVyc2Ugb3JkZXIuIEknbGwg
c2VuZCB2MTAuCgogIFBhdWwKCj4gSmFuCj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
