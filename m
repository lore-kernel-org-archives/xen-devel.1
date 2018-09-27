From: Isaila Alexandru <aisaila@bitdefender.com>
Subject: Re: [RFC PATCH 2/2] x86/mm: Add mem access rights to NPT
Date: Thu, 27 Sep 2018 12:38:05 +0300
Message-ID: <609e259387df6ee56b5890588eb70c40fdf748f0.camel@bitdefender.com>
References: <20180926164741.13405-1-george.dunlap@citrix.com>
 <20180926164741.13405-2-george.dunlap@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=4jve=mj=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1g5SkV-0004Yp-PH
 for xen-devel@lists.xenproject.org; Thu, 27 Sep 2018 09:38:19 +0000
In-Reply-To: <20180926164741.13405-2-george.dunlap@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Cc: Razvan Cojocaru <rcojocaru@bitdefender.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>, Tamas K Lengyel <tamas.lengyel@zentific.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCAyMDE4LTA5LTI2IGF0IDE3OjQ3ICswMTAwLCBHZW9yZ2UgRHVubGFwIHdyb3RlOgo+
IEZyb206IElzYWlsYSBBbGV4YW5kcnUgPGFpc2FpbGFAYml0ZGVmZW5kZXIuY29tPgo+IAo+IFRo
aXMgcGF0Y2ggYWRkcyBhY2Nlc3MgY29udHJvbCBmb3IgTlBUIG1vZGUuCj4gCj4gVGhlcmUgYXJl
buKAmXQgZW5vdWdoIGV4dHJhIGJpdHMgdG8gc3RvcmUgdGhlIGFjY2VzcyByaWdodHMgaW4gdGhl
IE5QVAo+IHAybQo+IHRhYmxlLCBzbyB3ZSBhZGQgYSByYWRpeCB0cmVlIHRvIHN0b3JlIGV4dHJh
IGluZm9ybWF0aW9uLgo+IAo+IEZvciBlZmZpY2llbmN5Ogo+ICAtIE9ubHkgYWxsb2NhdGUgdGhp
cyByYWRpeCB0cmVlIHdoZW4gd2UgZmlyc3Qgc3RvcmUgIm5vbi1kZWZhdWx0Igo+ICAgIGV4dHJh
IGluZm9ybWF0aW9uCj4gCj4gIC0gUmVtb3ZlIGVudGlyZXMgd2hpY2ggbWF0Y2ggdGhlIGRlZmF1
bHQgZXh0cmEgaW5mb3JtYXRpb24gcmF0aGVyCj4gICAgdGhhbiBjb250aW51aW5nIHRvIHN0b3Jl
IHRoZW0KPiAKPiAgLSBGb3Igc3VwZXJwYWdlcywgb25seSBzdG9yZSBhbiBlbnRyeSBmb3IgdGhl
IGZpcnN0IGdmbiBpbiB0aGUKPiAgICBzdXBlcnBhZ2UuICBVc2UgdGhlIG9yZGVyIG9mIHRoZSBw
Mm0gZW50cnkgYmVpbmcgcmVhZCB0byBkZXRlcm1pbmUKPiAgICB0aGUgcHJvcGVyIHBsYWNlIHRv
IGxvb2sgaW4gdGhlIHJhZGl4IHRhYmxlLgo+IAo+IE1vZGlmeSBwMm1fdHlwZV90b19mbGFncygp
IHRvIGFjY2VwdCBhbmQgaW50ZXJwcmV0IGFuIGFjY2VzcyB2YWx1ZSwKPiBwYXJhbGxlbCB0byB0
aGUgZXB0IGNvZGUuCj4gCj4gQWRkIGEgc2V0X2RlZmF1bHRfYWNjZXNzKCkgbWV0aG9kIHRvIHRo
ZSBwMm0tcHQgYW5kIHAybS1lcHQgdmVyc2lvbnMKPiBvZiB0aGUgcDJtIHJhdGhlciB0aGFuIHNl
dHRpbmcgaXQgZGlyZWN0bHksIHRvIGRlYWwgd2l0aCBkaWZmZXJlbnQKPiBkZWZhdWx0IHBlcm1p
dHRlZCBhY2Nlc3MgdmFsdWVzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRydSBJc2FpbGEg
PGFpc2FpbGFAYml0ZGVmZW5kZXIuY29tPgo+IFNpZ25lZC1vZmYtYnk6IEdlb3JnZSBEdW5sYXAg
PGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT4KPiAtLS0KPiBOQiwgdGhpcyBpcyBjb21waWxlLXRl
c3RlZCBvbmx5LgoKSSd2ZSB0ZXN0ZWQgdGhpcyB3aXRoIHhlbi1hY2Nlc3MgYW5kIGl0IHdvcmtz
IGFzIGV4cGVjdGVkCj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9tb25pdG9yLmMgYi94
ZW4vYXJjaC94ODYvbW9uaXRvci5jCj4gaW5kZXggM2M0MmUyMTkwNi4uMmU2YjFlNzVlNCAxMDA2
NDQKPiAtLS0gYS94ZW4vYXJjaC94ODYvbW9uaXRvci5jCj4gKysrIGIveGVuL2FyY2gveDg2L21v
bml0b3IuYwo+IEBAIC0yMCw2ICsyMCw3IEBACj4gICAqLwo+ICAKPiAgI2luY2x1ZGUgPGFzbS9t
b25pdG9yLmg+Cj4gKyNpbmNsdWRlIDxhc20vcDJtLmg+CgpJcyB0aGlzIGludGVuZGVkPwoKUmVn
YXJkcywKQWxleAoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
