From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v4 08/16] xen/mm: Drop the parameter mfn
 from populate_pt_range
Date: Thu, 22 Feb 2018 16:40:04 +0000
Message-ID: <445bc932-044d-eacf-a487-0410e8fdb22d@arm.com>
References: <20180221140259.29360-1-julien.grall@arm.com>
 <20180221140259.29360-9-julien.grall@arm.com>
 <20180222163505.enzgrp4alo7pibeh@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180222163505.enzgrp4alo7pibeh@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xen.org, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

SGkgV2VpLAoKT24gMjIvMDIvMTggMTY6MzUsIFdlaSBMaXUgd3JvdGU6Cj4gT24gV2VkLCBGZWIg
MjEsIDIwMTggYXQgMDI6MDI6NTFQTSArMDAwMCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBUaGUg
ZnVuY3Rpb24gcG9wdWxhdGVfcHRfcmFuZ2UgaXMgdXNlZCB0byBwb3B1bGF0ZSBpbiBhZHZhbmNl
IHRoZQo+PiBwYWdlLXRhYmxlIGJ1dCBpdCB3aWxsIG5vdCBkbyB0aGUgYWN0dWFsIG1hcHBpbmcu
IFNvIHBhc3NpbmcgdGhlIE1GTiBpbgo+PiBwYXJhbWV0ZXIgaXMgcG9pbnRsZXNzLiBOb3RlIHRo
YXQgdGhlIG9ubHkgY2FsbGVyIHBhc3MgMC4uLgo+Pgo+PiBBdCB0aGUgc2FtZSB0aW1lIHJlcGxh
Y2UgMCBieSBJTlZBTElEX01GTiB0byBtYWtlIGNsZWFyIHRoZSBNRk4gaXMKPj4gaW52YWxpZC4K
Pj4KPiAKPiBUaGUgbWZuIHBhcmFtZXRlciBpcyB0aGUgZmlyc3QgbWZuIG9mIGEgY29uc2VjdXRp
dmUgbnIgTUZOcyBwYXNzZWQgdG8KPiBtYXBfcGFnZXNfdG9feGVuLiBQdXR0aW5nIElOVkFMSURf
TUZOIGlzbid0IGhlbHBpbmcgLS0gdGhlIHZhbHVlIHdyaXR0ZW4KPiB0byBwYWdlIHRhYmxlKHMp
IHdpbGwgd3JhcCBhcm91bmQgdG8gMC4KPiAKPiBBbmQgSSB0aGluayBzdGFydGluZyBmcm9tIDAg
dG8gYXZvaWQgb3ZlcmZsb3cgaXMgcHJvYmFibHkgYSBiZXR0ZXIKPiBiZWhhdmlvdXIuIElmIHlv
dSByZWFsbHkgd2FudCB0byBtYWtlIHN1cmUgYWxsIGVudHJpZXMgYXJlIGZpbGxlZCB3aXRoCj4g
SU5WQUxJRF9NRk4geW91IHNob3VsZCBjYWxsIG1hcF9wYWdlc190b194ZW4gZm9yIG5yIHRpbWVz
IHdpdGggZWFjaAo+IHBhZ2UuCgpJIGFtIG5vdCBzdXJlIHRvIHVuZGVyc3RhbmQgdGhpcy4gRnJv
bSBpdHMgbmFtZSwgcG9wdWxhdGVfcHRfcmFuZ2UgCnNob3VsZCBvbmx5IGNyZWF0ZSB0aGUgaW50
ZXJtZWRpYXRlIHRhYmxlcy4gVGhlIGxlYWYgZW50cnkgd2lsbCBzdGF5IAppbnZhbGlkLiBTbyBo
b3cgdGhlIHZhbHVlIG9mIG1mbiBtYXR0ZXJzPyBJcyBpdCBiZWNhdXNlIHRoZSBjb2RlIGlzIAp3
cml0dGVuIGluIGEgc3VjaCB3YXkgdGhhdCBwYXNzaW5nIElOVkFMSURfTUZOIHdpbGwgcmVzdWx0
IHRvIHVuZGVmaW5lZCAKYmVoYXZpb3I/CgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
