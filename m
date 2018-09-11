From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] perfc: Print a system time in a convenient
 format
Date: Tue, 11 Sep 2018 03:28:39 -0600
Message-ID: <5B978AC702000078001E719D@prv1-mh.provo.novell.com>
References: <1536648829-13743-1-git-send-email-andrii.anisov@gmail.com>
 <5B977C7902000078001E70BE@prv1-mh.provo.novell.com>
 <d643cde4-a64a-fee0-af57-6d169fd04206@epam.com>
 <5B97868502000078001E712B@prv1-mh.provo.novell.com>
 <f150cba5-9458-fe1a-a974-4373e4636e7c@citrix.com>
 <5B97886002000078001E7151@prv1-mh.provo.novell.com>
 <c175f9c8-3b6b-46b5-abbd-8fe6b6e83a9c@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=zj+h=lz=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fzeyU-0006I2-58
 for xen-devel@lists.xenproject.org; Tue, 11 Sep 2018 09:28:46 +0000
In-Reply-To: <c175f9c8-3b6b-46b5-abbd-8fe6b6e83a9c@citrix.com>
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

Pj4+IE9uIDExLjA5LjE4IGF0IDExOjIwLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMTEvMDkvMTggMTA6MTgsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAxMS4w
OS4xOCBhdCAxMToxNSwgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+IHdyb3RlOgo+Pj4gT24g
MTEvMDkvMTggMTA6MTAsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4+IE9uIDExLjA5LjE4IGF0
IDEwOjUwLCA8YW5kcmlpX2FuaXNvdkBlcGFtLmNvbT4gd3JvdGU6Cj4+Pj4+IE9uIDExLjA5LjE4
IDExOjI3LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4+IE5BSywgZm9yIHR3byByZWFzb25zOiBJ
J20gbm90IG9mIHRoZSBvcGluaW9uIHRoYXQgcmVhZGluZyBhIDE1IG9yIG1vcmUKPj4+Pj4+IGRp
Z2l0IGRlY2ltYWwgbnVtYmVyIHdpdGhvdXQgYW55IHNlcGFyYXRvcnMgaXMgYW55IGVhc2llciB0
aGFuIHRoZQo+Pj4+Pj4gY3VycmVudCBmb3JtYXQuCj4+Pj4+IEl0J3MgcXVpdGUgc3ViamVjdGl2
ZS4gSU1ITyB0aW1lc3RhbXBzIG1lYXN1cmVkIGluIG5zIGVhc2llciB0byAKPj4+Pj4gdW5kZXJz
dGFuZCBpbiBkZWNpbWFscyByYXRoZXIgdGhhbiBpbiBzZXBhcmF0ZWQgMzItYml0IGhleC1lcy4g
Tm8gbWF0dGVyIAo+Pj4+PiBob3cgbWFueSBkaWdpdGFsIG51bWJlciB0aGV5IGhhdmUuCj4+Pj4g
SXQgaXMgc3ViamVjdGl2ZSwgeWVzLCBidXQgaW4gc3VjaCBhIGNhc2UgeW91IGV2ZW4gbW9yZSBz
byBuZWVkIHRvCj4+Pj4gZGVtb25zdHJhdGUgYSBjaGFuZ2UgaXMgYW4gb3ZlcmFsbCBpbXByb3Zl
bWVudC4KPj4+Pgo+Pj4+PiBFdmVuIHBvc3QgcHJvY2Vzc2luZyBvZiBwZXJmYyBvdXRwdXQgaXMg
ZWFzaWVyIGluIGNhc2Ugb2YgZGVjaW1hbCAKPj4+Pj4gdGltZXN0YW1wcy4gWW91IHNob3VsZCBu
b3QgcGFyc2UgaGV4ZXMgYW5kIG9kZCBzZXBhcmF0b3JzIHRvIGNhbGN1bGF0ZSAKPj4+Pj4gdGhl
IHRpbWUgZWxhcHNlZCBiZXR3ZWVuIHR3byBzYW1wbGVzLgo+Pj4+IFBvc3QgcHJvY2Vzc2luZyB1
c3VhbGx5IHVzZXMgc2NyaXBzIGZvciBwYXJzaW5nIC0gSSBkb24ndCB0aGluayBpdCdzCj4+Pj4g
b3Zlcmx5IGNvbXBsaWNhdGVkIHRvIGhhdmUgYSBzY3JpcHQgY29udmVydCB0aGUgbnVtYmVyIGlu
dG8KPj4+PiBiYXNpY2FsbHkgYW55IGZvcm1hdCB5b3Ugd2FudC4KPj4+IFJpZ2h0LCBidXQgdGhp
cyBwYXJ0aWN1bGFyIG1pcy1wYXR0ZXJuIHdhbnRzIGZpeGluZy4gIEl0IGlzIHNpbXBseQo+Pj4g
Y29uZnVzaW5nIHRvIGhhdmUgYSBzaW5nbGUgbnVtYmVyIGZvcm1hdHRlZCB3aXRoIGEgY29sb24g
aW5iZXR3ZWVuLgo+PiBXaGF0IG90aGVyIHNlcGFyYXRvciBkbyB5b3Ugc3VnZ2VzdD8gSSBjb25z
aWRlciBpdCBxdWl0ZSBoZWxwZnVsCj4+IHRvIGhhdmUgb25lIHdoZW4gdGhlcmUgYXJlIG1vcmUg
dGhhbiBhYm91dCAxMCBkaWdpdHMuIChJJ2QgYWxzbwo+PiBiZSBmaW5lLCBidHcsIHRvIGhhdmUg
dGhlIHRpbWUgcHJpbnRlZCBpbiBkZWNpbWFsLCBidXQgdGhlbgo+PiBwZXJoYXBzIHdpdGggbXMg
Z3JhbnVsYXJpdHkgYW5kIDYgZGlnaXRzIGZvciB0aGUgZnJhY3Rpb25hbCBwYXJ0LikKPiAKPiBJ
dCBpcyBjdXJyZW50bHkgbW9yZSBjb21tb24gYWNyb3NzIHRoZSBiYXNlIHRvIHVzZSB0aGUgZm9y
bWF0IHByb3Bvc2VkCj4gYnkgQW5kcmlpLgo+IAo+IEZvciBjb25zaXN0ZW50bHkgYWxvbmUsIHRo
YXQgZm9ybWF0IHNob3VsZCBiZSBmb2xsb3dlZCwgb3IgKmV2ZXJ5dGhpbmcqCj4gc2hvdWxkIGJl
IGNoYW5nZWQuCgpfTW9yZV8gY29uc2lzdGVuY3kgd291bGQgYmUgZGVzaXJhYmxlLCBidXQgSSBk
b24ndCB0aGluayB0aGVyZSdzIGEKc3RyaWN0IG5lZWQgdG8gZ2V0IHRoZXJlIGluIG9uZSBzdGVw
LiBBIHBhdGNoIHNob3VsZG4ndCByZXN1bHQgaW4gbGVzcwpjb25zaXN0ZW5jeSwgSSBmdWxseSBh
Z3JlZS4gSWYgdGhlcmUgYXJlIG90aGVyIGhhcmQgdG8gcGFyc2UgKGJ5IGEKaHVtYW4pIHRpbWUg
c3RhbXBzIHdoaWNoIGdldCBsb2dnZWQsIEknbSBhbGwgZm9yIGNoYW5naW5nIHRoZW0sCmJ1dCBy
aWdodCBoZXJlIHRoZSBmb2N1cyBpcyBqdXN0IG9uIHRoZSBoZWFkbGluZXMgd2hpY2ggc29tZSBv
ZiB0aGUKa2V5IGhhbmRsZXJzIGxvZyAod2hpY2gsIGFzIGluZGljYXRlZCBiZWZvcmUsIEknZCBp
bmRlZWQgbGlrZSB0byBzZWUKY2hhbmdlZCBhbGwgaW4gb25lIGdvKS4KCkphbgoKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
