From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2] xen: add DEBUG_INFO Kconfig symbol
Date: Mon, 10 Sep 2018 07:29:52 -0600
Message-ID: <5B9671D002000078001E6C86@prv1-mh.provo.novell.com>
References: <20180831082921.11208-1-olaf@aepfle.de>
 <5B88FFBB02000078001E3CA8@prv1-mh.provo.novell.com>
 <5B966FC202000078001E6C53@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=emay=ly=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fzMGL-00084y-B2
 for xen-devel@lists.xenproject.org; Mon, 10 Sep 2018 13:29:57 +0000
In-Reply-To: <5B966FC202000078001E6C53@prv1-mh.provo.novell.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Olaf Hering <olaf@aepfle.de>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEwLjA5LjE4IGF0IDE1OjIxLCA8SkJldWxpY2hAc3VzZS5jb20+IHdyb3RlOgo+Pj4+
IE9uIDMxLjA4LjE4IGF0IDEwOjQzLCA8SkJldWxpY2hAc3VzZS5jb20+IHdyb3RlOgo+Pj4+PiBP
biAzMS4wOC4xOCBhdCAxMDoyOSwgPG9sYWZAYWVwZmxlLmRlPiB3cm90ZToKPj4+IC0tLSBhL3hl
bi9LY29uZmlnLmRlYnVnCj4+PiArKysgYi94ZW4vS2NvbmZpZy5kZWJ1Zwo+Pj4gQEAgLTExLDYg
KzExLDEzIEBAIGNvbmZpZyBERUJVRwo+Pj4gIAo+Pj4gIAkgIFlvdSBwcm9iYWJseSB3YW50IHRv
IHNheSAnTicgaGVyZS4KPj4+ICAKPj4+ICtjb25maWcgREVCVUdfSU5GTwo+Pj4gKwlib29sICJD
b21waWxlIFhlbiB3aXRoIGRlYnVnIGluZm8iCj4+PiArCWRlZmF1bHQgeQo+Pj4gKwktLS1oZWxw
LS0tCj4+PiArCSAgSWYgeW91IHNheSBZIGhlcmUgdGhlIHJlc3VsdGluZyBYZW4gd2lsbCBpbmNs
dWRlIGRlYnVnZ2luZyBpbmZvCj4+PiArCSAgcmVzdWx0aW5nIGluIGEgbGFyZ2VyIGJpbmFyeSBp
bWFnZS4KPj4+ICsKPj4+ICBpZiBERUJVRyB8fCBFWFBFUlQgPSAieSIKPj4gCj4+IFBlcmhhcHMg
YmV0dGVyIG1vdmUgeW91ciBhZGRpdGlvbiBpbnRvIHRoaXMgY29uZGl0aW9uYWwgc2VjdGlvbj8K
PiAKPiBTbyB0aGlzIHdhcyBhIGJhZCBzdWdnZXN0aW9uIGFmdGVyIGFsbCAtIHdpdGggREVCVUc9
biBERUJVR19JTkZPIGlzCj4gbm93IGltcGxpY2l0bHkgbiBhcyB3ZWxsLiBUaGUgc2VjdGlvbiBu
ZWVkcyB0byBiZSBtb3ZlZCBiYWNrIHRvIHdoZXJlCj4geW91IGhhZCBpdCBhcyBwZXIgYWJvdmUs
IHdpdGggdGhlIF9wcm9tcHRfIGRlcGVuZGluZyBvbgo+IERFQlVHIHx8IEVYUEVSVD0ieSIuCgpG
dXJ0aGVybW9yZSAtIGlzIENPVkVSQUdFIHdpdGhvdXQgREVCVUdfSU5GTyBvZiBhbnkgdXNlPyBB
cmUgdGhlcmUKcGVyaGFwcyBhbnkgb3RoZXIgZGVwZW5kZW5jaWVzIChJIHRoaW5rL2hvcGUgbGl2
ZSBwYXRjaGluZyBsb2dpYyBkb2Vzbid0CmRlcGVuZCBvbiBkZWJ1ZyBpbmZvKT8KCkphbgoKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
