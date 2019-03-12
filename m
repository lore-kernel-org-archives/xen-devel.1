From: David Hildenbrand <david@redhat.com>
Subject: Re: xen: Can't insert balloon page into VM userspace
 (WAS Re: [linux-linus bisection] complete test-arm64-arm64-xl-xsm)
Date: Tue, 12 Mar 2019 18:18:28 +0100
Message-ID: <e0b64793-260d-5e70-0544-e7290509b605@redhat.com>
References: <E1h3Uiq-0002L6-Ij@osstest.test-lab.xenproject.org>
 <80211e70-5f54-9421-8e8f-2a4fc758ce39@arm.com>
 <46118631-61d4-adb6-6ffc-4e7c62ea3da9@arm.com>
 <20190312171421.GJ19508@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=+dzC=RP=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1h3l2w-0006et-Qp
 for xen-devel@lists.xenproject.org; Tue, 12 Mar 2019 17:18:34 +0000
In-Reply-To: <20190312171421.GJ19508@bombadil.infradead.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Matthew Wilcox <willy@infradead.org>, Julien Grall <julien.grall@arm.com>
Cc: Juergen Gross <jgross@suse.com>, k.khlebnikov@samsung.com, Stefano Stabellini <sstabellini@kernel.org>, Kees Cook <keescook@chromium.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, "VMware,
 Inc." <pv-drivers@vmware.com>, osstest service owner <osstest-admin@xenproject.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-mm@kvack.org, Julien Freche <jfreche@vmware.com>, Nadav Amit <namit@vmware.com>, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTIuMDMuMTkgMTg6MTQsIE1hdHRoZXcgV2lsY294IHdyb3RlOgo+IE9uIFR1ZSwgTWFyIDEy
