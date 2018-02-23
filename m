From: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH v3 1/2] x86/hvm: introduce cr{0,
 4}_host_mask to store trapped bits of CR accesses
Date: Fri, 23 Feb 2018 04:58:10 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19101533E@SHSMSX101.ccr.corp.intel.com>
References: <20180220085647.25459-1-roger.pau@citrix.com>
 <20180220085647.25459-2-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=af6p=fr=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1ep5R2-0001nH-PL
 for xen-devel@lists.xenproject.org; Fri, 23 Feb 2018 04:58:16 +0000
In-Reply-To: <20180220085647.25459-2-roger.pau@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "Nakajima, Jun" <jun.nakajima@intel.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Jan Beulich <jbeulich@suse.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
List-Id: xen-devel@lists.xenproject.org

PiBGcm9tOiBSb2dlciBQYXUgTW9ubmUgW21haWx0bzpyb2dlci5wYXVAY2l0cml4LmNvbV0NCj4g
U2VudDogVHVlc2RheSwgRmVicnVhcnkgMjAsIDIwMTggNDo1NyBQTQ0KPiANCj4gQXQgdGhlIG1v
bWVudCB0aGlzIGlzIGN1cnJlbnRseSBzZXQgYXQgVk1De1MvQn0gY3JlYXRpb24gYW5kIG5vdCBj
aGFuZ2VkLA0KPiBidXQgZnVydGhlciBwYXRjaGVzIGFyZSBnb2luZyB0byBjaGFuZ2UgdGhlIENS
NCBtYXNrIGF0IHJ1bnRpbWUuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOp
IDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCg0KUmV2aWV3ZWQtYnk6IEtldmluIFRpYW4gPGtldmlu
LnRpYW5AaW50ZWwuY29tPg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
