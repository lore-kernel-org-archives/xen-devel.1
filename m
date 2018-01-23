From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH RFC v2 00/12] xen/x86: use per-vcpu stacks
 for 64 bit pv domains
Date: Tue, 23 Jan 2018 01:36:00 -0700
Message-ID: <5A67020002000078001A1642@prv-mh.provo.novell.com>
References: <20180122123256.1431-1-jgross@suse.com>
 <5A65EC0A02000078001A1118@suse.com>
 <068bc63f-f79c-627c-4f48-ca8cdef166d9@suse.com>
 <5A6601D302000078001A1230@suse.com>
 <1a670986-d36b-3530-3b12-15ac2faa302e@suse.com>
 <5A6607DB02000078001A127B@suse.com>
 <ad9fe5e8-76b1-3a61-4696-f6d3708cd404@suse.com>
 <5A6624A602000078001A1375@prv-mh.provo.novell.com>
 <1484b1c8-6140-323e-9933-e1120f1e2a0d@citrix.com>
 <23fb5992-6e01-f162-327a-4c8905c9f686@citrix.com>
 <8c922b5c-0708-8b6b-4c4e-e6e3c41ec385@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=2ufb=es=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1edu3q-0003ve-W7
 for xen-devel@lists.xenproject.org; Tue, 23 Jan 2018 08:36:07 +0000
In-Reply-To: <8c922b5c-0708-8b6b-4c4e-e6e3c41ec385@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, wei.liu2@citrix.com, George.Dunlap@eu.citrix.com, ian.jackson@eu.citrix.com, Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIyLjAxLjE4IGF0IDIwOjAyLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMjIvMDEvMTggMTg6NDgsIEdlb3JnZSBEdW5sYXAgd3JvdGU6Cj4+IE9uIDAxLzIy
LzIwMTggMDY6MzkgUE0sIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+PiBKYW46IEFzIHRvIHRoZSB0
aGluZ3Mgbm90IGNvdmVyZWQgYnkgdGhlIGN1cnJlbnQgWFBUSSwgaGlkaW5nIG1vc3Qgb2YKPj4+
IHRoZSAudGV4dCBzZWN0aW9uIGlzIGltcG9ydGFudCB0byBwcmV2ZW50IGZpbmdlcnByaW50aW5n
IG9yIFJPUAo+Pj4gc2Nhbm5pbmcuICBUaGlzIGlzIGEgZGVmZW5jZS1pbi1kZXB0aCBhcmd1bWVu
dCwgYnV0IGEgZ3Vlc3QgYmVpbmcgZWFzaWx5Cj4+PiBhYmxlIHRvIGlkZW50aWZ5IHdoZXRoZXIg
Y2VydGFpbiBYU0FzIGFyZSBmaXhlZCBvciBub3QgaXMgcXVpdGUgYmFkLiAKPj4gSSdtIGFmcmFp
ZCB3ZSBoYXZlIGEgZmFpcmx5IGRpZmZlcmVudCBvcGluaW9uIG9mIHdoYXQgaXMgInF1aXRlIGJh
ZCIuCj4gCj4gSSBzdWdnZXN0IHlvdSB0cnkgdGFsa2luZyB0byBzb21lIHJlYWwgdXNlcnMgdGhl
bi4KPiAKPj4gU3VwcG9zZSB3ZSBoYW5kZWQgdXNlcnMgYSBrbm9iIGFuZCBzYWlkLCAiSWYgeW91
IGZsaXAgdGhpcyBzd2l0Y2gsCj4+IGF0dGFja2VycyB3b24ndCBiZSBhYmxlIHRvIHRlbGwgaWYg
eW91J3ZlIGZpeGVkIFhTQXMgb3Igbm90IHdpdGhvdXQKPj4gdHJ5aW5nIHRoZW07IGJ1dCBpdCB3
aWxsIHNsb3cgZG93biB5b3VyIGd1ZXN0cyAyMCUuIiAgSG93IG1hbnkgZG8geW91Cj4+IHRoaW5r
IHdvdWxkIGZsaXAgaXQsIGFuZCBob3cgbWFueSB3b3VsZCByZWNrb24gdGhhdCBhbiBhdHRhY2tl
ciBjb3VsZAo+PiBwcm9iYWJseSBmaW5kIG91dCB0aGF0IGluZm9ybWF0aW9uIGFueXdheT8KPiAK
PiBOb25zZW5zZS4gIFRoZSBwZXJmb3JtYW5jZSBoaXQgaXMgYWxyZWFkeSB0YWtlbi4gIFRoZSBh
cmd1bWVudCBpcyAiZG8KPiB5b3Ugd2FudCBhbiBhdHRhY2tlciBhYmxlIHRvIHRyaXZpYWxseSBl
dmFsdWF0ZSBzZWN1cml0eSB3ZWFrbmVzc2VzIGluCj4geW91ciBoeXBlcnZpc29yIiwgYSBwcm9j
ZXNzIHdoaWNoIHVzdWFsbHkgaGFzIHRvIGJlIGRvbmUgYnkgZ3Vlc3N3b3JrCj4gYW5kIGtub3dp
bmcgdGhlIGV4YWN0IGJpbmFyeSB1bmRlciBhdHRhY2suICBIYXZpbmcgLnRleHQgZnVsbHkgcmVh
ZGFibGUKPiBsb3dlcnMgdGhlIGJhcnJpZXIgdG8gZW50cnkgc3Vic3RhbnRpYWxseS4KCkkgbmVp
dGhlciBhZ3JlZSB3aXRoIEdlb3JnZSdzIHJlcGx5IGJlaW5nIG5vbnNlbnNlLCBub3IgZG8gSSB0
aGluawp0aGlzIGlzIGFuIGFwcHJvcHJpYXRlIHRvbmUuIF9Tb21lXyBwZXJmb3JtYW5jZSBoaXQg
aXMgYWxyZWFkeQp0YWtlbi4gRnVydGhlciBoaWRpbmcgb2YgaW5mb3JtYXRpb24gbXkgaW5jdXIg
ZnVydGhlciBsb3NzIG9mCnBlcmZvcm1hbmNlLCBvciBhcmUgeW91IHRlbGxpbmcgbWUgeW91IGNh
biBndWFyYW50ZWUgdGhpcyBuZXZlcgpldmVyIHRvIGhhcHBlbj8gQWRkaXRpb25hbGx5LCB0aGUg
YW1vdW50IG9mICJndWVzc3dvcmsiIG1heQpoZWF2aWx5IGRlcGVuZCBvbiB0aGUgbmF0dXJlIG9m
IGEgc3BlY2lmaWMgaXNzdWUuIEkgY2FuIGltYWdpbmUKY2FzZXMgd2hlcmUgc3VjaCBndWVzc3dv
cmsgbWF5IGV2ZW4gdHVybiBvdXQgZWFzaWVyIHRoYW4gdXNpbmcKc29tZSBzaWRlIGNoYW5uZWwg
YXBwcm9hY2ggbGlrZSB0aG9zZSByZWNlbnQgb25lcy4KCkFzIGluZGljYXRlZCBlYXJsaWVyLCBJ
J20gbm90IGZ1bmRhbWVudGFsbHkgb3Bwb3NlZCB0byBoaWRpbmcKbW9yZSB0aGluZ3MsIGJ1dCBJ
J20gYWxzbyBub3QgY29udmluY2VkIHdlIHNob3VsZCBoaWRlIG1vcmUgc3R1ZmYKcmVnYXJkbGVz
cyBvZiB0aGUgcHJpY2UgdG8gcGF5LgoKSmFuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
