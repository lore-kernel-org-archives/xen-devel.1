From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v6 12/14] memory: add get_paged_gfn() as a
 wrapper...
Date: Wed, 12 Sep 2018 04:10:12 -0600
Message-ID: <5B98E60402000078001E7BDC@prv1-mh.provo.novell.com>
References: <20180823094711.21376-1-paul.durrant@citrix.com>
 <20180823094711.21376-13-paul.durrant@citrix.com>
 <5B97D78602000078001E7620@prv1-mh.provo.novell.com>
 <3cae8215da44446487479f24527a5387@AMSPEX02CL03.citrite.net>
 <5B98D92B02000078001E7B17@prv1-mh.provo.novell.com>
 <66659ea9-6b54-f27c-0aac-cd33b3bf44dc@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=mhj0=l2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1g026D-0007IK-Un
 for xen-devel@lists.xenproject.org; Wed, 12 Sep 2018 10:10:17 +0000
In-Reply-To: <66659ea9-6b54-f27c-0aac-cd33b3bf44dc@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: george.dunlap@citrix.com
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson <Ian.Jackson@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEyLjA5LjE4IGF0IDEyOjAxLCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPiB3cm90
ZToKPiBPbiAwOS8xMi8yMDE4IDEwOjE1IEFNLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4gT24g
MTIuMDkuMTggYXQgMTE6MTAsIDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT4gd3JvdGU6Cj4+Pj4g
RnJvbTogWGVuLWRldmVsIFttYWlsdG86eGVuLWRldmVsLWJvdW5jZXNAbGlzdHMueGVucHJvamVj
dC5vcmddIE9uIEJlaGFsZgo+Pj4+IE9mIEphbiBCZXVsaWNoCj4+Pj4gU2VudDogMTEgU2VwdGVt
YmVyIDIwMTggMTU6NTYKPj4+Pgo+Pj4+Pj4+IE9uIDIzLjA4LjE4IGF0IDExOjQ3LCA8cGF1bC5k
dXJyYW50QGNpdHJpeC5jb20+IHdyb3RlOgo+Pj4+PiAuLi5mb3Igc29tZSB1c2VzIG9mIGdldF9w
YWdlX2Zyb21fZ2ZuKCkuCj4+Pj4+Cj4+Pj4+IFRoZXJlIGFyZSBtYW55IG9jY3VyZW5jZXMgb2Yg
dGhlIGZvbGxvd2luZyBwYXR0ZXJuIGluIHRoZSBjb2RlOgo+Pj4+Pgo+Pj4+PiAgICAgcSA9IDxy
ZWFkb25seSBsb29rLXVwPiA/IFAyTV9BTExPQyA6IFAyTV9VTlNIQVJFOwo+Pj4+Cj4+Pj4gRXNw
ZWNpYWxseSB3aXRoIHRoaXMgVU5TSEFSRSBpbiBtaW5kIC0gaXMgInBhZ2VkIiBpbiB0aGUgaGVs
cGVyCj4+Pj4gZnVuY3Rpb24ncyBuYW1lIHJlYWxseSBzdWl0YWJsZT8gU2luY2Ugd2UgKEkgdGhp
bmspIGFscmVhZHkgaGF2ZQo+Pj4+IGdldF9nZm4oKSwgaG93IGFib3V0IHRyeV9nZXRfZ2ZuKCk/
Cj4+Pgo+Pj4gVGhhdCBuYW1lIG1heSBiZSBhIGxpdHRsZSBtaXNsZWFkaW5nIHNpbmNlIGl0IHN1
Z2dlc3RzIGEgY2xvc2UgZnVuY3Rpb25hbCAKPj4+IHJlbGF0aW9uc2hpcCB3aXRoIGdldF9nZm4o
KSB3aGVyZWFzIGl0IGRvZXMgbW9yZSB0aGFuIHRoYXQuIEhvdyBhYm91dCAKPj4+IHRyeV9nZXRf
cGFnZV9mcm9tX2dmbigpPwo+PiAKPj4gRmluZSB3aXRoIG1lOyBHZW9yZ2U/Cj4gCj4gQXQgdGhl
IHJpc2sgb2YgYmlrZSBzaGVkZGluZy4uICJ0cnkiIHRvIG1lIG1lYW5zIG9ubHkgcGFzcy9mYWls
LCB3aXRoIG5vCj4gc2lkZSBlZmZlY3RzLCBhbmQgd2l0aCBubyBwZXJtaXNzaW9ucyBjaGVja3Mu
ICBXaGF0IGFib3V0Cj4gImNoZWNrX2FuZF9nZXRfcGFnZV9mcm9tX2dmbigpIj8KPiAKPiBJJ2Qg
cHJlZmVyICdjaGVjaycgYnV0IGlmIGFueW9uZSBvYmplY3RzIEknZCByYXRoZXIganVzdCBnbyB3
aXRoICd0cnknCj4gYW5kIGdldCB0aGluZ3MgaW4gLS0gdGhlIGNvZGUgaXMgYSBkZWZpbml0ZSBp
bXByb3ZlbWVudC4KCkknbSBmaW5lIHdpdGggImNoZWNrIiwgYW5kIGluZGVlZCBJIHdhc24ndCBy
ZWFsbHkgaGFwcHkgYWJvdXQgdGhlCmVhcmxpZXIgcHJvcG9zZWQgInRyeSIuCgpKYW4KCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
