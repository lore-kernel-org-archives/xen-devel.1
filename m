From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [PATCH v9 7/7] vtd: add lookup_page method to
 iommu_ops
Date: Tue, 18 Sep 2018 14:00:19 +0000
Message-ID: <c248c490e4184888a312eeff70b3c1ed@AMSPEX02CL03.citrite.net>
References: <20180913152128.6114-1-paul.durrant@citrix.com>
 <20180913152128.6114-9-paul.durrant@citrix.com>
 <5BA0FB8F02000078001E9785@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=i+rk=ma=citrix.com=prvs=7929e83f2=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1g2GYJ-0005M9-Jp
 for xen-devel@lists.xenproject.org; Tue, 18 Sep 2018 14:00:31 +0000
In-Reply-To: <5BA0FB8F02000078001E9785@prv1-mh.provo.novell.com>
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
SkJldWxpY2hAc3VzZS5jb21dCj4gU2VudDogMTggU2VwdGVtYmVyIDIwMTggMTQ6MjAKPiBUbzog
UGF1bCBEdXJyYW50IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT4KPiBDYzogR2VvcmdlIER1bmxh
cCA8R2VvcmdlLkR1bmxhcEBjaXRyaXguY29tPjsgV2VpIExpdQo+IDx3ZWkubGl1MkBjaXRyaXgu
Y29tPjsgS2V2aW4gVGlhbiA8a2V2aW4udGlhbkBpbnRlbC5jb20+OyB4ZW4tZGV2ZWwgPHhlbi0K
PiBkZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZz4KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY5IDcv
N10gdnRkOiBhZGQgbG9va3VwX3BhZ2UgbWV0aG9kIHRvIGlvbW11X29wcwo+IAo+ID4+PiBPbiAx
My4wOS4xOCBhdCAxNzoyMSwgPHBhdWwuZHVycmFudEBjaXRyaXguY29tPiB3cm90ZToKPiA+IEBA
IC0xNzksOSArMTgxLDE3IEBAIHN0cnVjdCBpb21tdV9vcHMgewo+ID4gICNlbmRpZiAvKiBIQVNf
UENJICovCj4gPgo+ID4gICAgICB2b2lkICgqdGVhcmRvd24pKHN0cnVjdCBkb21haW4gKmQpOwo+
ID4gKwo+ID4gKyAgICAvKgo+ID4gKyAgICAgKiBUaGlzIGJsb2NrIG9mIG9wZXJhdGlvbnMgbXVz
dCBiZSBhcHByb3ByaWF0ZWx5IGxvY2tlZCBhZ2FpbnN0Cj4gZWFjaAo+ID4gKyAgICAgKiBvdGhl
ciB0byBoYXZlIG1lYW5pbmdmdWwgcmVzdWx0cy4KPiA+ICsgICAgICovCj4gPiAgICAgIGludCBf
X211c3RfY2hlY2sgKCptYXBfcGFnZSkoc3RydWN0IGRvbWFpbiAqZCwgZGZuX3QgZGZuLCBtZm5f
dAo+IG1mbiwKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBp
bnQgZmxhZ3MpOwo+ID4gICAgICBpbnQgX19tdXN0X2NoZWNrICgqdW5tYXBfcGFnZSkoc3RydWN0
IGRvbWFpbiAqZCwgZGZuX3QgZGZuKTsKPiA+ICsgICAgaW50IF9fbXVzdF9jaGVjayAoKmxvb2t1
cF9wYWdlKShzdHJ1Y3QgZG9tYWluICpkLCBkZm5fdCBkZm4sIG1mbl90Cj4gKm1mbiwKPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgKmZsYWdzKTsK
PiAKPiBJJ20gYWZyYWlkIHRoZSBjb21tZW50IGlzIGFtYmlndW91czogSXQgbWF5IG1lYW4gdGhl
IGltcGxlbWVudGF0aW9ucwo+IG9mIHRoZSBob29rcyBoYXZlIHRvIGhhdmUgc3VpdGFibGUgbG9j
a2luZyBpbiBwbGFjZSwgb3IgY2FsbGVycyBoYXZlIHRvCj4gdGFrZSBjYXJlIG9mIGxvY2tpbmcu
IEkgdGhpbmsgdGhlIGxhdHRlciBpcyBtZWFudCwgd2hpY2ggSSB0aGluayBuZWVkcyB0bwo+IGJl
IG1hZGUgZXhwbGljaXQuIFdpdGggdGhhdAo+IFJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJl
dWxpY2hAc3VzZS5jb20+Cj4gCgpUaGFua3MuIFllcywgdGhlIGxhdHRlciBpcyB3aGF0IEkgbWVh
bnQuIENhbiB5b3UgZml4IHRoZSB3b3JkaW5nIGFzIHlvdSBzZWUgZml0IGR1cmluZyBjb21taXQ/
CgogIFBhdWwKCj4gSmFuCj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
