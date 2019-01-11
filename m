From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH V3] x86/vm_event: block interrupt injection
 for sync vm_events
Date: Fri, 11 Jan 2019 12:31:35 +0200
Message-ID: <5e504b51-50f9-e07b-b9e7-96e9ea921480@bitdefender.com>
References: <1544788198-28303-1-git-send-email-rcojocaru@bitdefender.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19BEBE800@SHSMSX101.ccr.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RBEN=PT=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1ghu6E-0008Lt-Np
 for xen-devel@lists.xenproject.org; Fri, 11 Jan 2019 10:31:38 +0000
In-Reply-To: <AADFC41AFE54684AB9EE6CBC0274A5D19BEBE800@SHSMSX101.ccr.corp.intel.com>
Content-Language: en-US-large
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "Tian, Kevin" <kevin.tian@intel.com>, "tamas@tklengyel.com" <tamas@tklengyel.com>, "wei.liu2@citrix.com" <wei.liu2@citrix.com>, "suravee.suthikulpanit@amd.com" <suravee.suthikulpanit@amd.com>, "Nakajima,
 Jun" <jun.nakajima@intel.com>, "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, "julien.grall@arm.com" <julien.grall@arm.com>, "sstabellini@kernel.org" <sstabellini@kernel.org>, "jbeulich@suse.com" <jbeulich@suse.com>, "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>, "brian.woods@amd.com" <brian.woods@amd.com>, "roger.pau@citrix.com" <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTIvMjUvMTggNDoyOSBBTSwgVGlhbiwgS2V2aW4gd3JvdGU6Cj4+IEZyb206IFJhenZhbiBD
b2pvY2FydSBbbWFpbHRvOnJjb2pvY2FydUBiaXRkZWZlbmRlci5jb21dCj4+IFNlbnQ6IEZyaWRh
eSwgRGVjZW1iZXIgMTQsIDIwMTggNzo1MCBQTQo+Pgo+PiBCbG9jayBpbnRlcnJ1cHRzIChpbiB2
bXhfaW50cl9hc3Npc3QoKSkgZm9yIHRoZSBkdXJhdGlvbiBvZgo+PiBwcm9jZXNzaW5nIGEgc3lu
YyB2bV9ldmVudCAoc2ltaWxhcmx5IHRvIHRoZSBzdHJhdGVneQo+PiBjdXJyZW50bHkgdXNlZCBm
b3Igc2luZ2xlLXN0ZXBwaW5nKS4gT3RoZXJ3aXNlLCBhdHRlbXB0aW5nCj4+IHRvIGVtdWxhdGUg
YW4gaW5zdHJ1Y3Rpb24gd2hlbiByZXF1ZXN0ZWQgYnkgYSB2bV9ldmVudAo+PiByZXBseSBtYXkg
bGVnaXRpbWF0ZWx5IG5lZWQgdG8gY2FsbCBlLmcuCj4+IGh2bV9pbmplY3RfcGFnZV9mYXVsdCgp
LCB3aGljaCB0aGVuIG92ZXJ3cml0ZXMgdGhlIGFjdGl2ZQo+PiBpbnRlcnJ1cHQgaW4gdGhlIFZN
Q1MuCj4+Cj4+IFRoZSBzeW5jIHZtX2V2ZW50IGhhbmRsaW5nIHBhdGggb24geDg2L1ZNWCBpcyAo
cm91Z2hseSk6Cj4+IG1vbml0b3JfdHJhcHMoKSAtPiBwcm9jZXNzIHZtX2V2ZW50IC0+IHZteF9p
bnRyX2Fzc2lzdCgpCj4+IChwb3NzaWJseSB3cml0aW5nIFZNX0VOVFJZX0lOVFJfSU5GTykgLT4K
Pj4gaHZtX3ZtX2V2ZW50X2RvX3Jlc3VtZSgpIC0+IGh2bV9lbXVsYXRlX29uZV92bV9ldmVudCgp
Cj4+IChwb3NzaWJseSBvdmVyd3JpdGluZyB0aGUgVk1fRU5UUllfSU5UUl9JTkZPIHZhbHVlKS4K
Pj4KPj4gVGhpcyBwYXRjaCBtYXkgYWxzbyBiZSBoZWxwZnVsIGZvciB0aGUgZnV0dXJlIHJlbW92
YWwKPj4gb2YgbWF5X2RlZmVyIGluIGh2bV9zZXRfY3J7MCwzLDR9IGFuZCBodm1fc2V0X21zcigp
Lgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBSYXp2YW4gQ29qb2NhcnUgPHJjb2pvY2FydUBiaXRkZWZl
bmRlci5jb20+Cj4+Cj4gCj4gUmV2aWV3ZWQtYnk6IEtldmluIFRpYW4gPGtldmluLnRpYW5AaW50
ZWwuY29tPgoKUGluZz8KCgpUaGFua3MsClJhenZhbgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
