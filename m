From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH 3/6] x86: Handle the Xen MSRs via the new
 guest_{rd, wr}msr() infrastructure
Date: Mon, 26 Feb 2018 14:43:09 -0500
Message-ID: <6b1992c4-48cd-2f82-71dc-0877e10f029d@oracle.com>
References: <1519666519-16311-1-git-send-email-andrew.cooper3@citrix.com>
 <1519666519-16311-4-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1519666519-16311-4-git-send-email-andrew.cooper3@citrix.com>
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
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, Jan Beulich <JBeulich@suse.com>, Paul Durrant <paul.durrant@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDIvMjYvMjAxOCAxMjozNSBQTSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBEaXNwYXRjaCBm
cm9tIHRoZSBndWVzdF97cmQsd3J9bXNyKCkgZnVuY3Rpb25zLCBhZnRlciBmYWxsaW5nIHRocm91
Z2ggZnJvbSB0aGUKPiAhaXNfdmlyaWRpYW5fZG9tYWluKCkgY2FzZS4KPgo+IFJlbmFtZSB7cmQs
d3J9bXNyX2h5cGVydmlzb3JfcmVncygpIHRvIGd1ZXN0X3tyZCx3cn1tc3JfeGVuKCkgZm9yIGNv
bnNpc3RlbmN5LAo+IGFuZCBiZWNhdXNlIHRoZSBfcmVncyBzdWZmaXggaXNuJ3QgdmVyeSBhcHBy
b3ByaWF0ZS4KPgo+IFVwZGF0ZSB0aGVtIHRvIHRha2UgYSB2Y3B1IHBvaW50ZXIgcmF0aGVyIHRo
YW4gcHJlc3VtaW5nIHRoYXQgdGhleSBhY3Qgb24KPiBjdXJyZW50LCBhbmQgc3dpdGNoIHRvIHVz
aW5nIFg4NkVNVUxfKiByZXR1cm4gdmFsdWVzLgo+Cj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENv
b3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KPiAtLS0KPiBDQzogSmFuIEJldWxpY2gg
PEpCZXVsaWNoQHN1c2UuY29tPgo+IENDOiBKdW4gTmFrYWppbWEgPGp1bi5uYWthamltYUBpbnRl
bC5jb20+Cj4gQ0M6IFBhdWwgRHVycmFudCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+Cj4gQ0M6
IEtldmluIFRpYW4gPGtldmluLnRpYW5AaW50ZWwuY29tPgo+IENDOiBCb3JpcyBPc3Ryb3Zza3kg
PGJvcmlzLm9zdHJvdnNreUBvcmFjbGUuY29tPgo+IENDOiBTdXJhdmVlIFN1dGhpa3VscGFuaXQg
PHN1cmF2ZWUuc3V0aGlrdWxwYW5pdEBhbWQuY29tPgo+IENDOiBXZWkgTGl1IDx3ZWkubGl1MkBj
aXRyaXguY29tPgo+IENDOiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4K
PiBDQzogU2VyZ2V5IER5YXNsaSA8c2VyZ2V5LmR5YXNsaUBjaXRyaXguY29tPgo+IC0tLQo+ICB4
ZW4vYXJjaC94ODYvaHZtL3N2bS9zdm0uYyAgICAgIHwgMjUgKysrKy0tLS0tLS0tLS0tLS0tLS0t
LS0tLQo+ICB4ZW4vYXJjaC94ODYvaHZtL3ZteC92bXguYyAgICAgIHwgMjQgKysrKy0tLS0tLS0t
LS0tLS0tLS0tLS0tCj4gIHhlbi9hcmNoL3g4Ni9tc3IuYyAgICAgICAgICAgICAgfCAgOCArKysr
KysrKwo+ICB4ZW4vYXJjaC94ODYvcHYvZW11bC1wcml2LW9wLmMgIHwgIDYgLS0tLS0tCj4gIHhl
bi9hcmNoL3g4Ni90cmFwcy5jICAgICAgICAgICAgfCAzMyArKysrKysrKysrKysrKysrLS0tLS0t
LS0tLS0tLS0tLS0KPiAgeGVuL2luY2x1ZGUvYXNtLXg4Ni9wcm9jZXNzb3IuaCB8ICA0ICsrLS0K
PiAgNiBmaWxlcyBjaGFuZ2VkLCAzNCBpbnNlcnRpb25zKCspLCA2NiBkZWxldGlvbnMoLSkKCgpS
ZXZpZXdlZC1ieTogQm9yaXMgT3N0cm92c2t5IDxib3Jpcy5vc3Ryb3Zza3lAb3JhY2xlLmNvbT4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
