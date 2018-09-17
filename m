From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2] iommu: setup inclusive mappings before
 enabling iommu
Date: Mon, 17 Sep 2018 15:22:12 +0200
Message-ID: <20180917132212.loqi4mc2wfmftcub@mac.bytemobile.com>
References: <20180914135843.24899-1-roger.pau@citrix.com>
 <5B9FA2D402000078001E90EC@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=tyjn=l7=citrix.com=prvs=791e5d1a9=roger.pau@srs-us1.protection.inumbo.net>)
 id 1g1tTw-0004sL-T3
 for xen-devel@lists.xenproject.org; Mon, 17 Sep 2018 13:22:28 +0000
Content-Disposition: inline
In-Reply-To: <5B9FA2D402000078001E90EC@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, xen-devel <xen-devel@lists.xenproject.org>, Brian Woods <brian.woods@amd.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBTZXAgMTcsIDIwMTggYXQgMDY6NDk6MjRBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDE0LjA5LjE4IGF0IDE1OjU4LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gT3IgZWxzZSBpdCBjYW4gbGVhZCB0byBmcmVlemVzIHdoZW4gZW5hYmxpbmcgdGhl
IGlvbW11IG9uIGNlcnRhaW4KPiA+IEludGVsIGhhcmR3YXJlOgo+ID4gCj4gPiBbLi4uXQo+ID4g
KFhFTikgRUxGOiBhZGRyZXNzZXM6Cj4gPiAoWEVOKSAgICAgdmlydF9iYXNlICAgICAgICA9IDB4
ZmZmZmZmZmY4MDAwMDAwMAo+ID4gKFhFTikgICAgIGVsZl9wYWRkcl9vZmZzZXQgPSAweDAKPiA+
IChYRU4pICAgICB2aXJ0X29mZnNldCAgICAgID0gMHhmZmZmZmZmZjgwMDAwMDAwCj4gPiAoWEVO
KSAgICAgdmlydF9rc3RhcnQgICAgICA9IDB4ZmZmZmZmZmY4MTAwMDAwMAo+ID4gKFhFTikgICAg
IHZpcnRfa2VuZCAgICAgICAgPSAweGZmZmZmZmZmODI5NTMwMDAKPiA+IChYRU4pICAgICB2aXJ0
X2VudHJ5ICAgICAgID0gMHhmZmZmZmZmZjgyNzRlMTgwCj4gPiAoWEVOKSAgICAgcDJtX2Jhc2Ug
ICAgICAgICA9IDB4ODAwMDAwMDAwMAo+ID4gKFhFTikgIFhlbiAga2VybmVsOiA2NC1iaXQsIGxz
YiwgY29tcGF0MzIKPiA+IChYRU4pICBEb20wIGtlcm5lbDogNjQtYml0LCBQQUUsIGxzYiwgcGFk
ZHIgMHgxMDAwMDAwIC0+IDB4Mjk1MzAwCj4gPiA8ZnJlZXplPgo+ID4gCj4gPiBUaGlzIHJlc3Rv
cmVzIHRoZSBiZWhhdmlvciBiZWZvcmUgY29tbWl0IDY2YTkyNzRjYzM0MzUgdGhhdCBjaGFuZ2Vk
Cj4gPiB0aGUgb3JkZXIgYW5kIGVuYWJsZWQgdGhlIGlvbW11IHdpdGhvdXQgaGF2aW5nIHRoZSBp
bmNsdXNpdmUgbWFwcGluZ3MKPiA+IHNldHVwLgo+ID4gCj4gPiBOb3RlIHRoYXQgb24gQU1EIGhh
cmR3YXJlIHRoZSBvcmRlciBpcyBhbHNvIGNoYW5nZWQgdG8gYWRkIGluY2x1c2l2ZQo+ID4gbWFw
cGluZ3MgYmVmb3JlIGFkZGluZyBhbnkgZGV2aWNlcy4KPiA+IAo+ID4gUmVwb3J0ZWQtYnk6IERh
cmlvIEZhZ2dpb2xpIDxkZmFnZ2lvbGlAc3VzZS5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBSb2dl
ciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPiAKPiBXaXRoIHRoZSBleGNlcHRp
b24gb2YgdGhlIEFSTSBhc3BlY3QgKGJlY2F1c2UgaXQncyBub3QKPiBjbGVhciB0byBtZSB3aHkg
dGhlIGNvZGUgcmVtb3ZlZCBmcm9tIGlvbW11X2h3ZG9tX2luaXQoKQo+IGRvZXNuJ3QgbmVlZCB0
byByZS1hcHBlYXIgaW4gQVJNLXNwZWNpZmljIGNvZGUgYXMgd2VsbCkKPiBSZXZpZXdlZC1ieTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKSSBndWVzcyB5b3UgbWVhbiB0aGUgZm9s
bG93aW5nIGNodW5rOgoKLSAgICBpZiAoIGlvbW11X2h3ZG9tX2luY2x1c2l2ZSAmJiAhaXNfcHZf
ZG9tYWluKGQpICkKLSAgICB7Ci0gICAgICAgIHByaW50ayhYRU5MT0dfV0FSTklORwotICAgICAg
ICAgICAgICAgIklPTU1VIGluY2x1c2l2ZSBtYXBwaW5ncyBhcmUgb25seSBzdXBwb3J0ZWQgb24g
UFYgRG9tMFxuIik7Ci0gICAgICAgIGlvbW11X2h3ZG9tX2luY2x1c2l2ZSA9IDA7Ci0gICAgfQoK
SSBoYXZlbid0IGFkZGVkIGl0IGZvciBBUk0gYmVjYXVzZSBpb21tdV9od2RvbV9pbmNsdXNpdmUg
aXMgYWx3YXlzIHNldAp0byAwIGluIHRoZSBBUk0gY2FzZSwgc28gdGhlIGNvbmRpdGlvbiB3b3Vs
ZCBuZXZlciBtYXRjaC4KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
