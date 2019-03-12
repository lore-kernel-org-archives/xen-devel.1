From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: xen: Can't insert balloon page into VM userspace
 (WAS Re: [linux-linus bisection] complete test-arm64-arm64-xl-xsm)
Date: Tue, 12 Mar 2019 17:24:43 +0000
Message-ID: <45323ea0-2a50-8891-830e-e1f8a8ed23ea__5965.7883642771$1552412560$gmane$org@citrix.com>
References: <E1h3Uiq-0002L6-Ij@osstest.test-lab.xenproject.org>
 <80211e70-5f54-9421-8e8f-2a4fc758ce39@arm.com>
 <46118631-61d4-adb6-6ffc-4e7c62ea3da9@arm.com>
 <20190312171421.GJ19508@bombadil.infradead.org>
 <e0b64793-260d-5e70-0544-e7290509b605@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=eiBn=RP=citrix.com=prvs=9679d707e=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1h3lPP-0000o9-HS
 for xen-devel@lists.xenproject.org; Tue, 12 Mar 2019 17:41:47 +0000
In-Reply-To: <e0b64793-260d-5e70-0544-e7290509b605@redhat.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: David Hildenbrand <david@redhat.com>, Matthew Wilcox <willy@infradead.org>, Julien Grall <julien.grall@arm.com>
Cc: Juergen Gross <jgross@suse.com>, k.khlebnikov@samsung.com, Stefano Stabellini <sstabellini@kernel.org>, Kees Cook <keescook@chromium.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, "VMware,
 Inc." <pv-drivers@vmware.com>, osstest service owner <osstest-admin@xenproject.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-mm@kvack.org, Julien Freche <jfreche@vmware.com>, Nadav Amit <namit@vmware.com>, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTIvMDMvMjAxOSAxNzoxOCwgRGF2aWQgSGlsZGVuYnJhbmQgd3JvdGU6Cj4gT24gMTIuMDMu
