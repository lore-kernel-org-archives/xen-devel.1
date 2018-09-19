From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v11 1/7] iommu: introduce the concept of
 DFN...
Date: Wed, 19 Sep 2018 17:17:36 +0100
Message-ID: <20180919161736.ke2anfsrr7rs5oh5@zion.uk.xensource.com>
References: <20180919083602.8201-1-paul.durrant@citrix.com>
 <20180919083602.8201-2-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=wwm0=mb=citrix.com=prvs=79313d28f=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1g2fAf-0004nr-MR
 for xen-devel@lists.xenproject.org; Wed, 19 Sep 2018 16:17:45 +0000
Content-Disposition: inline
In-Reply-To: <20180919083602.8201-2-paul.durrant@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBTZXAgMTksIDIwMTggYXQgMDk6MzU6NTZBTSArMDEwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IC4uLm1lYW5pbmcgJ2RldmljZSBETUEgZnJhbWUgbnVtYmVyJyBpLmUuIGEgZnJhbWUg
bnVtYmVyIG1hcHBlZCBpbiB0aGUgSU9NTVUKPiAocmF0aGVyIHRoYW4gdGhlIE1NVSkgYW5kIGhl
bmNlIHVzZWQgZm9yIERNQSBhZGRyZXNzIHRyYW5zbGF0aW9uLgo+IAo+IFRoaXMgcGF0Y2ggaXMg
YSBsYXJnZWx5IGNvc21ldGljIGNoYW5nZSB0aGF0IHN1YnN0aXR1dGVzIHRoZSB0ZXJtcyAnZ2Zu
Jwo+IGFuZCAnZ2FkZHInIGZvciAnZGZuJyBhbmQgJ2RhZGRyJyBpbiBhbGwgdGhlIHBsYWNlcyB3
aGVyZSB0aGUgZnJhbWUgbnVtYmVyCj4gb3IgYWRkcmVzcyByZWxhdGUgdG8gYSBkZXZpY2UgcmF0
aGVyIHRoYW4gdGhlIENQVS4KPiAKPiBUaGUgcGFydHMgdGhhdCBhcmUgbm90IHB1cmVseSBjb3Nt
ZXRpYyBhcmU6Cj4gCj4gIC0gdGhlIGludHJvZHVjdGlvbiBvZiBhIHR5cGUtc2FmZSBkZWNsYXJh
dGlvbiBvZiBkZm5fdCBhbmQgZGVmaW5pdGlvbiBvZgo+ICAgIElOVkFMSURfREZOIHRvIG1ha2Ug
dGhlIHN1YnN0aXR1dGlvbiBvZiBnZm5feChJTlZBTElEX0dGTikgbWVjaGFuaWNhbC4KPiAgLSB0
aGUgaW50cm9kdWN0aW9uIG9mIF9fZGZuX3RvX2RhZGRyIGFuZCBfX2RhZGRyX3RvX2RmbiAoYW5k
IHR5cGUtc2FmZQo+ICAgIHZhcmlhbnRzIHdpdGhvdXQgdGhlIGxlYWRpbmcgX18pIHdpdGggc29t
ZSB1c2Ugb2YgdGhlIGZvcm1lci4KPiAKPiBTdWJzZXF1ZW50IHBhdGNoZXMgd2lsbCBjb252ZXJ0
IGNvZGUgdG8gbWFrZSB1c2Ugb2YgdHlwZS1zYWZlIERGTnMuCj4gCj4gU2lnbmVkLW9mZi1ieTog
UGF1bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4KPiBBY2tlZC1ieTogSmFuIEJl
dWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+IFJldmlld2VkLWJ5OiBLZXZpbiBUaWFuIDxrZXZp
bi50aWFuQGludGVsLmNvbT4KClJldmlld2VkLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXgu
Y29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
