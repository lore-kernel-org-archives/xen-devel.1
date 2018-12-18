From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH for-4.12 v4 0/4] xen/arm: Implement Set/Way
 operations
Date: Tue, 18 Dec 2018 14:35:46 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1812181435390.15901@sstabellini-ThinkPad-X260>
References: <20181218180417.22134-1-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ti8Z=O3=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1gZNxs-000482-OD
 for xen-devel@lists.xenproject.org; Tue, 18 Dec 2018 22:35:48 +0000
In-Reply-To: <20181218180417.22134-1-julien.grall@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SSBjb21taXR0ZWQgdGhlIHNlcmllcwoKT24gVHVlLCAxOCBEZWMgMjAxOCwgSnVsaWVuIEdyYWxs
IHdyb3RlOgo+IEhpIGFsbCwKPiAKPiBUaGlzIGlzIHZlcnNpb24gMyBvZiB0aGUgc2VyaWVzIHRv
IGltcGxlbWVudCBzZXQvd2F5LiBGb3IgbW9yZSBkZXRhaWxzIHNlZQo+IHBhdGNoICMzLgo+IAo+
IENoZWVycywKPiAKPiBKdWxpZW4gR3JhbGwgKDQpOgo+ICAgeGVuL2FybTogdmNwcmVnOiBBZGQg
d3JhcHBlcnMgdG8gaGFuZGxlIGNvLXByb2MgYWNjZXNzIHRyYXBwZWQgYnkKPiAgICAgSENSX0VM
Mi5UVk0KPiAgIHhlbi9hcm06IHZzeXNyZWc6IEFkZCB3cmFwcGVyIHRvIGhhbmRsZSBzeXNyZWcg
YWNjZXNzIHRyYXBwZWQgYnkKPiAgICAgSENSX0VMMi5UVk0KPiAgIHhlbi9hcm06IEltcGxlbWVu
dCBTZXQvV2F5IG9wZXJhdGlvbnMKPiAgIHhlbi9hcm06IFRyYWNrIHBhZ2UgYWNjZXNzZWQgYmV0
d2VlbiBiYXRjaCBvZiBTZXQvV2F5IG9wZXJhdGlvbnMKPiAKPiAgeGVuL2FyY2gvYXJtL2FybTY0
L3ZzeXNyZWcuYyB8ICA3NSArKysrKysrKysrKysrKysrKysrCj4gIHhlbi9hcmNoL2FybS9kb21h
aW4uYyAgICAgICAgfCAgMTQgKysrKwo+ICB4ZW4vYXJjaC9hcm0vcDJtLmMgICAgICAgICAgIHwg
MTE5ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrLQo+ICB4ZW4vYXJjaC9hcm0vdHJhcHMu
YyAgICAgICAgIHwgIDI1ICsrKysrKy0KPiAgeGVuL2FyY2gvYXJtL3ZjcHJlZy5jICAgICAgICB8
IDE3MSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gIHhlbi9h
cmNoL3g4Ni9kb21haW4uYyAgICAgICAgfCAgIDQgKwo+ICB4ZW4vY29tbW9uL2RvbWFpbi5jICAg
ICAgICAgIHwgICA1ICstCj4gIHhlbi9pbmNsdWRlL2FzbS1hcm0vY3ByZWdzLmggfCAgIDEgKwo+
ICB4ZW4vaW5jbHVkZS9hc20tYXJtL2RvbWFpbi5oIHwgICA5ICsrKwo+ICB4ZW4vaW5jbHVkZS9h
c20tYXJtL3AybS5oICAgIHwgIDIyICsrKysrKwo+ICB4ZW4vaW5jbHVkZS94ZW4vZG9tYWluLmgg
ICAgIHwgICAyICsKPiAgMTEgZmlsZXMgY2hhbmdlZCwgNDQzIGluc2VydGlvbnMoKyksIDQgZGVs
ZXRpb25zKC0pCj4gCj4gLS0gCj4gMi4xMS4wCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
