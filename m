From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v6 08/14] vtd: add lookup_page method to
 iommu_ops
Date: Fri, 07 Sep 2018 08:56:20 -0600
Message-ID: <5B92919402000078001E66D9@prv1-mh.provo.novell.com>
References: <20180823094711.21376-1-paul.durrant@citrix.com>
 <20180823094711.21376-9-paul.durrant@citrix.com>
 <5B925CC402000078001E6538@prv1-mh.provo.novell.com>
 <d40d38f534974523b694e3fcda29cbed@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=p3pn=lv=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fyIBL-0001kr-KT
 for xen-devel@lists.xenproject.org; Fri, 07 Sep 2018 14:56:23 +0000
In-Reply-To: <d40d38f534974523b694e3fcda29cbed@AMSPEX02CL03.citrite.net>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Kevin Tian <kevin.tian@intel.com>, george.dunlap@citrix.com
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA3LjA5LjE4IGF0IDE0OjM2LCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+PiAgLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPj4gRnJvbTogSmFuIEJldWxpY2ggW21h
aWx0bzpKQmV1bGljaEBzdXNlLmNvbV0KPj4gU2VudDogMDcgU2VwdGVtYmVyIDIwMTggMTI6MTEK
Pj4gVG86IFBhdWwgRHVycmFudCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+Cj4+IENjOiBHZW9y
Z2UgRHVubGFwIDxHZW9yZ2UuRHVubGFwQGNpdHJpeC5jb20+OyBLZXZpbiBUaWFuCj4+IDxrZXZp
bi50aWFuQGludGVsLmNvbT47IHhlbi1kZXZlbCA8eGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnPgo+PiBTdWJqZWN0OiBSZTogW1BBVENIIHY2IDA4LzE0XSB2dGQ6IGFkZCBsb29rdXBfcGFn
ZSBtZXRob2QgdG8gaW9tbXVfb3BzCj4+IAo+PiA+Pj4gT24gMjMuMDguMTggYXQgMTE6NDcsIDxw
YXVsLmR1cnJhbnRAY2l0cml4LmNvbT4gd3JvdGU6Cj4+ID4gVGhpcyBwYXRjaCBhZGRzIGEgbmV3
IG1ldGhvZCB0byB0aGUgVlQtZCBJT01NVSBpbXBsZW1lbnRhdGlvbiB0byBmaW5kCj4+IHRoZQo+
PiA+IE1GTiBjdXJyZW50bHkgbWFwcGVkIGJ5IHRoZSBzcGVjaWZpZWQgQkZOIGFsb25nIHdpdGgg
YSB3cmFwcGVyIGZ1bmN0aW9uCj4+IGluCj4+ID4gZ2VuZXJpYyBJT01NVSBjb2RlIHRvIGNhbGwg
dGhlIGltcGxlbWVudGF0aW9uIGlmIGl0IGV4aXN0cy4KPj4gCj4+IEZvciB0aGlzIHRvIGdvIGlu
LCBJIHRoaW5rIHRoZSBBTUQgc2lkZSBvZiBpdCB3YW50cyB0byBhbHNvIGJlIGltcGxlbWVudGVk
Lgo+IAo+IFdoeT8gSXQgY2FuIGJlIGRvbmUgbGF0ZXIuIE5vdGhpbmcgZXhpc3RpbmcgaXMgZ29p
bmcgdG8gYnJlYWsgaWYgaXQgaXMgbm90IAo+IGltcGxlbWVudGVkLgoKSWYgaXQgd2FzIHNvbWV0
aGluZyB0aGF0J3MgdGVycmlibHkgZGlmZmljdWx0IHRvIGltcGxlbWVudCwgSSdkCnByb2JhYmx5
IGFncmVlLiBCdXQgaW50cm9kdWNpbmcgUFYgSU9NTVUgZm9yIEludGVsIG9ubHkgKGFuZApoZW5j
ZSBvbmNlIGFnYWluIG1ha2luZyBBTUQgYSBzZWNvbmQgY2xhc3MgY2l0aXplbikgSSBkb24ndApy
ZWFsbHkgbGlrZS4gQW5vdGhlciB0aGluZyB3b3VsZCBiZSBpZiB5b3UgaGFkIHRoZSBpbXBsZW1l
bnRhdGlvbgpyZWFkeSwgYnV0IHRoZSBtYWludGFpbmVyKHMpIGRvbid0IHJlc3BvbmQuLi4KCkph
bgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
