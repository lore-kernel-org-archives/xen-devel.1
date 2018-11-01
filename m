From: "Jan Beulich" <jbeulich@suse.com>
Subject: Re: [PATCH v1] x86/hvm: Clean up may_defer from hvm_*
 helpers
Date: Thu, 01 Nov 2018 07:58:53 -0600
Message-ID: <5BDB069D02000078001424DF@prv1-mh.provo.novell.com>
References: <20181024091849.15572-1-aisaila@bitdefender.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19BE2B9E0@SHSMSX101.ccr.corp.intel.com>
 <73ab7fcd-59da-f160-3eda-a799349585a3@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=mjq2=nm=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gIDUv-0007AB-RQ
 for xen-devel@lists.xenproject.org; Thu, 01 Nov 2018 13:58:57 +0000
In-Reply-To: <73ab7fcd-59da-f160-3eda-a799349585a3@bitdefender.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: rcojocaru@bitdefender.com
Cc: kevin.tian@intel.com, tamas@tklengyel.com, wei.liu2@citrix.com, jun.nakajima@intel.com, andrew.cooper3@citrix.com, paul.durrant@citrix.com, suravee.suthikulpanit@amd.com, aisaila@bitdefender.com, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com, brian.woods@amd.com
List-Id: xen-devel@lists.xenproject.org

Pj4+IFJhenZhbiBDb2pvY2FydSA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4gMTEvMDEvMTgg
MTE6MzEgQU0gPj4+Cj5PbiAxMC8zMC8xOCA4OjE5IEFNLCBUaWFuLCBLZXZpbiB3cm90ZToKPj4+
IEZyb206IEFsZXhhbmRydSBTdGVmYW4gSVNBSUxBIFttYWlsdG86YWlzYWlsYUBiaXRkZWZlbmRl
ci5jb21dCj4+PiBTZW50OiBXZWRuZXNkYXksIE9jdG9iZXIgMjQsIDIwMTggNToxOSBQTQo+Pj4K
Pj4+IFRoZSBtYXlfZGVmZXIgdmFyIHdhcyBsZWZ0IHdpdGggdGhlIG9sZGVyIGJvb2xfdCB0eXBl
LiBUaGlzIHBhdGNoCj4+PiBjaGFuZ2VzIHRoZSB0eXBlIHRvIGJvb2wuCj4+Pgo+Pj4gU2lnbmVk
LW9mZi1ieTogQWxleGFuZHJ1IElzYWlsYSA8YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+Cj4+IAo+
PiBSZXZpZXdlZC1ieTogS2V2aW4gVGlhbiA8a2V2aW4udGlhbkBpbnRlbC5jb20+Cj4KPkkgdGhp
bmsgdGhpcyB0cml2aWFsIHBhdGNoIGhhcyBhbGwgdGhlIGFja3MgaXQgbmVlZHMgdG8gZ28gaW4/
CgpJdCBiZWluZyB0cml2aWFsLCBJIHdhcyBjb25zaWRlcmluZyB0byBpZ25vcmUgdGhlIG5lZWQg
Zm9yIFBhdWwncyBhY2sgaW4gdGhpcwpjYXNlICh3aGljaCBpaXJjIGhhcyBub3QgYmVlbiBnaXZl
biBzbyBmYXIpLCBidXQgc2luY2UgeW91IGFzayAtIGRpZCB5b3UKY2hlY2sgYmVmb3JlIGFza2lu
Zz8gSSBjYW4gb25seSByZS1pdGVyYXRlIHRoYXQgZ2VuZXJhbGx5IGl0IGlzIHRoZSBzdWJtaXR0
ZXIKdG8gY2hhc2UgYWNrcywgbm90IGFueSBvZiB0aGUgcG90ZW50aWFsIGNvbW1pdHRlcnMuCgoK
SmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
