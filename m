From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 12/34] x86/pt: only call some functions for
 HVM guests
Date: Wed, 22 Aug 2018 18:08:24 +0100
Message-ID: <20180822170824.cdbgipejcar7marn@citrix.com>
References: <cover.f5351150954129956fcf53a7781206b6295df78d.1534518694.git-series.wei.liu2@citrix.com>
 <b576d7d5e5f5baa54a8152cafceb9181d13e02ce.1534518694.git-series.wei.liu2@citrix.com>
 <5B7AB8BA02000078001E00BF@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=om3v=lf=citrix.com=prvs=7650e4d92=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fsWcO-0000Yd-ME
 for xen-devel@lists.xenproject.org; Wed, 22 Aug 2018 17:08:28 +0000
Content-Disposition: inline
In-Reply-To: <5B7AB8BA02000078001E00BF@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBBdWcgMjAsIDIwMTggYXQgMDY6NDg6NThBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDE3LjA4LjE4IGF0IDE3OjEyLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gCj4gQWNjb3JkaW5nIHRvIHlvdXIgZWFybGllciBwYXRjaCwgaGFzX3ZsYXBpYygpIGlt
cGxpZXMgaXNfaHZtX2RvbWFpbigpLAo+IHNvIGlmIGFueXRoaW5nIGlzIHRvIGJlIG1vdmVkIHRv
IHRoZSBjYWxsZXIsIHRoZW4gaGFzX3ZsYXBpYygpIChhbmQKPiBpc19odm1fZG9tYWluKCkgd291
bGQgdGhlbiB0byBiZSBkcm9wcGVkIGFsdG9nZXRoZXIpLiBIb3dldmVyLAo+IHRoaXMgaXMgYWdh
aW4gYSBjYXNlIHdoZXJlIEknbSBub3Qgc3VyZSB3aGV0aGVyIGFkZGluZyAvIGV4dGVuZGluZwo+
IGlmKCktcyBhcm91bmQgY2FsbHMgaXMgaW5kZWVkIHByZWZlcmFibGUgb3ZlciBhZGRpbmcgc3Rh
dGljIGlubGluZSBzdHVicy4KPiBQZXJoYXBzIGZvciB0aGUgc3BlY2lmaWMgb25lIGhlcmUgZWl0
aGVyIHZhcmlhbnQgaXMgYWJvdXQgYXMgbXVjaCAob3IKPiBhcyBsaXR0bGUpIGNvZGUgY2h1cm4s
IGJ1dCBmb3IgdGhlIFBJIGhvb2tzIGZ1bmN0aW9ucyBJIHRoaW5rIHRoZSBzdHViCj4gYXBwcm9h
Y2ggbWlnaHQgYmUgc2xpZ2h0bHkgYmV0dGVyLgoKT0suIEkgd2lsbCBwdXQgdG9nZXRoZXIgc29t
ZSBzdHVicy4KCldlaS4KCj4gCj4gSmFuCj4gCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
