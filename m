From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 6/9] x86: move memory_type_changed to mm.c
Date: Wed, 08 Aug 2018 03:26:49 -0600
Message-ID: <5B6AB75902000078001DBE12@prv1-mh.provo.novell.com>
References: <cover.3198a0d9ad2683b74afcc86654a244d17cd8795e.1533636027.git-series.wei.liu2@citrix.com>
 <305664028519f455e05c99c9b1a5c580a0f52ecc.1533636027.git-series.wei.liu2@citrix.com>
 <5B69838F02000078001DB82F@prv1-mh.provo.novell.com>
 <20180807161941.qgon4tiytdbehgsf@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=wdim=kx=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fnKk3-0006I8-Jj
 for xen-devel@lists.xenproject.org; Wed, 08 Aug 2018 09:26:55 +0000
In-Reply-To: <20180807161941.qgon4tiytdbehgsf@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA3LjA4LjE4IGF0IDE4OjE5LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
T24gVHVlLCBBdWcgMDcsIDIwMTggYXQgMDU6MzM6MzVBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4+ID4+PiBPbiAwNy4wOC4xOCBhdCAxMjowMCwgPHdlaS5saXUyQGNpdHJpeC5jb20+IHdy
b3RlOgo+PiA+IFRoaXMgZnVuY3Rpb24gaXMgY29tbW9uIHRvIGJvdGggUFYgYW5kIEhWTS4gTW92
ZSBpdCB0byB4ODYgY29tbW9uCj4+ID4gY29kZS4KPj4gCj4+IEknbSBhZnJhaWQgdGhhdCdzIHRo
ZSB3cm9uZyB3YXkgcm91bmQ6IHAybV9tZW1vcnlfdHlwZV9jaGFuZ2VkKCkKPj4gaXMgSFZNIChp
biBmYWN0IEVQVCkgc3BlY2lmaWMuIFRoZSBvbmx5IHVzZXMgb2YgdGhlIGZ1bmN0aW9uIHRoYXQg
YXJlbid0Cj4+IGFscmVhZHkgSFZNLXNwZWNpZmljIGFyZSBmcm9tIGRvbWN0bC5jIGFuZCBmcm9t
IGlvbW11X2NvbnN0cnVjdCgpLAo+PiB5ZXQgSSBkb3VidCB0aGUgZmx1c2hfYWxsKEZMVVNIX0NB
Q0hFKSBoYXMgYW55IHJlbGV2YW5jZSB0aGVyZSBpbgo+PiB0aGUgUFYgY2FzZS4KPiAKPiBZZWFo
LCBJIGdvdCB0aGUgaW1wcmVzc2lvbiB0aGF0IGZsdXNoaW5nIGlzIHJlbGV2YW50IHRvIFBWIGZy
b20gcmVhZGluZwo+IGV4aXN0aW5nIGNvZGUuCgpXZWxsLCBJIHdvdWxkIGhhdmUgdGhvdWdodCBz
byBhcyB3ZWxsLCBidXQgdGhlIGZldyBwbGFjZXMgd2hlcmUgdGhlCmZ1bmN0aW9uIGlzIHBvc3Np
Ymx5IHVzZWQgb24gYSBQViBkb21haW4gYWxsIGRvbid0IGxvb2sgYXMgaWYgdGhlIGNhY2hlCmZs
dXNoIGNvdWxkIG1hdHRlciB0aGVyZSAocXVpdGUgcG9zc2libHkgaXQgY291bGQgZXZlbiBiZSBh
dm9pZGVkIGluCnRob3NlIHNwZWNpZmljIGNhc2VzIGZvciBIVk0sIGF0IHRoZSB2ZXJ5IGxlYXN0
IGluIGlvbW11X2NvbnN0cnVjdCgpKS4KCj4gSWYgaXQgaXMgSFZNIG9ubHkgSSBzdWdnZXN0IHdl
IGFkZCBodm0gcHJlZml4IHRvIGl0IGFuZCBvbmx5IGNhbGwgaXQKPiB3aGVuIHRoZSBkb21haW4g
aW4gcXVlc3Rpb24gaXMgaHZtLiBUaGlzIGZvbGxvd3Mgd2hhdCB3ZSBhbHJlYWR5IGRvIGluCj4g
b3RoZXIgcGxhY2VzLgo+IAo+ICAgIGlmICggaXNfaHZtX2RvbWFpbihkKSApCj4gICAgICAgIGh2
bV9tZW1vcnlfdHlwZV9jaGFuZ2UoLi4uKQoKWWVhaCwgdGhhdCB3b3VsZCBwcm9iYWJseSBiZSBm
aW5lIGlmIHdlIGluZGVlZCBzZXR0bGUgb24gdGhlIGZ1bmN0aW9uCmJlaW5nIG1lYW5pbmdsZXNz
IGZvciBQVi4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
