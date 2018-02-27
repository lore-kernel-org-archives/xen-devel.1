From: Juergen Gross <jgross@suse.com>
Subject: Re: [v2 1/1] xen,
 mm: Allow deferred page initialization for xen pv domains
Date: Tue, 27 Feb 2018 08:44:44 +0100
Message-ID: <927f2a94-2ece-53f7-3be8-532f3be77dd4__48769.205393228$1519717448$gmane$org@suse.com>
References: <20180226160112.24724-1-pasha.tatashin@oracle.com>
 <20180226160112.24724-2-pasha.tatashin@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=gjir=fv=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1eqZwW-0008OV-BW
 for xen-devel@lists.xenproject.org; Tue, 27 Feb 2018 07:44:56 +0000
In-Reply-To: <20180226160112.24724-2-pasha.tatashin@oracle.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Pavel Tatashin <pasha.tatashin@oracle.com>, steven.sistare@oracle.com, daniel.m.jordan@oracle.com, akataria@vmware.com, tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com, x86@kernel.org, boris.ostrovsky@oracle.com, akpm@linux-foundation.org, mhocko@suse.com, vbabka@suse.cz, luto@kernel.org, labbott@redhat.com, kirill.shutemov@linux.intel.com, bp@suse.de, minipli@googlemail.com, jinb.park7@gmail.com, dan.j.williams@intel.com, bhe@redhat.com, zhang.jia@linux.alibaba.com, mgorman@techsingularity.net, hannes@cmpxchg.org, virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, linux-mm@kvack.org
List-Id: xen-devel@lists.xenproject.org

T24gMjYvMDIvMTggMTc6MDEsIFBhdmVsIFRhdGFzaGluIHdyb3RlOgo+IEp1ZXJnZW4gR3Jvc3Mg
bm90aWNlZCB0aGF0IGNvbW1pdAo+IGY3Zjk5MTAwZDhkICgibW06IHN0b3AgemVyb2luZyBtZW1v
cnkgZHVyaW5nIGFsbG9jYXRpb24gaW4gdm1lbW1hcCIpCj4gYnJva2UgWEVOIFBWIGRvbWFpbnMg
d2hlbiBkZWZlcnJlZCBzdHJ1Y3QgcGFnZSBpbml0aWFsaXphdGlvbiBpcyBlbmFibGVkLgo+IAo+
IFRoaXMgaXMgYmVjYXVzZSB0aGUgeGVuJ3MgUGFnZVBpbm5lZCgpIGZsYWcgaXMgZ2V0dGluZyBl
cmFzZWQgZnJvbSBzdHJ1Y3QKPiBwYWdlcyB3aGVuIHRoZXkgYXJlIGluaXRpYWxpemVkIGxhdGVy
IGluIGJvb3QuCj4gCj4gSnVlcmdlbiBmaXhlZCB0aGlzIHByb2JsZW0gYnkgZGlzYWJsaW5nIGRl
ZmVycmVkIHBhZ2VzIG9uIHhlbiBwdiBkb21haW5zLgo+IEl0IGlzIGRlc2lyYWJsZSwgaG93ZXZl
ciwgdG8gaGF2ZSB0aGlzIGZlYXR1cmUgYXZhaWxhYmxlIGFzIGl0IHJlZHVjZXMgYm9vdAo+IHRp
bWUuIFRoaXMgZml4IHJlLWVuYWJsZXMgdGhlIGZlYXR1cmUgZm9yIHB2LWRtYWlucywgYW5kIGZp
eGVzIHRoZSBwcm9ibGVtCj4gdGhlIGZvbGxvd2luZyB3YXk6Cj4gCj4gVGhlIGZpeCBpcyB0byBk
ZWxheSBzZXR0aW5nIFBhZ2VQaW5uZWQgZmxhZyB1bnRpbCBzdHJ1Y3QgcGFnZXMgZm9yIGFsbAo+
IGFsbG9jYXRlZCBtZW1vcnkgYXJlIGluaXRpYWxpemVkLCBpLmUuIHVudGlsIGFmdGVyIGZyZWVf
YWxsX2Jvb3RtZW0oKS4KPiAKPiBBIG5ldyB4ODZfaW5pdC5oeXBlciBvcCBpbml0X2FmdGVyX2Jv
b3RtZW0oKSBpcyBjYWxsZWQgdG8gbGV0IHhlbiBrbm93Cj4gdGhhdCBib290IGFsbG9jYXRvciBp
cyBkb25lLCBhbmQgaGVuY2Ugc3RydWN0IHBhZ2VzIGZvciBhbGwgdGhlIGFsbG9jYXRlZAo+IG1l
bW9yeSBhcmUgbm93IGluaXRpYWxpemVkLiBJZiBkZWZlcnJlZCBwYWdlIGluaXRpYWxpemF0aW9u
IGlzIGVuYWJsZWQsIHRoZQo+IHJlc3Qgb2Ygc3RydWN0IHBhZ2VzIGFyZSBnb2luZyB0byBiZSBp
bml0aWFsaXplZCBsYXRlciBpbiBib290IG9uY2UKPiBwYWdlX2FsbG9jX2luaXRfbGF0ZSgpIGlz
IGNhbGxlZC4KPiAKPiB4ZW5fYWZ0ZXJfYm9vdG1lbSgpIHdhbGtzIHBhZ2UgdGFibGUncyBwYWdl
cyBhbmQgbWFya3MgdGhlbSBwaW5uZWQuCj4gCj4gU2lnbmVkLW9mZi1ieTogUGF2ZWwgVGF0YXNo
aW4gPHBhc2hhLnRhdGFzaGluQG9yYWNsZS5jb20+CgpWZXJpZmllZCB0byB3b3JrIG9uIGEgc3lz
dGVtIHdoZXJlIHRoZSBvcmlnaW5hbCBpc3N1ZSBjYXVzZWQgYSBjcmFzaC4KClJldmlld2VkLWJ5
OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+ClRlc3RlZC1ieTogSnVlcmdlbiBHcm9z
cyA8amdyb3NzQHN1c2UuY29tPgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
