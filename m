From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH v6 12/14] memory: add get_paged_gfn() as a
 wrapper...
Date: Wed, 12 Sep 2018 11:01:53 +0100
Message-ID: <66659ea9-6b54-f27c-0aac-cd33b3bf44dc@citrix.com>
References: <20180823094711.21376-1-paul.durrant@citrix.com>
 <20180823094711.21376-13-paul.durrant@citrix.com>
 <5B97D78602000078001E7620@prv1-mh.provo.novell.com>
 <3cae8215da44446487479f24527a5387@AMSPEX02CL03.citrite.net>
 <5B98D92B02000078001E7B17@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=k4dt=l2=citrix.com=prvs=786dc2bea=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1g01yJ-000631-2H
 for xen-devel@lists.xenproject.org; Wed, 12 Sep 2018 10:02:07 +0000
In-Reply-To: <5B98D92B02000078001E7B17@prv1-mh.provo.novell.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Ian Jackson <Ian.Jackson@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDkvMTIvMjAxOCAxMDoxNSBBTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMTIuMDku
MTggYXQgMTE6MTAsIDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT4gd3JvdGU6Cj4+PiBGcm9tOiBY
ZW4tZGV2ZWwgW21haWx0bzp4ZW4tZGV2ZWwtYm91bmNlc0BsaXN0cy54ZW5wcm9qZWN0Lm9yZ10g
T24gQmVoYWxmCj4+PiBPZiBKYW4gQmV1bGljaAo+Pj4gU2VudDogMTEgU2VwdGVtYmVyIDIwMTgg
MTU6NTYKPj4+Cj4+Pj4+PiBPbiAyMy4wOC4xOCBhdCAxMTo0NywgPHBhdWwuZHVycmFudEBjaXRy
aXguY29tPiB3cm90ZToKPj4+PiAuLi5mb3Igc29tZSB1c2VzIG9mIGdldF9wYWdlX2Zyb21fZ2Zu
KCkuCj4+Pj4KPj4+PiBUaGVyZSBhcmUgbWFueSBvY2N1cmVuY2VzIG9mIHRoZSBmb2xsb3dpbmcg
cGF0dGVybiBpbiB0aGUgY29kZToKPj4+Pgo+Pj4+ICAgICBxID0gPHJlYWRvbmx5IGxvb2stdXA+
ID8gUDJNX0FMTE9DIDogUDJNX1VOU0hBUkU7Cj4+Pgo+Pj4gRXNwZWNpYWxseSB3aXRoIHRoaXMg
VU5TSEFSRSBpbiBtaW5kIC0gaXMgInBhZ2VkIiBpbiB0aGUgaGVscGVyCj4+PiBmdW5jdGlvbidz
IG5hbWUgcmVhbGx5IHN1aXRhYmxlPyBTaW5jZSB3ZSAoSSB0aGluaykgYWxyZWFkeSBoYXZlCj4+
PiBnZXRfZ2ZuKCksIGhvdyBhYm91dCB0cnlfZ2V0X2dmbigpPwo+Pgo+PiBUaGF0IG5hbWUgbWF5
IGJlIGEgbGl0dGxlIG1pc2xlYWRpbmcgc2luY2UgaXQgc3VnZ2VzdHMgYSBjbG9zZSBmdW5jdGlv
bmFsIAo+PiByZWxhdGlvbnNoaXAgd2l0aCBnZXRfZ2ZuKCkgd2hlcmVhcyBpdCBkb2VzIG1vcmUg
dGhhbiB0aGF0LiBIb3cgYWJvdXQgCj4+IHRyeV9nZXRfcGFnZV9mcm9tX2dmbigpPwo+IAo+IEZp
bmUgd2l0aCBtZTsgR2VvcmdlPwoKQXQgdGhlIHJpc2sgb2YgYmlrZSBzaGVkZGluZy4uICJ0cnki
IHRvIG1lIG1lYW5zIG9ubHkgcGFzcy9mYWlsLCB3aXRoIG5vCnNpZGUgZWZmZWN0cywgYW5kIHdp
dGggbm8gcGVybWlzc2lvbnMgY2hlY2tzLiAgV2hhdCBhYm91dAoiY2hlY2tfYW5kX2dldF9wYWdl
X2Zyb21fZ2ZuKCkiPwoKSSdkIHByZWZlciAnY2hlY2snIGJ1dCBpZiBhbnlvbmUgb2JqZWN0cyBJ
J2QgcmF0aGVyIGp1c3QgZ28gd2l0aCAndHJ5JwphbmQgZ2V0IHRoaW5ncyBpbiAtLSB0aGUgY29k
ZSBpcyBhIGRlZmluaXRlIGltcHJvdmVtZW50LgoKIC1HZW9yZ2UKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
