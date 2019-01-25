From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [OSSTEST PATCH 5/5] power: ssh: Wait for the target
 to appear to go down
Date: Fri, 25 Jan 2019 18:22:42 +0100
Message-ID: <20190125172242.d75qxovsf5t5a564@mac>
References: <20190125145046.27138-1-ian.jackson@eu.citrix.com>
 <20190125145046.27138-6-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6NYt=QB=citrix.com=prvs=92139f89c=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gn5Bv-0006zE-EU
 for xen-devel@lists.xenproject.org; Fri, 25 Jan 2019 17:22:55 +0000
Content-Disposition: inline
In-Reply-To: <20190125145046.27138-6-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@eu.citrix.com>
Cc: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBKYW4gMjUsIDIwMTkgYXQgMDI6NTA6NDZQTSArMDAwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gV2hlbiB3ZSBgcG93ZXIgb24nIHdpdGggdGhlIHNzaCBtZXRob2QsIHdlIGFjdHVhbGx5
IHJ1biBzc2ggcmVib290Lgo+IAo+IE9uIHNvbWUgc3lzdGVtcyAobm90YWJseSwgRnJlZUJTRCkg
dGhlIGtlcm5lbCBkb2VzIG5vdCBzaW1wbHkgcmVib290Cj4gaW1tZWRpYXRlbHkgZXZlbiB3aXRo
IHRoZSBydW5lcyB3ZSBwcm92aWRlIGhlcmUsIGllIGZvciBGcmVlQlNECj4gICByZWJvb3QgLW5x
Cj4gRWcsIEkgaGF2ZSBzZWVuIHJlYm9vdHMgd2l0aCBzZXZlcmFsIG1lc3NhZ2VzIGxpa2UgdGhp
czoKPiAgIEphbiAyNSAxNDoxNzo1OS4xMDAwNDQgV2FpdGluZyAobWF4IDYwIHNlY29uZHMpIGZv
ciBzeXN0ZW0gdGhyZWFkIGBidWZzcGFjZWRhZW1vbi0yJyB0byBzdG9wLi4uIGRvbmUKClNvIGl0
IHNlZW1zIGxpa2UgcmVib290IC1ucSBkb2Vzbid0IGJlaGF2ZSBhcyBleHBlY3RlZC4uLgoKPiBU
aGlzIGNhbiByZXN1bHQgaW4gdGhlIHNzaCBtZXRob2QgZmFpbGluZyBzcHVyaW91c2x5LCBiZWNh
dXNlIHRoZQo+IGBwb3dlciBvbicgYXBwZWFycyB0byBjb21wbGV0ZSB3aGlsZSB0aGUgaG9zdCBp
cyBzdGlsbCB1cCBpbiB0aGUKPiBwcmV2aW91cyBlbnZpcm9ubWVudC4gIEluIG9uZSBvZiBteSB0
ZXN0IHJ1bnMgSSBzYXcgYW4gc3NoIHRvIHRoZSBob3N0Cj4gc3VjY2VlZCwgYW5kIHByaW50IHRo
ZSB1cHRpbWUgKG9mIHRoZSBleGlzdGluZyBlbnZpcm9ubWVudCksIGJldHdlZW4KPiB0aGUgcmVi
b290IGNvbW1hbmQgYmVpbmcgaXNzdWVkIGFuZCB0aGUgaG9zdCBhY3R1YWxseSByZWJvb3Rpbmcu
Cj4gCj4gU28sIHdhaXQgKHVwIHRvIGp1c3Qgb3ZlciBhIG1pbnV0ZSkgdW50aWwgdGhlIGhvc3Qg
ZG9lcyBub3QgcmVzcG9uZCB0bwo+IHBpbmcuICAodGFyZ2V0X2F3YWl0X2Rvd24gcnVucyBwaW5n
IC1jIDUuKQo+IAo+IENDOiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4K
PiBTaWduZWQtb2ZmLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4K
ClJldmlld2VkLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KClRo
YW5rcy4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
