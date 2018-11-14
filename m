From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v2 4/5] xen/domain: Allocate d->vcpu[]
 earlier during domain_create()
Date: Wed, 14 Nov 2018 18:59:05 +0000
Message-ID: <5decbe62-8030-bf8e-117c-bc1874a90d31@arm.com>
References: <1542039391-32406-1-git-send-email-andrew.cooper3@citrix.com>
 <1542039391-32406-5-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1542039391-32406-5-git-send-email-andrew.cooper3@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

SGkgQW5kcmV3LAoKT24gMTIvMTEvMjAxOCAxNjoxNiwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBU
aGUgQVJNIGNvZGUgaGFzIGEgY2hpY2tlbi1hbmQtZWdnIHByb2JsZW0uICBPbmUgb2YgdGhlIHZH
SUNfdjMgZW11bGF0aW9ucwoKTklUOiBzL3ZHSUNfdjMvdkdJQ3YzLwoKPiBkaWZmIC0tZ2l0IGEv
eGVuL2FyY2gvYXJtL3ZnaWMuYyBiL3hlbi9hcmNoL2FybS92Z2ljLmMKPiBpbmRleCA1YTRmMDgy
Li44OTI0NDVlIDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL2FybS92Z2ljLmMKPiArKysgYi94ZW4v
YXJjaC9hcm0vdmdpYy5jCj4gQEAgLTY2Nyw5ICs2NjcsMjcgQEAgdm9pZCB2Z2ljX2ZyZWVfdmly
cShzdHJ1Y3QgZG9tYWluICpkLCB1bnNpZ25lZCBpbnQgdmlycSkKPiAgICAgICBjbGVhcl9iaXQo
dmlycSwgZC0+YXJjaC52Z2ljLmFsbG9jYXRlZF9pcnFzKTsKPiAgIH0KPiAgIAo+IC11bnNpZ25l
ZCBpbnQgdmdpY19tYXhfdmNwdXMoY29uc3Qgc3RydWN0IGRvbWFpbiAqZCkKPiArdW5zaWduZWQg
aW50IHZnaWNfbWF4X3ZjcHVzKHVuc2lnbmVkIGludCBkb21jdGxfdmdpY192ZXJzaW9uKQo+ICAg
ewo+IC0gICAgcmV0dXJuIG1pbl90KHVuc2lnbmVkIGludCwgTUFYX1ZJUlRfQ1BVUywgZC0+YXJj
aC52Z2ljLmhhbmRsZXItPm1heF92Y3B1cyk7Cj4gKyAgICB1bnNpZ25lZCBpbnQgbWF4X3ZjcHVz
Owo+ICsKPiArICAgIHN3aXRjaCAoIGRvbWN0bF92Z2ljX3ZlcnNpb24gKQo+ICsgICAgewo+ICsg
ICAgY2FzZSBYRU5fRE9NQ1RMX0NPTkZJR19HSUNfVjI6Cj4gKyAgICAgICAgbWF4X3ZjcHVzID0g
ODsKPiArICAgICAgICBicmVhazsKPiArCj4gKyNpZmRlZiBDT05GSUdfR0lDVjMKPiArICAgIGNh
c2UgWEVOX0RPTUNUTF9DT05GSUdfR0lDX1YzOgo+ICsgICAgICAgIG1heF92Y3B1cyA9IDQwOTI7
CgpUaGUgcHJldmlvdXMgY2FzZSB3YXMgdXNpbmcgNDA5Ni4gQWxzbywgY2FuIHlvdSBtb3ZlIHRo
ZSBjb21tZW50IHRvIGtlZXAgdGhlIApyYXRpb25hbGUgZm9yIHRoZSBudW1iZXI/Cgo+ICsgICAg
ICAgIGJyZWFrOwo+ICsjZW5kaWYKPiArCj4gKyAgICBkZWZhdWx0Ogo+ICsgICAgICAgIHJldHVy
biAwOwo+ICsgICAgfQo+ICsKPiArICAgIHJldHVybiBtaW5fdCh1bnNpZ25lZCBpbnQsIE1BWF9W
SVJUX0NQVVMsIG1heF92Y3B1cyk7CgpIb3cgYWJvdXQgbW92aW5nIHRoaXMgY2hlY2sgaW4gdGhl
IGNvbW1vbiBjb2RlPwoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
