From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH V5] x86/hvm: fix domain crash when CR3 has
 the noflush bit set
Date: Fri, 23 Feb 2018 09:31:43 +0200
Message-ID: <3e9f4e37-8e3c-ba03-f5f9-b8179a3f0b1a@bitdefender.com>
References: <1518776535-2951-1-git-send-email-rcojocaru@bitdefender.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D1910152F1@SHSMSX101.ccr.corp.intel.com>
 <eb8c1245-824b-0468-432c-a6fa999be1db@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <eb8c1245-824b-0468-432c-a6fa999be1db@bitdefender.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "Tian, Kevin" <kevin.tian@intel.com>, "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
Cc: "tamas@tklengyel.com" <tamas@tklengyel.com>, "suravee.suthikulpanit@amd.com" <suravee.suthikulpanit@amd.com>, "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>, "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, "tim@xen.org" <tim@xen.org>, "jbeulich@suse.com" <jbeulich@suse.com>, "Nakajima, Jun" <jun.nakajima@intel.com>, "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDIvMjMvMjAxOCAwOToyOSBBTSwgUmF6dmFuIENvam9jYXJ1IHdyb3RlOgo+IExhY2tpbmcg
UENJRCBzdXBwb3J0IGluIHRoZSBlbXVsYXRpb24gbGF5ZXIgY3JlYXRlcyB0d28gZGlmZmVyZW50
IHdheSBvZgo+IGhhbmRsaW5nIHRoZSBOT0ZMVVNIIGJlaW5nIHNldDogb25lIGlzIGluIGhhcmR3
YXJlLCBhbmQgdGhpcyBoYXBwZW5zIGZvcgo+IGV2ZXJ5dGhpbmcgZXhjZXB0IHRoZSBpbnRyb3Nw
ZWN0aW9uIGNhc2UsIGFuZCBvbmUgaW4gdGhlIGVtdWxhdGlvbiBsYXllcgo+ICh0aGlzIGhhcHBl
bnMgd2hlbiBhbiBpbnRyb3NwZWN0aW9uIGFnZW50IGFza3MgWGVuIHRvIGVtdWxhdGUgYW4KPiBp
bnN0cnVjdGlvbiB3aGVuIGl0IHJlcGxpZXMgdG8gYW4gRVBUIGZhdWx0IHZtX2V2ZW50KS4KClNv
cnJ5LCBub3Qgd2hlbiB0aGUgaW50cm9zcGVjdGlvbiBhZ2VudCBhc2tzIFhlbiB0byBlbXVsYXRl
IGFuCmluc3RydWN0aW9uIHdoZW4gaXQgcmVwbGllcyB0byBhbiBFUFQgZmF1bHQgdm1fZXZlbnQs
IGJ1dCB3aGVuIHRoZQppbnRyb3NwZWN0aW9uIGFnZW50IHdhbnRzIHRvIGJlIGFibGUgdG8gdmV0
byBhIENSMyB3cml0ZSAtIGkuZS4gd2hlbiB0aGUKaW50cm9zcGVjdGlvbiBhZ2VudCBzdWJzY3Jp
YmVzIHRvIENSMyB3cml0ZSBldmVudHMuCgoKVGhhbmtzLApSYXp2YW4KCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
