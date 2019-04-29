From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH for-next 1/9] xen/arm: Use mfn_to_pdx
 instead of pfn_to_pdx when possible
Date: Mon, 29 Apr 2019 17:30:00 +0100
Message-ID: <5fa1fe83-6dcd-5c8c-6018-23123f4fbc6f@arm.com>
References: <20190218113600.9540-1-julien.grall@arm.com>
 <20190218113600.9540-2-julien.grall@arm.com>
 <alpine.DEB.2.10.1904151453080.29275@sstabellini-ThinkPad-X260>
 <b92d3ffc-0dd9-ddfb-cee0-664f61ee2ff9@arm.com>
 <alpine.DEB.2.10.1904151522330.29275@sstabellini-ThinkPad-X260>
 <c3e5008c-7dd2-61b5-bec1-287b310a471c@arm.com>
 <02478ff8-d1e2-abe1-74a5-ca72ab87f154@arm.com>
 <5CC197EF0200007800229019@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cijb=S7=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hL9AJ-00062F-P7
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2019 16:30:03 +0000
In-Reply-To: <5CC197EF0200007800229019@prv1-mh.provo.novell.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

SGkgSmFuLAoKT24gMjUvMDQvMjAxOSAxMjoyMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24g
MTcuMDQuMTkgYXQgMTk6MDcsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4gd3JvdGU6Cj4+IEFueXdh
eSwgaXQgaXMgbm90IHRoZSBmaXJzdCB0aW1lIEkgc2VlIGJ1aWxkIGVycm9yIHdoZW4gdHJ5aW5n
IHRvIG1ha2UgdGhlIGNvZGUgdXNpbmcKPj4gdHlwZXNhZmUgZ2ZuL21mbi4gVGhlIGhlYWRlcnMg
ZGVwZW5kZW5jeSBhcmUgcXVpdGUgbWVzc3kgaW4gZ2VuZXJhbC4KPiAKPiBCZWNhdXNlIG9mIHRo
aXMsIC4uLgo+IAo+PiBBbmRyZXcsIEphbiBkbyB5b3UgaGF2ZSBhIHN1Z2dlc3Rpb24gaG93IHRv
IHByb2Nlc3Mgb24gdGhlIHg4NiBzaWRlPwo+IAo+IC4uLiBJIGRvbid0LCBJJ20gc29ycnksIHdp
dGhvdXQgYmVpbmcgYWJsZSB0byBpbnZlc3Qgc29tZSB0aW1lIHRvCj4gcGxheSB3aXRoIHRoaXMg
bXlzZWxmLgoKSSB0aG91Z2h0IEkgd291bGQgQ0NlZCB5b3UganVzdCBpbiBjYXNlIHlvdSBoYXZl
IGFuIGlkZWEgdG8gcXVpY2tseSBmaXggaXQuIApBbnl3YXksIHRoaXMgaXMgbW9yZSBhIGNsZWFu
dXAgYW5kIG5vdCBhIHByaW9yaXR5IGZvciBtZS4KCkNoZWVycywKCgotLSAKSnVsaWVuIEdyYWxs
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
