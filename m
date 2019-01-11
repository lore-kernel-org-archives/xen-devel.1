From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH V3] x86/vm_event: block interrupt injection
 for sync vm_events
Date: Fri, 11 Jan 2019 17:04:02 -0500
Message-ID: <e4a328c8-6f36-8ec4-a645-9f845b608fa4@oracle.com>
References: <1544788198-28303-1-git-send-email-rcojocaru@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=w36A=PT=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1gi4ul-0001kF-K0
 for xen-devel@lists.xenproject.org; Fri, 11 Jan 2019 22:04:31 +0000
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
To: Razvan Cojocaru <rcojocaru@bitdefender.com>, xen-devel@lists.xenproject.org
Cc: kevin.tian@intel.com, tamas@tklengyel.com, wei.liu2@citrix.com, suravee.suthikulpanit@amd.com, jun.nakajima@intel.com, andrew.cooper3@citrix.com, julien.grall@arm.com, sstabellini@kernel.org, jbeulich@suse.com, brian.woods@amd.com, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gMTIvMTQvMTggNjo0OSBBTSwgUmF6dmFuIENvam9jYXJ1IHdyb3RlOgo+IEJsb2NrIGludGVy
cnVwdHMgKGluIHZteF9pbnRyX2Fzc2lzdCgpKSBmb3IgdGhlIGR1cmF0aW9uIG9mCj4gcHJvY2Vz
c2luZyBhIHN5bmMgdm1fZXZlbnQgKHNpbWlsYXJseSB0byB0aGUgc3RyYXRlZ3kKPiBjdXJyZW50
bHkgdXNlZCBmb3Igc2luZ2xlLXN0ZXBwaW5nKS4gT3RoZXJ3aXNlLCBhdHRlbXB0aW5nCj4gdG8g
ZW11bGF0ZSBhbiBpbnN0cnVjdGlvbiB3aGVuIHJlcXVlc3RlZCBieSBhIHZtX2V2ZW50Cj4gcmVw
bHkgbWF5IGxlZ2l0aW1hdGVseSBuZWVkIHRvIGNhbGwgZS5nLgo+IGh2bV9pbmplY3RfcGFnZV9m
YXVsdCgpLCB3aGljaCB0aGVuIG92ZXJ3cml0ZXMgdGhlIGFjdGl2ZQo+IGludGVycnVwdCBpbiB0
aGUgVk1DUy4KPgo+IFRoZSBzeW5jIHZtX2V2ZW50IGhhbmRsaW5nIHBhdGggb24geDg2L1ZNWCBp
cyAocm91Z2hseSk6Cj4gbW9uaXRvcl90cmFwcygpIC0+IHByb2Nlc3Mgdm1fZXZlbnQgLT4gdm14
X2ludHJfYXNzaXN0KCkKPiAocG9zc2libHkgd3JpdGluZyBWTV9FTlRSWV9JTlRSX0lORk8pIC0+
Cj4gaHZtX3ZtX2V2ZW50X2RvX3Jlc3VtZSgpIC0+IGh2bV9lbXVsYXRlX29uZV92bV9ldmVudCgp
Cj4gKHBvc3NpYmx5IG92ZXJ3cml0aW5nIHRoZSBWTV9FTlRSWV9JTlRSX0lORk8gdmFsdWUpLgo+
Cj4gVGhpcyBwYXRjaCBtYXkgYWxzbyBiZSBoZWxwZnVsIGZvciB0aGUgZnV0dXJlIHJlbW92YWwK
PiBvZiBtYXlfZGVmZXIgaW4gaHZtX3NldF9jcnswLDMsNH0gYW5kIGh2bV9zZXRfbXNyKCkuCj4K
PiBTaWduZWQtb2ZmLWJ5OiBSYXp2YW4gQ29qb2NhcnUgPHJjb2pvY2FydUBiaXRkZWZlbmRlci5j
b20+CgoKUmV2aWV3ZWQtYnk6IEJvcmlzIE9zdHJvdnNreSA8Ym9yaXMub3N0cm92c2t5QG9yYWNs
ZS5jb20+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