MTkgMTg6MTQsIE1hdHRoZXcgV2lsY294IHdyb3RlOgo+PiBPbiBUdWUsIE1hciAxMiwgMjAxOSBh
dCAwNTowNTozOVBNICswMDAwLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+PiBPbiAzLzEyLzE5IDM6
NTkgUE0sIEp1bGllbiBHcmFsbCB3cm90ZToKPj4+PiBJdCBsb29rcyBsaWtlIGFsbCB0aGUgYXJt
IHRlc3QgZm9yIGxpbnVzIFsxXSBhbmQgbmV4dCBbMl0gdHJlZQo+Pj4+IGFyZSBub3cgZmFpbGlu
Zy4geDg2IHNlZW1zIHRvIGJlIG1vc3RseSBvay4KPj4+Pgo+Pj4+IFRoZSBiaXNlY3RvciBmaW5n
ZXJlZCB0aGUgZm9sbG93aW5nIGNvbW1pdDoKPj4+Pgo+Pj4+IGNvbW1pdCAwZWU5MzBlNmNhZmEw
NDhjMTkyNTg5M2QwY2E4OTkxOGIyODE0ZjJjCj4+Pj4gQXV0aG9yOiBNYXR0aGV3IFdpbGNveCA8
d2lsbHlAaW5mcmFkZWFkLm9yZz4KPj4+PiBEYXRlOiAgIFR1ZSBNYXIgNSAxNTo0NjowNiAyMDE5
IC0wODAwCj4+Pj4KPj4+PiAgICAgIG1tL21lbW9yeS5jOiBwcmV2ZW50IG1hcHBpbmcgdHlwZWQg
cGFnZXMgdG8gdXNlcnNwYWNlCj4+Pj4gICAgICBQYWdlcyB3aGljaCB1c2UgcGFnZV90eXBlIG11
c3QgbmV2ZXIgYmUgbWFwcGVkIHRvIHVzZXJzcGFjZSBhcyBpdCB3b3VsZAo+Pj4+ICAgICAgZGVz
dHJveSB0aGVpciBwYWdlIHR5cGUuICBBZGQgYW4gZXhwbGljaXQgY2hlY2sgZm9yIHRoaXMgaW5z
dGVhZCBvZgo+Pj4+ICAgICAgYXNzdW1pbmcgdGhhdCBrZXJuZWwgZHJpdmVycyBhbHdheXMgZ2V0
IHRoaXMgcmlnaHQuCj4+IE9oIGdvb2QsIGl0IGZvdW5kIGEgcmVhbCBwcm9ibGVtLgo+Pgo+Pj4g
SXQgdHVybnMgb3V0IHRoZSBwcm9ibGVtIGlzIGJlY2F1c2UgdGhlIGJhbGxvb24gZHJpdmVyIHdp
bGwgY2FsbAo+Pj4gX19TZXRQYWdlT2ZmbGluZSgpIG9uIGFsbG9jYXRlZCBwYWdlLiBUaGVyZWZv
cmUgdGhlIHBhZ2UgaGFzIGEgdHlwZSBhbmQKPj4+IHZtX2luc2VydF9wYWdlcyB3aWxsIGRlbnkg
dGhlIGluc2VydGlvbi4KPj4+Cj4+PiBNeSBrbm93bGVkZ2UgaXMgcXVpdGUgbGltaXRlZCBpbiB0
aGlzIGFyZWEuIFNvIEkgYW0gbm90IHN1cmUgaG93IHdlIGNhbgo+Pj4gc29sdmUgdGhlIHByb2Js
ZW0uCj4+Pgo+Pj4gSSB3b3VsZCBhcHByZWNpYXRlIGlmIHNvbWVvbmUgY291bGQgcHJvdmlkZSBp
bnB1dCBvZiB0byBmaXggdGhlIG1hcHBpbmcuCj4+IEkgZG9uJ3Qga25vdyB0aGUgYmFsbG9vbiBk
cml2ZXIsIHNvIEkgZG9uJ3Qga25vdyB3aHkgaXQgd2FzIGRvaW5nIHRoaXMsCj4+IGJ1dCB3aGF0
IGl0IHdhcyBkb2luZyB3YXMgV3JvbmcgYW5kIGhhcyBiZWVuIHNpbmNlIDIwMTQgd2l0aDoKPj4K
Pj4gY29tbWl0IGQ2ZDg2YzBhN2Y4ZGRjNWIzOGNmMDg5MjIyY2IxZDk1NDA3NjJkYzIKPj4gQXV0
aG9yOiBLb25zdGFudGluIEtobGVibmlrb3YgPGsua2hsZWJuaWtvdkBzYW1zdW5nLmNvbT4KPj4g
RGF0ZTogICBUaHUgT2N0IDkgMTU6Mjk6MjcgMjAxNCAtMDcwMAo+Pgo+PiAgICAgbW0vYmFsbG9v
bl9jb21wYWN0aW9uOiByZWRlc2lnbiBiYWxsb29uZWQgcGFnZXMgbWFuYWdlbWVudAo+Pgo+PiBJ
ZiBiYWxsb29uZWQgcGFnZXMgYXJlIHN1cHBvc2VkIHRvIGJlIG1hcHBlZCBpbnRvIHVzZXJzcGFj
ZSwgeW91IGNhbid0IG1hcmsKPj4gdGhlbSBhcyBiYWxsb29uZWQgcGFnZXMgdXNpbmcgdGhlIG1h
cGNvdW50IGZpZWxkLgo+Pgo+IEFza2luZyBteXNlbGYgd2h5IGFueWJvZHkgd291bGQgd2FudCB0
byBtYXAgYmFsbG9vbiBpbmZsYXRlZCBwYWdlcyBpbnRvCj4gdXNlciBzcGFjZSAodGhpcyBqdXN0
IHNvdW5kcyBwbGFpbiB3cm9uZyBidXQgbXkgdW5kZXJzdGFuZGluZyB0byB3aGF0Cj4gWEVOIGJh
bGxvb24gZHJpdmVyIGRvZXMgbWlnaHQgYmUgbGltaXRlZCksIGJ1dCBJIGFzc3VtZSB0aGUgZWFz
eSBmaXgKPiB3b3VsZCBiZSB0byByZXZlcnQKCkkgc3VzcGVjdCB0aGUgYnVnIGhlcmUgaXMgdGhh
dCB0aGUgYmFsbG9vbiBkcml2ZXIgaXMgKGFiKXVzZWQgZm9yIGEKc2Vjb25kIHB1cnBvc2UgLSB0
byBjcmVhdGUgYSBob2xlIGluIHBmbiBzcGFjZSB0byBtYXAgc29tZSBvdGhlciBiaXRzIG9mCnNo
YXJlZCBtZW1vcnkgaW50by4KCkkgdGhpbmsgYXQgdGhlIGVuZCBvZiB0aGUgZGF5LCB3aGF0IGlz
IG5lZWRlZCBpcyBhIHN0cnVjdCBwYWdlX2luZm8Kd2hpY2ggbG9va3MgbGlrZSBub3JtYWwgUkFN
LCBidXQgdGhlIGJhY2tpbmcgZm9yIHdoaWNoIGNhbiBiZSBhbHRlcmVkIGJ5Cmh5cGVyY2FsbCB0
byBtYXAgb3RoZXIgdGhpbmdzLgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
