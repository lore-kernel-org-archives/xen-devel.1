From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH V2] x86/vm_event: block interrupt injection
 for sync vm_events
Date: Thu, 13 Dec 2018 17:11:32 +0200
Message-ID: <5edd45c1-2ef1-c82e-2b7c-e75754a2c782@bitdefender.com>
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
 <b561518a-3ba3-8a31-35e7-4f481f3802e4@bitdefender.com>
 <746ecf9f-4aeb-1d7f-7ba5-367f1b1488d7@arm.com>
 <07005fdc-9b5d-5bad-611b-c0c0966ecfca@bitdefender.com>
 <5C12737B0200007800205E91@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PwXp=OW=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1gXSeK-0001p8-IU
 for xen-devel@lists.xenproject.org; Thu, 13 Dec 2018 15:11:40 +0000
In-Reply-To: <5C12737B0200007800205E91@prv1-mh.provo.novell.com>
Content-Language: en-US-large
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>, Tamas K Lengyel <tamas@tklengyel.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, xen-devel <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Brian Woods <brian.woods@amd.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTIvMTMvMTggNDo1OCBQTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMTMuMTIuMTgg
YXQgMTQ6MTgsIDxyY29qb2NhcnVAYml0ZGVmZW5kZXIuY29tPiB3cm90ZToKPj4gU28sIGxvbmcg
c3Rvcnkgc2hvcnQsIG9uIFZNWCB3ZSBmaXJzdCBzZW5kIG91dCB0aGUgdm1fZXZlbnQsIHdoaWxl
Cj4+IHByb2Nlc3NpbmcgaXQgYW4gaW50ZXJydXB0IC8gZXhjZXB0aW9uIG1heSBiZWNvbWUgcGVu
ZGluZywgYmVmb3JlCj4+IHJlc3VtaW5nIHRoZSBWQ1BVIHRoYXQgaGFzIHNlbnQgb3V0IHRoZSB2
bV9ldmVudCB0aGVyZSdzIGEgWGVuIGZ1bmN0aW9uCj4+IHRoYXQgcGlja3MgdXAgdGhlIHBlbmRp
bmcgaW50ZXJydXB0IGFuZCBzY2hlZHVsZXMgaXQgKHdyaXRlcyBpdCBpbiB0aGUKPj4gVk1DUyks
IGFuZCBvbmx5IHRoZW4gd2UgYXR0ZW1wdCB0aGUgZW11bGF0aW9uLCB3aGljaCBtYXkgb3Zlcndy
aXRlIGl0Cj4+IChiZWNhdXNlIHRoZXJlJ3Mgb25seSBvbmUgcGxhY2Ugd2UgY2FuIHdyaXRlIHRv
IHNjaGVkdWxlIGludGVycnVwdHMgLwo+PiBleGNlcHRpb25zKS4KPiAKPiBTbyBwZXJoYXBzIHRo
ZSBzb2x1dGlvbiBpcyBpbmRlZWQgdG8gY2hhbmdlIHRoZSBvcmRlciBvZiBob3cgdGhpbmdzCj4g
Z2V0IGRvbmUsIGluc3RlYWQgb2YgYmxvY2tpbmcgaW50ZXJydXB0cz8gWW91IHNlZW0gdG8gdGhp
bmsgdGhpcyB3YXkKPiB0b28sIGFzIHBlciAuLi4KPiAKPj4gMi4gSW50ZXJydXB0cyBhcmUgbm90
IGJsb2NrZWQgaW5kZWZpbml0ZWx5IC0gb25seSB1bnRpbCB0aGUgZW11bGF0aW9uIGlzCj4+IGRv
bmUuIEl0IGNvdWxkIGJlIGFyZ3VlZCB0aGF0IHRoYXQncyByZWFsbHkgdGhlIHByb3BlciBwbGFj
ZSBmb3IgdGhlbSB0bwo+PiBiZSBwcm9jZXNzZWQgYW55d2F5IC0gb24gYW4gaW5zdHJ1Y3Rpb24g
Ym91bmRhcnksIF9hZnRlcl8gdGhlCj4+IGluLXByb2dyZXNzIGluc3RydWN0aW9uIGhhcyBmaW5p
c2hlZCBleGVjdXRpbmcuIEl0J3MganVzdCB0aGF0IHdpdGggdGhlCj4+IHZtX2V2ZW50IGludHJv
c3BlY3Rpb24gdGhpbmcgeW91IGNvdWxkIHNheSB0aGF0IGV4ZWN1dGluZyB0aGUgY3VycmVudAo+
PiBpbnN0cnVjdGlvbiBtYXkgdGFrZSBhIGJpdCBsb25nZXIuCj4gCj4gLi4uIHRoaXMuCgpRdWl0
ZSBwb3NzaWJseSwgZm9sbG93aW5nIHRoZSBsZWFkIG9mIHRoZSBzaW5nbGVzdGVwcGluZyBjb2Rl
IGp1c3QKc2VlbWVkIGxpa2UgdGhlIG1vc3Qgc3RyYWlnaHRmb3J3YXJkIHdheSBvdXQgb2YgdGhl
IHByb2JsZW0uIE9mIGNvdXJzZQphbiBhbHRlcm5hdGl2ZSB3YXkgb2YgaGFuZGxpbmcgaW50ZXJy
dXB0cyB3b3VsZCBwcm9iYWJseSBiZSBwcmVmZXJyYWJsZSwKaG93ZXZlciB3ZSdkIG5lZWQgYSBi
aXQgb2YgZ3VpZGFuY2Ugb24gaG93IHRvIGdvIGFib3V0IGl0IGFuZCBpbiB0aGUKbWVhbnRpbWUg
SSBkb24ndCBzZWUgaG93IHRoaXMgc21hbGwgZml4IHdvdWxkIGh1cnQuCgpJIHJlbWVtYmVyIEFu
ZHJldyBzdWdnZXN0aW5nIHRha2luZyBzb21ldGhpbmcgbGlrZSB0aGlzIG9uIGF0IHRoZSBYZW4K
RGV2ZWxvcGVyIFN1bW1pdCBpbiBCdWRhcGVzdCBidXQgdGhlbiBvZiBjb3Vyc2UgbXVjaCBtb3Jl
IGltcG9ydGFudAp0aGluZ3MgaGFwcGVuZWQgd2l0aCBNZWx0ZG93biAmIGFsLgoKClRoYW5rcywK
UmF6dmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
