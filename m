From: Joe Jin <joe.jin@oracle.com>
Subject: Re: [PATCH] xen-swiotlb: exchange memory with Xen only
 when pages are contiguous
Date: Fri, 26 Oct 2018 07:48:09 -0700
Message-ID: <dac26047-7426-fec5-0360-fbfd6e211d69__36811.3072742291$1540565215$gmane$org@oracle.com>
References: <bb6d87b4-c371-c6c0-8c48-bc95df018ad1@oracle.com>
 <20181024130246.GA22616@localhost.localdomain>
 <83900cf4-690c-9725-d022-d427fdeb4f7d@oracle.com>
 <581cb7ea-3112-791d-918d-9bb887e4744f@oracle.com>
 <24a62522-1629-5d0b-398e-6d2c1a0b97f7@oracle.com>
 <922914c9-22db-c5d1-33da-d07691ebd7d7@oracle.com>
 <a47fabe8-53d1-47b8-0efc-f9f1e5b4898a@oracle.com>
 <45f5ffe8-3f48-4485-53f0-5a056be69b0c@oracle.com>
 <5b64850f-9142-0360-fe4e-9e7bc74d2368@oracle.com>
 <20181026074802.GA4768@lst.de>
 <10301c25-5bbf-51b6-6cb2-77e30bcd9a99@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=obby=ng=oracle.com=joe.jin@srs-us1.protection.inumbo.net>)
 id 1gG3PL-0004Qa-9N
 for xen-devel@lists.xenproject.org; Fri, 26 Oct 2018 14:48:15 +0000
In-Reply-To: <10301c25-5bbf-51b6-6cb2-77e30bcd9a99@oracle.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Dongli Zhang <dongli.zhang@oracle.com>
Cc: John Sobecki <john.sobecki@oracle.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, konrad@kernel.org, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Christoph Helwig <hch@lst.de>
List-Id: xen-devel@lists.xenproject.org

T24gMTAvMjYvMTggMTo1NCBBTSwgRG9uZ2xpIFpoYW5nIHdyb3RlOgo+IElmIGRvbTAgKG9yIGFu
eSBkb21haW4pIGlzIGhhcHB5LCBhbHRob3VnaCBpdCBjb3VsZCB0cnkgdG8gZXhjaGFuZ2UgYWxs
IGl0cwo+IGNvbnRpbnVvdXMgZG1hIHBhZ2VzIGJhY2sgdG8geGVuIGh5cGVydmlzb3IuIEZyb20g
dGhlIHBlcnNwZWN0aXZlIG9mIGVhY2gKPiBkb21haW4sIHRoZXkgYWx3YXlzIHdvdWxkIGxpa2Ug
dG8ga2VlcCBhcyBtdWNoIGNvbnRpbnVvdXMgZG1hIHBhZ2UgYXMgcG9zc2libGUuCj4gCj4gSSBh
bSB0aGlua2luZyBzb21ldGhpbmcgZGlmZmVyZW50LiBJZiB0aGVyZSBpcyBtYWxpY2lvdXMgZG9t
VSBrZWVwIGV4Y2hhbmdpbmcKPiBtZW1vcnkgYW5kIGFsbG9jYXRpbmcgY29udGludW91cyBwYWdl
cyBmcm9tIHhlbiBoeXBlcnZpc29yLCB3aWxsIHRoZQo+IGNvbnRpbnVvdXNseSBkbWEgcGFnZXMg
YmUgdXNlZCB1cCAoc29ydCBvZiBEb1MgYXR0YWNrKT8KClRoaXMgaXMgYSBwcm9ibGVtLgoKPiAK
PiBJIGFtIG5vdCBzdXJlIGlmIHRoZXJlIGlzIGFueXRoaW5nIGluIHhlbiBoeXBlcnZpc29yIHRv
IHByZXZlbnQgc3VjaCBiZWhhdmlvcj8KCkknbSBub3Qgc3VyZSBidXQgSSBndWVzcyBpdCBoYXJk
IHRvIHByZXZlbnQgaXQsIHhlbiBoeXBlcnZpc29yIGNvdWxkIG5vdCBpZGVudGlmeQppZiB0aGUg
cmVxdWlyZW1lbnQgaXMgcmVhc29uYWJsZSBvciBuby4KCk1heWJlIFhlbiByZXNlcnZlIHNvbWUg
bG93IG1lbW9yeSBmb3IgZ3Vlc3Qgc3RhcnQ/CgpUaGFua3MsCkpvZQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
