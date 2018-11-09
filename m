From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v6 24/26] xen/vpl011: buffer out chars when
 the backend is xen
Date: Fri, 9 Nov 2018 14:32:20 +0000
Message-ID: <63451d9f-af2b-1c30-2f3a-dd7a7b9965f0@arm.com>
References: <alpine.DEB.2.10.1811021527250.18518@sstabellini-ThinkPad-X260>
 <1541202318-9840-24-git-send-email-sstabellini@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1541202318-9840-24-git-send-email-sstabellini@kernel.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Stefano Stabellini <stefanos@xilinx.com>, andrii_anisov@epam.com, konrad.wilk@oracle.com, George.Dunlap@eu.citrix.com, andrew.cooper3@citrix.com, Achin.Gupta@arm.com, ian.jackson@eu.citrix.com, xen-devel@lists.xen.org, tim@xen.org, jbeulich@suse.com, wei.liu2@citrix.com
List-Id: xen-devel@lists.xenproject.org

SGkgU3RlZmFubywKCk9uIDAyLzExLzIwMTggMjM6NDUsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90
ZToKPiBUbyBhdm9pZCBtaXhpbmcgdGhlIG91dHB1dCBvZiBkaWZmZXJlbnQgZG9tYWlucyBvbiB0
aGUgY29uc29sZSwgYnVmZmVyCj4gdGhlIG91dHB1dCBjaGFycyBhbmQgcHJpbnQgbGluZSBieSBs
aW5lLiBVbmxlc3MgdGhlIGRvbWFpbiBoYXMgaW5wdXQKPiBmcm9tIHRoZSBzZXJpYWwsIGluIHdo
aWNoIGNhc2Ugd2Ugd2FudCB0byBwcmludCBjaGFyIGJ5IGNoYXIgZm9yIGEKPiBzbW9vdGggdXNl
ciBleHBlcmllbmNlLgo+IAo+IFRoZSBzaXplIG9mIFNCU0FfVUFSVF9PVVRfQlVGX1NJWkUgaXMg
YXJiaXRyYXJ5LCBjaG9vc2UgdGhlIHNhbWUgc2l6ZQo+IGFzIFZVQVJUX0JVRl9TSVpFIHVzZWQg
aW4gdnVhcnQuYy4KPiAKPiBFeHBvcnQgYSBmdW5jdGlvbiBuYW1lZCBjb25zb2xlX2lucHV0X2Rv
bWFpbigpIHRvIGFsbG93IG90aGVycyB0byBrbm93Cj4gd2hpY2ggZG9tYWlucyBoYXMgaW5wdXQg
YXQgYSBnaXZlbiB0aW1lLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8
c3RlZmFub3NAeGlsaW54LmNvbT4KCldpdGggb25lIHF1ZXN0aW9uIGJlbG93OgoKUmV2aWV3ZWQt
Ynk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cgo+IENDOiBhbmRyZXcuY29v
cGVyM0BjaXRyaXguY29tCj4gQ0M6IEdlb3JnZS5EdW5sYXBAZXUuY2l0cml4LmNvbQo+IENDOiBp
YW4uamFja3NvbkBldS5jaXRyaXguY29tCj4gQ0M6IGpiZXVsaWNoQHN1c2UuY29tCj4gQ0M6IGtv
bnJhZC53aWxrQG9yYWNsZS5jb20KPiBDQzogdGltQHhlbi5vcmcKPiBDQzogd2VpLmxpdTJAY2l0
cml4LmNvbQo+IC0tLQo+IFhYWDogbWVyZ2UgdGhpcyBwYXRjaCB3aXRoICJ4ZW4vYXJtOiBBbGxv
dyB2cGwwMTEgdG8gYmUgdXNlZCBieSBEb21VIiBvbgo+ICAgICAgIGNvbW1pdAoKQ291bGQgeW91
IHByb3ZpZGUgYSBjb21taXQgbWVzc2FnZSB0aGF0IHdpbGwgYmUgdXNlZCBhZnRlciBtZXJnZT8K
CkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
