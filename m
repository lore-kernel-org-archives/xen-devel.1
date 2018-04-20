From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2] shim: don't let build modify shim.config
Date: Fri, 20 Apr 2018 06:22:06 -0600
Message-ID: <5AD9DB6E02000078001BCFC9@prv1-mh.provo.novell.com>
References: <20180420064005.14563-1-jgross@suse.com>
 <5AD9C0D302000078001BCEC4@suse.com>
 <c159bcd5-b298-8979-ab54-f95fca9d9fd7@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=xcz5=hj=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1f9V3G-00046w-Gq
 for xen-devel@lists.xenproject.org; Fri, 20 Apr 2018 12:22:06 +0000
In-Reply-To: <c159bcd5-b298-8979-ab54-f95fca9d9fd7@suse.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIwLjA0LjE4IGF0IDE0OjEzLCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBPbiAy
MC8wNC8xOCAxMjoyOCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDIwLjA0LjE4IGF0IDA4
OjQwLCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPj4+IC0tLSBhL3Rvb2xzL2Zpcm13YXJlL3hl
bi1kaXIvTWFrZWZpbGUKPj4+ICsrKyBiL3Rvb2xzL2Zpcm13YXJlL3hlbi1kaXIvTWFrZWZpbGUK
Pj4+IEBAIC00MSwxNiArNDEsMTQgQEAgbGlua2Zhcm0uc3RhbXA6ICQoREVQX0RJUlMpICQoREVQ
X0ZJTEVTKSBGT1JDRQo+Pj4gICQoRCk6IGxpbmtmYXJtLnN0YW1wCj4+PiAgCSQoTUFLRSkgLUMg
JChEKS94ZW4gZGlzdGNsZWFuCj4+PiAgCj4+PiAtLlBIT05ZOiBzaGltLSVjb25maWcKPj4+IC1z
aGltLSVjb25maWc6ICQoRCkgRk9SQ0UKPj4+IC0JJChNQUtFKSAtQyAkKEQpL3hlbiAkKmNvbmZp
ZyBcCj4+PiAtCQlYRU5fQ09ORklHX0VYUEVSVD15IFwKPj4+IC0JCUtDT05GSUdfQ09ORklHPSQo
Q1VSRElSKS9zaGltLmNvbmZpZwo+Pj4gKyQoRCkveGVuLy5jb25maWc6IHNoaW0uY29uZmlnICQo
RCkKPj4gCj4+IERvIHlvdSBuZWVkIHRoZSAkKEQpLyBwcmVmaXggaGVyZSwgLi4uCj4+IAo+Pj4g
KwljcCAkPCAkQAo+Pj4gKwkkKE1BS0UpIC1DICQoRCkveGVuIG9sZGRlZmNvbmZpZyBcCj4+IAo+
PiAuLi4gaGVyZSwgYW5kIC4uLgo+PiAKPj4+ICsJCVhFTl9DT05GSUdfRVhQRVJUPXkKPj4+ICAK
Pj4+IC14ZW4tc2hpbTogJChEKSBzaGltLW9sZGRlZmNvbmZpZwo+Pj4gK3hlbi1zaGltOiAkKEQp
ICQoRCkveGVuLy5jb25maWcKPj4gCj4+IC4uLiBoZXJlPyBJbiB0aGUgbWlkZGxlIGNhc2UgdXNp
bmcgJChARCkgbWlnaHQgYmUgYmV0dGVyIGFueXdheS4gT3RoZXIKPj4gdGhhbiB0aGF0IExHVE0s
IGJ1dCBwbGVhc2UgY29uc2lkZXIgcmVtb3ZpbmcgdGhlIGxpbmUgY29udGludWF0aW9ucyBmcm9t
Cj4+IHRoZSBtYWtlIGludm9jYXRpb25zLgo+IAo+IFlvdSBhcmUgYXdhcmUgb2YgdGhlIGxpbmUg
ZnVydGhlciB1cDoKPiAKPiBEPXhlbi1yb290CgpPaCwgaW5kZWVkLiBUaGlzIHhlbi1kaXIveGVu
LXJvb3QgaGllcmFyY2h5IGlzIGNvbmZ1c2luZy4KCj4gU28gJChEKS94ZW4gaXMganVzdCB0aGUg
cGF0aCB0byB0aGUgaHlwZXJ2aXNvciBwYXJ0IG9mIHRoZSBzaGltLiBUaGlzCj4gaGFzIG5vdGhp
bmcgdG8gZG8gd2l0aCAkKEBEKSBvciBvdGhlciB2YXJpYW50cyBvZiB0aGUgbWFrZSBhdXRvbWF0
aWMKPiB2YXJpYWJsZXMuCgpUaGUgc3VnZ2VzdGVkICQoQEQpIHdvdWxkIHN0aWxsIGJlIHdvcnRo
d2hpbGUgdG8gaGF2ZSBpbW8sIGJ1dCBJIGFncmVlCnlvdSBjYW4ndCBkcm9wIHRoZSAkKEQpLyBw
cmVmaXhlcy4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
