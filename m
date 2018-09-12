From: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Subject: Re: [PATCH v8 1/6] iommu: rename iommu_dom0_strict and
 iommu_passthrough
Date: Wed, 12 Sep 2018 18:53:38 +0700
Message-ID: <0e0d2cf7-5fd7-10a0-ad9e-250501bad292@amd.com>
References: <20180907090739.56652-1-roger.pau@citrix.com>
 <20180907090739.56652-2-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=9skb=l2=amd.com=suravee.suthikulpanit@srs-us1.protection.inumbo.net>)
 id 1g03ih-0008Td-LJ
 for xen-devel@lists.xenproject.org; Wed, 12 Sep 2018 11:54:08 +0000
In-Reply-To: <20180907090739.56652-2-roger.pau@citrix.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Kevin Tian <kevin.tian@intel.com>, Brian Woods <brian.woods@amd.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

Um9nZXIsCgpPbiA5LzcvMTggNDowNyBQTSwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IFRvIGlv
bW11X2h3ZG9tX3N0cmljdCBhbmQgaW9tbXVfaHdkb21fcGFzc3Rocm91Z2ggd2hpY2ggaXMgbW9y
ZQo+IGRlc2NyaXB0aXZlIG9mIHRoZWlyIHVzYWdlLiBBbHNvIGNoYW5nZSB0aGVpciB0eXBlIGZy
b20gYm9vbF90IHRvCj4gYm9vbC4KPiAKPiBObyBmdW5jdGlvbmFsIGNoYW5nZS4KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+IFJldmll
d2VkLWJ5OiBKYW4gQmV1bGljaDxqYmV1bGljaEBzdXNlLmNvbT4KPiBSZXZpZXdlZC1ieTogS2V2
aW4gVGlhbjxrZXZpbi50aWFuQGludGVsLmNvbT4KPiBSZXZpZXdlZC1ieTogV2VpIExpdTx3ZWku
bGl1MkBjaXRyaXguY29tPgo+IC0tLQo+IENjOiBKYW4gQmV1bGljaDxqYmV1bGljaEBzdXNlLmNv
bT4KPiBDYzogQW5kcmV3IENvb3BlcjxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+IENjOiBT
dXJhdmVlIFN1dGhpa3VscGFuaXQ8c3VyYXZlZS5zdXRoaWt1bHBhbml0QGFtZC5jb20+Cj4gQ2M6
IEJyaWFuIFdvb2RzPGJyaWFuLndvb2RzQGFtZC5jb20+Cj4gQ2M6IEtldmluIFRpYW48a2V2aW4u
dGlhbkBpbnRlbC5jb20+Cj4gLS0tCj4gQ2hhbmdlcyBzaW5jZSB2NToKPiAgIC0gUmVtb3ZlIHVu
bmVlZGVkICEhLgo+IAo+IENoYW5nZXMgc2luY2UgdjQ6Cj4gICAtIE5ldyBpbiB0aGlzIHZlcnNp
b24KQWNrZWQtYnk6IFN1cmF2ZWUgU3V0aGlrdWxwYW5pdCA8c3VyYXZlZS5zdXRoaWt1bHBhbml0
QGFtZC5jb20+CgpUaGFuayB5b3UsClN1cmF2ZWUKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
