From: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH RFC 3/6] kexec: export PG_offline to
 VMCOREINFO
Date: Thu, 15 Nov 2018 12:20:40 +0100
Message-ID: <4aa5d39d-a923-87de-d646-70b9cbfe62f0__3180.43547817997$1542280775$gmane$org@redhat.com>
References: <20181114211704.6381-1-david@redhat.com>
 <20181114211704.6381-4-david@redhat.com>
 <20181115061923.GA3971@dhcp-128-65.nay.redhat.com>
 <20181115111023.GC26448@zn.tnic>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=kcc+=n2=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1gNFhc-0007yQ-NP
 for xen-devel@lists.xenproject.org; Thu, 15 Nov 2018 11:20:52 +0000
In-Reply-To: <20181115111023.GC26448@zn.tnic>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Borislav Petkov <bp@alien8.de>, Dave Young <dyoung@redhat.com>
Cc: Michal Hocko <mhocko@suse.com>, Arnd Bergmann <arnd@arndb.de>, Baoquan He <bhe@redhat.com>, linux-pm@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org, "Michael S. Tsirkin" <mst@redhat.com>, xen-devel@lists.xenproject.org, linux-fsdevel@vger.kernel.org, devel@linuxdriverproject.org, Andrew Morton <akpm@linux-foundation.org>, Omar Sandoval <osandov@fb.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Lianbo Jiang <lijiang@redhat.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTUuMTEuMTggMTI6MTAsIEJvcmlzbGF2IFBldGtvdiB3cm90ZToKPiBPbiBUaHUsIE5vdiAx
NSwgMjAxOCBhdCAwMjoxOToyM1BNICswODAwLCBEYXZlIFlvdW5nIHdyb3RlOgo+PiBJdCB3b3Vs
ZCBiZSBnb29kIHRvIGNvcHkgc29tZSBiYWNrZ3JvdW5kIGluZm8gZnJvbSBjb3ZlciBsZXR0ZXIg
dG8gdGhlCj4+IHBhdGNoIGRlc2NyaXB0aW9uIHNvIHRoYXQgd2UgY2FuIGdldCBiZXR0ZXIgdW5k
ZXJzdGFuZGluZyB3aHkgdGhpcyBpcwo+PiBuZWVkZWQgbm93Lgo+Pgo+PiBCVFcsIExpYW5ibyBp
cyB3b3JraW5nIG9uIGEgZG9jdW1lbnRhdGlvbiBvZiB0aGUgdm1jb3JlaW5mbyBleHBvcnRlZAo+
PiBmaWVsZHMuIENjaW5nIGhpbSBzbyB0aGF0IGhlIGlzIGF3YXJlIG9mIHRoaXMuCj4+Cj4+IEFs
c28gY2MgQm9yaXMsICBhbHRob3VnaCBJIGRvIG5vdCB3YW50IHRoZSBkb2MgY2hhbmdlcyBibG9j
a3MgdGhpcwo+PiBoZSBtaWdodCBoYXZlIGRpZmZlcmVudCBvcGluaW9uIDopCj4gCj4gWWVhaCwg
bXkgaW5pdGlhbCByZWFjdGlvbiBpcyB0aGF0IGV4cG9ydGluZyBhbiBtbS1pbnRlcm5hbCBmbGFn
IHRvCj4gdXNlcnNwYWNlIGlzIGEgbm8tbm8uCgpTb3JyeSB0byBzYXksIGJ1dCB0aGF0IGlzIHRo
ZSBjdXJyZW50IHByYWN0aWNlIHdpdGhvdXQgd2hpY2gKbWFrZWR1bXBmaWxlIHdvdWxkIG5vdCBi
ZSBhYmxlIHRvIHdvcmsgYXQgYWxsLiAoZXhjbHVkZSB1c2VyIHBhZ2VzLApleGNsdWRlIHBhZ2Ug
Y2FjaGUsIGV4Y2x1ZGUgYnVkZHkgcGFnZXMpLiBMZXQncyBub3QgcmVpbnZlbnQgdGhlIHdoZWVs
CmhlcmUuIFRoaXMgaXMgaG93IGR1bXBpbmcgd29ya3MgZm9yZXZlci4KCkFsc28gc2VlIGhvdyBo
d3BvaXNvbmVkIHBhZ2VzIGFyZSBoYW5kbGVkLgoKKHBsZWFzZSBub3RlIHRoYXQgbW9zdCBkaXN0
cmlidXRpb25zIG9ubHkgc3VwcG9ydCBkdW1waW5nIHZpYQptYWtlZHVtcGZpbGUsIGZvciBzYWlk
IHJlYXNvbnMpCgo+IAo+IFdoYXQgd291bGQgYmUgYmV0dGVyLCBJTUhPLCBpcyBoYXZpbmcgYSBn
ZW5lcmFsIG1ldGhvZCBvZiB0ZWxsaW5nIHRoZQo+IGtkdW1wIGtlcm5lbCAtIG1heWJlIHJhbmdl
cyBvZiBwaHlzaWNhbCBhZGRyZXNzZXMgLSB3aGljaCB0byBza2lwLgoKQW5kIHRoYXQgaGFzIHRv
IGJlIHVwZGF0ZWQgd2hlbmV2ZXIgd2UgY2hhbmdlIGEgcGFnZSBmbGFnLiBCdXQgdGhlbiB0aGUK
ZHVtcCBrZXJuZWwgd291bGQgaGF2ZSB0byBiZSBhd2FyZSBhYm91dCAic3RydWN0IHBhZ2UiIGxv
Y2F0aW9uIGFuZApmb3JtYXQgb2Ygc29tZSBvbGQga2VybmVsIHRvIGJlIGR1bXAuIExldCdzIGp1
c3Qgbm90IGV2ZW4gZGlzY3VzcyBnb2luZwpkb3duIHRoYXQgcGF0aC4KCj4gCj4gQmVjYXVzZSB0
aGUgbW9tZW50IHRoZXJlJ3MgYSBzZXQgb2YgcGFnZXMgd2hpY2ggZG8gbm90IGhhdmUgUEdfb2Zm
bGluZQo+IHNldCBidXQga2R1bXAgd291bGQgc3RpbGwgbGlrZSB0byBza2lwLCB0aGlzIGJyZWFr
cy4KCkkgZG9uJ3QgdW5kZXJzdGFuZCB5b3VyIGNvbmNlcm4uIFBHX29mZmxpbmUgaXMgb25seSBh
biBvcHRpbWl6YXRpb24gZm9yCnNlY3Rpb25zIHRoYXQgYXJlIG9ubGluZS4gT2ZmbGluZSBzZWN0
aW9ucyBjYW4gYWxyZWFkeSBiZSBjb21wbGV0ZWx5Cmlnbm9yZWQgd2hlbiBkdW1waW5nLgoKSSBk
b24ndCBzZWUgaG93IHRoZXJlIHNob3VsZCBiZSAic2V0IG9mIHBhZ2VzIHdoaWNoIGRvIG5vdCBo
YXZlClBHX29mZmxpbmUiLiBJIG1lYW4gaWYgdGhleSBkb24ndCBoYXZlIFBHX29mZmxpbmUgdGhl
eSB3aWxsIHNpbXBseSBiZQpkdW1wZWQgbGlrZSBiZWZvcmUuIFdoaWNoIHdvcmtlZCBmb3JldmVy
LiBTb3JyeSwgSSBkb24ndCBnZXQgeW91ciBwb2ludC4KCi0tIAoKVGhhbmtzLAoKRGF2aWQgLyBk
aGlsZGVuYgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
