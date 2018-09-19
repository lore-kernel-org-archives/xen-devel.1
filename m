From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v11 7/7] vtd: add lookup_page method to
 iommu_ops
Date: Wed, 19 Sep 2018 17:24:41 +0100
Message-ID: <20180919162441.32brq7a6k2vm6pun@zion.uk.xensource.com>
References: <20180919083602.8201-1-paul.durrant@citrix.com>
 <20180919083602.8201-8-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=wwm0=mb=citrix.com=prvs=79313d28f=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1g2fHV-0005o3-Ke
 for xen-devel@lists.xenproject.org; Wed, 19 Sep 2018 16:24:49 +0000
Content-Disposition: inline
In-Reply-To: <20180919083602.8201-8-paul.durrant@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, George Dunlap <george.dunlap@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBTZXAgMTksIDIwMTggYXQgMDk6MzY6MDJBTSArMDEwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IFRoaXMgcGF0Y2ggYWRkcyBhIG5ldyBtZXRob2QgdG8gdGhlIFZULWQgSU9NTVUgaW1w
bGVtZW50YXRpb24gdG8gZmluZCB0aGUKPiBNRk4gY3VycmVudGx5IG1hcHBlZCBieSB0aGUgc3Bl
Y2lmaWVkIERGTiBhbG9uZyB3aXRoIGEgd3JhcHBlciBmdW5jdGlvbgo+IGluIGdlbmVyaWMgSU9N
TVUgY29kZSB0byBjYWxsIHRoZSBpbXBsZW1lbnRhdGlvbiBpZiBpdCBleGlzdHMuCj4gCj4gTk9U
RTogVGhpcyBwYXRjaCBvbmx5IGFkZHMgYSBYZW4taW50ZXJuYWwgaW50ZXJmYWNlLiBUaGlzIHdp
bGwgYmUgdXNlZCBieQo+ICAgICAgIGEgc3Vic2VxdWVudCBwYXRjaC4KPiAgICAgICBBbm90aGVy
IHN1YnNlcXVlbnQgcGF0Y2ggd2lsbCBhZGQgc2ltaWxhciBmdW5jdGlvbmFsaXR5IGZvciBBTUQK
PiAgICAgICBJT01NVXMuCj4gCj4gU2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxwYXVsLmR1
cnJhbnRAY2l0cml4LmNvbT4KPiBSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1
c2UuY29tPgo+IFJldmlld2VkLWJ5OiBLZXZpbiBUaWFuIDxrZXZpbi50aWFuQGludGVsLmNvbT4K
ClJldmlld2VkLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
