From: Matthew Wilcox <willy@infradead.org>
Subject: Re: xen: Can't insert balloon page into VM userspace
 (WAS Re: [linux-linus bisection] complete test-arm64-arm64-xl-xsm)
Date: Tue, 12 Mar 2019 10:14:21 -0700
Message-ID: <20190312171421.GJ19508@bombadil.infradead.org>
References: <E1h3Uiq-0002L6-Ij@osstest.test-lab.xenproject.org>
 <80211e70-5f54-9421-8e8f-2a4fc758ce39@arm.com>
 <46118631-61d4-adb6-6ffc-4e7c62ea3da9@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TINx=RP=infradead.org=willy@srs-us1.protection.inumbo.net>)
 id 1h3kyu-0006PV-Mp
 for xen-devel@lists.xenproject.org; Tue, 12 Mar 2019 17:14:24 +0000
Content-Disposition: inline
In-Reply-To: <46118631-61d4-adb6-6ffc-4e7c62ea3da9@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Juergen Gross <jgross@suse.com>, k.khlebnikov@samsung.com, Stefano Stabellini <sstabellini@kernel.org>, Kees Cook <keescook@chromium.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, "VMware,
 Inc." <pv-drivers@vmware.com>, david@redhat.com, osstest service owner <osstest-admin@xenproject.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-mm@kvack.org, Julien Freche <jfreche@vmware.com>, Nadav Amit <namit@vmware.com>, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBNYXIgMTIsIDIwMTkgYXQgMDU6MDU6MzlQTSArMDAwMCwgSnVsaWVuIEdyYWxsIHdy
b3RlOgo+IE9uIDMvMTIvMTkgMzo1OSBQTSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+ID4gSXQgbG9v
a3MgbGlrZSBhbGwgdGhlIGFybSB0ZXN0IGZvciBsaW51cyBbMV0gYW5kIG5leHQgWzJdIHRyZWUK
PiA+IGFyZSBub3cgZmFpbGluZy4geDg2IHNlZW1zIHRvIGJlIG1vc3RseSBvay4KPiA+IAo+ID4g
VGhlIGJpc2VjdG9yIGZpbmdlcmVkIHRoZSBmb2xsb3dpbmcgY29tbWl0Ogo+ID4gCj4gPiBjb21t
aXQgMGVlOTMwZTZjYWZhMDQ4YzE5MjU4OTNkMGNhODk5MThiMjgxNGYyYwo+ID4gQXV0aG9yOiBN
YXR0aGV3IFdpbGNveCA8d2lsbHlAaW5mcmFkZWFkLm9yZz4KPiA+IERhdGU6ICAgVHVlIE1hciA1
IDE1OjQ2OjA2IDIwMTkgLTA4MDAKPiA+IAo+ID4gICAgICBtbS9tZW1vcnkuYzogcHJldmVudCBt
YXBwaW5nIHR5cGVkIHBhZ2VzIHRvIHVzZXJzcGFjZQo+ID4gICAgICBQYWdlcyB3aGljaCB1c2Ug
cGFnZV90eXBlIG11c3QgbmV2ZXIgYmUgbWFwcGVkIHRvIHVzZXJzcGFjZSBhcyBpdCB3b3VsZAo+
ID4gICAgICBkZXN0cm95IHRoZWlyIHBhZ2UgdHlwZS4gIEFkZCBhbiBleHBsaWNpdCBjaGVjayBm
b3IgdGhpcyBpbnN0ZWFkIG9mCj4gPiAgICAgIGFzc3VtaW5nIHRoYXQga2VybmVsIGRyaXZlcnMg
YWx3YXlzIGdldCB0aGlzIHJpZ2h0LgoKT2ggZ29vZCwgaXQgZm91bmQgYSByZWFsIHByb2JsZW0u
Cgo+IEl0IHR1cm5zIG91dCB0aGUgcHJvYmxlbSBpcyBiZWNhdXNlIHRoZSBiYWxsb29uIGRyaXZl
ciB3aWxsIGNhbGwKPiBfX1NldFBhZ2VPZmZsaW5lKCkgb24gYWxsb2NhdGVkIHBhZ2UuIFRoZXJl
Zm9yZSB0aGUgcGFnZSBoYXMgYSB0eXBlIGFuZAo+IHZtX2luc2VydF9wYWdlcyB3aWxsIGRlbnkg
dGhlIGluc2VydGlvbi4KPiAKPiBNeSBrbm93bGVkZ2UgaXMgcXVpdGUgbGltaXRlZCBpbiB0aGlz
IGFyZWEuIFNvIEkgYW0gbm90IHN1cmUgaG93IHdlIGNhbgo+IHNvbHZlIHRoZSBwcm9ibGVtLgo+
IAo+IEkgd291bGQgYXBwcmVjaWF0ZSBpZiBzb21lb25lIGNvdWxkIHByb3ZpZGUgaW5wdXQgb2Yg
dG8gZml4IHRoZSBtYXBwaW5nLgoKSSBkb24ndCBrbm93IHRoZSBiYWxsb29uIGRyaXZlciwgc28g
SSBkb24ndCBrbm93IHdoeSBpdCB3YXMgZG9pbmcgdGhpcywKYnV0IHdoYXQgaXQgd2FzIGRvaW5n
IHdhcyBXcm9uZyBhbmQgaGFzIGJlZW4gc2luY2UgMjAxNCB3aXRoOgoKY29tbWl0IGQ2ZDg2YzBh
N2Y4ZGRjNWIzOGNmMDg5MjIyY2IxZDk1NDA3NjJkYzIKQXV0aG9yOiBLb25zdGFudGluIEtobGVi
bmlrb3YgPGsua2hsZWJuaWtvdkBzYW1zdW5nLmNvbT4KRGF0ZTogICBUaHUgT2N0IDkgMTU6Mjk6
MjcgMjAxNCAtMDcwMAoKICAgIG1tL2JhbGxvb25fY29tcGFjdGlvbjogcmVkZXNpZ24gYmFsbG9v
bmVkIHBhZ2VzIG1hbmFnZW1lbnQKCklmIGJhbGxvb25lZCBwYWdlcyBhcmUgc3VwcG9zZWQgdG8g
YmUgbWFwcGVkIGludG8gdXNlcnNwYWNlLCB5b3UgY2FuJ3QgbWFyawp0aGVtIGFzIGJhbGxvb25l
ZCBwYWdlcyB1c2luZyB0aGUgbWFwY291bnQgZmllbGQuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
