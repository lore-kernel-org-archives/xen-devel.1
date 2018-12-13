From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH V2] x86/vm_event: block interrupt injection
 for sync vm_events
Date: Thu, 13 Dec 2018 10:03:45 +0200
Message-ID: <7fd8e5fe-9fbd-07c3-c27c-1bdec37d078e@bitdefender.com>
References: <1544457709-24302-1-git-send-email-rcojocaru@bitdefender.com>
 <20181210164938.lcfmhamgdxxc2zbn@mac>
 <7408c2bf-c22e-dfb0-11e8-d7264f2df4e7@bitdefender.com>
 <a8b7b007-1270-b000-b076-757efa338788@bitdefender.com>
 <20181211101450.gmnjax3gnobby3cq@mac>
 <7ea634cc-1683-fa37-6adc-2fd79f28d5c9@bitdefender.com>
 <c30a8dbd-8ff7-bec6-e718-bdadcdef6352@arm.com>
 <a28c6276-0191-1f14-6cb6-b2212c245ef0@bitdefender.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19BE9F208@SHSMSX101.ccr.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PwXp=OW=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1gXLyN-0001GE-VD
 for xen-devel@lists.xenproject.org; Thu, 13 Dec 2018 08:03:55 +0000
In-Reply-To: <AADFC41AFE54684AB9EE6CBC0274A5D19BE9F208@SHSMSX101.ccr.corp.intel.com>
Content-Language: en-US-large
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "Tian, Kevin" <kevin.tian@intel.com>, Julien Grall <julien.grall@arm.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, "tamas@tklengyel.com" <tamas@tklengyel.com>
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>, "wei.liu2@citrix.com" <wei.liu2@citrix.com>, "Nakajima,
 Jun" <jun.nakajima@intel.com>, "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, "jbeulich@suse.com" <jbeulich@suse.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>, "brian.woods@amd.com" <brian.woods@amd.com>, "suravee.suthikulpanit@amd.com" <suravee.suthikulpanit@amd.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTIvMTMvMTggODo1NCBBTSwgVGlhbiwgS2V2aW4gd3JvdGU6Cj4+IEZyb206IFJhenZhbiBD
b2pvY2FydSBbbWFpbHRvOnJjb2pvY2FydUBiaXRkZWZlbmRlci5jb21dCj4+IFNlbnQ6IFR1ZXNk
YXksIERlY2VtYmVyIDExLCAyMDE4IDg6MzMgUE0KPj4KPj4+IEluIGFueSBjYXNlLCBJIHRoaW5r
IHlvdSB3YW50IHRvIHJlbmFtZSB0aGUgZnVuY3Rpb24gYW5kL29yIGRvY3VtZW50Cj4+PiBtb3Jl
IHRoYXQgZXhwZWN0ZWQgYmVoYXZpb3IuCj4+Cj4+IFlvdSdyZSByaWdodCwgSSBzaG91bGQgcHJv
YmFibHkgcmVuYW1lIHRoYXQgZnVuY3Rpb24gLyB2YXJpYWJsZSB0bwo+PiBiZXR0ZXIgcmVmbGVj
dCB3aGF0IGl0IHNpZ25pZmllcyAtIHRoYXQgc3luYyB2bV9ldmVudCBwcm9jZXNzaW5nIGlzIGlu
Cj4+IHByb2dyZXNzLiBGb3IgVk1YIGFuZCBTVk0sIHRoYXQgc2ltcGx5IG1lYW5zIHRoYXQgaW50
ZXJydXB0cyB3aWxsIGJlCj4+IGJsb2NrZWQsIGFuZCB0aGUgdmFsdWUgb2YgdGhlIHZhcmlhYmxl
IHdpbGwgYmUgY29ycmVjdCBhbmQgcG9zc2libHkKPj4gdXNlZnVsIGZvciBBUk0gYXMgd2VsbC4K
Pj4KPiAKPiB3aGF0IGFib3V0IHZtX2V2ZW50X2Jsb2NrX2ludGVycnVwdF9pbmplY3Rpb24/IGlu
IHRoYXQgY2FzZQo+IGl0J3MgaW5qZWN0aW9uIGluc3RlYWQgb2YgaW50ZXJydXB0IGl0c2VsZiBi
ZWluZyBibG9ja2VkLiBibG9ja2luZwo+IGluamVjdGlvbiBzaG91bGQgbWVhbiBzYW1lIHRoaW5n
IGNyb3NzIGFyY2hzPwoKT2YgY291cnNlLCBpZiBKdWxpZW4gYWdyZWVzIHdpdGggdGhlIGNoYW5n
ZSBJJ2xsIHJlbmFtZSBpdCBhcyBzdWdnZXN0ZWQuCgoKVGhhbmtzLApSYXp2YW4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
