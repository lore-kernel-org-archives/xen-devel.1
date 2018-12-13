From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH V2] x86/vm_event: block interrupt injection
 for sync vm_events
Date: Thu, 13 Dec 2018 07:58:03 -0700
Message-ID: <5C12737B0200007800205E91@prv1-mh.provo.novell.com>
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
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=79tL=OW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gXSRF-0007zy-8a
 for xen-devel@lists.xenproject.org; Thu, 13 Dec 2018 14:58:09 +0000
In-Reply-To: <07005fdc-9b5d-5bad-611b-c0c0966ecfca@bitdefender.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>, Tamas K Lengyel <tamas@tklengyel.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, xen-devel <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Brian Woods <brian.woods@amd.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEzLjEyLjE4IGF0IDE0OjE4LCA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4gd3Jv
dGU6Cj4gU28sIGxvbmcgc3Rvcnkgc2hvcnQsIG9uIFZNWCB3ZSBmaXJzdCBzZW5kIG91dCB0aGUg
dm1fZXZlbnQsIHdoaWxlCj4gcHJvY2Vzc2luZyBpdCBhbiBpbnRlcnJ1cHQgLyBleGNlcHRpb24g
bWF5IGJlY29tZSBwZW5kaW5nLCBiZWZvcmUKPiByZXN1bWluZyB0aGUgVkNQVSB0aGF0IGhhcyBz
ZW50IG91dCB0aGUgdm1fZXZlbnQgdGhlcmUncyBhIFhlbiBmdW5jdGlvbgo+IHRoYXQgcGlja3Mg
dXAgdGhlIHBlbmRpbmcgaW50ZXJydXB0IGFuZCBzY2hlZHVsZXMgaXQgKHdyaXRlcyBpdCBpbiB0
aGUKPiBWTUNTKSwgYW5kIG9ubHkgdGhlbiB3ZSBhdHRlbXB0IHRoZSBlbXVsYXRpb24sIHdoaWNo
IG1heSBvdmVyd3JpdGUgaXQKPiAoYmVjYXVzZSB0aGVyZSdzIG9ubHkgb25lIHBsYWNlIHdlIGNh
biB3cml0ZSB0byBzY2hlZHVsZSBpbnRlcnJ1cHRzIC8KPiBleGNlcHRpb25zKS4KClNvIHBlcmhh
cHMgdGhlIHNvbHV0aW9uIGlzIGluZGVlZCB0byBjaGFuZ2UgdGhlIG9yZGVyIG9mIGhvdyB0aGlu
Z3MKZ2V0IGRvbmUsIGluc3RlYWQgb2YgYmxvY2tpbmcgaW50ZXJydXB0cz8gWW91IHNlZW0gdG8g
dGhpbmsgdGhpcyB3YXkKdG9vLCBhcyBwZXIgLi4uCgo+IDIuIEludGVycnVwdHMgYXJlIG5vdCBi
bG9ja2VkIGluZGVmaW5pdGVseSAtIG9ubHkgdW50aWwgdGhlIGVtdWxhdGlvbiBpcwo+IGRvbmUu
IEl0IGNvdWxkIGJlIGFyZ3VlZCB0aGF0IHRoYXQncyByZWFsbHkgdGhlIHByb3BlciBwbGFjZSBm
b3IgdGhlbSB0bwo+IGJlIHByb2Nlc3NlZCBhbnl3YXkgLSBvbiBhbiBpbnN0cnVjdGlvbiBib3Vu
ZGFyeSwgX2FmdGVyXyB0aGUKPiBpbi1wcm9ncmVzcyBpbnN0cnVjdGlvbiBoYXMgZmluaXNoZWQg
ZXhlY3V0aW5nLiBJdCdzIGp1c3QgdGhhdCB3aXRoIHRoZQo+IHZtX2V2ZW50IGludHJvc3BlY3Rp
b24gdGhpbmcgeW91IGNvdWxkIHNheSB0aGF0IGV4ZWN1dGluZyB0aGUgY3VycmVudAo+IGluc3Ry
dWN0aW9uIG1heSB0YWtlIGEgYml0IGxvbmdlci4KCi4uLiB0aGlzLgoKSmFuCgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
