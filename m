From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH V2] x86/vm_event: block interrupt injection
 for sync vm_events
Date: Thu, 13 Dec 2018 14:15:16 +0200
Message-ID: <b561518a-3ba3-8a31-35e7-4f481f3802e4@bitdefender.com>
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
 <312c012d-9db5-b5e7-30b2-44bc2d54b576@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PwXp=OW=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1gXPtk-00053B-KC
 for xen-devel@lists.xenproject.org; Thu, 13 Dec 2018 12:15:24 +0000
In-Reply-To: <312c012d-9db5-b5e7-30b2-44bc2d54b576@arm.com>
Content-Language: en-US-large
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, "Tian, Kevin" <kevin.tian@intel.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, "tamas@tklengyel.com" <tamas@tklengyel.com>
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>, "wei.liu2@citrix.com" <wei.liu2@citrix.com>, "Nakajima,
 Jun" <jun.nakajima@intel.com>, "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, "jbeulich@suse.com" <jbeulich@suse.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>, "brian.woods@amd.com" <brian.woods@amd.com>, "suravee.suthikulpanit@amd.com" <suravee.suthikulpanit@amd.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTIvMTMvMTggMjowNCBQTSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpLAo+IAo+IE9uIDEy
LzEzLzE4IDg6MDMgQU0sIFJhenZhbiBDb2pvY2FydSB3cm90ZToKPj4gT24gMTIvMTMvMTggODo1
NCBBTSwgVGlhbiwgS2V2aW4gd3JvdGU6Cj4+Pj4gRnJvbTogUmF6dmFuIENvam9jYXJ1IFttYWls
dG86cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbV0KPj4+PiBTZW50OiBUdWVzZGF5LCBEZWNlbWJl
ciAxMSwgMjAxOCA4OjMzIFBNCj4+Pj4KPj4+Pj4gSW4gYW55IGNhc2UsIEkgdGhpbmsgeW91IHdh
bnQgdG8gcmVuYW1lIHRoZSBmdW5jdGlvbiBhbmQvb3IgZG9jdW1lbnQKPj4+Pj4gbW9yZSB0aGF0
IGV4cGVjdGVkIGJlaGF2aW9yLgo+Pj4+Cj4+Pj4gWW91J3JlIHJpZ2h0LCBJIHNob3VsZCBwcm9i
YWJseSByZW5hbWUgdGhhdCBmdW5jdGlvbiAvIHZhcmlhYmxlIHRvCj4+Pj4gYmV0dGVyIHJlZmxl
Y3Qgd2hhdCBpdCBzaWduaWZpZXMgLSB0aGF0IHN5bmMgdm1fZXZlbnQgcHJvY2Vzc2luZyBpcyBp
bgo+Pj4+IHByb2dyZXNzLiBGb3IgVk1YIGFuZCBTVk0sIHRoYXQgc2ltcGx5IG1lYW5zIHRoYXQg
aW50ZXJydXB0cyB3aWxsIGJlCj4+Pj4gYmxvY2tlZCwgYW5kIHRoZSB2YWx1ZSBvZiB0aGUgdmFy
aWFibGUgd2lsbCBiZSBjb3JyZWN0IGFuZCBwb3NzaWJseQo+Pj4+IHVzZWZ1bCBmb3IgQVJNIGFz
IHdlbGwuCj4+Pj4KPj4+Cj4+PiB3aGF0IGFib3V0IHZtX2V2ZW50X2Jsb2NrX2ludGVycnVwdF9p
bmplY3Rpb24/IGluIHRoYXQgY2FzZQo+Pj4gaXQncyBpbmplY3Rpb24gaW5zdGVhZCBvZiBpbnRl
cnJ1cHQgaXRzZWxmIGJlaW5nIGJsb2NrZWQuIGJsb2NraW5nCj4+PiBpbmplY3Rpb24gc2hvdWxk
IG1lYW4gc2FtZSB0aGluZyBjcm9zcyBhcmNocz8KPiAKPiBXaHkgd291bGQgeW91IHdhbnQgdG8g
YmxvY2sgYWxsIGludGVycnVwdHMgaW5qZWN0aW9ucz8gV2hlbiBJIGxvb2tlZCBhdAo+IHRoZSBk
ZXRhaWxzLCBpdCBmZWVscyBtb3JlIHlvdSB3YW50IHRvIGJsb2NrIGV4Y2VwdGlvbnMuCj4gCj4g
SSBjYW4gc2VlIHVzZSBmb3IgYmxvY2tpbmcgZXhjZXB0aW9uIG9uIEFybSwgYmxvY2tpbmcgYWxs
IHRoZSBpbnRlcnJ1cHRzCj4gaXMgbGlrZWx5IGdvaW5nIHRvIGJyaW5nIG1vcmUgaXNzdWVzIHRo
YW4gc29sdmluZyBhbnl0aGluZy4KPiAKPiBTbyBhIGJldHRlciBuYW1lIHdvdWxkIGJlIHZtX2V2
ZW50X2Jsb2NrX2V4Y2VwdGlvbl9pbmplY3Rpb24uCgpJJ2QgbGlrZSB0byBibG9jayB0aGUgd3Jp
dGluZyBvZiBhbnl0aGluZywgYnkgdm14X2ludHJfYXNzaXN0KCksIGludG8KVk1fRU5UUllfSU5U
Ul9JTkZPLCBiZWNhdXNlIGFuIGVtdWxhdGlvbiBhdHRlbXB0IHRoYXQgaGFwcGVucwpwb3N0LXZt
eF9pbnRyX2Fzc2lzdCgpIChiZWNhdXNlIHRoZSB2bV9ldmVudCBjbGllbnQgYXBwbGljYXRpb24g
aGFzCnJlcXVlc3RlZCBpdCkgbWF5IHdyaXRlIGFuIGV4Y2VwdGlvbiBvZiBpdHMgb3duIHRoZXJl
LgoKU2luY2Ugdm14X2ludHJfYXNzaXN0KCkgaXMgY2FsbGVkIG9uIFZNWCBiZXR3ZWVuIHRoZSB0
aW1lIG9mIHNlbmRpbmcgb3V0CnRoZSB2bV9ldmVudCBhbmQgdGhlIGVtdWxhdGlvbiAod2hpY2gg
aGFwcGVucyBpbgpodm1fdm1fZXZlbnRfZG9fcmVzdW1lKCkpLCB3ZSB3YW50IHRvIGJsb2NrIGV2
ZXJ5dGhpbmcgdGhhdCBpdCBtYXkgd3JpdGUKaW4gdGhlIFZNQ1MgdW50aWwgdGhlIGVtdWxhdGlv
biBpcyBkb25lLiBJIHRoaW5rIHRoYXQncyBtb3JlIHRoYW4ganVzdApleGNlcHRpb25zLgoKSSd2
ZSBwcm9iYWJseSBiZWVuIGNvbmZ1c2luZyB3aGVuIEkgd2FzIHRhbGtpbmcgYWJvdXQgdGhlIGV4
Y2VwdGlvbnMKdGhhdCBlbXVsYXRpbmcgdGhlIGN1cnJlbnQgaW5zdHJ1Y3Rpb24gbWF5IHRyaWdn
ZXIgLSB3ZSBkb24ndCB3YW50IHRvCmJsb2NrIHRob3NlLgoKClRoYW5rcywKUmF6dmFuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
