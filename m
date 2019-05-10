From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH 11/14] xen/x86: mm: Re-implement
 set_gpfn_from_mfn() as a static inline function
Date: Fri, 10 May 2019 15:05:55 +0100
Message-ID: <210fee0a-bbd0-ccef-82d5-d81ed55ef587@arm.com>
References: <20190507151458.29350-1-julien.grall@arm.com>
 <20190507151458.29350-12-julien.grall@arm.com>
 <5CD571FE020000780022D826@prv1-mh.provo.novell.com>
 <22eaed55-f714-0c97-385d-72cf796f5936@arm.com>
 <5CD57E04020000780022D8F0@prv1-mh.provo.novell.com>
 <fac9e2db-c746-5f53-bebc-0615fe60e8a4@arm.com>
 <5CD58127020000780022D963@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=thpN=TK=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hP69w-0008NO-6n
 for xen-devel@lists.xenproject.org; Fri, 10 May 2019 14:06:00 +0000
In-Reply-To: <5CD58127020000780022D963@prv1-mh.provo.novell.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiAxMC8wNS8yMDE5IDE0OjQ4LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBPbiAxMC4w
NS4xOSBhdCAxNTo0MSwgPGp1bGllbi5ncmFsbEBhcm0uY29tPiB3cm90ZToKPj4gT24gMTAvMDUv
MjAxOSAxNDozNSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+PiBPbiAxMC4wNS4xOSBhdCAxNToy
NywgPGp1bGllbi5ncmFsbEBhcm0uY29tPiB3cm90ZToKPj4+PiBPbiAxMC8wNS8yMDE5IDEzOjQz
LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4+Pj4gT24gMDcuMDUuMTkgYXQgMTc6MTQsIDxqdWxp
ZW4uZ3JhbGxAYXJtLmNvbT4gd3JvdGU6Cj4+Pj4+PiArc3RhdGljIGlubGluZSB2b2lkIHNldF9n
cGZuX2Zyb21fbWZuKHVuc2lnbmVkIGxvbmcgbWZuLCB1bnNpZ25lZCBsb25nIHBmbikKPj4+Pj4+
ICt7Cj4+Pj4+PiArICAgIHN0cnVjdCBkb21haW4gKmQgPSBwYWdlX2dldF9vd25lcihtZm5fdG9f
cGFnZShfbWZuKG1mbikpKTsKPj4+Pj4+ICsgICAgdW5zaWduZWQgbG9uZyBlbnRyeSA9IChkICYm
IChkID09IGRvbV9jb3cpKSA/IFNIQVJFRF9NMlBfRU5UUlkgOiBwZm47Cj4+Pj4+Cj4+Pj4+IFRo
ZSAmJiBoZXJlIGxvb2tzLCBlaG0sIGZ1bm55LCBidXQgSSBndWVzcyBpdCdzIG5lZWRlZCBmb3Ig
ZWFybHkgYm9vdD8KPj4+Pgo+Pj4+IEkgaGF2ZSBubyBpZGVhLCB0aGlzIGlzIHg4NiBub3QgQXJt
Li4uCj4+Pj4KPj4+Pj4gQnV0IHRoYXQncyBwZXJoYXBzIGEgc2VwYXJhdGUgdGhpbmcgdG8gY2xl
YW4gdXAuIEhvd2V2ZXIsIGxvb2tpbmcgYXQKPj4+Pj4gdGhpcyAtIHdoeSBpcyBBcm0gc2V0dGlu
ZyB1cCBkb21fY293IGluIHRoZSBmaXJzdCBwbGFjZT8KPj4+Pgo+Pj4+IENvbW1vbiBjb2RlIGlz
IHVzaW5nIGRvbV9jb3csIHNvIEkgZG9uJ3QgdGhpbmsgd2Ugd2FudCBpdCB0byBiZSBOVUxMIG9u
IEFybSB0bwo+Pj4+IGF2b2lkIHdlaXJkIGlzc3Vlcy4KPj4+Cj4+PiBJIGRpZG4ndCBtZWFuIGl0
IHRvIHJlbWFpbiBOVUxMLiBDb21tb24gY29kZSBkb2Vzbid0IGRlcmVmZXJlbmNlIGl0Cj4+PiAo
YW5kIGlzbid0IHN1cHBvc2VkIHRvKSwgc28gSSdkIGNvbnNpZGVyIGluaXRpYWxpemluZyBpdCB0
byBzb21lIGtub3duCj4+PiBmYXVsdGluZyBub24tTlVMTCBhZGRyZXNzLCBpZiB0aGVyZSBpcyBz
dWNoIG9uIEFybS4KPj4KPj4gUGF0Y2hlcyBhcmUgd2VsY29tZWQgOykuCj4gCj4gU28gaXMgdGhl
cmUgc3VjaCBhbiBhZGRyZXNzIG9uIEFybT8KCjAgLSAyTUIgaXMgdW5tYXBwZWQgc28gZmFyLiBJ
IGRvbid0IGtub3cgd2hldGhlciB0aGlzIHdpbGwgc3RpbGwgYmUgdGhlIGNhc2UgKGF0IApsZWFz
dCBmb3IgdGhlIHJhbmdlIDRLQiAtIDJNQikgd2l0aCB0aGUgcmV3b3JrIEkgYW0gYXR0ZW1wdGlu
Zy4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
