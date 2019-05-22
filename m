From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH] xen/public: arch-arm: Restrict the
 visibility of struct vcpu_guest_core_regs
Date: Wed, 22 May 2019 13:20:45 +0100
Message-ID: <83c1a4f7-0714-0ee5-e225-835126d92c5d@arm.com>
References: <20190520181250.17404-1-julien.grall@arm.com>
 <5CE3C45A0200007800230E0E@prv1-mh.provo.novell.com>
 <1c7f43ce-7df2-24c9-ecb2-d8be1afebfa5@arm.com>
 <5CE3C8370200007800230E40@prv1-mh.provo.novell.com>
 <f2f912ac-a1c6-1f07-f708-cf2935c0270f@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2jZt=TW=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hTQEj-0003Cz-Bw
 for xen-devel@lists.xenproject.org; Wed, 22 May 2019 12:20:49 +0000
In-Reply-To: <f2f912ac-a1c6-1f07-f708-cf2935c0270f@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAyMS8wNS8yMDE5IDEwOjU1LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSGkgSmFuLAo+IAo+
IE9uIDUvMjEvMTkgMTA6NDMgQU0sIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAyMS4wNS4x
OSBhdCAxMTozNSwgPGp1bGllbi5ncmFsbEBhcm0uY29tPiB3cm90ZToKPj4+IE9uIDUvMjEvMTkg
MTA6MjYgQU0sIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4+IE9uIDIwLjA1LjE5IGF0IDIwOjEy
LCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+Pj4+PiDCoMKgwqDCoMKgIEFzIHRoaXMg
aXMgbm93IFhlbiBhbmQgdG9vbHMgb25seSwgSSBhbSB3b25kZXJpbmcgd2hldGhlciB0aGUgY2hl
Y2sgb24KPj4+Pj4gwqDCoMKgwqDCoCBHTlVfQyBpcyBzdGlsbCBuZWNlc3NhcnkuIEkgYW0gaGFw
cHkgdG8gc2VuZCBhIGZvbGxvdy11cCBwYXRjaCAob3IgZm9sZAo+Pj4+PiDCoMKgwqDCoMKgIGlu
IHRoaXMgb25lKSBpZiBpdCBjYW4gYmUgcmVtb3ZlZC4KPj4+Pgo+Pj4+IEkgdGhpbmsgdGhpcyBz
aG91bGQgYmUgZHJvcHBlZCBpZiBpdCBjYW4gYmUgd2l0aG91dCBicmVha2luZyBhbnkKPj4+PiBw
YXJ0IG9mIHRoZSBidWlsZC4KPj4+IFRoaXMgaXMgYmVjYXVzZSBhbGwgdGhlIHRvb2xzIGFyZSBw
YXJ0IG9mIHhlbi5naXQsIHJpZ2h0Pwo+Pgo+PiBSaWdodCAtIG5vLW9uZSBlbHNlIGlzIHN1cHBv
c2VkIHRvIGRlZmluZSBfX1hFTl9UT09MU19fLCBvcgo+PiBpZiBhbnlvbmUgZG9lcywgdGhleSdy
ZSBvbiB0aGVpciBvd24uCj4gCj4gVGhhbmtzIGZvciB0aGUgaW5mb3JtYXRpb24uIEkgd2lsbCBk
byBhIGZ1bGwgYnVpbGQgY2hlY2suCgpJIHRob3VnaHQgYWJvdXQgdGhpcyBhZ2FpbiwgbG9uZyB0
ZXJtIHRoZXJlIGFyZSBhbiBhdHRlbXB0IHRvIGJ1aWxkIHhlbiB3aXRoIApvdGhlciBjb21waWxl
ciBub3QgbmVjZXNzYXJpbHkgc3VwcG9ydGluZyBHTlUgQyBleHRlbnNpb24uCgpXaGlsZSB0aGlz
IHdvdWxkIHByb2JhYmx5IG5vdCBiZSB0aGUgb25seSBwbGFjZSB0aGF0IG5lZWQgdG8gYmUgcmV3
b3JrZWQsIHdlIAp3b3VsZCBoYXZlIHRvIHJldmVydCBwYXJ0IG9mIHRoaXMgY2hhbmdlLiBTbyBJ
IHdpbGwgbm90IGRyb3AgdGhlICNpZmRlZiBoZXJlLgoKSSB3aWxsIHJlc2VuZCB0aGUgcGF0Y2gg
bmV4dCB3ZWVrIHRvIGdpdmUgc29tZSB0aW1lIGZvciBtb3JlIGZlZWRiYWNrLgoKCkNoZWVycywK
Ci0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
