From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 27/34] x86: make hvm_inject_* functions
 build when !CONFIG_HVM
Date: Fri, 24 Aug 2018 17:27:40 +0100
Message-ID: <20180824162740.2w3jngknccw2kdku@citrix.com>
References: <cover.f5351150954129956fcf53a7781206b6295df78d.1534518694.git-series.wei.liu2@citrix.com>
 <9166a931d5230e28f4677a2305a832e55c833ed0.1534518694.git-series.wei.liu2@citrix.com>
 <20180821083724.dd7k2dcngwlxwj57@mac>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=n8yf=lh=citrix.com=prvs=76773b150=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1ftEwM-0004yu-KH
 for xen-devel@lists.xenproject.org; Fri, 24 Aug 2018 16:28:02 +0000
Content-Disposition: inline
In-Reply-To: <20180821083724.dd7k2dcngwlxwj57@mac>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBBdWcgMjEsIDIwMTggYXQgMTA6Mzc6MjRBTSArMDIwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiBPbiBGcmksIEF1ZyAxNywgMjAxOCBhdCAwNDoxMjo0NVBNICswMTAwLCBXZWkg
TGl1IHdyb3RlOgo+ID4gVGhleSByZWZlcmVuY2UgaHZtX2luamVjdF9ldmVudCB3aGljaCBpcyBI
Vk0gY29kZSAobm90IGNvbXBpbGVkKS4gVGhleQo+ID4gYXJlbid0IHVzZWQgYnkgY29kZSBvdXRz
aWRlIEhWTSBjb2RlIGFueXdheS4KPiAKPiBDYW4geW91IHB1dCBhbGwgdGhlIGZ1bmN0aW9ucyBp
bnNpZGUgb2YgYW4gI2lmZGVmIENPTkZJR19IVk0gaW5zdGVhZAo+IG9mIG1ha2luZyB0aGVtIG5v
LW9wcz8KPiAKPiBUaGFua3MsIFJvZ2VyLgoKVGhpcyBwYXRjaCBoYXMgYmVlbiBkcm9wcGVkIGlu
IG5ldyB2ZXJzaW9uIG9mIHRoZSBzZXJpZXMuCgpXZWkuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
