From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v2 01/11] vpci: move lock
Date: Thu, 6 Sep 2018 10:57:07 +0100
Message-ID: <20180906095707.cyjinw2bmxppm5t7@zion.uk.xensource.com>
References: <20180717094830.54806-1-roger.pau@citrix.com>
 <20180717094830.54806-2-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=xusr=lu=citrix.com=prvs=7806f00aa=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fxr2F-0000EF-U6
 for xen-devel@lists.xenproject.org; Thu, 06 Sep 2018 09:57:11 +0000
Content-Disposition: inline
In-Reply-To: <20180717094830.54806-2-roger.pau@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBKdWwgMTcsIDIwMTggYXQgMTE6NDg6MjBBTSArMDIwMCwgUm9nZXIgUGF1IE1vbm5l
IHdyb3RlOgo+IFRvIHRoZSBvdXRzaWRlIG9mIHRoZSB2cGNpIHN0cnVjdC4gVGhpcyB3YXkgdGhl
IGxvY2sgY2FuIGJlIHVzZWQgdG8KPiBjaGVjayB3aGV0aGVyIHZwY2kgaXMgcHJlc2VudCwgYW5k
IHJlbW92YWwgY2FuIGJlIHBlcmZvcm1lZCB3aGlsZQo+IGhvbGRpbmcgdGhlIGxvY2ssIGluIG9y
ZGVyIHRvIG1ha2Ugc3VyZSB0aGVyZSBhcmUgbm8gYWNjZXNzZXMgdG8gdGhlCj4gY29udGVudHMg
b2YgdGhlIHZwY2kgc3RydWN0LiBQcmV2aW91c2x5IHJlbW92YWwgY291bGQgcmFjZSB3aXRoCj4g
dnBjaV9yZWFkIGZvciBleGFtcGxlLCBzaW5jZSB0aGUgbG9jayB3YXMgZHJvcHBlZCBwcmlvciB0
byBmcmVlaW5nCj4gcGRldi0+dnBjaS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9u
bsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KClJldmlld2VkLWJ5OiBXZWkgTGl1IDx3ZWkubGl1
MkBjaXRyaXguY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
