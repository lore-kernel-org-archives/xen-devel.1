From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: xen: Can't insert balloon page into VM userspace
 (WAS Re: [linux-linus bisection] complete test-arm64-arm64-xl-xsm)
Date: Tue, 12 Mar 2019 18:11:14 +0000
Message-ID: <6e5309b3-2910-b556-da8d-05b529de1d18__47402.2450320021$1552414515$gmane$org@citrix.com>
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
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=eiBn=RP=citrix.com=prvs=9679d707e=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1h3luk-0003eF-Nw
 for xen-devel@lists.xenproject.org; Tue, 12 Mar 2019 18:14:10 +0000
In-Reply-To: <f4b40d91-9c41-60ed-6b4e-df47af8e5292@oracle.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, David Hildenbrand <david@redhat.com>, Matthew Wilcox <willy@infradead.org>, Julien Grall <julien.grall@arm.com>
Cc: Juergen Gross <jgross@suse.com>, k.khlebnikov@samsung.com, Stefano Stabellini <sstabellini@kernel.org>, Kees Cook <keescook@chromium.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, "VMware,
 Inc." <pv-drivers@vmware.com>, osstest service owner <osstest-admin@xenproject.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-mm@kvack.org, Julien Freche <jfreche@vmware.com>, Nadav Amit <namit@vmware.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gMTIvMDMvMjAxOSAxODowMiwgQm9yaXMgT3N0cm92c2t5IHdyb3RlOgo+IE9uIDMvMTIvMTkg
MToyNCBQTSwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMTIvMDMvMjAxOSAxNzoxOCwgRGF2
aWQgSGlsZGVuYnJhbmQgd3JvdGU6Cj4+PiBPbiAxMi4wMy4xOSAxODoxNCwgTWF0dGhldyBXaWxj
b3ggd3JvdGU6Cj4+Pj4gT24gVHVlLCBNYXIgMTIsIDIwMTkgYXQgMDU6MDU6MzlQTSArMDAwMCwg
SnVsaWVuIEdyYWxsIHdyb3RlOgo+Pj4+PiBPbiAzLzEyLzE5IDM6NTkgUE0sIEp1bGllbiBHcmFs
bCB3cm90ZToKPj4+Pj4+IEl0IGxvb2tzIGxpa2UgYWxsIHRoZSBhcm0gdGVzdCBmb3IgbGludXMg
WzFdIGFuZCBuZXh0IFsyXSB0cmVlCj4+Pj4+PiBhcmUgbm93IGZhaWxpbmcuIHg4NiBzZWVtcyB0
byBiZSBtb3N0bHkgb2suCj4+Pj4+Pgo+Pj4+Pj4gVGhlIGJpc2VjdG9yIGZpbmdlcmVkIHRoZSBm
b2xsb3dpbmcgY29tbWl0Ogo+Pj4+Pj4KPj4+Pj4+IGNvbW1pdCAwZWU5MzBlNmNhZmEwNDhjMTky
NTg5M2QwY2E4OTkxOGIyODE0ZjJjCj4+Pj4+PiBBdXRob3I6IE1hdHRoZXcgV2lsY294IDx3aWxs
eUBpbmZyYWRlYWQub3JnPgo+Pj4+Pj4gRGF0ZTogICBUdWUgTWFyIDUgMTU6NDY6MDYgMjAxOSAt
MDgwMAo+Pj4+Pj4KPj4+Pj4+ICAgICAgbW0vbWVtb3J5LmM6IHByZXZlbnQgbWFwcGluZyB0eXBl
ZCBwYWdlcyB0byB1c2Vyc3BhY2UKPj4+Pj4+ICAgICAgUGFnZXMgd2hpY2ggdXNlIHBhZ2VfdHlw
ZSBtdXN0IG5ldmVyIGJlIG1hcHBlZCB0byB1c2Vyc3BhY2UgYXMgaXQgd291bGQKPj4+Pj4+ICAg
ICAgZGVzdHJveSB0aGVpciBwYWdlIHR5cGUuICBBZGQgYW4gZXhwbGljaXQgY2hlY2sgZm9yIHRo
aXMgaW5zdGVhZCBvZgo+Pj4+Pj4gICAgICBhc3N1bWluZyB0aGF0IGtlcm5lbCBkcml2ZXJzIGFs
d2F5cyBnZXQgdGhpcyByaWdodC4KPj4+PiBPaCBnb29kLCBpdCBmb3VuZCBhIHJlYWwgcHJvYmxl
bS4KPj4+Pgo+Pj4+PiBJdCB0dXJucyBvdXQgdGhlIHByb2JsZW0gaXMgYmVjYXVzZSB0aGUgYmFs
bG9vbiBkcml2ZXIgd2lsbCBjYWxsCj4+Pj4+IF9fU2V0UGFnZU9mZmxpbmUoKSBvbiBhbGxvY2F0
ZWQgcGFnZS4gVGhlcmVmb3JlIHRoZSBwYWdlIGhhcyBhIHR5cGUgYW5kCj4+Pj4+IHZtX2luc2Vy
dF9wYWdlcyB3aWxsIGRlbnkgdGhlIGluc2VydGlvbi4KPj4+Pj4KPj4+Pj4gTXkga25vd2xlZGdl
IGlzIHF1aXRlIGxpbWl0ZWQgaW4gdGhpcyBhcmVhLiBTbyBJIGFtIG5vdCBzdXJlIGhvdyB3ZSBj
YW4KPj4+Pj4gc29sdmUgdGhlIHByb2JsZW0uCj4+Pj4+Cj4+Pj4+IEkgd291bGQgYXBwcmVjaWF0
ZSBpZiBzb21lb25lIGNvdWxkIHByb3ZpZGUgaW5wdXQgb2YgdG8gZml4IHRoZSBtYXBwaW5nLgo+
Pj4+IEkgZG9uJ3Qga25vdyB0aGUgYmFsbG9vbiBkcml2ZXIsIHNvIEkgZG9uJ3Qga25vdyB3aHkg
aXQgd2FzIGRvaW5nIHRoaXMsCj4+Pj4gYnV0IHdoYXQgaXQgd2FzIGRvaW5nIHdhcyBXcm9uZyBh
bmQgaGFzIGJlZW4gc2luY2UgMjAxNCB3aXRoOgo+Pj4+Cj4+Pj4gY29tbWl0IGQ2ZDg2YzBhN2Y4
ZGRjNWIzOGNmMDg5MjIyY2IxZDk1NDA3NjJkYzIKPj4+PiBBdXRob3I6IEtvbnN0YW50aW4gS2hs
ZWJuaWtvdiA8ay5raGxlYm5pa292QHNhbXN1bmcuY29tPgo+Pj4+IERhdGU6ICAgVGh1IE9jdCA5
IDE1OjI5OjI3IDIwMTQgLTA3MDAKPj4+Pgo+Pj4+ICAgICBtbS9iYWxsb29uX2NvbXBhY3Rpb246
IHJlZGVzaWduIGJhbGxvb25lZCBwYWdlcyBtYW5hZ2VtZW50Cj4+Pj4KPj4+PiBJZiBiYWxsb29u
ZWQgcGFnZXMgYXJlIHN1cHBvc2VkIHRvIGJlIG1hcHBlZCBpbnRvIHVzZXJzcGFjZSwgeW91IGNh
bid0IG1hcmsKPj4+PiB0aGVtIGFzIGJhbGxvb25lZCBwYWdlcyB1c2luZyB0aGUgbWFwY291bnQg
ZmllbGQuCj4+Pj4KPj4+IEFza2luZyBteXNlbGYgd2h5IGFueWJvZHkgd291bGQgd2FudCB0byBt
YXAgYmFsbG9vbiBpbmZsYXRlZCBwYWdlcyBpbnRvCj4+PiB1c2VyIHNwYWNlICh0aGlzIGp1c3Qg
c291bmRzIHBsYWluIHdyb25nIGJ1dCBteSB1bmRlcnN0YW5kaW5nIHRvIHdoYXQKPj4+IFhFTiBi
YWxsb29uIGRyaXZlciBkb2VzIG1pZ2h0IGJlIGxpbWl0ZWQpLCBidXQgSSBhc3N1bWUgdGhlIGVh
c3kgZml4Cj4+PiB3b3VsZCBiZSB0byByZXZlcnQKPj4gSSBzdXNwZWN0IHRoZSBidWcgaGVyZSBp
cyB0aGF0IHRoZSBiYWxsb29uIGRyaXZlciBpcyAoYWIpdXNlZCBmb3IgYQo+PiBzZWNvbmQgcHVy
cG9zZQo+IFllcy4gQW5kIGl0cyBuYW1lIGlzIGFsbG9jX3hlbmJhbGxvb25lZF9wYWdlcygpLgoK
RldJVywgSSBkaWQgZXhwcmVzcyBteSB2aWV3cyB0aGF0IHRoaXMgd2FzIGEgQmFkSWRlYSh0bSkg
d2hlbiB0aGF0IGxvZ2ljCndhcyBmaXJzdCBpbnRyb2R1Y2VkLgoKQnV0IHllcyAtIG5vdyBpcyBj
bGVhcmx5IHRoZSB0aW1lIHRvIGZpeCB0aGlzIHByb3Blcmx5LgoKfkFuZHJldwoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
