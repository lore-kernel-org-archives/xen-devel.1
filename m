From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v1] Increase framebuffer size to todays
 standards
Date: Mon, 26 Nov 2018 03:31:27 -0700
Message-ID: <5BFBCB7F02000078001FFD9B@prv1-mh.provo.novell.com>
References: <20181125191405.3028-1-olaf@aepfle.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=azgn=of=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gREAt-000465-ON
 for xen-devel@lists.xenproject.org; Mon, 26 Nov 2018 10:31:31 +0000
In-Reply-To: <20181125191405.3028-1-olaf@aepfle.de>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI1LjExLjE4IGF0IDIwOjE0LCA8b2xhZkBhZXBmbGUuZGU+IHdyb3RlOgo+IE15IG5v
dGVib29rIHJlcG9ydHMgYSBkaXNwbGF5IHNpemUgb2YgMTkyMHgxMDgwOgo+IAo+IChYRU4pIHZl
c2FmYjogZnJhbWVidWZmZXIgYXQgMHhkMDAwMDAwMCwgbWFwcGVkIHRvIDB4ZmZmZjgyYzAwMDIw
MTAwMCwgdXNpbmcgODEyOGssIHRvdGFsIDgxMjhrCj4gKFhFTikgdmVzYWZiOiBtb2RlIGlzIDE5
MjB4MTA4MHgzMiwgbGluZWxlbmd0aD03NjgwLCBmb250IDh4MTYKPiAoWEVOKSB2ZXNhZmI6IFRy
dWVjb2xvcjogc2l6ZT04Ojg6ODo4LCBzaGlmdD0yNDoxNjo4OjAKPiAKPiBUaGUgaGFyZGNvZGVk
IHZhbHVlcyBmZWVsIGFyYml0cmFyeSwgc28ganVzdCBidW1wIHRoZW0gdG8gZml4IG15IHN5c3Rl
bS4KPiBUaGUgZmlsdGVycyBmb3Igbm90ZWJvb2tzIGF0IGh0dHBzOi8vZ2VpemhhbHMuZXUvIGlu
ZGljYXRlIHRoZSB1cHBlcgo+IGxpbWl0IGNvdWxkIGJlIGV2ZW4gbGFyZ2VyLCBsaWtlIDM4NDB4
MjE2MC4KCkFuZCBJIHRoaW5rIGEgY2hhbmdlIGxpa2UgdGhpcyBzaG91bGQgKGEpIGFkZHJlc3Mg
dGhlIG1vcmUgZ2VuZXJhbApjYXNlIHJhdGhlciB0aGFuIGp1c3QgeW91ciBsYXB0b3AgKG9yIGxh
cHRvcHMgaW4gZ2VuZXJhbCkgYW5kIChiKQphY3R1YWxseSBhZGQgc29tZSBoZWFkcm9vbS4gSGVu
Y2UgYXQgdGhlIHZlcnkgbGVhc3QgSSdkIHNlZSB1cwpnbyB0byA0MDk2eDMwNzIuIFdIVVhHQSB3
b3VsZCBldmVuIGNhbGwgZm9yIDc2ODB4NDgwMC4KCj4gRml4ZXMgY29tbWl0IGU3Y2IzNWU4YjFi
OGY4NzJkOTA2ODAwYzcyZjkyZjEwZDcwMWY3OWMgKCJ4ZW46IGludHJvZHVjZSBhIAo+IGdlbmVy
aWMgZnJhbWVidWZmZXIgZHJpdmVyIikKCkkgZG9uJ3QgdGhpbmsgdGhpcyBpcyBhcHByb3ByaWF0
ZSBoZXJlLiBPbmNlIGZ1cnRoZXIgYnVtcGluZyB0dXJucwpvdXQgbmVjZXNzYXJ5LCB3b3VsZCB0
aGF0IHRoZW4gYmUgYSBmaXggdG8geW91ciBjaGFuZ2UgaGVyZT8gQQpwcm9wZXIgImZpeCIgd291
bGQgaW1vIG9ubHkgYmUgdG8gZ2V0IHJpZCBvZiB0aGUgaGFyZCBjb2RlZCB1cHBlcgpib3VuZHMu
IEJ1bXBpbmcgdGhlIGJvdW5kcyBldmVyeSBvbmNlIGluIGEgd2hpbGUgaXMgYW4gZXhwZWN0ZWQK
YWN0aW9uLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
