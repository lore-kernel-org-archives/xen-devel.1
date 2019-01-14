From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH V3] x86/vm_event: block interrupt injection
 for sync vm_events
Date: Mon, 14 Jan 2019 02:53:13 -0700
Message-ID: <5C3C5C09020000780020D1D4@prv1-mh.provo.novell.com>
References: <1544788198-28303-1-git-send-email-rcojocaru@bitdefender.com>
 <e4a328c8-6f36-8ec4-a645-9f845b608fa4@oracle.com>
 <11c88af4-95db-86de-b073-534f5583c1e6@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=+Ly7=PW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1giyxf-0004oO-RI
 for xen-devel@lists.xenproject.org; Mon, 14 Jan 2019 09:55:15 +0000
In-Reply-To: <11c88af4-95db-86de-b073-534f5583c1e6@bitdefender.com>
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

Pj4+IE9uIDE0LjAxLjE5IGF0IDEwOjM0LCA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4gd3Jv
dGU6Cj4gT24gMS8xMi8xOSAxMjowNCBBTSwgQm9yaXMgT3N0cm92c2t5IHdyb3RlOgo+PiBPbiAx
Mi8xNC8xOCA2OjQ5IEFNLCBSYXp2YW4gQ29qb2NhcnUgd3JvdGU6Cj4+PiBCbG9jayBpbnRlcnJ1
cHRzIChpbiB2bXhfaW50cl9hc3Npc3QoKSkgZm9yIHRoZSBkdXJhdGlvbiBvZgo+Pj4gcHJvY2Vz
c2luZyBhIHN5bmMgdm1fZXZlbnQgKHNpbWlsYXJseSB0byB0aGUgc3RyYXRlZ3kKPj4+IGN1cnJl
bnRseSB1c2VkIGZvciBzaW5nbGUtc3RlcHBpbmcpLiBPdGhlcndpc2UsIGF0dGVtcHRpbmcKPj4+
IHRvIGVtdWxhdGUgYW4gaW5zdHJ1Y3Rpb24gd2hlbiByZXF1ZXN0ZWQgYnkgYSB2bV9ldmVudAo+
Pj4gcmVwbHkgbWF5IGxlZ2l0aW1hdGVseSBuZWVkIHRvIGNhbGwgZS5nLgo+Pj4gaHZtX2luamVj
dF9wYWdlX2ZhdWx0KCksIHdoaWNoIHRoZW4gb3ZlcndyaXRlcyB0aGUgYWN0aXZlCj4+PiBpbnRl
cnJ1cHQgaW4gdGhlIFZNQ1MuCj4+Pgo+Pj4gVGhlIHN5bmMgdm1fZXZlbnQgaGFuZGxpbmcgcGF0
aCBvbiB4ODYvVk1YIGlzIChyb3VnaGx5KToKPj4+IG1vbml0b3JfdHJhcHMoKSAtPiBwcm9jZXNz
IHZtX2V2ZW50IC0+IHZteF9pbnRyX2Fzc2lzdCgpCj4+PiAocG9zc2libHkgd3JpdGluZyBWTV9F
TlRSWV9JTlRSX0lORk8pIC0+Cj4+PiBodm1fdm1fZXZlbnRfZG9fcmVzdW1lKCkgLT4gaHZtX2Vt
dWxhdGVfb25lX3ZtX2V2ZW50KCkKPj4+IChwb3NzaWJseSBvdmVyd3JpdGluZyB0aGUgVk1fRU5U
UllfSU5UUl9JTkZPIHZhbHVlKS4KPj4+Cj4+PiBUaGlzIHBhdGNoIG1heSBhbHNvIGJlIGhlbHBm
dWwgZm9yIHRoZSBmdXR1cmUgcmVtb3ZhbAo+Pj4gb2YgbWF5X2RlZmVyIGluIGh2bV9zZXRfY3J7
MCwzLDR9IGFuZCBodm1fc2V0X21zcigpLgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IFJhenZhbiBD
b2pvY2FydSA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4KPj4gCj4+IAo+PiBSZXZpZXdlZC1i
eTogQm9yaXMgT3N0cm92c2t5IDxib3Jpcy5vc3Ryb3Zza3lAb3JhY2xlLmNvbT4KPiAKPiBUaGFu
a3MhIFNvIG5vdyB3ZSBoYXZlIHRocmVlIHJldmlld2VkLWJ5cywgaWYgSSdtIG5vdCBtaXN0YWtl
biBhbGwgd2UgCj4gbmVlZCBpcyBUYW1hcycgKGZvciB0aGUgdm1fZXZlbnQgcGFydCkgYW5kIEp1
bGllbiAvIFN0ZWZhbm8ncyAoZm9yIEFSTSkgCj4gYWNrcyAob3Igb3RoZXJ3aXNlKS4KCkFuZCB5
b3UnZCBuZWVkIHRvIHRhbGsgSsO8cmdlbiBpbnRvIGFsbG93aW5nIHRoaXMgaW4sIG5vdyB0aGF0
IHdlJ3JlCnBhc3QgdGhlIGZyZWV6ZSBwb2ludC4KCkphbgoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
