From: "Jan Beulich" <jbeulich@suse.com>
Subject: Re: [PATCH 2/3] x86/msr: Definitions for
 MSR_INTEL_CORE_THREAD_COUNT
Date: Mon, 15 Apr 2019 02:09:18 -0600
Message-ID: <5CB43C2E02000078001553EC@prv1-mh.provo.novell.com>
References: <1555172532-23814-1-git-send-email-andrew.cooper3@citrix.com>
 <1555172532-23814-3-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=6WyI=SR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hFwg6-0007TI-N2
 for xen-devel@lists.xenproject.org; Mon, 15 Apr 2019 08:09:22 +0000
In-Reply-To: <1555172532-23814-3-git-send-email-andrew.cooper3@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: andrew.cooper3@citrix.com
Cc: xen-devel@lists.xenproject.org, wei.liu2@citrix.com, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

Pj4+IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+IDA0LzEzLzE5IDY6
MjIgUE0gPj4+LS0tIGEveGVuL2FyY2gveDg2L21zci5jKysrIGIveGVuL2FyY2gveDg2L21zci5j
Cj5AQCAtMTMxLDYgKzEzMSw3IEBAIGludCBndWVzdF9yZG1zcihjb25zdCBzdHJ1Y3QgdmNwdSAq
diwgdWludDMyX3QgbXNyLCB1aW50NjRfdCAqdmFsKQo+Y2FzZSBNU1JfUFJFRF9DTUQ6Cj5jYXNl
IE1TUl9GTFVTSF9DTUQ6Cj4vKiBXcml0ZS1vbmx5ICovCj4rICAgIGNhc2UgTVNSX0lOVEVMX0NP
UkVfVEhSRUFEX0NPVU5UOgo+Y2FzZSBNU1JfVFNYX0ZPUkNFX0FCT1JUOgo+LyogTm90IG9mZmVy
ZWQgdG8gZ3Vlc3RzLiAqLwo+Z290byBncF9mYXVsdDsKCkluIGEgcHJpdmF0ZSB0YWxrIHdlIGhh
ZCwgZGlkbid0IHlvdSBtZW50aW9uIHRoZXJlIGlzIGF0IGxlYXN0IG9uZSBPUyAod2FzIGl0IE9T
WCkKdGhhdCB1bmNvbmRpdGlvbmFsbHkgcmVhZHkgdGhpcyBNU1I/IERlc3BpdGUgYXNzdW1pbmcg
dGhlcmUgYXJlIG90aGVyIGlzc3Vlcwp3aXRoIE9TWCwgd291bGRuJ3QgaXQgYmUgYmV0dGVyIHRv
IGF2b2lkIGdpdmluZyAjR1AoMCkgYmFjayBoZXJlPyBJIHJlYWxpemUgd2UgY2FuJ3QKeWV0IGdp
dmUgYmFjayBhIGZ1bGx5IGNvbnNpc3RlbnQgdmFsdWUgaGVyZSwgbG9va2luZyBhdCB3aGF0IGNv
bmNsdXNpb25zIExpbnV4CmRyYXdzIGZyb20gb3RoZXIgQ1BVSUQgb3V0cHV0LCBjb3VsZG4ndCAw
eDAwMDEwMDAxIGJlIHVzZWQgYXMgImZha2UiIHZhbHVlPwoKCk5ldmVydGhlbGVzcyBpZiB5b3Un
cmUgY29udmluY2VkIGl0IHNob3VsZCBiZSB0aGlzIHdheSwgYW5kIGlmIHRoaXMgZG9lc24ndCBh
Y3RpdmVseQpicmVhayBhbnkgZ3Vlc3QgT1MgKGR1ZSB0byBpbnRyb2R1Y2luZyB0aGlzIGFzIHRo
ZSBfb25seV8gdGhpbmcgY2F1c2luZyB0aGVpciBib290CnRvIGZhaWwpCgpBY2tlZC1ieTogSmFu
IEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKSmFuCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
