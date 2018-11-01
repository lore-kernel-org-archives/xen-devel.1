From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH v1] x86/hvm: Clean up may_defer from hvm_*
 helpers
Date: Thu, 1 Nov 2018 16:04:32 +0200
Message-ID: <33ee939f-4aa5-2791-267d-5ddc6756ddaa@bitdefender.com>
References: <20181024091849.15572-1-aisaila@bitdefender.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19BE2B9E0@SHSMSX101.ccr.corp.intel.com>
 <73ab7fcd-59da-f160-3eda-a799349585a3@bitdefender.com>
 <5BDB069D02000078001424DF@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=kl4z=nm=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1gIDaR-00084l-E4
 for xen-devel@lists.xenproject.org; Thu, 01 Nov 2018 14:04:39 +0000
In-Reply-To: <5BDB069D02000078001424DF@prv1-mh.provo.novell.com>
Content-Language: en-US-large
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: kevin.tian@intel.com, tamas@tklengyel.com, wei.liu2@citrix.com, jun.nakajima@intel.com, andrew.cooper3@citrix.com, paul.durrant@citrix.com, suravee.suthikulpanit@amd.com, aisaila@bitdefender.com, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com, brian.woods@amd.com
List-Id: xen-devel@lists.xenproject.org

CgpPbiAxMS8xLzE4IDM6NTggUE0sIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IFJhenZhbiBDb2pv
Y2FydSA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4gMTEvMDEvMTggMTE6MzEgQU0gPj4+Cj4+
IE9uIDEwLzMwLzE4IDg6MTkgQU0sIFRpYW4sIEtldmluIHdyb3RlOgo+Pj4+IEZyb206IEFsZXhh
bmRydSBTdGVmYW4gSVNBSUxBIFttYWlsdG86YWlzYWlsYUBiaXRkZWZlbmRlci5jb21dCj4+Pj4g
U2VudDogV2VkbmVzZGF5LCBPY3RvYmVyIDI0LCAyMDE4IDU6MTkgUE0KPj4+Pgo+Pj4+IFRoZSBt
YXlfZGVmZXIgdmFyIHdhcyBsZWZ0IHdpdGggdGhlIG9sZGVyIGJvb2xfdCB0eXBlLiBUaGlzIHBh
dGNoCj4+Pj4gY2hhbmdlcyB0aGUgdHlwZSB0byBib29sLgo+Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1i
eTogQWxleGFuZHJ1IElzYWlsYSA8YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+Cj4+Pgo+Pj4gUmV2
aWV3ZWQtYnk6IEtldmluIFRpYW4gPGtldmluLnRpYW5AaW50ZWwuY29tPgo+Pgo+PiBJIHRoaW5r
IHRoaXMgdHJpdmlhbCBwYXRjaCBoYXMgYWxsIHRoZSBhY2tzIGl0IG5lZWRzIHRvIGdvIGluPwo+
IAo+IEl0IGJlaW5nIHRyaXZpYWwsIEkgd2FzIGNvbnNpZGVyaW5nIHRvIGlnbm9yZSB0aGUgbmVl
ZCBmb3IgUGF1bCdzIGFjayBpbiB0aGlzCj4gY2FzZSAod2hpY2ggaWlyYyBoYXMgbm90IGJlZW4g
Z2l2ZW4gc28gZmFyKSwgYnV0IHNpbmNlIHlvdSBhc2sgLSBkaWQgeW91Cj4gY2hlY2sgYmVmb3Jl
IGFza2luZz8gSSBjYW4gb25seSByZS1pdGVyYXRlIHRoYXQgZ2VuZXJhbGx5IGl0IGlzIHRoZSBz
dWJtaXR0ZXIKPiB0byBjaGFzZSBhY2tzLCBub3QgYW55IG9mIHRoZSBwb3RlbnRpYWwgY29tbWl0
dGVycy4KClNvcnJ5LCBJIHdhcyBub3QgYXdhcmUgUGF1bCdzIGFjayB3YXMgc3RpbGwgbmVlZGVk
LiBCeSBjaGVjaywgZG8geW91Cm1lYW4gdGFrZSB0aGUgcmVjaXBpZW50cyBsaXN0ICh0aGF0IEkg
aGF2ZSBmcm9tIGdldF9tYWludGFpbmVyLnBsKSBhbmQKbWF0Y2ggaXQgdG8gdGhlIE1BSU5UQUlO
RVJTIGZpbGUgdG8gc2VlIGlmIHRoZXJlJ3Mgbm8gYWNrIGZyb20gYW55CnBhcnRpY3VsYXIgc3Vi
Y2F0ZWdvcnk/CgoKVGhhbmtzLApSYXp2YW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
