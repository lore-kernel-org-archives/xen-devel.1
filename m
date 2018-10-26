From: Christoph Helwig <hch@lst.de>
Subject: Re: [PATCH] xen-swiotlb: exchange memory with Xen only
 when pages are contiguous
Date: Fri, 26 Oct 2018 09:48:02 +0200
Message-ID: <20181026074802.GA4768__32104.1516181596$1540540013$gmane$org@lst.de>
References: <bb6d87b4-c371-c6c0-8c48-bc95df018ad1@oracle.com>
 <20181024130246.GA22616@localhost.localdomain>
 <83900cf4-690c-9725-d022-d427fdeb4f7d@oracle.com>
 <581cb7ea-3112-791d-918d-9bb887e4744f@oracle.com>
 <24a62522-1629-5d0b-398e-6d2c1a0b97f7@oracle.com>
 <922914c9-22db-c5d1-33da-d07691ebd7d7@oracle.com>
 <a47fabe8-53d1-47b8-0efc-f9f1e5b4898a@oracle.com>
 <45f5ffe8-3f48-4485-53f0-5a056be69b0c@oracle.com>
 <5b64850f-9142-0360-fe4e-9e7bc74d2368@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=npj0=ng=lst.de=hch@srs-us1.protection.inumbo.net>)
 id 1gFwqj-0006ni-Dr
 for xen-devel@lists.xenproject.org; Fri, 26 Oct 2018 07:48:05 +0000
Content-Disposition: inline
In-Reply-To: <5b64850f-9142-0360-fe4e-9e7bc74d2368@oracle.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Joe Jin <joe.jin@oracle.com>
Cc: John Sobecki <john.sobecki@oracle.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, "DONGLI.ZHANG" <dongli.zhang@oracle.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, konrad@kernel.org, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Christoph Helwig <hch@lst.de>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBPY3QgMjUsIDIwMTggYXQgMTE6NTY6MDJBTSAtMDcwMCwgSm9lIEppbiB3cm90ZToK
PiBJIGp1c3QgZGlzY3Vzc2VkIHRoaXMgcGF0Y2ggd2l0aCBCb3JpcyBpbiBwcml2YXRlLCBoaXMg
b3BpbmlvbnMoQm9yaXMsCj4gcGxlYXNlIGNvcnJlY3QgbWUgaWYgYW55IG1pc3VuZGVyc3Rvb2Qp
IGFyZToKPiAKPiAxLiBXaXRoL3dpdGhvdXQgdGhlIGNoZWNrLCBib3RoIGFyZSBpbmNvcnJlY3Qs
IGhlIHRob3VnaHQgd2UgbmVlZCB0bwo+ICAgIHByZXZlbnRlZCB1bmFsbG9jJ2QgZnJlZSBhdCBo
ZXJlLiAKPiAyLiBPbiBmcmVlaW5nLCBpZiB1cHBlciBsYXllciBhbHJlYWR5IGNoZWNrZWQgdGhl
IG1lbW9yeSB3YXMgRE1BLWFibGUsCj4gICAgdGhlIGNoZWNraW5nIGF0IGhlcmUgZG9lcyBub3Qg
bWFrZSBzZW5zZSwgd2UgY2FuIHJlbW92ZSBhbGwgY2hlY2tzLgo+IDMuIHhlbl9jcmVhdGVfY29u
dGlndW91c19yZWdpb24oKSBhbmQgeGVuX2Rlc3Ryb3lfY29udGlndW91c19yZWdpb24oKQo+ICAg
IHRvIGNvbWUgaW4gcGFpcnMuCj4gCj4gRm9yICMxIGFuZCAjMywgSSB0aGluayB3ZSBuZWVkIHNv
bWV0aGluZyBhc3NvY2lhdGUgaXQsIGxpa2UgYSBsaXN0LCBvbgo+IGFsbG9jYXRpbmcsIGFkZCBh
ZGRyIHRvIGl0LCBvbiBmcmVlaW5nLCBjaGVjayBpZiBpbiB0aGUgbGlzdC4KCklzIHRoZXJlIGFu
eSB3YXkgdG8gZmlndXJlIG91dCBiYXNlZCBvbiBhbiBhZGRyZXNzIGlmIHRoZSBleGNoYW5nZQpv
cGVyYXRpb24gaGFwcGVuZWQ/Cgo+IEZvciAjMiwgSSdtIHdhcyBub3QgZm91bmQgYW55d2hlcmUg
dmFsaWRhdGVkIHRoZSBhZGRyZXNzIG9uIAo+IGRtYV9mcmVlX2NvaGVyZW50KCkgY2FsbHBhdGgs
IG5vdCBqdXN0IHhlbi1zd2lvdGxiLgoKQXQgbGVhc3QgZm9yIHNpbXBsZSBkaXJlY3QgbWFwcGlu
Z3MgdGhlcmUgaXMgbm8gZWFzeSB3YXkgdG8gdmVyaWZ5IHRoYXQKd2l0aG91dCBrZWVwaW5nIGEg
bGlzdCwgYW5kIGZvciBzb21lIG9mIHRoZSBvcHMgdGhhdCBkbyB2bWFwIGxpa2UKb3BlcmF0aW9u
cyB3ZSBoYXZlIGJhc2ljIHNhbnRpeSBjaGVja3MsIGJ1dCBub3RoaW5nIHRoYXQgcmVhbGx5IGNh
dGNoZXMKYSB3cm9uZyBmcmVlLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
