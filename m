From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH V2] x86/vm_event: block interrupt injection
 for sync vm_events
Date: Thu, 13 Dec 2018 12:04:33 +0000
Message-ID: <312c012d-9db5-b5e7-30b2-44bc2d54b576@arm.com>
References: <1544457709-24302-1-git-send-email-rcojocaru@bitdefender.com>
 <20181210164938.lcfmhamgdxxc2zbn@mac>
 <7408c2bf-c22e-dfb0-11e8-d7264f2df4e7@bitdefender.com>
 <a8b7b007-1270-b000-b076-757efa338788@bitdefender.com>
 <20181211101450.gmnjax3gnobby3cq@mac>
 <7ea634cc-1683-fa37-6adc-2fd79f28d5c9@bitdefender.com>
 <c30a8dbd-8ff7-bec6-e718-bdadcdef6352@arm.com>
 <a28c6276-0191-1f14-6cb6-b2212c245ef0@bitdefender.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19BE9F208@SHSMSX101.ccr.corp.intel.com>
 <7fd8e5fe-9fbd-07c3-c27c-1bdec37d078e@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=M0om=OW=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gXPjM-0003jA-Is
 for xen-devel@lists.xenproject.org; Thu, 13 Dec 2018 12:04:40 +0000
In-Reply-To: <7fd8e5fe-9fbd-07c3-c27c-1bdec37d078e@bitdefender.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>, "Tian, Kevin" <kevin.tian@intel.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, "tamas@tklengyel.com" <tamas@tklengyel.com>
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>, "wei.liu2@citrix.com" <wei.liu2@citrix.com>, "Nakajima,
 Jun" <jun.nakajima@intel.com>, "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, "jbeulich@suse.com" <jbeulich@suse.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>, "brian.woods@amd.com" <brian.woods@amd.com>, "suravee.suthikulpanit@amd.com" <suravee.suthikulpanit@amd.com>
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiAxMi8xMy8xOCA4OjAzIEFNLCBSYXp2YW4gQ29qb2NhcnUgd3JvdGU6Cj4gT24gMTIv
MTMvMTggODo1NCBBTSwgVGlhbiwgS2V2aW4gd3JvdGU6Cj4+PiBGcm9tOiBSYXp2YW4gQ29qb2Nh
cnUgW21haWx0bzpyY29qb2NhcnVAYml0ZGVmZW5kZXIuY29tXQo+Pj4gU2VudDogVHVlc2RheSwg
RGVjZW1iZXIgMTEsIDIwMTggODozMyBQTQo+Pj4KPj4+PiBJbiBhbnkgY2FzZSwgSSB0aGluayB5
b3Ugd2FudCB0byByZW5hbWUgdGhlIGZ1bmN0aW9uIGFuZC9vciBkb2N1bWVudAo+Pj4+IG1vcmUg
dGhhdCBleHBlY3RlZCBiZWhhdmlvci4KPj4+Cj4+PiBZb3UncmUgcmlnaHQsIEkgc2hvdWxkIHBy
b2JhYmx5IHJlbmFtZSB0aGF0IGZ1bmN0aW9uIC8gdmFyaWFibGUgdG8KPj4+IGJldHRlciByZWZs
ZWN0IHdoYXQgaXQgc2lnbmlmaWVzIC0gdGhhdCBzeW5jIHZtX2V2ZW50IHByb2Nlc3NpbmcgaXMg
aW4KPj4+IHByb2dyZXNzLiBGb3IgVk1YIGFuZCBTVk0sIHRoYXQgc2ltcGx5IG1lYW5zIHRoYXQg
aW50ZXJydXB0cyB3aWxsIGJlCj4+PiBibG9ja2VkLCBhbmQgdGhlIHZhbHVlIG9mIHRoZSB2YXJp
YWJsZSB3aWxsIGJlIGNvcnJlY3QgYW5kIHBvc3NpYmx5Cj4+PiB1c2VmdWwgZm9yIEFSTSBhcyB3
ZWxsLgo+Pj4KPj4KPj4gd2hhdCBhYm91dCB2bV9ldmVudF9ibG9ja19pbnRlcnJ1cHRfaW5qZWN0
aW9uPyBpbiB0aGF0IGNhc2UKPj4gaXQncyBpbmplY3Rpb24gaW5zdGVhZCBvZiBpbnRlcnJ1cHQg
aXRzZWxmIGJlaW5nIGJsb2NrZWQuIGJsb2NraW5nCj4+IGluamVjdGlvbiBzaG91bGQgbWVhbiBz
YW1lIHRoaW5nIGNyb3NzIGFyY2hzPwoKV2h5IHdvdWxkIHlvdSB3YW50IHRvIGJsb2NrIGFsbCBp
bnRlcnJ1cHRzIGluamVjdGlvbnM/IFdoZW4gSSBsb29rZWQgYXQgCnRoZSBkZXRhaWxzLCBpdCBm
ZWVscyBtb3JlIHlvdSB3YW50IHRvIGJsb2NrIGV4Y2VwdGlvbnMuCgpJIGNhbiBzZWUgdXNlIGZv
ciBibG9ja2luZyBleGNlcHRpb24gb24gQXJtLCBibG9ja2luZyBhbGwgdGhlIGludGVycnVwdHMg
CmlzIGxpa2VseSBnb2luZyB0byBicmluZyBtb3JlIGlzc3VlcyB0aGFuIHNvbHZpbmcgYW55dGhp
bmcuCgpTbyBhIGJldHRlciBuYW1lIHdvdWxkIGJlIHZtX2V2ZW50X2Jsb2NrX2V4Y2VwdGlvbl9p
bmplY3Rpb24uCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
