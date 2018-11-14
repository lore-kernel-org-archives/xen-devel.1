From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 4/5] xen/domain: Allocate d->vcpu[]
 earlier during domain_create()
Date: Wed, 14 Nov 2018 19:04:18 +0000
Message-ID: <017c35d6-689c-b025-6a05-4188a2150332@citrix.com>
References: <1542039391-32406-1-git-send-email-andrew.cooper3@citrix.com>
 <1542039391-32406-5-git-send-email-andrew.cooper3@citrix.com>
 <5decbe62-8030-bf8e-117c-bc1874a90d31@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5decbe62-8030-bf8e-117c-bc1874a90d31@arm.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, Xen-devel <xen-devel@lists.xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTQvMTEvMjAxOCAxODo1OSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpIEFuZHJldywKPgo+
IE9uIDEyLzExLzIwMTggMTY6MTYsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+IFRoZSBBUk0gY29k
ZSBoYXMgYSBjaGlja2VuLWFuZC1lZ2cgcHJvYmxlbS7CoCBPbmUgb2YgdGhlIHZHSUNfdjMKPj4g
ZW11bGF0aW9ucwo+Cj4gTklUOiBzL3ZHSUNfdjMvdkdJQ3YzLwoKV2lsbCBmaXguCgo+Cj4+IGRp
ZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vdmdpYy5jIGIveGVuL2FyY2gvYXJtL3ZnaWMuYwo+PiBp
bmRleCA1YTRmMDgyLi44OTI0NDVlIDEwMDY0NAo+PiAtLS0gYS94ZW4vYXJjaC9hcm0vdmdpYy5j
Cj4+ICsrKyBiL3hlbi9hcmNoL2FybS92Z2ljLmMKPj4gQEAgLTY2Nyw5ICs2NjcsMjcgQEAgdm9p
ZCB2Z2ljX2ZyZWVfdmlycShzdHJ1Y3QgZG9tYWluICpkLCB1bnNpZ25lZAo+PiBpbnQgdmlycSkK
Pj4gwqDCoMKgwqDCoCBjbGVhcl9iaXQodmlycSwgZC0+YXJjaC52Z2ljLmFsbG9jYXRlZF9pcnFz
KTsKPj4gwqAgfQo+PiDCoCAtdW5zaWduZWQgaW50IHZnaWNfbWF4X3ZjcHVzKGNvbnN0IHN0cnVj
dCBkb21haW4gKmQpCj4+ICt1bnNpZ25lZCBpbnQgdmdpY19tYXhfdmNwdXModW5zaWduZWQgaW50
IGRvbWN0bF92Z2ljX3ZlcnNpb24pCj4+IMKgIHsKPj4gLcKgwqDCoCByZXR1cm4gbWluX3QodW5z
aWduZWQgaW50LCBNQVhfVklSVF9DUFVTLAo+PiBkLT5hcmNoLnZnaWMuaGFuZGxlci0+bWF4X3Zj
cHVzKTsKPj4gK8KgwqDCoCB1bnNpZ25lZCBpbnQgbWF4X3ZjcHVzOwo+PiArCj4+ICvCoMKgwqAg
c3dpdGNoICggZG9tY3RsX3ZnaWNfdmVyc2lvbiApCj4+ICvCoMKgwqAgewo+PiArwqDCoMKgIGNh
c2UgWEVOX0RPTUNUTF9DT05GSUdfR0lDX1YyOgo+PiArwqDCoMKgwqDCoMKgwqAgbWF4X3ZjcHVz
ID0gODsKPj4gK8KgwqDCoMKgwqDCoMKgIGJyZWFrOwo+PiArCj4+ICsjaWZkZWYgQ09ORklHX0dJ
Q1YzCj4+ICvCoMKgwqAgY2FzZSBYRU5fRE9NQ1RMX0NPTkZJR19HSUNfVjM6Cj4+ICvCoMKgwqDC
oMKgwqDCoCBtYXhfdmNwdXMgPSA0MDkyOwo+Cj4gVGhlIHByZXZpb3VzIGNhc2Ugd2FzIHVzaW5n
IDQwOTYuIEFsc28sIGNhbiB5b3UgbW92ZSB0aGUgY29tbWVudCB0bwo+IGtlZXAgdGhlIHJhdGlv
bmFsZSBmb3IgdGhlIG51bWJlcj8KClBsZWFzZSBzZWUgdGhlIHBvc3RlZCB2My7CoCBUaGlzIHdh
cyBhIHN0cmFpZ2h0IHR5cG8uCgo+Cj4+ICvCoMKgwqDCoMKgwqDCoCBicmVhazsKPj4gKyNlbmRp
Zgo+PiArCj4+ICvCoMKgwqAgZGVmYXVsdDoKPj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiAwOwo+
PiArwqDCoMKgIH0KPj4gKwo+PiArwqDCoMKgIHJldHVybiBtaW5fdCh1bnNpZ25lZCBpbnQsIE1B
WF9WSVJUX0NQVVMsIG1heF92Y3B1cyk7Cj4KPiBIb3cgYWJvdXQgbW92aW5nIHRoaXMgY2hlY2sg
aW4gdGhlIGNvbW1vbiBjb2RlPwoKQ2FuIGRvLgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
