From: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH v6 09/14] mm / iommu: include need_iommu()
 test in iommu_use_hap_pt()
Date: Thu, 13 Sep 2018 06:23:30 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D191301A51@SHSMSX101.ccr.corp.intel.com>
References: <20180823094711.21376-1-paul.durrant@citrix.com>
 <20180823094711.21376-10-paul.durrant@citrix.com>
 <5B925EF202000078001E655B@prv1-mh.provo.novell.com>
 <1ed1d6509b3043e89ccfe352a9b64ad4@AMSPEX02CL03.citrite.net>
 <5B978F3202000078001E722A@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=0io5=l3=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1g0L2R-0002up-N3
 for xen-devel@lists.xenproject.org; Thu, 13 Sep 2018 06:23:39 +0000
In-Reply-To: <5B978F3202000078001E722A@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Paul Durrant <paul.durrant@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "george.dunlap@citrix.com" <george.dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>, "Nakajima, Jun" <jun.nakajima@intel.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

PiBGcm9tOiBKYW4gQmV1bGljaCBbbWFpbHRvOkpCZXVsaWNoQHN1c2UuY29tXQo+IFNlbnQ6IFR1
ZXNkYXksIFNlcHRlbWJlciAxMSwgMjAxOCA1OjQ4IFBNCj4gCj4gPj4+IE9uIDExLjA5LjE4IGF0
IDExOjM5LCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+IHdyb3RlOgo+ID4+ICAtLS0tLU9yaWdp
bmFsIE1lc3NhZ2UtLS0tLQo+ID4+IEZyb206IEphbiBCZXVsaWNoIFttYWlsdG86SkJldWxpY2hA
c3VzZS5jb21dCj4gPj4gU2VudDogMDcgU2VwdGVtYmVyIDIwMTggMTI6MjAKPiA+PiBUbzogUGF1
bCBEdXJyYW50IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT4KPiA+PiBDYzogSnVsaWVuIEdyYWxs
IDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT47IEFuZHJldyBDb29wZXIKPiA+PiA8QW5kcmV3LkNvb3Bl
cjNAY2l0cml4LmNvbT47IEdlb3JnZSBEdW5sYXAKPiA+PiA8R2VvcmdlLkR1bmxhcEBjaXRyaXgu
Y29tPjsgSnVuIE5ha2FqaW1hIDxqdW4ubmFrYWppbWFAaW50ZWwuY29tPjsKPiA+PiBTdGVmYW5v
IFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyB4ZW4tZGV2ZWwgPHhlbi0KPiA+
PiBkZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZz4KPiA+PiBTdWJqZWN0OiBSZTogW1BBVENIIHY2
IDA5LzE0XSBtbSAvIGlvbW11OiBpbmNsdWRlIG5lZWRfaW9tbXUoKSB0ZXN0Cj4gaW4KPiA+PiBp
b21tdV91c2VfaGFwX3B0KCkKPiA+Pgo+ID4+ID4+PiBPbiAyMy4wOC4xOCBhdCAxMTo0NywgPHBh
dWwuZHVycmFudEBjaXRyaXguY29tPiB3cm90ZToKPiA+PiA+IFRoZSBuYW1lICdpb21tdV91c2Vf
aGFwX3B0JyBzdWdnZXN0cyB0aGF0IHRoYXQgUDJNIHRhYmxlIGlzIGluIHVzZQo+IGFzCj4gPj4g
dGhlCj4gPj4gPiBkb21haW4ncyBJT01NVSBwYWdldGFibGUgd2hpY2gsIHByaW9yIHRvIHRoaXMg
cGF0Y2gsIGlzIG5vdCBzdHJpY3RseQo+IHRydWUKPiA+PiA+IHNpbmNlIHRoZSBtYWNybyBkaWQg
bm90IHRlc3Qgd2hldGhlciB0aGUgZG9tYWluIGFjdHVhbGx5IGhhcyBJT01NVQo+ID4+ID4gbWFw
cGluZ3MuCj4gPj4KPiA+PiBIbW0sIEkgd291bGQgbmV2ZXIgaGF2ZSBpbXBsaWVkICJoYXMgSU9N
TVUgbWFwcGluZ3MiIGZyb20gdGhpcwo+ID4+IHZhcmlhYmxlIG5hbWUuIFRvIG1lIGl0IGhhcyBh
bHdheXMgYmVlbiAidXNlIEhBUCBwYWdlIHRhYmxlcyBmb3IKPiA+PiBJT01NVSBpZiBhbiBJT01N
VSBpcyBpbiB1c2UiLiBUaGUgY29kZSBjaGFuZ2UgbG9va3Mgc2FuZSwgYnV0Cj4gPj4gSSdtIG5v
dCBzdXJlIGl0IGlzIGEgY2xlYXIgaW1wcm92ZW1lbnQuIEhlbmNlIEkgd29uZGVyIHdoZXRoZXIg
eW91Cj4gPj4gaGF2ZSBhIG5lZWQgZm9yIHRoaXMgY2hhbmdlIGluIHN1YnNlcXVlbnQgcGF0Y2hl
cyB3aGljaCBnb2VzCj4gPj4gYmV5b25kIHdoYXQgeW91IHNheSBhYm92ZS4KPiA+Pgo+ID4KPiA+
IEkgY291bGQgdGFrZSBpdCBvdXQgYnV0IGl0IHdvdWxkIG1lYW4gYSBub24tdHJpdmlhbCByZWJh
c2UsIGFuZCB0byBtZSAtIGlmCj4gPiB0cnVlIC0gdGhlIG5hbWUgc2lsbCBpbXBsaWVzIHRoZSBJ
T01NVSBpcyBpbiB1c2UgZm9yIHRoZSBkb21haW4gc28gSSdkIGxpa2UKPiB0bwo+ID4ga2VlcCB0
aGUgY2hhbmdlLgo+IAo+IExldCdzIGJyb2FkZW4gdGhlIENjIGxpc3QgYSBsaXR0bGUgLSBwZXJo
YXBzIHdlIGNhbiBnZXQgZnVydGhlciBvcGluaW9ucyB0aGlzCj4gd2F5Lgo+IAoKdGhlIHByZXZp
b3VzIGRlZmluaXRpb24gY2hlY2tzIGhhcF9lbmFibGVkOgoKLSNkZWZpbmUgaW9tbXVfdXNlX2hh
cF9wdChkKSAoaGFwX2VuYWJsZWQoZCkgJiYgaW9tbXVfaGFwX3B0X3NoYXJlKQoKaWYgZm9sbG93
aW5nIEphbidzIHdheSBpdCBzaG91bGQgYmUgInVzZSBIQVAgcGFnZSB0YWJsZXMgZm9yIElPTU1V
IGlmIGFuIApJT01NVSBpcyBpbiB1c2UgYW5kIEhBUCBpcyBlbmFibGVkIiwgdGhlbiBoYXBfZW5h
YmxlZCBzaG91bGQgYmUgbW92ZWQKb3V0IHRvby4KCmluY2x1ZGluZyBpb21tdSBjaGVjayBpbiB0
aGUgbWFjcm8gbG9va3MgbW9yZSBjb25zaXN0ZW50LgoKVGhhbmtzCktldmluCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
