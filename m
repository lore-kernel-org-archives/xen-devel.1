From: David Hildenbrand <david@redhat.com>
Subject: Re: xen: Can't insert balloon page into VM userspace
 (WAS Re: [linux-linus bisection] complete test-arm64-arm64-xl-xsm)
Date: Tue, 12 Mar 2019 19:23:50 +0100
Message-ID: <9a40e1ff-7605-e822-a1d2-502a12d0fba7__30260.844044254$1552415088$gmane$org@redhat.com>
References: <E1h3Uiq-0002L6-Ij@osstest.test-lab.xenproject.org>
 <80211e70-5f54-9421-8e8f-2a4fc758ce39@arm.com>
 <46118631-61d4-adb6-6ffc-4e7c62ea3da9@arm.com>
 <20190312171421.GJ19508@bombadil.infradead.org>
 <e0b64793-260d-5e70-0544-e7290509b605@redhat.com>
 <45323ea0-2a50-8891-830e-e1f8a8ed23ea@citrix.com>
 <f4b40d91-9c41-60ed-6b4e-df47af8e5292@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=+dzC=RP=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1h3m4C-0004Vg-LA
 for xen-devel@lists.xenproject.org; Tue, 12 Mar 2019 18:23:56 +0000
In-Reply-To: <f4b40d91-9c41-60ed-6b4e-df47af8e5292@oracle.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Matthew Wilcox <willy@infradead.org>, Julien Grall <julien.grall@arm.com>
Cc: Juergen Gross <jgross@suse.com>, k.khlebnikov@samsung.com, Stefano Stabellini <sstabellini@kernel.org>, Kees Cook <keescook@chromium.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, "VMware,
 Inc." <pv-drivers@vmware.com>, osstest service owner <osstest-admin@xenproject.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-mm@kvack.org, Julien Freche <jfreche@vmware.com>, Nadav Amit <namit@vmware.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gMTIuMDMuMTkgMTk6MDIsIEJvcmlzIE9zdHJvdnNreSB3cm90ZToKPiBPbiAzLzEyLzE5IDE6
