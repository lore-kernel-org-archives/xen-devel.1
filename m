From: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH V3] x86/vm_event: block interrupt injection
 for sync vm_events
Date: Tue, 25 Dec 2018 02:29:03 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19BEBE800@SHSMSX101.ccr.corp.intel.com>
References: <1544788198-28303-1-git-send-email-rcojocaru@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=f35z=PC=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1gbcT1-0001WY-2d
 for xen-devel@lists.xenproject.org; Tue, 25 Dec 2018 02:29:11 +0000
In-Reply-To: <1544788198-28303-1-git-send-email-rcojocaru@bitdefender.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "tamas@tklengyel.com" <tamas@tklengyel.com>, "wei.liu2@citrix.com" <wei.liu2@citrix.com>, "suravee.suthikulpanit@amd.com" <suravee.suthikulpanit@amd.com>, "Nakajima,
 Jun" <jun.nakajima@intel.com>, "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, "julien.grall@arm.com" <julien.grall@arm.com>, "sstabellini@kernel.org" <sstabellini@kernel.org>, "jbeulich@suse.com" <jbeulich@suse.com>, "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>, "brian.woods@amd.com" <brian.woods@amd.com>, "roger.pau@citrix.com" <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

PiBGcm9tOiBSYXp2YW4gQ29qb2NhcnUgW21haWx0bzpyY29qb2NhcnVAYml0ZGVmZW5kZXIuY29t
XQo+IFNlbnQ6IEZyaWRheSwgRGVjZW1iZXIgMTQsIDIwMTggNzo1MCBQTQo+IAo+IEJsb2NrIGlu
dGVycnVwdHMgKGluIHZteF9pbnRyX2Fzc2lzdCgpKSBmb3IgdGhlIGR1cmF0aW9uIG9mCj4gcHJv
Y2Vzc2luZyBhIHN5bmMgdm1fZXZlbnQgKHNpbWlsYXJseSB0byB0aGUgc3RyYXRlZ3kKPiBjdXJy
ZW50bHkgdXNlZCBmb3Igc2luZ2xlLXN0ZXBwaW5nKS4gT3RoZXJ3aXNlLCBhdHRlbXB0aW5nCj4g
dG8gZW11bGF0ZSBhbiBpbnN0cnVjdGlvbiB3aGVuIHJlcXVlc3RlZCBieSBhIHZtX2V2ZW50Cj4g
cmVwbHkgbWF5IGxlZ2l0aW1hdGVseSBuZWVkIHRvIGNhbGwgZS5nLgo+IGh2bV9pbmplY3RfcGFn
ZV9mYXVsdCgpLCB3aGljaCB0aGVuIG92ZXJ3cml0ZXMgdGhlIGFjdGl2ZQo+IGludGVycnVwdCBp
biB0aGUgVk1DUy4KPiAKPiBUaGUgc3luYyB2bV9ldmVudCBoYW5kbGluZyBwYXRoIG9uIHg4Ni9W
TVggaXMgKHJvdWdobHkpOgo+IG1vbml0b3JfdHJhcHMoKSAtPiBwcm9jZXNzIHZtX2V2ZW50IC0+
IHZteF9pbnRyX2Fzc2lzdCgpCj4gKHBvc3NpYmx5IHdyaXRpbmcgVk1fRU5UUllfSU5UUl9JTkZP
KSAtPgo+IGh2bV92bV9ldmVudF9kb19yZXN1bWUoKSAtPiBodm1fZW11bGF0ZV9vbmVfdm1fZXZl
bnQoKQo+IChwb3NzaWJseSBvdmVyd3JpdGluZyB0aGUgVk1fRU5UUllfSU5UUl9JTkZPIHZhbHVl
KS4KPiAKPiBUaGlzIHBhdGNoIG1heSBhbHNvIGJlIGhlbHBmdWwgZm9yIHRoZSBmdXR1cmUgcmVt
b3ZhbAo+IG9mIG1heV9kZWZlciBpbiBodm1fc2V0X2NyezAsMyw0fSBhbmQgaHZtX3NldF9tc3Io
KS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBSYXp2YW4gQ29qb2NhcnUgPHJjb2pvY2FydUBiaXRkZWZl
bmRlci5jb20+Cj4gCgpSZXZpZXdlZC1ieTogS2V2aW4gVGlhbiA8a2V2aW4udGlhbkBpbnRlbC5j
b20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
