From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2 1/2] x86/dom0: rename paging function
Date: Thu, 13 Dec 2018 10:14:56 +0100
Message-ID: <20181213091456.7wocasd422zs5u6y@mac>
References: <5C0FD8B40200007800205267@prv1-mh.provo.novell.com>
 <20181212091455.xziv2gbsswljlur2@mac>
 <5C10DA96020000780020560C@prv1-mh.provo.novell.com>
 <20181212100407.j5hg4vqi2l4kjvsk@mac>
 <5C10E3D5020000780020564D@prv1-mh.provo.novell.com>
 <20181212155608.nujhjevz2yyqfjdw@mac>
 <5C11340D02000078002058FA@prv1-mh.provo.novell.com>
 <20181212170519.remicvdevdl6r65n@mac>
 <3F7E1F6E020000A10063616D@prv1-mh.provo.novell.com>
 <5C120E030200007800205B30@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cbg8=OW=citrix.com=prvs=878bab526=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gXN5G-0000vM-GJ
 for xen-devel@lists.xenproject.org; Thu, 13 Dec 2018 09:15:06 +0000
Content-Disposition: inline
In-Reply-To: <5C120E030200007800205B30@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, andrei.semenov@bertin.fr, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBEZWMgMTMsIDIwMTggYXQgMTI6NDU6MDdBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDEyLjEyLjE4IGF0IDE4OjA1LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gT24gV2VkLCBEZWMgMTIsIDIwMTggYXQgMDk6MTU6MDlBTSAtMDcwMCwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4gPj4gVGhlIE1NSU8gc2lkZSBvZiB0aGluZ3Mgb2YgY291cnNlIHN0aWxs
IHJlbWFpbnMgdW5jbGVhci4KPiA+IAo+ID4gUmlnaHQsIGZvciB0aGUgTU1JTyBhbmQgdGhlIGhh
bmRsaW5nIG9mIGdyYW50IGFuZCBmb3JlaWduIG1hcHBpbmdzIGl0J3MKPiA+IG5vdCBjbGVhciBo
b3cgd2Ugd2FudCB0byBwcm9jZWVkLgo+ID4gCj4gPiBNYXliZSBhY2NvdW50IGZvciBhbGwgaG9z
dCBSQU0gKHRvdGFsX3BhZ2VzKSBwbHVzIE1NSU8gQkFScz8KPiAKPiBXZWxsLCBJIHRob3VnaHQg
d2UndmUgYWxyZWFkeSBzZXR0bGVkIG9uIGl0IGJlaW5nIGltcG9zc2libGUgdG8KPiBhY2NvdW50
IGZvciBhbGwgTU1JTyBCQVJzIGF0IHRoaXMgcG9pbnQuCgpXZWxsLCBJIGNvdWxkIGl0ZXJhdGUg
b3ZlciBhbGwgdGhlIHJlZ2lzdGVyZWQgUENJIGRldmljZXMgYW5kIHNpemUKdGhlIEJBUnMgKHdp
dGhvdXQgVkYgQkFScyBhdCBsZWFzdCBpbml0aWFsbHkpLiBUaGlzIGlzIHF1aXRlCmN1bWJlcnNv
bWUsIG15IG90aGVyIG9wdGlvbiB3b3VsZCBiZSB1c2luZyBtYXhfcGFnZSBhbmQgaG9wZSB0aGF0
CnRoZXJlIGFyZSBlbm91Z2ggaG9sZXMgdG8gbWFrZSB1cCBmb3IgQkFSIE1NSU8gcmVnaW9ucy4K
ClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
