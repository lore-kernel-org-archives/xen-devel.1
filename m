From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 6/7] xen/domain: Pass the full
 domctl_createdomain struct to create_domain()
Date: Fri, 9 Mar 2018 14:50:45 +0000
Message-ID: <20180309145045.e75dz37teqiqi24y@citrix.com>
References: <1520601522-2886-1-git-send-email-andrew.cooper3@citrix.com>
 <1520601522-2886-7-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <1520601522-2886-7-git-send-email-andrew.cooper3@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>, Xen-devel <xen-devel@lists.xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBNYXIgMDksIDIwMTggYXQgMDE6MTg6NDFQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBJbiBmdXR1cmUgcGF0Y2hlcywgdGhlIHN0cnVjdHVyZSB3aWxsIGJlIGV4dGVuZGVk
IHdpdGggZnVydGhlciBpbmZvcm1hdGlvbiwKPiBhbmQgdGhpcyBpcyBmYXIgY2xlYW5lciB0aGFu
IGFkZGluZyBleHRyYSBwYXJhbWV0ZXJzLgo+IAo+IE9uZSBtaW5vciB0d2VhayBpcyB0aGF0IHRo
ZSBzZXR0aW5nIG9mIGd1ZXN0X3R5cGUgbmVlZHMgdG8gYmUgZGVmZXJyZWQgdW50aWwKPiBjb25m
aWcgaXMga25vd24tZ29vZCB0byBkZXJlZmVyZW5jZSwgYnV0IHRoaXMgZG9lc24ndCByZXN1bHQg
aW4gYW55IGNoYW5nZWQKPiBiZWhhdmlvdXIgYXMgc3lzdGVtIGRvbWFpbnMgbmV2ZXIgdXNlZCB0
byBwYXNzIFhFTl9ET01DVExfQ0RGX2h2bV9ndWVzdC4KPiAKPiBBbHNvIGZvciBjb21wbGV0ZW5l
c3MsIG1vdmUgdGhlIHNldHRpbmcgb2YgZC0+aGFuZGxlIGludG8gdGhlIHRhaWwgb2YKPiBkb21h
aW5fY3JlYXRlKCkgd2hlcmUgaXQgbW9yZSBsb2dpY2FsbHkgc2hvdWxkIGxpdmUuCj4gCj4gU2ln
bmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KClJl
dmlld2VkLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
