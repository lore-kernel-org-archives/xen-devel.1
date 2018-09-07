From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v6 01/14] iommu: introduce the concept of
 BFN...
Date: Fri, 07 Sep 2018 00:24:28 -0600
Message-ID: <5B92199C02000078001E6227@prv1-mh.provo.novell.com>
References: <20180823094711.21376-1-paul.durrant@citrix.com>
 <20180823094711.21376-2-paul.durrant@citrix.com>
 <5B88147F02000078001E39FB@prv1-mh.provo.novell.com>
 <eb9e4dcaf17544338b3b3fb5d40d43d0@AMSPEX02CL03.citrite.net>
 <5B8D1F2602000078001E48B5@prv1-mh.provo.novell.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D1912EFA15@SHSMSX101.ccr.corp.intel.com>
 <5B8E432E02000078001E4FB5@prv1-mh.provo.novell.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D1912EFD02@SHSMSX101.ccr.corp.intel.com>
 <5B8E469802000078001E4FE5@prv1-mh.provo.novell.com>
 <777ac29dd97a46938eec6c00ecf51e32@AMSPEX02CL03.citrite.net>
 <5B8E4B8A02000078001E505A@prv1-mh.provo.novell.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D1912F0BFB@SHSMSX101.ccr.corp.intel.com>
 <5B8F7C5202000078001E559F@prv1-mh.provo.novell.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D1912F14C8@SHSMSX101.ccr.corp.intel.com>
 <5B8F81B302000078001E55C9@prv1-mh.provo.novell.com>
 <a3315f3d139b4484a71c9669bd312fe1@AMSPEX02CL03.citrite.net>
 <5B8FA41B02000078001E56E4@prv1-mh.provo.novell.com>
 <707e1cd819cf4dbc996c80c936d25606@AMSPEX02CL03.citrite.net>
 <5B9127ED02000078001E5F41@prv1-mh.provo.novell.com>
 <afd5e179b3034dc099db256cdeffd062@AMSPEX02CL03.citrite.net>
 <AADFC41AFE54684AB9EE6CBC0274A5D1912F4592@SHSMSX101.ccr.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=p3pn=lv=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fyAC1-00087c-6j
 for xen-devel@lists.xenproject.org; Fri, 07 Sep 2018 06:24:33 +0000
