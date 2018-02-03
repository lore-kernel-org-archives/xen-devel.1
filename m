From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 3/3] x86/svm: correct EFER.SVME intercept
	checks
Date: Sat, 3 Feb 2018 17:10:14 +0000
Message-ID: <b79c8792-0b4a-8ad4-52cd-ea0b7e4c23c7@citrix.com>
References: <20180131203525.21660-1-brian.woods@amd.com>
 <20180131203525.21660-4-brian.woods@amd.com>
 <3afd1271-ae0c-7d44-0afe-0474c86b568c@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <3afd1271-ae0c-7d44-0afe-0474c86b568c@oracle.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, Brian Woods <brian.woods@amd.com>, xen-devel@lists.xen.org
Cc: Jan Beulich <jbeulich@suse.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDMvMDIvMTggMTc6MDMsIEJvcmlzIE9zdHJvdnNreSB3cm90ZToKPgo+Cj4gT24gMDEvMzEv
MjAxOCAwMzozNSBQTSwgQnJpYW4gV29vZHMgd3JvdGU6Cj4+IENvcnJlY3RzIHNvbWUgRUZFUi5T
Vk1FIGNoZWNrcyBpbiBpbnRlcmNlcHRzLsKgIFNlZSBBTUQgQVBNIHZvbDIgc2VjdGlvbgo+PiAx
NS40IGZvciBtb3JlIGRldGFpbHMuwqAgVk1NQ0FMTCBpc24ndCBjaGVja2VkIGR1ZSB0byBndWVz
dHMgbmVlZGluZyBpdAo+PiB0byBib290Lgo+Pgo+Cj4gRG9uJ3QgeW91IG5lZWQgU1ZNRSBiZSBv
biBmb3IgVk1NQ0FMTD8KCkluIHJlYWwgaGFyZHdhcmUsIHllcy4KCkhvd2V2ZXIsIGl0J3MgcXVp
dGUgdW5yZWFzb25hYmxlIHRvIHJlcXVpcmUgdGhlIGd1ZXN0IHRvIGhhdmUgYWN0aXZhdGVkCml0
cyBpZGVhIG9mIEVGRVIuU1ZNRSBiZWZvcmUgaXQgY2FuIG1ha2UgaHlwZXJjYWxscyA6KQoKfkFu
ZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
