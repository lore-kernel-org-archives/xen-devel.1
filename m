From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: xen: Can't insert balloon page into VM userspace
 (WAS Re: [linux-linus bisection] complete test-arm64-arm64-xl-xsm)
Date: Tue, 12 Mar 2019 14:02:31 -0400
Message-ID: <f4b40d91-9c41-60ed-6b4e-df47af8e5292__32115.9361906879$1552413863$gmane$org@oracle.com>
References: <E1h3Uiq-0002L6-Ij@osstest.test-lab.xenproject.org>
 <80211e70-5f54-9421-8e8f-2a4fc758ce39@arm.com>
 <46118631-61d4-adb6-6ffc-4e7c62ea3da9@arm.com>
 <20190312171421.GJ19508@bombadil.infradead.org>
 <e0b64793-260d-5e70-0544-e7290509b605@redhat.com>
 <45323ea0-2a50-8891-830e-e1f8a8ed23ea@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9Jsx=RP=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1h3lkO-0002nE-Ns
 for xen-devel@lists.xenproject.org; Tue, 12 Mar 2019 18:03:28 +0000
In-Reply-To: <45323ea0-2a50-8891-830e-e1f8a8ed23ea@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, David Hildenbrand <david@redhat.com>, Matthew Wilcox <willy@infradead.org>, Julien Grall <julien.grall@arm.com>
Cc: Juergen Gross <jgross@suse.com>, k.khlebnikov@samsung.com, Stefano Stabellini <sstabellini@kernel.org>, Kees Cook <keescook@chromium.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, "VMware,
 Inc." <pv-drivers@vmware.com>, osstest service owner <osstest-admin@xenproject.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-mm@kvack.org, Julien Freche <jfreche@vmware.com>, Nadav Amit <namit@vmware.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gMy8xMi8xOSAxOjI0IFBNLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+IE9uIDEyLzAzLzIwMTkg
