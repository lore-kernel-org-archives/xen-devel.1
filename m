From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] perfc: Print a system time in a convenient
 format
Date: Tue, 11 Sep 2018 03:18:24 -0600
Message-ID: <5B97886002000078001E7151@prv1-mh.provo.novell.com>
References: <1536648829-13743-1-git-send-email-andrii.anisov@gmail.com>
 <5B977C7902000078001E70BE@prv1-mh.provo.novell.com>
 <d643cde4-a64a-fee0-af57-6d169fd04206@epam.com>
 <5B97868502000078001E712B@prv1-mh.provo.novell.com>
 <f150cba5-9458-fe1a-a974-4373e4636e7c@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=zj+h=lz=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fzeoX-0004Vo-Dy
 for xen-devel@lists.xenproject.org; Tue, 11 Sep 2018 09:18:29 +0000
In-Reply-To: <f150cba5-9458-fe1a-a974-4373e4636e7c@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, "andrii_anisov@epam.com" <andrii_anisov@epam.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, andrii.anisov@gmail.com, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDExLjA5LjE4IGF0IDExOjE1LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMTEvMDkvMTggMTA6MTAsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAxMS4w
OS4xOCBhdCAxMDo1MCwgPGFuZHJpaV9hbmlzb3ZAZXBhbS5jb20+IHdyb3RlOgo+Pj4gT24gMTEu
MDkuMTggMTE6MjcsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE5BSywgZm9yIHR3byByZWFzb25z
OiBJJ20gbm90IG9mIHRoZSBvcGluaW9uIHRoYXQgcmVhZGluZyBhIDE1IG9yIG1vcmUKPj4+PiBk
aWdpdCBkZWNpbWFsIG51bWJlciB3aXRob3V0IGFueSBzZXBhcmF0b3JzIGlzIGFueSBlYXNpZXIg
dGhhbiB0aGUKPj4+PiBjdXJyZW50IGZvcm1hdC4KPj4+IEl0J3MgcXVpdGUgc3ViamVjdGl2ZS4g
SU1ITyB0aW1lc3RhbXBzIG1lYXN1cmVkIGluIG5zIGVhc2llciB0byAKPj4+IHVuZGVyc3RhbmQg
aW4gZGVjaW1hbHMgcmF0aGVyIHRoYW4gaW4gc2VwYXJhdGVkIDMyLWJpdCBoZXgtZXMuIE5vIG1h
dHRlciAKPj4+IGhvdyBtYW55IGRpZ2l0YWwgbnVtYmVyIHRoZXkgaGF2ZS4KPj4gSXQgaXMgc3Vi
amVjdGl2ZSwgeWVzLCBidXQgaW4gc3VjaCBhIGNhc2UgeW91IGV2ZW4gbW9yZSBzbyBuZWVkIHRv
Cj4+IGRlbW9uc3RyYXRlIGEgY2hhbmdlIGlzIGFuIG92ZXJhbGwgaW1wcm92ZW1lbnQuCj4+Cj4+
PiBFdmVuIHBvc3QgcHJvY2Vzc2luZyBvZiBwZXJmYyBvdXRwdXQgaXMgZWFzaWVyIGluIGNhc2Ug
b2YgZGVjaW1hbCAKPj4+IHRpbWVzdGFtcHMuIFlvdSBzaG91bGQgbm90IHBhcnNlIGhleGVzIGFu
ZCBvZGQgc2VwYXJhdG9ycyB0byBjYWxjdWxhdGUgCj4+PiB0aGUgdGltZSBlbGFwc2VkIGJldHdl
ZW4gdHdvIHNhbXBsZXMuCj4+IFBvc3QgcHJvY2Vzc2luZyB1c3VhbGx5IHVzZXMgc2NyaXBzIGZv
ciBwYXJzaW5nIC0gSSBkb24ndCB0aGluayBpdCdzCj4+IG92ZXJseSBjb21wbGljYXRlZCB0byBo
YXZlIGEgc2NyaXB0IGNvbnZlcnQgdGhlIG51bWJlciBpbnRvCj4+IGJhc2ljYWxseSBhbnkgZm9y
bWF0IHlvdSB3YW50Lgo+IAo+IFJpZ2h0LCBidXQgdGhpcyBwYXJ0aWN1bGFyIG1pcy1wYXR0ZXJu
IHdhbnRzIGZpeGluZy4gIEl0IGlzIHNpbXBseQo+IGNvbmZ1c2luZyB0byBoYXZlIGEgc2luZ2xl
IG51bWJlciBmb3JtYXR0ZWQgd2l0aCBhIGNvbG9uIGluYmV0d2Vlbi4KCldoYXQgb3RoZXIgc2Vw
YXJhdG9yIGRvIHlvdSBzdWdnZXN0PyBJIGNvbnNpZGVyIGl0IHF1aXRlIGhlbHBmdWwKdG8gaGF2
ZSBvbmUgd2hlbiB0aGVyZSBhcmUgbW9yZSB0aGFuIGFib3V0IDEwIGRpZ2l0cy4gKEknZCBhbHNv
CmJlIGZpbmUsIGJ0dywgdG8gaGF2ZSB0aGUgdGltZSBwcmludGVkIGluIGRlY2ltYWwsIGJ1dCB0
aGVuCnBlcmhhcHMgd2l0aCBtcyBncmFudWxhcml0eSBhbmQgNiBkaWdpdHMgZm9yIHRoZSBmcmFj
dGlvbmFsIHBhcnQuKQoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
