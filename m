From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 05/34] xen: is_hvm_domain should evaluate to
 0 when !CONFIG_HVM
Date: Mon, 20 Aug 2018 10:45:56 +0100
Message-ID: <20180820094556.bqj7mqr45f2gasgh@citrix.com>
References: <cover.f5351150954129956fcf53a7781206b6295df78d.1534518694.git-series.wei.liu2@citrix.com>
 <32dc160e20e574c7ec736fad43157928de86962e.1534518694.git-series.wei.liu2@citrix.com>
 <5a1733d0-6b5a-8638-86a8-b4bb053a6848@citrix.com>
 <20180820090650.zwfoamxtw6uq43rr@citrix.com>
 <4f38f9e2-edd8-df76-3932-c9abf426a8ab@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=qa+b=ld=citrix.com=prvs=763aa43e8=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1frgl6-0002c4-Df
 for xen-devel@lists.xenproject.org; Mon, 20 Aug 2018 09:46:00 +0000
Content-Disposition: inline
In-Reply-To: <4f38f9e2-edd8-df76-3932-c9abf426a8ab@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBBdWcgMjAsIDIwMTggYXQgMTA6MjM6NDdBTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiA+Cj4gPj4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC5oIGIveGVu
L2luY2x1ZGUveGVuL3NjaGVkLmgKPiA+PiBpbmRleCA1MWNlZWJlLi5mZGQxOGE3IDEwMDY0NAo+
ID4+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC5oCj4gPj4gKysrIGIveGVuL2luY2x1ZGUv
eGVuL3NjaGVkLmgKPiA+PiBAQCAtODc5LDggKzg3OSwxNyBAQCB2b2lkIHdhdGNoZG9nX2RvbWFp
bl9kZXN0cm95KHN0cnVjdCBkb21haW4gKmQpOwo+ID4+Cj4gPj4gICNkZWZpbmUgaXNfcHZfZG9t
YWluKGQpICgoZCktPmd1ZXN0X3R5cGUgPT0gZ3Vlc3RfdHlwZV9wdikKPiA+PiAgI2RlZmluZSBp
c19wdl92Y3B1KHYpICAgKGlzX3B2X2RvbWFpbigodiktPmRvbWFpbikpCj4gPj4gLSNkZWZpbmUg
aXNfaHZtX2RvbWFpbihkKSAoKGQpLT5ndWVzdF90eXBlID09IGd1ZXN0X3R5cGVfaHZtKQo+ID4+
IC0jZGVmaW5lIGlzX2h2bV92Y3B1KHYpICAgKGlzX2h2bV9kb21haW4odi0+ZG9tYWluKSkKPiA+
PiArCj4gPj4gK3N0YXRpYyBpbmxpbmUgYm9vbCBpc19odm1fZG9tYWluKGNvbnN0IHN0cnVjdCBk
b21haW4gKmQpCj4gPj4gK3sKPiA+PiArICAgIHJldHVybiBJU19FTkFCTEVEKENPTkZJR19IVk0p
ID8gZC0+Z3Vlc3RfdHlwZSA9PSBndWVzdF90eXBlX2h2bSA6IGZhbHNlOwo+ID4+ICt9Cj4gPj4g
Kwo+ID4+ICtzdGF0aWMgaW5saW5lIGJvb2wgaXNfaHZtX3ZjcHUoY29uc3Qgc3RydWN0IHZjcHUg
KnYpCj4gPj4gK3sKPiA+PiArICAgIHJldHVybiBpc19odm1fZG9tYWluKHYtPmRvbWFpbik7Cj4g
Pj4gK30KPiA+PiArCj4gPiBUaGlzIHNob3VsZCB3b3JrIHRvby4gSSdtIG5vdCB0b28gZnVzcyB3
aGV0aGVyIGlzX2h2bV8qIGFyZSBtYWNyb3Mgb3IKPiA+IGZ1bmN0aW9ucy4KPiAKPiBzdGF0aWMg
aW5saW5lcyBhcmUgc3VwZXJpb3IgdG8gbWFjcm9zIGluIGEgbG90IG9mIHdheXMuwqAgSWYgaW4g
ZG91YnQsCj4gdXNlIGEgc3RhdGljIGlubGluZSAoaWYgeW91IGNhbi7CoCB3ZSd2ZSBnb3Qgc29t
ZSBoZWFkZXIgZmlsZSB0YW5nbGVzCj4gd2hpY2ggb2NjYXNpb25hbGx5IG1ha2UgaXQgdmVyeSBo
YXJkIHRvIHVzZSBzdGF0aWMgaW5saW5lcykuCgpPSywgc3VyZS4KCldlaS4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
