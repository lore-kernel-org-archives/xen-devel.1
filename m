From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH for-next 9/9] xen: Remove mfn_to_gmfn macro
Date: Wed, 13 Mar 2019 09:59:26 -0600
Message-ID: <5C8928DE020000780021E44B@prv1-mh.provo.novell.com>
References: <20190218113600.9540-1-julien.grall@arm.com>
 <20190218113600.9540-10-julien.grall@arm.com>
 <5C892053020000780021E3A3@prv1-mh.provo.novell.com>
 <d99d0f41-9f56-be1b-96eb-de34fce812ee@arm.com>
 <5C892459020000780021E3FF@prv1-mh.provo.novell.com>
 <e5f62bfe-d31e-53b3-41c2-493960742890@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=GbKp=RQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1h46Hy-0000Am-T0
 for xen-devel@lists.xenproject.org; Wed, 13 Mar 2019 15:59:30 +0000
In-Reply-To: <e5f62bfe-d31e-53b3-41c2-493960742890@arm.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEzLjAzLjE5IGF0IDE2OjQ4LCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IEhpLAo+IAo+IE9uIDEzLzAzLzIwMTkgMTU6NDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBP
biAxMy4wMy4xOSBhdCAxNjoyNCwgPGp1bGllbi5ncmFsbEBhcm0uY29tPiB3cm90ZToKPj4+IE9u
IDEzLzAzLzIwMTkgMTU6MjIsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4+IE9uIDE4LjAyLjE5
IGF0IDEyOjM2LCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+Pj4+PiAtLS0gYS94ZW4v
aW5jbHVkZS9hc20tYXJtL21tLmgKPj4+Pj4gKysrIGIveGVuL2luY2x1ZGUvYXNtLWFybS9tbS5o
Cj4+Pj4+IEBAIC0zMjEsMTAgKzMyMSw4IEBAIHN0cnVjdCBwYWdlX2luZm8gKmdldF9wYWdlX2Zy
b21fZ3ZhKHN0cnVjdCB2Y3B1ICp2LCAKPiB2YWRkcl90IHZhLAo+Pj4+PiAgICAjZGVmaW5lIFNI
QVJFRF9NMlBfRU5UUlkgICAgICAgICAofjBVTCAtIDFVTCkKPj4+Pj4gICAgI2RlZmluZSBTSEFS
RURfTTJQKF9lKSAgICAgICAgICAgKChfZSkgPT0gU0hBUkVEX00yUF9FTlRSWSkKPj4+Pj4gICAg
Cj4+Pj4+IC0vKiBYZW4gYWx3YXlzIG93bnMgUDJNIG9uIEFSTSAqLwo+Pj4+PiArLyogV2UgZG9u
J3QgaGF2ZSBhIE0yUCBvbiBBcm0gKi8KPj4+Pj4gICAgI2RlZmluZSBzZXRfZ3Bmbl9mcm9tX21m
bihtZm4sIHBmbikgZG8geyAodm9pZCkgKG1mbiksICh2b2lkKShwZm4pOyB9IAo+IHdoaWxlICgw
KQo+Pj4+PiAtI2RlZmluZSBtZm5fdG9fZ21mbihfZCwgbWZuKSAgKG1mbikKPj4+Pgo+Pj4+IFNv
IGlzIHRoZSBwbGFuIHRvIHJlbW92ZSB0aGUgb3RoZXIgbWFjcm8gZnJvbSBBcm0gdGhlbiBhcyB3
ZWxsPwo+Pj4KPj4+IERvIHlvdSBtZWFuIG1mbl90b19nZm4/IElmIHNvIGl0IGRvZXMgbm90IGV4
aXN0IG9uIEFybS4KPj4gCj4+IE5vLCBJIG1lYW4gdGhlIG9uZSBpbiBjb250ZXh0IGFib3ZlIC0g
c2V0X2dwZm5fZnJvbV9tZm4oKS4KPiAKPiBJdCBpcyB1c2VkIGluIGNvbW1vbiBjb2RlLCBzbyB3
ZSB3b3VsZCBuZWVkIHRvICNpZGVmIHRoZSBjYWxsZXIuCgpIbW0sIHJpZ2h0LCBzdWNoICNpZmRl
Zi1hcnkgd291bGQgYmUgdW5kZXNpcmFibGUgKGFuZCB0d28gb3V0IG9mCnRoZSB0aHJlZSBjb21t
b24gY29kZSBjYWxsZXJzIHdvdWxkIG5lZWQgaXQuCgo+IEkgdGhpbmsgaXQgaXMgYmV0dGVyIHRv
IHByb3ZpZGUgYSBOT1AgaW1wbGVtZW50YXRpb24uIENvdWxkIGJlIG1vdmVkIHNvbWV3aGVyZSAK
PiBpbiB0aGUgY29tbW9uIGhlYWRlciB0aG91Z2guIEFueSBvcGluaW9ucz8KClRoaXMgd291bGQg
cGVyaGFwcyBiZSBiZXR0ZXIsIG5vdyB0aGF0IHlvdSBoYXZlIEhBVkVfTTJQLgoKSmFuCgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
