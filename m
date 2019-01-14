From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH V3] x86/vm_event: block interrupt injection
 for sync vm_events
Date: Mon, 14 Jan 2019 11:34:39 +0200
Message-ID: <11c88af4-95db-86de-b073-534f5583c1e6@bitdefender.com>
References: <1544788198-28303-1-git-send-email-rcojocaru@bitdefender.com>
 <e4a328c8-6f36-8ec4-a645-9f845b608fa4@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8imn=PW=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1giyeI-00036J-8H
 for xen-devel@lists.xenproject.org; Mon, 14 Jan 2019 09:35:14 +0000
In-Reply-To: <e4a328c8-6f36-8ec4-a645-9f845b608fa4@oracle.com>
Content-Language: en-US-large
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org, tamas@tklengyel.com, sstabellini@kernel.org, julien.grall@arm.com
Cc: kevin.tian@intel.com, wei.liu2@citrix.com, suravee.suthikulpanit@amd.com, jun.nakajima@intel.com, andrew.cooper3@citrix.com, jbeulich@suse.com, Boris Ostrovsky <boris.ostrovsky@oracle.com>, brian.woods@amd.com, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gMS8xMi8xOSAxMjowNCBBTSwgQm9yaXMgT3N0cm92c2t5IHdyb3RlOgo+IE9uIDEyLzE0LzE4
IDY6NDkgQU0sIFJhenZhbiBDb2pvY2FydSB3cm90ZToKPj4gQmxvY2sgaW50ZXJydXB0cyAoaW4g
dm14X2ludHJfYXNzaXN0KCkpIGZvciB0aGUgZHVyYXRpb24gb2YKPj4gcHJvY2Vzc2luZyBhIHN5
bmMgdm1fZXZlbnQgKHNpbWlsYXJseSB0byB0aGUgc3RyYXRlZ3kKPj4gY3VycmVudGx5IHVzZWQg
Zm9yIHNpbmdsZS1zdGVwcGluZykuIE90aGVyd2lzZSwgYXR0ZW1wdGluZwo+PiB0byBlbXVsYXRl
IGFuIGluc3RydWN0aW9uIHdoZW4gcmVxdWVzdGVkIGJ5IGEgdm1fZXZlbnQKPj4gcmVwbHkgbWF5
IGxlZ2l0aW1hdGVseSBuZWVkIHRvIGNhbGwgZS5nLgo+PiBodm1faW5qZWN0X3BhZ2VfZmF1bHQo
KSwgd2hpY2ggdGhlbiBvdmVyd3JpdGVzIHRoZSBhY3RpdmUKPj4gaW50ZXJydXB0IGluIHRoZSBW
TUNTLgo+Pgo+PiBUaGUgc3luYyB2bV9ldmVudCBoYW5kbGluZyBwYXRoIG9uIHg4Ni9WTVggaXMg
KHJvdWdobHkpOgo+PiBtb25pdG9yX3RyYXBzKCkgLT4gcHJvY2VzcyB2bV9ldmVudCAtPiB2bXhf
aW50cl9hc3Npc3QoKQo+PiAocG9zc2libHkgd3JpdGluZyBWTV9FTlRSWV9JTlRSX0lORk8pIC0+
Cj4+IGh2bV92bV9ldmVudF9kb19yZXN1bWUoKSAtPiBodm1fZW11bGF0ZV9vbmVfdm1fZXZlbnQo
KQo+PiAocG9zc2libHkgb3ZlcndyaXRpbmcgdGhlIFZNX0VOVFJZX0lOVFJfSU5GTyB2YWx1ZSku
Cj4+Cj4+IFRoaXMgcGF0Y2ggbWF5IGFsc28gYmUgaGVscGZ1bCBmb3IgdGhlIGZ1dHVyZSByZW1v
dmFsCj4+IG9mIG1heV9kZWZlciBpbiBodm1fc2V0X2NyezAsMyw0fSBhbmQgaHZtX3NldF9tc3Io
KS4KPj4KPj4gU2lnbmVkLW9mZi1ieTogUmF6dmFuIENvam9jYXJ1IDxyY29qb2NhcnVAYml0ZGVm
ZW5kZXIuY29tPgo+IAo+IAo+IFJldmlld2VkLWJ5OiBCb3JpcyBPc3Ryb3Zza3kgPGJvcmlzLm9z
dHJvdnNreUBvcmFjbGUuY29tPgoKVGhhbmtzISBTbyBub3cgd2UgaGF2ZSB0aHJlZSByZXZpZXdl
ZC1ieXMsIGlmIEknbSBub3QgbWlzdGFrZW4gYWxsIHdlIApuZWVkIGlzIFRhbWFzJyAoZm9yIHRo
ZSB2bV9ldmVudCBwYXJ0KSBhbmQgSnVsaWVuIC8gU3RlZmFubydzIChmb3IgQVJNKSAKYWNrcyAo
b3Igb3RoZXJ3aXNlKS4KCkNvdWxkIHlvdSBwbGVhc2UgdGFrZSBhIGxvb2s/CgoKVGhhbmtzLApS
YXp2YW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
