From: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH v2 4/4] x86/HVM: prefill cache with PDPTEs
 when possible
Date: Fri, 14 Sep 2018 02:18:02 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19130315F@SHSMSX101.ccr.corp.intel.com>
References: <5B97BEB202000078001E73FB@prv1-mh.provo.novell.com>
 <5B97C01202000078001E7413@prv1-mh.provo.novell.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D191301A70@SHSMSX101.ccr.corp.intel.com>
 <5B9A25EE02000078001E814E@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=gyat=l4=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1g0dgS-0001Uy-DY
 for xen-devel@lists.xenproject.org; Fri, 14 Sep 2018 02:18:12 +0000
In-Reply-To: <5B9A25EE02000078001E814E@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul.durrant@citrix.com>, "Nakajima,
 Jun" <jun.nakajima@intel.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

PiBGcm9tOiBKYW4gQmV1bGljaCBbbWFpbHRvOkpCZXVsaWNoQHN1c2UuY29tXQo+IFNlbnQ6IFRo
dXJzZGF5LCBTZXB0ZW1iZXIgMTMsIDIwMTggNDo1NSBQTQo+IAo+ID4+PiBPbiAxMy4wOS4xOCBh
dCAwODozMCwgPGtldmluLnRpYW5AaW50ZWwuY29tPiB3cm90ZToKPiA+PiAgRnJvbTogSmFuIEJl
dWxpY2ggW21haWx0bzpKQmV1bGljaEBzdXNlLmNvbV0KPiA+PiBTZW50OiBUdWVzZGF5LCBTZXB0
ZW1iZXIgMTEsIDIwMTggOToxNiBQTQo+ID4+Cj4gPj4gU2luY2Ugc3RyaWN0bHkgc3BlYWtpbmcg
aXQgaXMgaW5jb3JyZWN0IGZvciBndWVzdF93YWxrX3RhYmxlcygpIHRvIHJlYWQKPiA+PiBMMyBl
bnRyaWVzIGR1cmluZyBQQUUgcGFnZSB3YWxrcywgdHJ5IHRvIG92ZXJjb21lIHRoaXMgd2hlcmUg
cG9zc2libGUgYnkKPiA+Cj4gPiBjYW4geW91IGVsYWJvcmF0ZT8gd2h5IGl0J3MgaW5jb3JyZWN0
IHRvIHJlYWQgTDMgZW50cmllcz8KPiAKPiBBcmNoaXRlY3R1cmFsIGJlaGF2aW9yOiBJbiBQQUUg
bW9kZSB0aGV5IGdldCByZWFkIHVwb24gQ1IzIGxvYWRzLAo+IG5vdCBkdXJpbmcgcGFnZSB3YWxr
cy4KCmFoIHllcy4gY2FuIHlvdSBhZGQgIkNSMyBsb2FkIiBpbiBkZXNjcmlwdGlvbiB3aGljaCBy
ZW1pbmRzCnBlb3BsZSBlYXNpbHk/Cgo+IAo+ID4+IHByZS1sb2FkaW5nIHRoZSB2YWx1ZXMgZnJv
bSBoYXJkd2FyZSBpbnRvIHRoZSBjYWNoZS4gU2FkbHkgdGhlCj4gPj4gaW5mb3JtYXRpb24gaXMg
YXZhaWxhYmxlIGluIHRoZSBFUFQgY2FzZSBvbmx5LiBPbiB0aGUgcG9zaXRpdmUgc2lkZSBmb3IK
PiA+PiBOUFQgdGhlIHNwZWMgc3BlbGxzIG91dCB0aGF0IEwzIGVudHJpZXMgYXJlIGFjdHVhbGx5
IHJlYWQgb24gd2Fsa3MsIHNvCj4gPj4gdXMgcmVhZGluZyB0aGVtIGlzIGNvbnNpc3RlbnQgd2l0
aCBoYXJkd2FyZSBiZWhhdmlvciBpbiB0aGF0IGNhc2UuCj4gPgo+ID4gSSdtIGEgbGl0dGxlIGJp
dCBjb25mdXNlZCBhYm91dCB0aGUgZGVzY3JpcHRpb24gaGVyZS4geW91IGNoYW5nZQo+ID4gVk1Y
IGNvZGUgYnV0IHVzaW5nIE5QVCBzcGVjIGFzIHRoZSByZWZlcmVuY2U/Cj4gCj4gSSdtIHRyeWlu
ZyB0byBleHBsYWluIHdoeSB0aGVyZSBub3QgYmVpbmcgYSB3YXkgdG8gZG8gdGhlIHNhbWUgb24K
PiBOUFQgaXMgbm90IG9ubHkgbm90IGEgcHJvYmxlbSwgYnV0IGluIGxpbmUgd2l0aCBoYXJkd2Fy
ZSBiZWhhdmlvci4KPiAKClJldmlld2VkLWJ5OiBLZXZpbiBUaWFuIDxrZXZpbi50aWFuQGludGVs
LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
