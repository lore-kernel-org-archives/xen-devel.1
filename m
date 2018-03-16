From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 45/45] ARM: VGIC: wire new VGIC(-v2)
 files into Xen build system
Date: Fri, 16 Mar 2018 05:32:07 -0600
Message-ID: <5AABB94702000078001B2B61@prv-mh.provo.novell.com>
References: <20180315203050.19791-1-andre.przywara@linaro.org>
 <20180315203050.19791-46-andre.przywara@linaro.org>
 <5AABAF2A02000078001B2A6C@prv-mh.provo.novell.com>
 <ff913871-5d38-30c0-11d5-3321fa494e96@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=krzt=gg=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ewnaj-0005vJ-MN
 for xen-devel@lists.xenproject.org; Fri, 16 Mar 2018 11:32:09 +0000
In-Reply-To: <ff913871-5d38-30c0-11d5-3321fa494e96@linaro.org>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andre Przywara <andre.przywara@linaro.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE2LjAzLjE4IGF0IDEyOjEwLCA8YW5kcmUucHJ6eXdhcmFAbGluYXJvLm9yZz4gd3Jv
dGU6Cj4gT24gMTYvMDMvMTggMTA6NDgsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAxNS4w
My4xOCBhdCAyMTozMCwgPGFuZHJlLnByenl3YXJhQGxpbmFyby5vcmc+IHdyb3RlOgo+Pj4gLS0t
IGEveGVuL2NvbW1vbi9NYWtlZmlsZQo+Pj4gKysrIGIveGVuL2NvbW1vbi9NYWtlZmlsZQo+Pj4g
QEAgLTE5LDYgKzE5LDcgQEAgb2JqLXkgKz0ga2V5aGFuZGxlci5vCj4+PiAgb2JqLSQoQ09ORklH
X0tFWEVDKSArPSBrZXhlYy5vCj4+PiAgb2JqLSQoQ09ORklHX0tFWEVDKSArPSBraW1hZ2Uubwo+
Pj4gIG9iai15ICs9IGxpYi5vCj4+PiArb2JqLXkgKz0gbGlzdF9zb3J0Lm8KPj4gCj4+IFdoeSBo
ZXJlIHJhdGhlciB0aGFuIGluIHBhdGNoIDE3PyBBbmQgd2h5IGFsc28gZm9yIHg4Nj8gSSB0aGlu
ayB5b3UKPj4gd2FudCBhIHByb21wdGxlc3MgS2NvbmZpZyBvcHRpb24gdGhhdCBhbiBhcmNoIGNh
biBzZWxlY3QgaWYgaXQgbmVlZHMKPj4gdGhpcyBjb2RlLCB1bmxlc3Mgb3IgdW50aWwgY29tbW9u
IGNvZGUgbWFrZXMgdXNlIG9mIGl0Lgo+IAo+IFllYWgsIEkgaGFkIG9iai0kKENPTkZJR19ORVdf
VkdJQykgYmVmb3JlLCBidXQgSnVsaWVuIGRpc2xpa2VkIGl0Lgo+IFByb21wdGxlc3MgS2NvbmZp
ZyBzb3VuZHMgZ29vZCB0byBtZS4KCkFuZCBub3RlIEknbSBub3QgYXNraW5nIGZvciBhIFZHSUMg
b3B0aW9uLCBidXQgZm9yIGEgTElTVF9TT1JUIG9uZS4KCkphbgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
