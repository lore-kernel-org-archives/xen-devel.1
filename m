From: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH v5 06/15] public / x86: introduce
 __HYPERCALL_iommu_op
Date: Tue, 7 Aug 2018 03:00:01 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D1912AC112@SHSMSX101.ccr.corp.intel.com>
References: <20180803172220.1657-1-paul.durrant@citrix.com>
 <20180803172220.1657-7-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=tozp=kw=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1fmsFV-0006YA-Fs
 for xen-devel@lists.xenproject.org; Tue, 07 Aug 2018 03:01:29 +0000
In-Reply-To: <20180803172220.1657-7-paul.durrant@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Jan Beulich <jbeulich@suse.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>
List-Id: xen-devel@lists.xenproject.org

PiBGcm9tOiBQYXVsIER1cnJhbnQNCj4gU2VudDogU2F0dXJkYXksIEF1Z3VzdCA0LCAyMDE4IDE6
MjIgQU0NCj4gDQo+IFRoaXMgcGF0Y2ggaW50cm9kdWNlcyB0aGUgYm9pbGVycGxhdGUgZm9yIGEg
bmV3IGh5cGVyY2FsbCB0byBhbGxvdyBhDQo+IGRvbWFpbiB0byBjb250cm9sIElPTU1VIG1hcHBp
bmdzIGZvciBpdHMgb3duIHBhZ2VzLg0KPiBXaGlsc3QgdGhlcmUgaXMgZHVwbGljYXRpb24gb2Yg
Y29kZSBiZXR3ZWVuIHRoZSBuYXRpdmUgYW5kIGNvbXBhdCBlbnRyeQ0KPiBwb2ludHMgd2hpY2gg
YXBwZWFycyByaXBlIGZvciBzb21lIGZvcm0gb2YgY29tYmluYXRpb24sIEkgdGhpbmsgaXQgaXMN
Cj4gYmV0dGVyIHRvIG1haW50YWluIHRoZSBzZXBhcmF0aW9uIGFzLWlzIGJlY2F1c2UgdGhlIGNv
bXBhdCBlbnRyeSBwb2ludA0KPiB3aWxsIG5lY2Vzc2FyaWx5IGdhaW4gY29tcGxleGl0eSBpbiBz
dWJzZXF1ZW50IHBhdGNoZXMuDQo+IA0KPiBOT1RFOiBUaGlzIGh5cGVyY2FsbCBpcyBvbmx5IGlt
cGxlbWVudGVkIGZvciB4ODYgYW5kIGlzIGN1cnJlbnRseQ0KPiAgICAgICByZXN0cmljdGVkIGJ5
IFhTTSB0byBkb20wLiBJdHMgc2NvcGUgY2FuIGJlIGV4cGFuZGVkIGluIGZ1dHVyZQ0KPiAgICAg
ICBpZiBuZWVkIGJlLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxwYXVsLmR1
cnJhbnRAY2l0cml4LmNvbT4NClsuLi5dDQoNCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9p
b21tdV9vcC5jIGIveGVuL2FyY2gveDg2L2lvbW11X29wLmMNCj4gbmV3IGZpbGUgbW9kZSAxMDA2
NDQNCj4gaW5kZXggMDAwMDAwMDAwMC4uNzQ0YzBmY2UyNw0KPiAtLS0gL2Rldi9udWxsDQo+ICsr
KyBiL3hlbi9hcmNoL3g4Ni9pb21tdV9vcC5jDQo+IEBAIC0wLDAgKzEsMTg0IEBADQo+ICsvKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
DQo+ICoqKioqKioqKioqKioqKioqKg0KPiArICogeDg2L2lvbW11X29wLmMNCj4gKyAqDQo+ICsg
KiBQYXJhdmlydHVhbGlzZWQgSU9NTVUgZnVuY3Rpb25hbGl0eQ0KDQphbHRob3VnaCBvbmx5IHg4
NiBpcyBzdXBwb3J0ZWQsIGxvZ2ljIGluIHRoaXMgZmlsZSBpcyB2ZW5kb3IgYWdub3N0aWMuIEJl
dHRlcg0KbW92ZSB0byBhIGNvbW1vbiBwbGFjZSBub3cuLi4NCg0KVGhhbmtzDQpLZXZpbg0KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
