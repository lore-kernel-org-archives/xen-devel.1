From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 0/4] x86: Drop PVRDTSCP and fix MSR_TSC_AUX
 handling for guests
Date: Fri, 16 Nov 2018 17:43:42 +0000
Message-ID: <78463755-55b3-7914-227e-9351702b6764@citrix.com>
References: <1542318438-20319-1-git-send-email-andrew.cooper3@citrix.com>
 <5BEE97C402000078001FCB10@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5BEE97C402000078001FCB10@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Xen-devel <xen-devel@lists.xen.org>, Jun Nakajima <jun.nakajima@intel.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Brian Woods <brian.woods@amd.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTYvMTEvMjAxOCAxMDoxMSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMTUuMTEuMTgg
YXQgMjI6NDcsIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToKPj4gQm9yaXMgaGFz
IGNvbmZpcm1lZCB0aGF0IG5vb25lIGFwcGVhcnMgdG8gYmUgdXNpbmcgUFZSRFRTQ1AgYW55IG1v
cmUsIGFuZCBpbgo+PiB0aGUgZGVjYWRlIHNpbmNlIGl0IHdhcyBpbnRyb2R1Y2VkLCBndWVzdCBr
ZXJuZWwgLyBoYXJkd2FyZSBzdXBwb3J0IGhhcwo+PiBwcm92aWRlZCBhIGJldHRlciBhbHRlcm5h
dGl2ZS4KPiBEb2Vzbid0IHJlbW92YWwgb2YgZnVuY3Rpb25hbGl0eSByZXF1aXJlIGtub3dpbmcg
dGhhdCBpdCB3YXMgbmV2ZXIgdXNlZAo+IGF0IGFsbCwgcmF0aGVyIHRoYW4ganVzdCBrbm93aW5n
IHRoYXQgbm90aGluZyB1c2VzIGl0IGFueW1vcmU/IFdoYXQgaWYKPiBzb21lIG9sZCBndWVzdCBz
b21ld2hlcmUgcmVsaWVzIG9uIGl0PwoKSXRzIGFuIGFsbC1vci1ub3RoaW5nIGZlYXR1cmUuwqAg
VGhlIGVudGlyZXR5IG9mIHlvdXIgVk0gdXNlcnNwYWNlIG5lZWQKdG8gc3VwcG9ydCBpdCwgb3Ig
dGltaW5nIHdpbGwgZ28gd3Jvbmcgb24gbWlncmF0ZS4KCldlIGFscmVhZHkgZXN0YWJsaXNoZWQg
dGhhdCBpdCBhcHBlYXJzIHRvIGJlIGEgdmVzdGlnaWFsIE9yYWNsZS1pc20gZm9yCndoaWNoIG5v
IGNvbnN1bWVyIHNpZGUgY29kZSBldmVyIGFwcGVhcmVkLCBhbmQgdGhhdCBpc24ndCB1c2VkLgoK
V2hhdCBpcyB1bmFjY2VwdGFibGUgaXMgUFZSRFRTQ1AncyBpbXBsZW1lbnRhdGlvbiBjYXVzaW5n
IGJyZWFrYWdlcyBpbgphcmNoaXRlY3R1cmFsIGJlaGF2aW91ciBmb3Igbm9uLVBWUkRUU0NQIGNv
bmZpZ3VyYXRpb25zLCBhbmQgb25lIHdheSBvcgphbm90aGVyLCB0aGlzIG5lZWRzIGZpeGluZy4K
ClBsZWFzZSBjYW4gd2UgbWFrZSBhIGRlY2lzaW9uLCBiZWNhdXNlIEkgZG9uJ3QgaGF2ZSB0byB0
aW1lIChvciBpbmRlZWQsCnRoZSB3YW50KSB0byBhbmQgZml4IHRoaXMgYSAzcmQgZGlmZmVyZW50
IHdheSBpZiB0aGF0J3MgZ29pbmcgdG8gcnVuCmludG8gYSBzaW1pbGFyIHJlYWN0aW9uLgoKfkFu
ZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