In-Reply-To: <AADFC41AFE54684AB9EE6CBC0274A5D1912F4592@SHSMSX101.ccr.corp.intel.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>, Kevin Tian <kevin.tian@intel.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA3LjA5LjE4IGF0IDAzOjQ3LCA8a2V2aW4udGlhbkBpbnRlbC5jb20+IHdyb3RlOgo+
PiAgRnJvbTogUGF1bCBEdXJyYW50IFttYWlsdG86UGF1bC5EdXJyYW50QGNpdHJpeC5jb21dCj4+
IFNlbnQ6IFRodXJzZGF5LCBTZXB0ZW1iZXIgNiwgMjAxOCAxMDo1NCBQTQo+PiAKPj4gPiAtLS0t
LU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+PiA+IEZyb206IEphbiBCZXVsaWNoIFttYWlsdG86SkJl
dWxpY2hAc3VzZS5jb21dCj4+ID4gU2VudDogMDYgU2VwdGVtYmVyIDIwMTggMTQ6MTMKPj4gPiBU
bzogUGF1bCBEdXJyYW50IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT4KPj4gPiBDYzogU3VyYXZl
ZSBTdXRoaWt1bHBhbml0IDxzdXJhdmVlLnN1dGhpa3VscGFuaXRAYW1kLmNvbT47IEp1bGllbiBH
cmFsbAo+PiA+IDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT47IEtldmluIFRpYW4gPGtldmluLnRpYW5A
aW50ZWwuY29tPjsgU3RlZmFubwo+PiA+IFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5v
cmc+OyB4ZW4tZGV2ZWwgPHhlbi0KPj4gPiBkZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZz4KPj4g
PiBTdWJqZWN0OiBSRTogW1hlbi1kZXZlbF0gW1BBVENIIHY2IDAxLzE0XSBpb21tdTogaW50cm9k
dWNlIHRoZSBjb25jZXB0Cj4+IG9mCj4+ID4gQkZOLi4uCj4+ID4KPj4gPiA+Pj4gT24gMDYuMDku
MTggYXQgMTI6MzYsIDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT4gd3JvdGU6Cj4+ID4gPj4gRnJv
bTogSmFuIEJldWxpY2ggW21haWx0bzpKQmV1bGljaEBzdXNlLmNvbV0KPj4gPiA+PiBTZW50OiAw
NSBTZXB0ZW1iZXIgMjAxOCAxMDozOQo+PiA+ID4+Cj4+ID4gPj4gPj4+IE9uIDA1LjA5LjE4IGF0
IDExOjEzLCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+IHdyb3RlOgo+PiA+ID4+ID4gUGVyc29u
YWxseSBJIHRoaW5rICdidXMgYWRkcmVzcycgaXMgY29tbW9ubHkgZW5vdWdoIHVzZWQgdGVybSBm
b3IKPj4gPiA+PiBhZGRyZXNzZXMKPj4gPiA+PiA+IHVzZWQgYnkgZGV2aWNlcyBmb3IgRE1BLiBJ
bmRlZWQgd2UgaGF2ZSBhbHJlYWR5ICdkZXZfYnVzX2FkZHInIGluCj4+ID4gdGhlCj4+ID4gPj4g
Z3JhbnQKPj4gPiA+PiA+IG1hcCBhbmQgdW5tYXAgaHlwZXJjYWxscy4gU28gYmFkZHIgYW5kIGJm
biBzZWVtIGxpa2Ugb2sgdGVybXMgdG8KPj4gbWUuCj4+ID4gSXQncwo+PiA+ID4+ID4gYWxzbyBu
b3QgaW1wb3NzaWJsZSB0byByZW5hbWUgdGhlc2UgbGF0ZXIgaWYgdGhleSBwcm92ZSBwcm9ibGVt
YXRpYy4KPj4gPiA+Pgo+PiA+ID4+IEJ1dCB0aGF0J3MgdGhlIHBvaW50IC0gdGhlIG5hbWVzIGFy
ZSBwcm9ibGVtYXRpYyAodG8gbWUpOiBJCj4+IHBlcm1hbmVudGx5Cj4+ID4gPj4gaGF2ZSB0byBy
ZW1pbmQgbXlzZWxmIHRoYXQgdGhleSBkbyBfbm90XyByZWZlciB0byB0aGUgYWRkcmVzc2VzIGFz
Cj4+ID4gPj4gc2VlbiB3aGVuIGFjY2Vzc2luZyBtZW1vcnksIGJ1dCB0aGUgb25lcyBnb2luZyBf
aW50b18gdGhlIElPTU1VLgo+PiA+ID4KPj4gPiA+IE9rLiBDb3VsZCB3ZSBhZ3JlZSBvbiAnSU9G
TicgdGhlbj8gSSB0aGluayAnaW92YScgYW5kICdpbyBhZGRyZXNzJyBhcmUKPj4gYWxzbwo+PiA+
ID4gcmVhc29uYWJseSB3aWRlbHkgdXNlZCB0ZXJtcyB0byByZWZlciB0byBhZGRyZXNzIGZyb20g
YSBkZXZpY2UncyBQb1YuCj4+IEknZAo+PiA+ID4gcmVhbGx5IGxpa2UgdG8gdW5ibG9jayB0aGVz
ZSBlYXJseSBwYXRjaGVzLgo+PiA+Cj4+ID4gSG1tLCBlYXJsaWVyIEkgaGFkIGluZGljYXRlZCBJ
J2QgcHJlZmVyIERGTiAoYXMgdGhpcyBtYWtlIGNsZWFyIHdob3NlCj4+ID4gdmlldyB3ZSBhcmUg
dGFsa2luZyBhYm91dCkuIEtldmluIHNlZW1lZCB0byBwcmVmZXIgREZOIHRvbywganVzdCB3aXRo
Cj4+ID4gYSBkaWZmZXJlbnQgYXNzb2NpYXRpb24gZm9yIEQgKHdoaWNoLCBhcyBzYWlkLCBJIGNv
bnNpZGVyIHVuaGVscGZ1bCkuIFNvCj4+ID4gaXMgdGhlcmUgYSBwYXJ0aWN1bGFyIHJlYXNvbiB5
b3UncmUgbm93IHN1Z2dlc3RpbmcgSU9GTiBuZXZlcnRoZWxlc3M/Cj4+IAo+PiBJdCB3YXMgdGhl
IGFtYmlndWl0eSBhbmQgbGFjayBvZiBhZ3JlZW1lbnQgb3ZlciB0aGUgJ0QnIHRoYXQgbWFkZSBt
ZSB0aGluawo+PiB0aGF0IHRoZSBvdGhlciBhbHRlcm5hdGl2ZSB3b3VsZCBiZSBiZXR0ZXIuCj4+
IEtldmluLCB3b3VsZCB5b3UgYmUgb2sgd2l0aCAnSU9GTic/Cj4+IAo+IAo+IE15IHByb2JsZW0g
d2l0aCBERk4gaXMgd2hlbiBjb21iaW5pbmcgRCB3aXRoIGFkZHJlc3MgdGhlbiAiZGV2aWNlIAo+
IGFkZHJlc3MiIGlzIG5vdCB2ZXJ5IGNsZWFyIHRvIG1lIHdoaWxlIGludGVycHJldGluZyBEIGFz
IERNQSBpcyBhbHNvCj4gbm90IHRoYXQgY2xlYXIgZnJvbSBKYW4ncyBwb2ludC4KCldoYXQgYWJv
dXQgbWFraW5nIGl0cyBkZXNjcmlwdGlvbiBtZW50aW9uIGJvdGggcG9zc2libGUgaW50ZXJwcmV0
YXRpb25zPwoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
