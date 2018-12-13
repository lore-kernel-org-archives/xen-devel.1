From: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH V2] x86/vm_event: block interrupt injection
 for sync vm_events
Date: Thu, 13 Dec 2018 06:54:31 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19BE9F208@SHSMSX101.ccr.corp.intel.com>
References: <1544457709-24302-1-git-send-email-rcojocaru@bitdefender.com>
 <20181210164938.lcfmhamgdxxc2zbn@mac>
 <7408c2bf-c22e-dfb0-11e8-d7264f2df4e7@bitdefender.com>
 <a8b7b007-1270-b000-b076-757efa338788@bitdefender.com>
 <20181211101450.gmnjax3gnobby3cq@mac>
 <7ea634cc-1683-fa37-6adc-2fd79f28d5c9@bitdefender.com>
 <c30a8dbd-8ff7-bec6-e718-bdadcdef6352@arm.com>
 <a28c6276-0191-1f14-6cb6-b2212c245ef0@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mz2v=OW=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1gXKtK-0001ds-8J
 for xen-devel@lists.xenproject.org; Thu, 13 Dec 2018 06:54:38 +0000
In-Reply-To: <a28c6276-0191-1f14-6cb6-b2212c245ef0@bitdefender.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>, Julien Grall <julien.grall@arm.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, "tamas@tklengyel.com" <tamas@tklengyel.com>
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>, "wei.liu2@citrix.com" <wei.liu2@citrix.com>, "Nakajima,
 Jun" <jun.nakajima@intel.com>, "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, "jbeulich@suse.com" <jbeulich@suse.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>, "brian.woods@amd.com" <brian.woods@amd.com>, "suravee.suthikulpanit@amd.com" <suravee.suthikulpanit@amd.com>
List-Id: xen-devel@lists.xenproject.org

PiBGcm9tOiBSYXp2YW4gQ29qb2NhcnUgW21haWx0bzpyY29qb2NhcnVAYml0ZGVmZW5kZXIuY29t
XQ0KPiBTZW50OiBUdWVzZGF5LCBEZWNlbWJlciAxMSwgMjAxOCA4OjMzIFBNDQo+IA0KPiA+IElu
IGFueSBjYXNlLCBJIHRoaW5rIHlvdSB3YW50IHRvIHJlbmFtZSB0aGUgZnVuY3Rpb24gYW5kL29y
IGRvY3VtZW50DQo+ID4gbW9yZSB0aGF0IGV4cGVjdGVkIGJlaGF2aW9yLg0KPiANCj4gWW91J3Jl
IHJpZ2h0LCBJIHNob3VsZCBwcm9iYWJseSByZW5hbWUgdGhhdCBmdW5jdGlvbiAvIHZhcmlhYmxl
IHRvDQo+IGJldHRlciByZWZsZWN0IHdoYXQgaXQgc2lnbmlmaWVzIC0gdGhhdCBzeW5jIHZtX2V2
ZW50IHByb2Nlc3NpbmcgaXMgaW4NCj4gcHJvZ3Jlc3MuIEZvciBWTVggYW5kIFNWTSwgdGhhdCBz
aW1wbHkgbWVhbnMgdGhhdCBpbnRlcnJ1cHRzIHdpbGwgYmUNCj4gYmxvY2tlZCwgYW5kIHRoZSB2
YWx1ZSBvZiB0aGUgdmFyaWFibGUgd2lsbCBiZSBjb3JyZWN0IGFuZCBwb3NzaWJseQ0KPiB1c2Vm
dWwgZm9yIEFSTSBhcyB3ZWxsLg0KPiANCg0Kd2hhdCBhYm91dCB2bV9ldmVudF9ibG9ja19pbnRl
cnJ1cHRfaW5qZWN0aW9uPyBpbiB0aGF0IGNhc2UNCml0J3MgaW5qZWN0aW9uIGluc3RlYWQgb2Yg
aW50ZXJydXB0IGl0c2VsZiBiZWluZyBibG9ja2VkLiBibG9ja2luZw0KaW5qZWN0aW9uIHNob3Vs
ZCBtZWFuIHNhbWUgdGhpbmcgY3Jvc3MgYXJjaHM/DQoNClRoYW5rcw0KS2V2aW4NCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
