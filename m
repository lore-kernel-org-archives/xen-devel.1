From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH] hvmloader: fix build with LLVM Linker
Date: Mon, 3 Sep 2018 16:19:37 +0200
Message-ID: <20180903141937.pxyox3zwz37rpn6l@mac.bytemobile.com>
References: <20180824095802.78002-1-roger.pau@citrix.com>
 <5B83C96F02000078001E214F@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=r/nd=lr=citrix.com=prvs=7776ac630=roger.pau@srs-us1.protection.inumbo.net>)
 id 1fwphj-0004sk-Bu
 for xen-devel@lists.xenproject.org; Mon, 03 Sep 2018 14:19:47 +0000
Content-Disposition: inline
In-Reply-To: <5B83C96F02000078001E214F@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBBdWcgMjcsIDIwMTggYXQgMDM6NTA6MzlBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDI0LjA4LjE4IGF0IDExOjU4LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gLS0tIC9kZXYvbnVsbAo+ID4gKysrIGIvdG9vbHMvZmlybXdhcmUvaHZtbG9hZGVy
L2h2bWxvYWRlci5sZHMKPiA+IEBAIC0wLDAgKzEsMTMgQEAKPiA+ICtTRUNUSU9OUwo+ID4gK3sK
PiA+ICsgIC4gPSAweDEwMDAwMDsKPiA+ICsgIC8qCj4gPiArICAgKiBOQjogdGhlcmUncyBubyBu
ZWVkIHRvIHVzZSB0aGUgQVQga2V5d29yZCBpbiBvcmRlciB0byBzZXQgdGhlIExNQSwgYnkKPiA+
ICsgICAqIGRlZmF1bHQgdGhlIGxpbmtlciB3aWxsIHVzZSBWTUEgPSBMTUEgdW5sZXNzIHNwZWNp
ZmllZCBvdGhlcndpc2UuCj4gPiArICAgKi8KPiA+ICsgIC50ZXh0IDogeyAqKC50ZXh0KSB9Cj4g
PiArICAucm9kYXRhIDogeyAqKC5yb2RhdGEpIH0KPiA+ICsgIC5kYXRhIDogeyAqKC5kYXRhKSB9
Cj4gPiArICAuYnNzIDogeyAqKC5ic3MpIH0KPiA+ICsgIF9lbmQgPSAuOwo+ID4gK30KPiAKPiBJ
cyB0aGlzIHJlYWxseSBzdWZmaWNpZW50PyBJaXJjIHRoZSBjb21waWxlciBjb3VsZCBjcmVhdGUg
cXVpdGUgYSBmZXcKPiBtb3JlIHZhcmlhbnRzIG9mIHRoZSBzZWN0aW9ucyBuYW1lZCBhYm92ZSwg
bGlrZSAucm9kYXRhLnN0ciogb3IKPiAudGV4dC5jb2xkLiBIZW5jZSBhdCB0aGUgdmVyeSBsZWFz
dCBJJ2QgZXhwZWN0IC48c2VjdGlvbj4gb24gdGhlCj4gcmlnaHQgc2lkZXMgYWJvdmUgdG8gYmUg
YWNjb21wYW5pZWQgYnkgLjxzZWN0aW9uPi4qIC4KClJpZ2h0LCBBVE0gdGhlIGNvbXBpbGVyIEkn
bSB1c2luZyBkb2Vzbid0IGdlbmVyYXRlIGFueSBvZiB0aG9zZSwgYnV0CnlvdSBhcmUgY29ycmVj
dCB0aGF0IHRoaXMgY291bGQgYmUgdGhlIGNhc2UuCgpEbyB5b3UgaGF2ZSBhIHByZWZlcmVuY2Ug
Zm9yIGFkZGluZyAuPHNlY3Rpb24+LiogaW5zdGVhZCBvZiBqdXN0IHVzaW5nCmEgc2luZ2xlIC48
c2VjdGlvbj4qPwoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
