From: Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: Re: [PATCH v4 6/6] x86/domctl: Remove
	XEN_DOMCTL_pin_mem_cacheattr
Date: Tue, 23 Jan 2018 15:47:52 +0000
Message-ID: <effd359a-26ed-c451-15a6-21021a9932f9@citrix.com>
References: <20180123152246.22031-1-ross.lagerwall@citrix.com>
 <20180123152246.22031-7-ross.lagerwall@citrix.com>
 <20180123154427.grsg3evcxqpgxljk@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180123154427.grsg3evcxqpgxljk@citrix.com>
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
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xen.org, Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>
List-Id: xen-devel@lists.xenproject.org

T24gMDEvMjMvMjAxOCAwMzo0NCBQTSwgV2VpIExpdSB3cm90ZToKPiBPbiBUdWUsIEphbiAyMywg
MjAxOCBhdCAwMzoyMjo0NlBNICswMDAwLCBSb3NzIExhZ2Vyd2FsbCB3cm90ZToKPj4gUmVtb3Zl
IHRoZSBpbXBsZW1lbnRhdGlvbiBvZiBYRU5fRE9NQ1RMX3Bpbl9tZW1fY2FjaGVhdHRyIHNpbmNl
IGl0IGhhcwo+PiBiZWVuIHJlcGxhY2VkIGJ5IGEgZG1vcC4gQ2hhbmdlIHhjX2RvbWFpbl9waW5f
bWVtb3J5X2NhY2hlYXR0cigpIHNvCj4+IHRoYXQgaXQgaXMgb25seSBkZWZpbmVkIHdoZW4gWENf
V0FOVF9DT01QQVRfREVWSUNFTU9ERUxfQVBJIGlzIHNldCBhbmQKPj4gaGF2ZSBpdCBjYWxsIHRo
ZSBuZXcgZG1vcC4gIExlYXZlIHRoZSBkZWZpbml0aW9ucyBvZgo+PiBYRU5fRE9NQ1RMX01FTV9D
QUNIRUFUVFJfKiBzaW5jZSB0aGV5IGFyZSBzdGlsbCB1c2VkIGJ5IFFFTVUuCj4+CnNuaXA+PiBk
aWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvcHVibGljL2RvbWN0bC5oIApiL3hlbi9pbmNsdWRlL3B1
YmxpYy9kb21jdGwuaAo+PiBpbmRleCBhODkyMWRkLi4zMDY3NGQ2IDEwMDY0NAo+PiAtLS0gYS94
ZW4vaW5jbHVkZS9wdWJsaWMvZG9tY3RsLmgKPj4gKysrIGIveGVuL2luY2x1ZGUvcHVibGljL2Rv
bWN0bC5oCj4+IEBAIC0zOCw3ICszOCw3IEBACj4+ICAgI2luY2x1ZGUgImh2bS9zYXZlLmgiCj4+
ICAgI2luY2x1ZGUgIm1lbW9yeS5oIgo+PiAgIAo+PiAtI2RlZmluZSBYRU5fRE9NQ1RMX0lOVEVS
RkFDRV9WRVJTSU9OIDB4MDAwMDAwMGYKPj4gKyNkZWZpbmUgWEVOX0RPTUNUTF9JTlRFUkZBQ0Vf
VkVSU0lPTiAweDAwMDAwMDEwCj4+ICAgCj4gCj4gV2UgYnVtcGVkIHRoaXMgdG8gMGYgaW4gdGhp
cyBkZXZlbG9wbWVudCB3aW5kb3cgc28gdGhlcmUgaXMgbm8gbmVlZCB0bwo+IGRvIGl0IGFnYWlu
LgoKT0suCgo+IAo+PiAgIC8qCj4+ICAgICogTkIuIHhlbl9kb21jdGwuZG9tYWluIGlzIGFuIElO
L09VVCBwYXJhbWV0ZXIgZm9yIHRoaXMgb3BlcmF0aW9uLgo+PiBAQCAtNTk4LDEwICs1OTgsNiBA
QCBzdHJ1Y3QgeGVuX2RvbWN0bF9pb3BvcnRfbWFwcGluZyB7Cj4+ICAgI2RlZmluZSBYRU5fRE9N
Q1RMX01FTV9DQUNIRUFUVFJfV0IgIDYKPj4gICAjZGVmaW5lIFhFTl9ET01DVExfTUVNX0NBQ0hF
QVRUUl9VQ00gNwo+PiAgICNkZWZpbmUgWEVOX0RPTUNUTF9ERUxFVEVfTUVNX0NBQ0hFQVRUUiAo
fih1aW50MzJfdCkwKQo+IAo+IEFueSByZWFzb24gdG8gbm90IHJlbW92ZSB0aGVzZSAjZGVmaW5l
J3M/Cj4gCgpUaGV5J3JlIHN0aWxsIHVzZWQgYnkgUUVNVSBhdCB0aGUgbW9tZW50LiBSZW1vdmlu
ZyB0aGVtIG5vdyB3b3VsZCBicmVhayAKdGhlIGJ1aWxkLiBUaGV5IGNhbiBiZSByZW1vdmVkIG9u
Y2UgUUVNVShzKSBoYXZlIGJlZW4gc3dpdGNoIHRvIHVzZSB0aGUgCm5ldyBYRU5fRE1PUF8qICNk
ZWZpbmVzLgoKLS0gClJvc3MgTGFnZXJ3YWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
