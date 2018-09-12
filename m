From: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Subject: Re: [PATCH v8 3/6] iommu: make iommu_inclusive_mapping
 a suboption of dom0-iommu
Date: Wed, 12 Sep 2018 18:59:17 +0700
Message-ID: <60a67472-c7de-1009-1afb-b920a14ddecf@amd.com>
References: <20180907090739.56652-1-roger.pau@citrix.com>
 <20180907090739.56652-4-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=9skb=l2=amd.com=suravee.suthikulpanit@srs-us1.protection.inumbo.net>)
 id 1g03nz-0000Hf-CK
 for xen-devel@lists.xenproject.org; Wed, 12 Sep 2018 11:59:35 +0000
In-Reply-To: <20180907090739.56652-4-roger.pau@citrix.com>
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
Cc: Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Brian Woods <brian.woods@amd.com>
List-Id: xen-devel@lists.xenproject.org

CgpPbiA5LzcvMTggNDowNyBQTSwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IEludHJvZHVjZSBh
IG5ldyBkb20wLWlvbW11PW1hcC1pbmNsdXNpdmUgZ2VuZXJpYyBvcHRpb24gdGhhdAo+IHN1cGVy
c2VkZXMgaW9tbXVfaW5jbHVzaXZlX21hcHBpbmcuIFRoZSBwcmV2aW91cyBiZWhhdmlvciBpcyBw
cmVzZXJ2ZWQKPiBhbmQgdGhlIG9wdGlvbiBzaG91bGQgb25seSBiZSBlbmFibGVkIGJ5IGRlZmF1
bHQgb24gSW50ZWwgaGFyZHdhcmUuCj4gCj4gU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7D
qTxyb2dlci5wYXVAY2l0cml4LmNvbT4KPiBSZXZpZXdlZC1ieTogUGF1bCBEdXJyYW50PHBhdWwu
ZHVycmFudEBjaXRyaXguY29tPgo+IFJldmlld2VkLWJ5OiBKYW4gQmV1bGljaDxqYmV1bGljaEBz
dXNlLmNvbT4KPiBSZXZpZXdlZC1ieTogS2V2aW4gVGlhbjxrZXZpbi50aWFuQGludGVsLmNvbT4K
PiAtLS0KPiBDaGFuZ2VzIHNpbmNlIHY3Ogo+ICAgLSBVc2UgLTEsIDAsIDEgaW4gaW9tbXVfaHdk
b21faW5jbHVzaXZlLgo+ICAgLSBQcmludCBhIHdhcm5pbmcgbWVzc2FnZSBpZiBtYXAtaW5jbHVz
aXZlIGlzIHNldCBvbiBBUk0uCj4gCj4gQ2hhbmdlcyBzaW5jZSB2NDoKPiAgIC0gVXNlIGFuIGlm
IHRvIHNldCB0aGUgZGVmYXVsdCBvcHRpb24gdmFsdWUuCj4gICAtIFNldCB0aGUgb3B0aW9uIHRv
IGZhbHNlIHVuY29uZGl0aW9uYWxseSBvbiBBUk0uCj4gCj4gQ2hhbmdlcyBzaW5jZSB2MjoKPiAg
IC0gRml4IHR5cG8gaW4gY29tbWl0IG1lc3NhZ2UuCj4gICAtIENoYW5nZSBzdHlsZSBhbmQgdGV4
dCBvZiB0aGUgZG9jdW1lbnRhdGlvbiBpbiB4ZW4gY29tbWFuZCBsaW5lLgo+ICAgLSBTZXQgdGhl
IGRlZmF1bHRzIGluIHtpbnRlbC9hbWR9X2lvbW11X2h3ZG9tX2luaXQgZm9yIGluY2x1c2l2ZS4K
PiAgIC0gUmUtYWRkIHRoZSBpb21tdV9kb20wX3Bhc3N0aHJvdWdoIHx8ICFpc19wdl9kb21haW4o
ZCkgY2hlY2suCj4gCj4gQ2hhbmdlcyBzaW5jZSB2MToKPiAgIC0gVXNlIGRvbTAtaW9tbXUgaW5z
dGVhZCBvZiB0aGUgaW9tbXUgb3B0aW9uLgo+ICAgLSBPbmx5IGVuYWJsZSBieSBkZWZhdWx0IG9u
IEludGVsIGhhcmR3YXJlLgo+IC0tLQo+IENjOiBBbmRyZXcgQ29vcGVyPGFuZHJldy5jb29wZXIz
QGNpdHJpeC5jb20+Cj4gQ2M6IEdlb3JnZSBEdW5sYXA8R2VvcmdlLkR1bmxhcEBldS5jaXRyaXgu
Y29tPgo+IENjOiBJYW4gSmFja3NvbjxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgo+IENjOiBK
YW4gQmV1bGljaDxqYmV1bGljaEBzdXNlLmNvbT4KPiBDYzogSnVsaWVuIEdyYWxsPGp1bGllbi5n
cmFsbEBhcm0uY29tPgo+IENjOiBLb25yYWQgUnplc3p1dGVrIFdpbGs8a29ucmFkLndpbGtAb3Jh
Y2xlLmNvbT4KPiBDYzogU3RlZmFubyBTdGFiZWxsaW5pPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+
Cj4gQ2M6IFRpbSBEZWVnYW48dGltQHhlbi5vcmc+Cj4gQ2M6IFdlaSBMaXU8d2VpLmxpdTJAY2l0
cml4LmNvbT4KPiBDYzogU3VyYXZlZSBTdXRoaWt1bHBhbml0PHN1cmF2ZWUuc3V0aGlrdWxwYW5p
dEBhbWQuY29tPgo+IENjOiBCcmlhbiBXb29kczxicmlhbi53b29kc0BhbWQuY29tPgo+IENjOiBL
ZXZpbiBUaWFuPGtldmluLnRpYW5AaW50ZWwuY29tPgoKRm9yIEFNRC1yZWxhdGVkIGNoYW5nZXMu
CgpBY2tlZC1ieTogU3VyYXZlZSBTdXRoaWt1bHBhbml0IDxzdXJhdmVlLnN1dGhpa3VscGFuaXRA
YW1kLmNvbT4KClRoYW5rIHlvdSwKU3VyYXZlZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
