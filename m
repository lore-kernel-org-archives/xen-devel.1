From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v4 01/12] x86: infrastructure to allow
 converting certain indirect calls to direct ones
Date: Tue, 02 Oct 2018 08:06:26 -0600
Message-ID: <5BB37B6202000078001EDC5C@prv1-mh.provo.novell.com>
References: <5B97C28802000078001E7456@prv1-mh.provo.novell.com>
 <5BB343D802000078001ED9F6@prv1-mh.provo.novell.com>
 <5BB3447802000078001EDA08@prv1-mh.provo.novell.com>
 <f04b3731-481c-b7a0-f5b5-e0e611b391b1@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=0jmz=mo=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1g7LJp-00038m-Gc
 for xen-devel@lists.xenproject.org; Tue, 02 Oct 2018 14:06:33 +0000
In-Reply-To: <f04b3731-481c-b7a0-f5b5-e0e611b391b1@citrix.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAyLjEwLjE4IGF0IDE1OjIxLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMDIvMTAvMTggMTE6MTIsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiAtLS0gYS94ZW4v
aW5jbHVkZS94ZW4vbGliLmgKPj4gKysrIGIveGVuL2luY2x1ZGUveGVuL2xpYi5oCj4+IEBAIC02
Niw2ICs2NiwxMCBAQAo+PiAgCj4+ICAjZGVmaW5lIFJPVU5EVVAoeCwgYSkgKCgoeCkgKyAoYSkg
LSAxKSAmIH4oKGEpIC0gMSkpCj4+ICAKPj4gKyNkZWZpbmUgY291bnRfdmFfYXJnXyhkb3QsIGEx
LCBhMiwgYTMsIGE0LCBhNSwgYTYsIGE3LCBhOCwgeCwgLi4uKSB4Cj4+ICsjZGVmaW5lIGNvdW50
X3ZhX2FyZyhhcmdzLi4uKSBcCj4+ICsgICAgY291bnRfdmFfYXJnXyguLCAjIyBhcmdzLCA4LCA3
LCA2LCA1LCA0LCAzLCAyLCAxLCAwKQo+IAo+IFRoaXMgcGFydGljdWxhciBiaXQgb2YgcmV2aWV3
IHNwbGl0IG91dCBmb3Igb2J2aW91cyByZWFzb25zLgo+IAo+IFdlIGFscmVhZHkgaGF2ZSBfX2Nv
dW50X2FyZ3MoKSBpbiB0aGUgQVJNIFNNQ0NDIGluZnJhc3RydWN0dXJlLiAgUGxlYXNlCj4gY2Fu
IHdlIGRlZHVwIHRoYXQgKGJyb2tlbiBvdXQgaW50byBhIHNlcGFyYXRlIHBhdGNoKSByYXRoZXIg
dGhhbgo+IGludHJvZHVjaW5nIGEgY29tcGV0aW5nIHZlcnNpb24uCj4gCj4gVGhlIEFSTSB2ZXJz
aW9uIGlzIGJ1Z2d5LiAgSXQgaXMgb2ZmLWJ5LXR3byBpbiB0aGUgYmFzZSBjYXNlLCBhbmQKPiBk
b2Vzbid0IGNvbXBpbGUgaWYgZmV3ZXIgdGhhbiB0d28gcGFyYW1ldGVycyBhcmUgcGFzc2VkLgoK
SWYgeW91IGhhZCBmb2xsb3dlZCBlYXJsaWVyIGRpc2N1c3Npb24sIHlvdSdkIGhhdmUga25vd24g
dXAgZnJvbnQKSnVsaWVuJ3MgcmVhY3Rpb24uIEl0IGlzIGZvciB0aGF0IHJlYXNvbiB0aGF0IEkn
bSBub3QgdHJ5aW5nIHRvIGZpZGRsZQp3aXRoIHRoZSBBUk0gY29kZSBpbiB0aGlzIHJlZ2FyZCwg
ZGVzcGl0ZSBhZ3JlZWluZyB3aXRoIHlvdSB0aGF0CmF0IHRoZSB2ZXJ5IGxlYXN0IGl0IF9sb29r
c18gYnVnZ3kuCgo+IFRoaXMgdmVyc2lvbiBmdW5jdGlvbnMgY29ycmVjdGx5LCBidXQgc2hvdWxk
IGJlIG5hbWVkIHdpdGggYSBwbHVyYWwuCgpXaHkgcGx1cmFsPyBOb3RoaW5nIGluIHN0ZGFyZy5o
IHVzZXMgcGx1cmFsIChpbmNsdWRpbmcgdGhlIGhlYWRlcgpmaWxlIG5hbWUgaXRzZWxmKS4KCkph
bgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
