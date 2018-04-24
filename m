From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH 3/6] arm: make it possible to disable the
 SMMU driver
Date: Tue, 24 Apr 2018 09:57:09 +0100
Message-ID: <b4ed1393-42fc-2f3e-8cc5-32fdb6956d66@arm.com>
References: <alpine.DEB.2.10.1804181324400.17714@sstabellini-ThinkPad-X260>
 <1524089752-22174-3-git-send-email-sstabellini@kernel.org>
 <7d79c66c-c252-71fa-bd64-7de7d5a09914@arm.com>
 <5AD9B53E02000078001BCE3B@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5AD9B53E02000078001BCE3B@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

CgpPbiAwNC8yMC8yMDE4IDEwOjM5IEFNLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBPbiAxOS4w
NC4xOCBhdCAxNzo0NCwgPGp1bGllbi5ncmFsbEBhcm0uY29tPiB3cm90ZToKPj4gT24gMTgvMDQv
MTggMjM6MTUsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPj4+IC0tLSBhL3hlbi9kcml2ZXJz
L3Bhc3N0aHJvdWdoL0tjb25maWcKPj4+ICsrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL0tj
b25maWcKPj4+IEBAIC0xLDMgKzEsNSBAQAo+Pj4gICAgCj4+PiAgICBjb25maWcgSEFTX1BBU1NU
SFJPVUdICj4+PiAgICAJYm9vbAo+Pj4gKwo+Pj4gK3NvdXJjZSAiZHJpdmVycy9wYXNzdGhyb3Vn
aC9hcm0vS2NvbmZpZyIKPj4KPj4gQ2FuJ3Qgd2UgbG9hZCBhcm0vS2NvbmZpZyBvbmx5IHdoZW4g
YXJtIGlzIHNlbGVjdGVkPyBUaGlzIHdvdWxkIGF2b2lkCj4+IHdlaXJkIG9wdGlvbiBvbiB4ODYu
Cj4gCj4gSG93IHdvdWxkIHRob3NlIG9wdGlvbnMgYXBwZWFyIGZvciB4ODYsIGdpdmVuIC4uLgo+
IAo+Pj4gLS0tIC9kZXYvbnVsbAo+Pj4gKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYXJt
L0tjb25maWcKPj4+IEBAIC0wLDAgKzEsNyBAQAo+Pj4gKwo+Pj4gK2NvbmZpZyBIQVNfU01NVXYy
Cj4+PiArCWJvb2wgIkFSTSBTTU1VdjIgZHJpdmVyIgo+Pj4gKwlkZWZhdWx0IHkKPj4+ICsJZGVw
ZW5kcyBvbiBBUk0KPiAKPiAuLi4gdGhpcyAiZGVwZW5kcyBvbiI/IE9mIGNvdXJzZSBpZiBtb3Jl
IG9wdGlvbnMgYXJlIGdvaW5nIHRvIGFwcGVhciBoZXJlLAo+IHdyYXBwaW5nIHRoZSB3aG9sZSBm
aWxlIGluICJpZiBBUk0iIHdvdWxkIGJlIHVzZWZ1bCBhbnl3YXksIGV2ZW4gaWYgb25seQo+IHRv
IGxpbWl0IHJlZHVuZGFuY3kuCgpJdCB3aWxsIGFwcGVhciB3aGVuIHlvdSBzZWFyY2ggZm9yIGl0
IGluIHRoZSBtZW51Y29uZmlnLiBUaGlzIHdpbGwgbG9vayAKcXVpdGUgd2VpcmQgZm9yIHg4Ni4K
Cj4gCj4gT3RvaCwgYXMgdm9pY2VkIGJlZm9yZSBpbiBhIGRpZmZlcmVudCBjb250ZXh0LCBJJ20g
bm90IGNvbnZpbmNlZCB3ZSB3YW50Cj4gc3VjaCBzaW5nbGUtb3B0aW9uIEtjb25maWcgZmlsZXMs
IGkuZS4gaW4gdGhlIGNhc2UgaGVyZSB0aGUgb3B0aW9uIG1heSBiZXR0ZXIKPiBnbyBkaXJlY3Rs
eSBpbnRvIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL0tjb25maWcuIFNwbGl0dGluZyBmaWxlcyB3
aGVuIHRoZXkKPiBncm93IHRvbyBsYXJnZSBpcyBhbiBvcHRpb24gYW55d2F5LgoKSSB3b3VsZCBi
ZSBvayB3aXRoIHRoYXQuCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