MjQgUE0sIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+IE9uIDEyLzAzLzIwMTkgMTc6MTgsIERhdmlk
IEhpbGRlbmJyYW5kIHdyb3RlOgo+Pj4gT24gMTIuMDMuMTkgMTg6MTQsIE1hdHRoZXcgV2lsY294
IHdyb3RlOgo+Pj4+IE9uIFR1ZSwgTWFyIDEyLCAyMDE5IGF0IDA1OjA1OjM5UE0gKzAwMDAsIEp1
bGllbiBHcmFsbCB3cm90ZToKPj4+Pj4gT24gMy8xMi8xOSAzOjU5IFBNLCBKdWxpZW4gR3JhbGwg
d3JvdGU6Cj4+Pj4+PiBJdCBsb29rcyBsaWtlIGFsbCB0aGUgYXJtIHRlc3QgZm9yIGxpbnVzIFsx
XSBhbmQgbmV4dCBbMl0gdHJlZQo+Pj4+Pj4gYXJlIG5vdyBmYWlsaW5nLiB4ODYgc2VlbXMgdG8g
YmUgbW9zdGx5IG9rLgo+Pj4+Pj4KPj4+Pj4+IFRoZSBiaXNlY3RvciBmaW5nZXJlZCB0aGUgZm9s
bG93aW5nIGNvbW1pdDoKPj4+Pj4+Cj4+Pj4+PiBjb21taXQgMGVlOTMwZTZjYWZhMDQ4YzE5MjU4
OTNkMGNhODk5MThiMjgxNGYyYwo+Pj4+Pj4gQXV0aG9yOiBNYXR0aGV3IFdpbGNveCA8d2lsbHlA
aW5mcmFkZWFkLm9yZz4KPj4+Pj4+IERhdGU6ICAgVHVlIE1hciA1IDE1OjQ2OjA2IDIwMTkgLTA4
MDAKPj4+Pj4+Cj4+Pj4+PiAgICAgIG1tL21lbW9yeS5jOiBwcmV2ZW50IG1hcHBpbmcgdHlwZWQg
cGFnZXMgdG8gdXNlcnNwYWNlCj4+Pj4+PiAgICAgIFBhZ2VzIHdoaWNoIHVzZSBwYWdlX3R5cGUg
bXVzdCBuZXZlciBiZSBtYXBwZWQgdG8gdXNlcnNwYWNlIGFzIGl0IHdvdWxkCj4+Pj4+PiAgICAg
IGRlc3Ryb3kgdGhlaXIgcGFnZSB0eXBlLiAgQWRkIGFuIGV4cGxpY2l0IGNoZWNrIGZvciB0aGlz
IGluc3RlYWQgb2YKPj4+Pj4+ICAgICAgYXNzdW1pbmcgdGhhdCBrZXJuZWwgZHJpdmVycyBhbHdh
eXMgZ2V0IHRoaXMgcmlnaHQuCj4+Pj4gT2ggZ29vZCwgaXQgZm91bmQgYSByZWFsIHByb2JsZW0u
Cj4+Pj4KPj4+Pj4gSXQgdHVybnMgb3V0IHRoZSBwcm9ibGVtIGlzIGJlY2F1c2UgdGhlIGJhbGxv
b24gZHJpdmVyIHdpbGwgY2FsbAo+Pj4+PiBfX1NldFBhZ2VPZmZsaW5lKCkgb24gYWxsb2NhdGVk
IHBhZ2UuIFRoZXJlZm9yZSB0aGUgcGFnZSBoYXMgYSB0eXBlIGFuZAo+Pj4+PiB2bV9pbnNlcnRf
cGFnZXMgd2lsbCBkZW55IHRoZSBpbnNlcnRpb24uCj4+Pj4+Cj4+Pj4+IE15IGtub3dsZWRnZSBp
cyBxdWl0ZSBsaW1pdGVkIGluIHRoaXMgYXJlYS4gU28gSSBhbSBub3Qgc3VyZSBob3cgd2UgY2Fu
Cj4+Pj4+IHNvbHZlIHRoZSBwcm9ibGVtLgo+Pj4+Pgo+Pj4+PiBJIHdvdWxkIGFwcHJlY2lhdGUg
aWYgc29tZW9uZSBjb3VsZCBwcm92aWRlIGlucHV0IG9mIHRvIGZpeCB0aGUgbWFwcGluZy4KPj4+
PiBJIGRvbid0IGtub3cgdGhlIGJhbGxvb24gZHJpdmVyLCBzbyBJIGRvbid0IGtub3cgd2h5IGl0
IHdhcyBkb2luZyB0aGlzLAo+Pj4+IGJ1dCB3aGF0IGl0IHdhcyBkb2luZyB3YXMgV3JvbmcgYW5k
IGhhcyBiZWVuIHNpbmNlIDIwMTQgd2l0aDoKPj4+Pgo+Pj4+IGNvbW1pdCBkNmQ4NmMwYTdmOGRk
YzViMzhjZjA4OTIyMmNiMWQ5NTQwNzYyZGMyCj4+Pj4gQXV0aG9yOiBLb25zdGFudGluIEtobGVi
bmlrb3YgPGsua2hsZWJuaWtvdkBzYW1zdW5nLmNvbT4KPj4+PiBEYXRlOiAgIFRodSBPY3QgOSAx
NToyOToyNyAyMDE0IC0wNzAwCj4+Pj4KPj4+PiAgICAgbW0vYmFsbG9vbl9jb21wYWN0aW9uOiBy
ZWRlc2lnbiBiYWxsb29uZWQgcGFnZXMgbWFuYWdlbWVudAo+Pj4+Cj4+Pj4gSWYgYmFsbG9vbmVk
IHBhZ2VzIGFyZSBzdXBwb3NlZCB0byBiZSBtYXBwZWQgaW50byB1c2Vyc3BhY2UsIHlvdSBjYW4n
dCBtYXJrCj4+Pj4gdGhlbSBhcyBiYWxsb29uZWQgcGFnZXMgdXNpbmcgdGhlIG1hcGNvdW50IGZp
ZWxkLgo+Pj4+Cj4+PiBBc2tpbmcgbXlzZWxmIHdoeSBhbnlib2R5IHdvdWxkIHdhbnQgdG8gbWFw
IGJhbGxvb24gaW5mbGF0ZWQgcGFnZXMgaW50bwo+Pj4gdXNlciBzcGFjZSAodGhpcyBqdXN0IHNv
dW5kcyBwbGFpbiB3cm9uZyBidXQgbXkgdW5kZXJzdGFuZGluZyB0byB3aGF0Cj4+PiBYRU4gYmFs
bG9vbiBkcml2ZXIgZG9lcyBtaWdodCBiZSBsaW1pdGVkKSwgYnV0IEkgYXNzdW1lIHRoZSBlYXN5
IGZpeAo+Pj4gd291bGQgYmUgdG8gcmV2ZXJ0Cj4+IEkgc3VzcGVjdCB0aGUgYnVnIGhlcmUgaXMg
dGhhdCB0aGUgYmFsbG9vbiBkcml2ZXIgaXMgKGFiKXVzZWQgZm9yIGEKPj4gc2Vjb25kIHB1cnBv
c2UKPiAKPiBZZXMuIEFuZCBpdHMgbmFtZSBpcyBhbGxvY194ZW5iYWxsb29uZWRfcGFnZXMoKS4K
PiAKCkhhdmVuJ3QgaGFkIGEgbG9vayBhdCB0aGUgY29kZSB5ZXQsIGJ1dCB3b3VsZCBhbm90aGVy
IHRlbXBvcmFyeSBmaXggYmUKdG8gY2xlYXIvc2V0IFBHX29mZmxpbmUgd2hlbiBhbGxvY2F0aW5n
L2ZyZWVpbmcgYSBiYWxsb29uZWQgcGFnZT8KKGFzc3VtaW5nIGhlcmUgdGhhdCBvbmx5IHN1Y2gg
cGFnZXMgd2lsbCBiZSBtYXBwZWQgdG8gdXNlciBzcGFjZSkKCi0tIAoKVGhhbmtzLAoKRGF2aWQg
LyBkaGlsZGVuYgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
