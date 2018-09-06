From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v3 07/16] x86/p2m/pod: make it build with
 !CONFIG_HVM
Date: Thu, 6 Sep 2018 11:57:58 +0100
Message-ID: <20180906105758.4bym7cj353m3wqjo@zion.uk.xensource.com>
References: <20180904161533.11575-1-wei.liu2@citrix.com>
 <20180904161533.11575-8-wei.liu2@citrix.com>
 <0ffaa5f9-917c-677e-d9b3-e34e1b6d76f8@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=xusr=lu=citrix.com=prvs=7806f00aa=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fxrz8-0005GW-CM
 for xen-devel@lists.xenproject.org; Thu, 06 Sep 2018 10:58:02 +0000
Content-Disposition: inline
In-Reply-To: <0ffaa5f9-917c-677e-d9b3-e34e1b6d76f8@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Tamas K Lengyel <tamas@tklengyel.com>, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBTZXAgMDQsIDIwMTggYXQgMDY6MjQ6MjhQTSArMDEwMCwgSnVsaWVuIEdyYWxsIHdy
b3RlOgo+IEhpIFdlaSwKPiAKPiBPbiAwOS8wNC8yMDE4IDA1OjE1IFBNLCBXZWkgTGl1IHdyb3Rl
Ogo+ID4gUG9wdWxhdGUtb24tZGVtYW5kIGlzIEhWTSBvbmx5Lgo+ID4gCj4gPiBQcm92aWRlIGEg
YnVuY2ggb2Ygc3R1YnMgZm9yIGNvbW1vbiBwMm0gY29kZSBhbmQgZ3VhcmQgb25lIGludm9jYXRp
b24KPiA+IG9mIGd1ZXN0X3BoeXNtYXBfbWFya19wb3B1bGF0ZV9vbl9kZW1hbmQgd2l0aCBpc19o
dm1fZG9tYWluLgo+ID4gCj4gPiBQdXQgcmVsZXZhbnQgZmllbGRzIGluIHAybV9kb21haW4gYW5k
IGNvZGUgd2hpY2ggdG91Y2hlcyB0aG9zZSBmaWVsZHMKPiA+IHVuZGVyIENPTkZJR19IVk0uCj4g
Cj4gQXJtIGRvZXMgbm90IGhhdmUgYW55IFBPRCBzdXBwb3J0LiBXb3VsZCBpdCBiZSB3b3J0aCB0
byBpbnRyb2R1Y2UgYQo+IENPTkZJR19IQVNfUE9EIHRvIGF2b2lkIGR1bW15IGZ1bmN0aW9uIG9u
IEFybT8KClRoYXQgc291bmRzIGZpbmUuIFRoaXMgd2lsbCBoYXZlIHRoZSBlZmZlY3Qgb2Ygbm90
IGNvbXBpbGluZyBQb0Qgb24gQXJtCmF0IGFsbCwgd2hpY2ggaXMgZ29vZC4KCkkgd2lsbCB3YWl0
IGZvciBtb3JlIHJldmlld3MgYmVmb3JlIHJld29ya2luZyB0aGlzIHBhdGNoLgoKV2VpLgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
