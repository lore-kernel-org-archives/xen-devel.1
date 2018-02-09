From: George Dunlap <dunlapg@umich.edu>
Subject: Re: [PATCH v2 1/4] asm-x86/monitor: Enable svm monitor
	events
Date: Fri, 9 Feb 2018 10:54:36 +0000
Message-ID: <CAFLBxZbRELTx66myMXxhzo+8=k9nvZjorYnsr-75zFrysCLSOQ@mail.gmail.com>
References: <1518103552-4836-1-git-send-email-aisaila@bitdefender.com>
 <1518103552-4836-2-git-send-email-aisaila@bitdefender.com>
 <CAFLBxZbB65ALGcu1mZ2ajwZ3yXEcMf8hhKf3mwSVN0h_kesQQw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <CAFLBxZbB65ALGcu1mZ2ajwZ3yXEcMf8hhKf3mwSVN0h_kesQQw@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Alexandru Isaila <aisaila@bitdefender.com>
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xen.org>, Jan Beulich <jbeulich@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBGZWIgOSwgMjAxOCBhdCAxMDoyOCBBTSwgR2VvcmdlIER1bmxhcCA8ZHVubGFwZ0B1
bWljaC5lZHU+IHdyb3RlOgo+IE9uIFRodSwgRmViIDgsIDIwMTggYXQgMzoyNSBQTSwgQWxleGFu
ZHJ1IElzYWlsYQo+IDxhaXNhaWxhQGJpdGRlZmVuZGVyLmNvbT4gd3JvdGU6Cj4+IFRoaXMgY29t
bWl0IHNlcGFyYXRlcyB0aGUgc3ZtIGNhcHMgZnJvbSB0aGUgdm14IGNhcHMuCj4KPiBJIGNhbiBz
ZWUgaG93IHRoZSBwYXRjaCByZWxhdGVzIHRvIHRoZSBkZXNjcmlwdGlvbiBoZXJlLCBidXQgaXQn
cyBub3QKPiBpbW1lZGlhdGVseSBjbGVhciBob3cgaXQgcmVsYXRlcyB0byB0aGUgdGl0bGUuCj4K
PiBBIGdvb2QgInRlbXBsYXRlIiB0byBzdGFydCB3aXRoIGZvciBhbnkgY29tbWl0IG1lc3NhZ2Ug
aXM6Cj4gMS4gV2hhdCB0aGUgY3VycmVudCBzaXR1YXRpb24gaXMKPiAyLiBXaHkgdGhhdCdzIGEg
cHJvYmxlbQo+IDMuIEhvdyB0aGlzIHBhdGNoIGZpeGVzIGl0Cj4KPiBUaGUgb25seSB0aW1lIHlv
dSBzaG91bGQgb21pdCBhbnkgb2YgdGhlc2UgaXMgaWYgaXQncyBjb21wbGV0ZWx5IG9idmlvdXMu
Cj4KPiBJbiB0aGlzIGNhc2UsIGl0IGxvb2tzIGxpa2UgdGhlIGFuc3dlcnMgd291bGQgbG9vayBs
aWtlOgo+Cj4gMS4gT25seSBhIHN1YnNldCBvZiB0aGUgbW9uaXRvciBmZWF0dXJlcyBhcmUgYXZh
aWxhYmxlIG9uIEFNRCwgYnV0IGFsbAo+IGNhcGFiaWxpdGllcyBhcmUgcGFzc2VkIHJlZ2FyZGxl
c3Mgb2YgdGhlIHByb2Nlc3NvciBhcmNoaXRlY3R1cmUuCj4KPiAyLiBUaGlzIG1lYW5zIHRoYXQg
dGhlIG1ham9yaXR5IG9mIGZ1bmN0aW9uYWxpdHkgYWR2ZXJ0aXplZCBpbgo+ICdjYXBhYmlsaXRp
ZXMnIGlzIGFjdHVhbGx5IGJyb2tlbiB3aGVuIHJ1bm5pbmcgdW5kZXIgQU1ELgo+Cj4gMy4gU2Vw
YXJhdGUgb3V0IGZlYXR1cmVzIHdoaWNoIGFyZSBpbXBsZW1lbnRlZCBvbiBib3RoIHN5c3RlbXMg
ZnJvbQo+IHRob3NlIGltcGxlbWVudGVkIG9ubHkgb24gSW50ZWwsIHNvIHRoYXQgb24gQU1EIHN5
c3RlbXMgd2Ugb25seQo+IGFkdmVydGl6ZSBmdW5jdGlvbmFsaXR5IHRoYXQgd29ya3MuCgpBbmQg
SSB0aGluayBhIGJldHRlciB0aXRsZSBtaWdodCBiZSBzb21ldGhpbmcgbGlrZToKCiJhc20teDg2
L21vbml0b3I6IEZpeCBtb250aW9yIGNhcGFiaWxpdHkgcmVwb3J0aW5nIG9uIFNWTSBzeXN0ZW1z
IgoKIC1HZW9yZ2UKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
