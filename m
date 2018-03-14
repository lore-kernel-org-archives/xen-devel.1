From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v5 10/16] xen/mm: Switch map_pages_to_xen to
 use MFN typesafe
Date: Wed, 14 Mar 2018 18:40:02 +0000
Message-ID: <faa2696c-c38a-10bc-2ce6-d66ff12494a7@citrix.com>
References: <20180314182009.14274-1-julien.grall@arm.com>
 <20180314182009.14274-11-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180314182009.14274-11-julien.grall@arm.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: julien.grall@arm.com, xen-devel@lists.xen.org
Cc: Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Jan Beulich <jbeulich@suse.com>, Shane Wang <shane.wang@intel.com>, Gang Wei <gang.wei@intel.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTQvMDMvMTggMTg6MjAsIGp1bGllbi5ncmFsbEBhcm0uY29tIHdyb3RlOgo+IEZyb206IEp1
bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cj4KPiBUaGUgY3VycmVudCBwcm90b3R5
cGUgaXMgc2xpZ2h0bHkgY29uZnVzaW5nIGJlY2F1c2UgaXQgdGFrZXMgYSB2aXJ0dWFsCj4gYWRk
cmVzcyBhbmQgYSBwaHlzaWNhbCBmcmFtZSAobm90IGFkZHJlc3MhKS4gU3dpdGNoaW5nIHRvIE1G
TiB3aWxsIGltcHJvdmUKPiBzYWZldHkgYW5kIHJlZHVjZSB0aGUgY2hhbmNlIHRvIG1pc3Rha2Vu
bHkgaW52ZXJ0IHRoZSAyIHBhcmFtZXRlcnMuCj4KPiBBbHNvLCB0YWtlIHRoZSBvcHBvcnR1bml0
eSB0byBzd2l0Y2ggKGEgLSBiKSA+PiBQQUdFX1NISUZUIHRvCj4gUEZOX0RPV04oYSAtIGIpIGlu
IHRoZSBjb2RlIG1vZGlmaWVkLgo+Cj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxp
ZW4uZ3JhbGxAYXJtLmNvbT4KCkFja2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVy
M0BjaXRyaXguY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