MTc6MTgsIERhdmlkIEhpbGRlbmJyYW5kIHdyb3RlOgo+PiBPbiAxMi4wMy4xOSAxODoxNCwgTWF0
dGhldyBXaWxjb3ggd3JvdGU6Cj4+PiBPbiBUdWUsIE1hciAxMiwgMjAxOSBhdCAwNTowNTozOVBN
ICswMDAwLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+Pj4gT24gMy8xMi8xOSAzOjU5IFBNLCBKdWxp
ZW4gR3JhbGwgd3JvdGU6Cj4+Pj4+IEl0IGxvb2tzIGxpa2UgYWxsIHRoZSBhcm0gdGVzdCBmb3Ig
bGludXMgWzFdIGFuZCBuZXh0IFsyXSB0cmVlCj4+Pj4+IGFyZSBub3cgZmFpbGluZy4geDg2IHNl
ZW1zIHRvIGJlIG1vc3RseSBvay4KPj4+Pj4KPj4+Pj4gVGhlIGJpc2VjdG9yIGZpbmdlcmVkIHRo
ZSBmb2xsb3dpbmcgY29tbWl0Ogo+Pj4+Pgo+Pj4+PiBjb21taXQgMGVlOTMwZTZjYWZhMDQ4YzE5
MjU4OTNkMGNhODk5MThiMjgxNGYyYwo+Pj4+PiBBdXRob3I6IE1hdHRoZXcgV2lsY294IDx3aWxs
eUBpbmZyYWRlYWQub3JnPgo+Pj4+PiBEYXRlOiAgIFR1ZSBNYXIgNSAxNTo0NjowNiAyMDE5IC0w
ODAwCj4+Pj4+Cj4+Pj4+ICAgICAgbW0vbWVtb3J5LmM6IHByZXZlbnQgbWFwcGluZyB0eXBlZCBw
YWdlcyB0byB1c2Vyc3BhY2UKPj4+Pj4gICAgICBQYWdlcyB3aGljaCB1c2UgcGFnZV90eXBlIG11
c3QgbmV2ZXIgYmUgbWFwcGVkIHRvIHVzZXJzcGFjZSBhcyBpdCB3b3VsZAo+Pj4+PiAgICAgIGRl
c3Ryb3kgdGhlaXIgcGFnZSB0eXBlLiAgQWRkIGFuIGV4cGxpY2l0IGNoZWNrIGZvciB0aGlzIGlu
c3RlYWQgb2YKPj4+Pj4gICAgICBhc3N1bWluZyB0aGF0IGtlcm5lbCBkcml2ZXJzIGFsd2F5cyBn
ZXQgdGhpcyByaWdodC4KPj4+IE9oIGdvb2QsIGl0IGZvdW5kIGEgcmVhbCBwcm9ibGVtLgo+Pj4K
Pj4+PiBJdCB0dXJucyBvdXQgdGhlIHByb2JsZW0gaXMgYmVjYXVzZSB0aGUgYmFsbG9vbiBkcml2
ZXIgd2lsbCBjYWxsCj4+Pj4gX19TZXRQYWdlT2ZmbGluZSgpIG9uIGFsbG9jYXRlZCBwYWdlLiBU
aGVyZWZvcmUgdGhlIHBhZ2UgaGFzIGEgdHlwZSBhbmQKPj4+PiB2bV9pbnNlcnRfcGFnZXMgd2ls
bCBkZW55IHRoZSBpbnNlcnRpb24uCj4+Pj4KPj4+PiBNeSBrbm93bGVkZ2UgaXMgcXVpdGUgbGlt
aXRlZCBpbiB0aGlzIGFyZWEuIFNvIEkgYW0gbm90IHN1cmUgaG93IHdlIGNhbgo+Pj4+IHNvbHZl
IHRoZSBwcm9ibGVtLgo+Pj4+Cj4+Pj4gSSB3b3VsZCBhcHByZWNpYXRlIGlmIHNvbWVvbmUgY291
bGQgcHJvdmlkZSBpbnB1dCBvZiB0byBmaXggdGhlIG1hcHBpbmcuCj4+PiBJIGRvbid0IGtub3cg
dGhlIGJhbGxvb24gZHJpdmVyLCBzbyBJIGRvbid0IGtub3cgd2h5IGl0IHdhcyBkb2luZyB0aGlz
LAo+Pj4gYnV0IHdoYXQgaXQgd2FzIGRvaW5nIHdhcyBXcm9uZyBhbmQgaGFzIGJlZW4gc2luY2Ug
MjAxNCB3aXRoOgo+Pj4KPj4+IGNvbW1pdCBkNmQ4NmMwYTdmOGRkYzViMzhjZjA4OTIyMmNiMWQ5
NTQwNzYyZGMyCj4+PiBBdXRob3I6IEtvbnN0YW50aW4gS2hsZWJuaWtvdiA8ay5raGxlYm5pa292
QHNhbXN1bmcuY29tPgo+Pj4gRGF0ZTogICBUaHUgT2N0IDkgMTU6Mjk6MjcgMjAxNCAtMDcwMAo+
Pj4KPj4+ICAgICBtbS9iYWxsb29uX2NvbXBhY3Rpb246IHJlZGVzaWduIGJhbGxvb25lZCBwYWdl
cyBtYW5hZ2VtZW50Cj4+Pgo+Pj4gSWYgYmFsbG9vbmVkIHBhZ2VzIGFyZSBzdXBwb3NlZCB0byBi
ZSBtYXBwZWQgaW50byB1c2Vyc3BhY2UsIHlvdSBjYW4ndCBtYXJrCj4+PiB0aGVtIGFzIGJhbGxv
b25lZCBwYWdlcyB1c2luZyB0aGUgbWFwY291bnQgZmllbGQuCj4+Pgo+PiBBc2tpbmcgbXlzZWxm
IHdoeSBhbnlib2R5IHdvdWxkIHdhbnQgdG8gbWFwIGJhbGxvb24gaW5mbGF0ZWQgcGFnZXMgaW50
bwo+PiB1c2VyIHNwYWNlICh0aGlzIGp1c3Qgc291bmRzIHBsYWluIHdyb25nIGJ1dCBteSB1bmRl
cnN0YW5kaW5nIHRvIHdoYXQKPj4gWEVOIGJhbGxvb24gZHJpdmVyIGRvZXMgbWlnaHQgYmUgbGlt
aXRlZCksIGJ1dCBJIGFzc3VtZSB0aGUgZWFzeSBmaXgKPj4gd291bGQgYmUgdG8gcmV2ZXJ0Cj4g
SSBzdXNwZWN0IHRoZSBidWcgaGVyZSBpcyB0aGF0IHRoZSBiYWxsb29uIGRyaXZlciBpcyAoYWIp
dXNlZCBmb3IgYQo+IHNlY29uZCBwdXJwb3NlCgpZZXMuIEFuZCBpdHMgbmFtZSBpcyBhbGxvY194
ZW5iYWxsb29uZWRfcGFnZXMoKS4KCi1ib3JpcwoKPiAgLSB0byBjcmVhdGUgYSBob2xlIGluIHBm
biBzcGFjZSB0byBtYXAgc29tZSBvdGhlciBiaXRzIG9mCj4gc2hhcmVkIG1lbW9yeSBpbnRvLgo+
Cj4gSSB0aGluayBhdCB0aGUgZW5kIG9mIHRoZSBkYXksIHdoYXQgaXMgbmVlZGVkIGlzIGEgc3Ry
dWN0IHBhZ2VfaW5mbwo+IHdoaWNoIGxvb2tzIGxpa2Ugbm9ybWFsIFJBTSwgYnV0IHRoZSBiYWNr
aW5nIGZvciB3aGljaCBjYW4gYmUgYWx0ZXJlZCBieQo+IGh5cGVyY2FsbCB0byBtYXAgb3RoZXIg
dGhpbmdzLgo+Cj4gfkFuZHJldwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
