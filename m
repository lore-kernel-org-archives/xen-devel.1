From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v11 01/12] vpci: introduce basic handlers to
 trap accesses to the PCI config space
Date: Wed, 21 Mar 2018 04:39:28 +0000
Message-ID: <07a6201a-8533-6c5d-3c6e-063c860bdcf7@arm.com>
References: <20180320151543.84348-1-roger.pau@citrix.com>
 <20180320151543.84348-2-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=kbl4=gl=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1eyVXH-00064Y-KO
 for xen-devel@lists.xenproject.org; Wed, 21 Mar 2018 04:39:39 +0000
In-Reply-To: <20180320151543.84348-2-roger.pau@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiAwMy8yMC8yMDE4IDAzOjE1IFBNLCBSb2dlciBQYXUgTW9ubmUgd3JvdGU6Cj4gVGhp
cyBmdW5jdGlvbmFsaXR5IGlzIGdvaW5nIHRvIHJlc2lkZSBpbiB2cGNpLmMgKGFuZCB0aGUgY29y
cmVzcG9uZGluZwo+IHZwY2kuaCBoZWFkZXIpLCBhbmQgc2hvdWxkIGJlIGFyY2gtYWdub3N0aWMu
IFRoZSBoYW5kbGVycyBpbnRyb2R1Y2VkCj4gaW4gdGhpcyBwYXRjaCBzZXR1cCB0aGUgYmFzaWMg
ZnVuY3Rpb25hbGl0eSByZXF1aXJlZCBpbiBvcmRlciB0byB0cmFwCj4gYWNjZXNzZXMgdG8gdGhl
IFBDSSBjb25maWcgc3BhY2UsIGFuZCBhbGxvdyBkZWNvZGluZyB0aGUgYWRkcmVzcyBhbmQKPiBm
aW5kaW5nIHRoZSBjb3JyZXNwb25kaW5nIGhhbmRsZXIgdGhhdCBzaG91bGQgaGFuZGxlIHRoZSBh
Y2Nlc3MKPiAoYWx0aG91Z2ggbm8gaGFuZGxlcnMgYXJlIGltcGxlbWVudGVkKS4KPiAKPiBOb3Rl
IHRoYXQgdGhlIHRyYXBzIHRvIHRoZSBQQ0kgSU8gcG9ydHMgcmVnaXN0ZXJzICgweGNmOC8weGNm
YykgYXJlCj4gc2V0dXAgaW5zaWRlIG9mIGEgeDg2IEhWTSBmaWxlLCBzaW5jZSB0aGF0J3Mgbm90
IHNoYXJlZCB3aXRoIG90aGVyCj4gYXJjaGVzLgo+IAo+IEEgbmV3IFhFTl9YODZfRU1VX1ZQQ0kg
eDg2IGRvbWFpbiBmbGFnIGlzIGFkZGVkIGluIG9yZGVyIHRvIHNpZ25hbCBYZW4KPiB3aGV0aGVy
IGEgZG9tYWluIHNob3VsZCB1c2UgdGhlIG5ld2x5IGludHJvZHVjZWQgdlBDSSBoYW5kbGVycywg
dGhpcwo+IGlzIG9ubHkgZW5hYmxlZCBmb3IgUFZIIERvbTAgYXQgdGhlIG1vbWVudC4KPiAKPiBB
IHZlcnkgc2ltcGxlIHVzZXItc3BhY2UgdGVzdCBpcyBhbHNvIHByb3ZpZGVkLCBzbyB0aGF0IHRo
ZSBiYXNpYwo+IGZ1bmN0aW9uYWxpdHkgb2YgdGhlIHZQQ0kgdHJhcHMgY2FuIGJlIGFzc2VydGVk
LiBUaGlzIGhhcyBiZWVuIHByb3Zlbgo+IHF1aXRlIGhlbHBmdWwgZHVyaW5nIGRldmVsb3BtZW50
LCBzaW5jZSB0aGUgbG9naWMgdG8gaGFuZGxlIHBhcnRpYWwKPiBhY2Nlc3NlcyBvciBhY2Nlc3Nl
cyB0aGF0IGV4cGFuZCBhY3Jvc3MgbXVsdGlwbGUgcmVnaXN0ZXJzIGlzIG5vdAo+IHRyaXZpYWwu
Cj4gCj4gVGhlIGhhbmRsZXJzIGZvciB0aGUgcmVnaXN0ZXJzIGFyZSBhZGRlZCB0byBhIGxpbmtl
ZCBsaXN0IHRoYXQncyBrZWVwCj4gc29ydGVkIGF0IGFsbCB0aW1lcy4gQm90aCB0aGUgcmVhZCBh
bmQgd3JpdGUgaGFuZGxlcnMgc3VwcG9ydCBhY2Nlc3Nlcwo+IHRoYXQgZXhwYW5kIGFjcm9zcyBt
dWx0aXBsZSBlbXVsYXRlZCByZWdpc3RlcnMgYW5kIGNvbnRhaW4gZ2FwcyBub3QKPiBlbXVsYXRl
ZC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4
LmNvbT4KPiBSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+IFtJ
TyBwYXJ0c10KPiBSZXZpZXdlZC1ieTogUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRAY2l0cml4
LmNvbT4KCkFja2VkLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgoKQ2hl
ZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
