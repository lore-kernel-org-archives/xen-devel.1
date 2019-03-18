From: "Nuernberger, Stefan" <snu@amazon.de>
Subject: Re: [PATCH RFC 05/55] x86/mm: introduce l{1,
 2}t local variables to modify_xen_mappings
Date: Mon, 18 Mar 2019 21:14:12 +0000
Message-ID: <1552943652.6788.94.camel@amazon.de>
References: <20190207164456.9260-1-wei.liu2@citrix.com>
 <20190207164456.9260-6-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2tBy=RV=amazon.de=prvs=97326004b=snu@srs-us1.protection.inumbo.net>)
 id 1h5zaP-0007jd-AE
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2019 21:14:21 +0000
In-Reply-To: <20190207164456.9260-6-wei.liu2@citrix.com>
Content-Language: en-US
Content-ID: <AE070104C090DB4DAECBFA938B7621C4@amazon.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "wei.liu2@citrix.com" <wei.liu2@citrix.com>
Cc: "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, "jbeulich@suse.com" <jbeulich@suse.com>, "roger.pau@citrix.com" <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCAyMDE5LTAyLTA3IGF0IDE2OjQ0ICswMDAwLCBXZWkgTGl1IHdyb3RlOg0KPiBUaGUg
cGwyZSBhbmQgcGwxZSB2YXJpYWJsZXMgYXJlIGhlYXZpbHkgKGFiKXVzZWQgaW4gdGhhdA0KPiBm
dW5jdGlvbi7CoMKgSXQNCj4gaXMgZmluZSBhdCB0aGUgbW9tZW50IGJlY2F1c2UgYWxsIHBhZ2Ug
dGFibGVzIGFyZSBhbHdheXMgbWFwcGVkIHNvDQo+IHRoZXJlIGlzIG5vIG5lZWQgdG8gdHJhY2sg
dGhlIGxpZmUgdGltZSBvZiBlYWNoIHZhcmlhYmxlLg0KPiANCj4gV2Ugd2lsbCBzb29uIGhhdmUg
dGhlIHJlcXVpcmVtZW50IHRvIG1hcCBhbmQgdW5tYXAgcGFnZSB0YWJsZXMuIFdlDQo+IG5lZWQg
dG8gdHJhY2sgdGhlIGxpZmUgdGltZSBvZiBlYWNoIHZhcmlhYmxlIHRvIGF2b2lkIGxlYWthZ2Uu
DQo+IA0KPiBJbnRyb2R1Y2Ugc29tZSBsezEsMn10IHZhcmlhYmxlcyB3aXRoIGxpbWl0ZWQgc2Nv
cGUgc28gdGhhdCB3ZSBjYW4NCj4gdHJhY2sgbGlmZSB0aW1lIG9mIHBvaW50ZXJzIHRvIHhlbiBw
YWdlIHRhYmxlcyBtb3JlIGVhc2lseS4NCj4gDQo+IE5vIGZ1bmN0aW9uYWwgY2hhbmdlLg0KPiAN
Cj4gU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4NCg0KU2FtZSBy
ZW1hcmsgYXMgSmFuIG9uIHRoZSBwcmV2aW91cyBwYXRjaCwgc29tZSBvZiB0aGUgb3JpZ2luYWwN
CnBsMWUvcGwyZSB1c2FnZSBpcyByZXRhaW5lZC4gSSBkb24ndCBzZWUgeWV0IGhvdyB0aGlzIHNj
b3Bpbmcgd2lsbA0KbGF0ZXIgaGVscCB3aXRoIG1hcC91bm1hcCwgYnV0IEknZCBhbHNvIHByZWZl
ciBpZiBhbGwgdXNhZ2Ugd2FzIHNjb3BlZA0KYW5kIHRoZSBmdW5jdGlvbi1zY29wZSBwbDFlL3Bs
MmUgcmVtb3ZlZC4NCg0KLSBTdGVmYW4NCgoKCkFtYXpvbiBEZXZlbG9wbWVudCBDZW50ZXIgR2Vy
bWFueSBHbWJICktyYXVzZW5zdHIuIDM4CjEwMTE3IEJlcmxpbgpHZXNjaGFlZnRzZnVlaHJlcjog
Q2hyaXN0aWFuIFNjaGxhZWdlciwgUmFsZiBIZXJicmljaApVc3QtSUQ6IERFIDI4OSAyMzcgODc5
CkVpbmdldHJhZ2VuIGFtIEFtdHNnZXJpY2h0IENoYXJsb3R0ZW5idXJnIEhSQiAxNDkxNzMgQgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
