From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] domctl: revert double increment of domctl
	version
Date: Wed, 21 Feb 2018 17:53:54 +0000
Message-ID: <af2837e6-93dc-4552-ca3c-5e1e50c05cc0@citrix.com>
References: <20180221173422.10550-1-olaf@aepfle.de>
 <20180221173802.4asubsivkejs2ihy@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180221173802.4asubsivkejs2ihy@citrix.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>, Olaf Hering <olaf@aepfle.de>
Cc: Stefano Stabellini <sstabellini@kernel.org>, George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, xen-devel@lists.xen.org, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjEvMDIvMTggMTc6MzgsIFdlaSBMaXUgd3JvdGU6Cj4gT24gV2VkLCBGZWIgMjEsIDIwMTgg
YXQgMDY6MzQ6MjJQTSArMDEwMCwgT2xhZiBIZXJpbmcgd3JvdGU6Cj4+IFhlbiA0LjEwIGhhcyBY
RU5fRE9NQ1RMX0lOVEVSRkFDRV9WRVJTSU9OIDB4ZSwgc3RhZ2luZyBzaG91bGQgYmUgZmluZQo+
PiB3aXRoIDB4ZiB1bnRpbCB0aGUgbmV4dCByZWxlYXNlIGlzIHByZXBhcmVkLgo+Pgo+PiBTaWdu
ZWQtb2ZmLWJ5OiBPbGFmIEhlcmluZyA8b2xhZkBhZXBmbGUuZGU+Cj4+IC0tLQo+PiAgeGVuL2lu
Y2x1ZGUvcHVibGljL2RvbWN0bC5oIHwgMiArLQo+PiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9wdWJs
aWMvZG9tY3RsLmggYi94ZW4vaW5jbHVkZS9wdWJsaWMvZG9tY3RsLmgKPj4gaW5kZXggZWM3YTg2
MGFmYy4uNTAxYzQ0MjMwYiAxMDA2NDQKPj4gLS0tIGEveGVuL2luY2x1ZGUvcHVibGljL2RvbWN0
bC5oCj4+ICsrKyBiL3hlbi9pbmNsdWRlL3B1YmxpYy9kb21jdGwuaAo+PiBAQCAtMzgsNyArMzgs
NyBAQAo+PiAgI2luY2x1ZGUgImh2bS9zYXZlLmgiCj4+ICAjaW5jbHVkZSAibWVtb3J5LmgiCj4+
ICAKPj4gLSNkZWZpbmUgWEVOX0RPTUNUTF9JTlRFUkZBQ0VfVkVSU0lPTiAweDAwMDAwMDEwCj4+
ICsjZGVmaW5lIFhFTl9ET01DVExfSU5URVJGQUNFX1ZFUlNJT04gMHgwMDAwMDAwZgo+PiAgCj4g
VGhlIHJlYXNvbiB3ZSBidW1wZWQgdGhlIG51bWJlciB0d2ljZSBpcyBiZWNhdXNlIHdlIHdhbnQg
YSBkZWRpY2F0ZWQKPiBudW1iZXIgdG8gZGVub3RlIHRoZSByZWNlbnQgc2VjdXJpdHkgZml4LgoK
VGhlIGRvdWJsZSBidW1wIGlzIHRoZXJlIGJlY2F1c2UgSmFuIGluc2lzdGVkIHVwb24gaXQsIHNv
IHRoZXJlIGlzIGEKbnVtYmVyIHRvIGJ1cm4gaWYgd2UgZGVjaWRlIHRvIGJhY2twb3J0IHBhcnQg
b2YgUFYtaW4tUFZIIHRvIFhlbiA0LjEwLsKgCkl0IGlzIGN1cnJlbnRseSB1bnVzZWQuCgpJIGNv
bnRpbnVlIHRvIHRoaW5rIHRoYXQgdGhpcyBpcyBhIG1pc3Rha2UgKHdoaWNoIGlzIGJhY2tlZCB1
cCBieQpldmVyeW9uZSBlbHNlIGJlaW5nIGNvbmZ1c2VkIGFib3V0IHdoYXQgaXMgZ29pbmcgb24p
LCBhbmQgZGVtb25zdHJhdGVzCnRoZSBpbmVmZmVjdGl2ZW5lc3Mgb2YgdGhlICpfSU5URVJGQUNF
X1ZFUlNJT05TIGluIGdlbmVyYWwuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
