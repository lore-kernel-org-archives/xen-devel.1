From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v9 5/7] memory: add
 check_get_page_from_gfn() as a wrapper...
Date: Wed, 19 Sep 2018 03:34:11 -0600
Message-ID: <5BA2181302000078001E9D32@prv1-mh.provo.novell.com>
References: <20180913152128.6114-6-paul.durrant@citrix.com>
 <5BA0FAB702000078001E9779@prv1-mh.provo.novell.com>
 <71ebe85f6fe94f989db6618eabf22c1e@AMSPEX02CL03.citrite.net>
 <5BA110EF02000078001E9802@prv1-mh.provo.novell.com>
 <ef6cbe5d4b994f7fbf61eb634c040dd4@AMSPEX02CL03.citrite.net>
 <5BA1E69F02000078001E99DF@prv1-mh.provo.novell.com>
 <f6f35c7b1ccf4abbaf0352f99b89e4fe@AMSPEX02CL03.citrite.net>
 <5BA20A0A02000078001E9C25@prv1-mh.provo.novell.com>
 <4a38b1a409a443d4940973c1d6eb4366@AMSPEX02CL03.citrite.net>
 <5BA2156E02000078001E9CF9@prv1-mh.provo.novell.com>
 <20180919092947.fmcko5hxzr5ps642@mac.bytemobile.com>
 <304E51960200007575B6CDDB@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=lqxj=mb=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1g2YsD-0004nl-4S
 for xen-devel@lists.xenproject.org; Wed, 19 Sep 2018 09:34:17 +0000
In-Reply-To: <304E51960200007575B6CDDB@prv1-mh.provo.novell.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, george.dunlap@citrix.com, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, IanJackson <Ian.Jackson@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE5LjA5LjE4IGF0IDExOjI5LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIFdlZCwgU2VwIDE5LCAyMDE4IGF0IDAzOjIyOjU0QU0gLTA2MDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+PiA+Pj4gT24gMTkuMDkuMTggYXQgMTA6NTQsIDxQYXVsLkR1cnJhbnRAY2l0cml4LmNv
bT4gd3JvdGU6Cj4+ID4+IEZyb206IEphbiBCZXVsaWNoIFttYWlsdG86SkJldWxpY2hAc3VzZS5j
b21dCj4+ID4+IFNlbnQ6IDE5IFNlcHRlbWJlciAyMDE4IDA5OjM0Cj4+ID4+IAo+PiA+PiA+Pj4g
T24gMTkuMDkuMTggYXQgMDk6NTYsIDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT4gd3JvdGU6Cj4+
ID4gT2ssIGlmIHdlIGluY2x1ZGUgcDJtLWNvbW1vbiBpbiB0aGUgbWlkZGxlIG9mIHAybSwgYW5k
IHRoZW4gYWRkIHN0dWZmIAo+PiA+IGRlcGVuZGVudCBvbiB0aGUgZGVjbGFyYXRpb24gb2YgcDJt
X3R5cGVfdCwgd2hhdCBoYXBwZW5zIHdoZW4gYSBzb3VyY2UgbW9kdWxlIAo+PiA+IGV4cGxpY2l0
bHkgaW5jbHVkZXMgcDJtLWNvbW1vbiBwcmlvciB0byBwMm0/Cj4+IAo+PiBUaGlzIGlzIG5vdCBz
dXBwb3NlZCB0byBoYXBwZW4sIGFzIHRoaXMgaGVhZGVyIGlzIHN1cHBvc2VkIHRvIG9ubHkgYmUK
Pj4gaW5jbHVkZWQgZnJvbSB0aGUgcGVyLWFyY2ggcDJtLmg7IHdlIHNob3VsZCBwdXQgYW4gI2Vy
cm9yIHRoZXJlLiBJCj4+IHNlZSB0aGVyZSdzIGV4YWN0bHkgb25lIHZpb2xhdGlvbiBvZiB0aGlz
IChkcml2ZXJzL3ZwY2kvaGVhZGVyLmMpLiBCdXQKPj4geW91ciBzZXJpZXMgY2FuIGdvIGluIGFz
IGlzOyBJJ2xsIHRyeSB0byByZW1lbWJlciB0byBjbGVhbiB0aGlzIHVwLgo+IAo+IE9oLCBkaWRu
J3Qga25vdyB0aGlzLCB3aWxsIHNlbmQgYSBwYXRjaCB0byBzd2l0Y2ggaGVhZGVyLmMgdG8gaW5j
bHVkZQo+IHAybS5oIGluc3RlYWQgb2YgcDJtLWNvbW1vbi5oLgoKTm8gbmVlZCB0bywgSSd2ZSBh
bHJlYWR5IG1hZGUgdGhpcyBwYXJ0IG9mIHRoZSBwYXRjaCBtb3ZpbmcgdGhlCmluY2x1c2lvbiBw
b2ludC4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
