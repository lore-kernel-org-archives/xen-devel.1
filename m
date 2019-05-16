From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] coverage: GCC coverage libfdt Makefile fix
Date: Thu, 16 May 2019 12:30:25 +0100
Message-ID: <f58548ce-ceef-9fce-05ba-db8da91277f7@citrix.com>
References: <20190516111354.15195-1-viktor.mitin.19@gmail.com>
 <20190516112638.GX2798@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/Nh3=TQ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hREar-0002O8-Ej
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 11:30:37 +0000
In-Reply-To: <20190516112638.GX2798@zion.uk.xensource.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>, Viktor Mitin <viktor.mitin.19@gmail.com>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

T24gMTYvMDUvMjAxOSAxMjoyNiwgV2VpIExpdSB3cm90ZToKPiBPbiBUaHUsIE1heSAxNiwgMjAx
OSBhdCAwMjoxMzo1NFBNICswMzAwLCBWaWt0b3IgTWl0aW4gd3JvdGU6Cj4+IFRoZSBwYXRjaCBy
ZXNvbHZlcyAneGVuY292JyBjcmFzaGVzIGluIGNhc2Ugb2YgQWFyY2g2NC4KPj4KPj4gQWxsIHRo
ZSAuaW5pdC4qIHNlY3Rpb25zIGFyZSBzdHJpcHBlZCBhZnRlciBib290LAo+PiBpdCBtZWFucyB0
aGF0IGFueXRoaW5nIGluIC5pbml0LmRhdGEgY2Fubm90IGJlIGFjY2Vzc2VkIGFueW1vcmUuCj4+
IFRoZSBidWlsZCBzeXN0ZW0gZXhwbGljaXRseSBjb21waWxlcyBhbnkgLmluaXQgYmluYXJ5IHdp
dGhvdXQgZ2NvdiBvcHRpb24uCj4+IFRoZSBwcm9ibGVtIGlzIGNvbWluZyBmcm9tIGxpYmZkdC4K
Pj4gVGhlIGVudGlyZSBsaWJyYXJ5IGlzIG1vdmVkIHRvIC5pbml0IHVzaW5nOgo+PiAkKE9CSkNP
UFkpICQoZm9yZWFjaCBzLCQoU0VDVElPTlMpLC0tcmVuYW1lLXNlY3Rpb24gLiQocyk9LmluaXQu
JChzKSkgJDwgJEAKPj4gU28gd2UgbmVlZCB0byB0ZWxsIHRoZSB0b3AgTWFrZWZpbGUgdG8gZmls
dGVyIG91dCBsaWJmZHQuCj4+Cj4+IFJlcG9ydGVkLWJ5OiBWaWt0b3IgTWl0aW4gPHZpa3Rvci5t
aXRpbi4xOUBnbWFpbC5jb20+Cj4+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVu
LmdyYWxsQGFybS5jb20+Cj4+IFRlc3RlZC1ieTogVmlrdG9yIE1pdGluIDx2aWt0b3IubWl0aW4u
MTlAZ21haWwuY29tPgo+IFJldmlld2VkLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29t
Pgo+Cj4gQWx0aG91Z2ggSSB3b3VsZCBsaWtlIHRvIGFzayB5b3UgdG8gYWRqdXN0IHRoZSBzdWJq
ZWN0IHRvIGJlIG1vcmUKPiBzcGVjaWZpYzoKPgo+ICAgY292ZXJhZ2U6IGZpbHRlciBvdXQgbGli
ZmR0Lm8KPgo+IGlmIHlvdSBhZ3JlZSwgdGhpcyBjYW4gYmUgZG9uZSB3aGlsZSBjb21taXR0aW5n
LgoKKzEKCkFja2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29t
PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