LCAyMDE5IGF0IDA1OjA1OjM5UE0gKzAwMDAsIEp1bGllbiBHcmFsbCB3cm90ZToKPj4gT24gMy8x
Mi8xOSAzOjU5IFBNLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+PiBJdCBsb29rcyBsaWtlIGFsbCB0
aGUgYXJtIHRlc3QgZm9yIGxpbnVzIFsxXSBhbmQgbmV4dCBbMl0gdHJlZQo+Pj4gYXJlIG5vdyBm
YWlsaW5nLiB4ODYgc2VlbXMgdG8gYmUgbW9zdGx5IG9rLgo+Pj4KPj4+IFRoZSBiaXNlY3RvciBm
aW5nZXJlZCB0aGUgZm9sbG93aW5nIGNvbW1pdDoKPj4+Cj4+PiBjb21taXQgMGVlOTMwZTZjYWZh
MDQ4YzE5MjU4OTNkMGNhODk5MThiMjgxNGYyYwo+Pj4gQXV0aG9yOiBNYXR0aGV3IFdpbGNveCA8
d2lsbHlAaW5mcmFkZWFkLm9yZz4KPj4+IERhdGU6ICAgVHVlIE1hciA1IDE1OjQ2OjA2IDIwMTkg
LTA4MDAKPj4+Cj4+PiAgICAgIG1tL21lbW9yeS5jOiBwcmV2ZW50IG1hcHBpbmcgdHlwZWQgcGFn
ZXMgdG8gdXNlcnNwYWNlCj4+PiAgICAgIFBhZ2VzIHdoaWNoIHVzZSBwYWdlX3R5cGUgbXVzdCBu
ZXZlciBiZSBtYXBwZWQgdG8gdXNlcnNwYWNlIGFzIGl0IHdvdWxkCj4+PiAgICAgIGRlc3Ryb3kg
dGhlaXIgcGFnZSB0eXBlLiAgQWRkIGFuIGV4cGxpY2l0IGNoZWNrIGZvciB0aGlzIGluc3RlYWQg
b2YKPj4+ICAgICAgYXNzdW1pbmcgdGhhdCBrZXJuZWwgZHJpdmVycyBhbHdheXMgZ2V0IHRoaXMg
cmlnaHQuCj4gCj4gT2ggZ29vZCwgaXQgZm91bmQgYSByZWFsIHByb2JsZW0uCj4gCj4+IEl0IHR1
cm5zIG91dCB0aGUgcHJvYmxlbSBpcyBiZWNhdXNlIHRoZSBiYWxsb29uIGRyaXZlciB3aWxsIGNh
bGwKPj4gX19TZXRQYWdlT2ZmbGluZSgpIG9uIGFsbG9jYXRlZCBwYWdlLiBUaGVyZWZvcmUgdGhl
IHBhZ2UgaGFzIGEgdHlwZSBhbmQKPj4gdm1faW5zZXJ0X3BhZ2VzIHdpbGwgZGVueSB0aGUgaW5z
ZXJ0aW9uLgo+Pgo+PiBNeSBrbm93bGVkZ2UgaXMgcXVpdGUgbGltaXRlZCBpbiB0aGlzIGFyZWEu
IFNvIEkgYW0gbm90IHN1cmUgaG93IHdlIGNhbgo+PiBzb2x2ZSB0aGUgcHJvYmxlbS4KPj4KPj4g
SSB3b3VsZCBhcHByZWNpYXRlIGlmIHNvbWVvbmUgY291bGQgcHJvdmlkZSBpbnB1dCBvZiB0byBm
aXggdGhlIG1hcHBpbmcuCj4gCj4gSSBkb24ndCBrbm93IHRoZSBiYWxsb29uIGRyaXZlciwgc28g
SSBkb24ndCBrbm93IHdoeSBpdCB3YXMgZG9pbmcgdGhpcywKPiBidXQgd2hhdCBpdCB3YXMgZG9p
bmcgd2FzIFdyb25nIGFuZCBoYXMgYmVlbiBzaW5jZSAyMDE0IHdpdGg6Cj4gCj4gY29tbWl0IGQ2
ZDg2YzBhN2Y4ZGRjNWIzOGNmMDg5MjIyY2IxZDk1NDA3NjJkYzIKPiBBdXRob3I6IEtvbnN0YW50
aW4gS2hsZWJuaWtvdiA8ay5raGxlYm5pa292QHNhbXN1bmcuY29tPgo+IERhdGU6ICAgVGh1IE9j
dCA5IDE1OjI5OjI3IDIwMTQgLTA3MDAKPiAKPiAgICAgbW0vYmFsbG9vbl9jb21wYWN0aW9uOiBy
ZWRlc2lnbiBiYWxsb29uZWQgcGFnZXMgbWFuYWdlbWVudAo+IAo+IElmIGJhbGxvb25lZCBwYWdl
cyBhcmUgc3VwcG9zZWQgdG8gYmUgbWFwcGVkIGludG8gdXNlcnNwYWNlLCB5b3UgY2FuJ3QgbWFy
awo+IHRoZW0gYXMgYmFsbG9vbmVkIHBhZ2VzIHVzaW5nIHRoZSBtYXBjb3VudCBmaWVsZC4KPiAK
CkFza2luZyBteXNlbGYgd2h5IGFueWJvZHkgd291bGQgd2FudCB0byBtYXAgYmFsbG9vbiBpbmZs
YXRlZCBwYWdlcyBpbnRvCnVzZXIgc3BhY2UgKHRoaXMganVzdCBzb3VuZHMgcGxhaW4gd3Jvbmcg
YnV0IG15IHVuZGVyc3RhbmRpbmcgdG8gd2hhdApYRU4gYmFsbG9vbiBkcml2ZXIgZG9lcyBtaWdo
dCBiZSBsaW1pdGVkKSwgYnV0IEkgYXNzdW1lIHRoZSBlYXN5IGZpeAp3b3VsZCBiZSB0byByZXZl
cnQKCgpjb21taXQgMmYwODVmZjM3ZDA4ZWNiYzc4NDlkNWFiYjk0MjRiZDc5MjdkZGExZApBdXRo
b3I6IERhdmlkIEhpbGRlbmJyYW5kIDxkYXZpZEByZWRoYXQuY29tPgpEYXRlOiAgIFdlZCBNYXIg
NiAxMTo0MjoyNCAyMDE5ICsxMTAwCgogICAgeGVuL2JhbGxvb246IG1hcmsgaW5mbGF0ZWQgcGFn
ZXMgUEdfb2ZmbGluZQoKICAgIE1hcmsgaW5mbGF0ZWQgYW5kIG5ldmVyIG9ubGluZWQgcGFnZXMg
UEdfb2ZmbGluZSwgdG8gdGVsbCB0aGUgd29ybGQgdGhhdAogICAgdGhlIGNvbnRlbnQgaXMgc3Rh
bGUgYW5kIHNob3VsZCBub3QgYmUgZHVtcGVkLgoKCi0tIAoKVGhhbmtzLAoKRGF2aWQgLyBkaGls
ZGVuYgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
