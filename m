From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] x86emul: correct AVX512BW write masking
 checks
Date: Wed, 16 Jan 2019 12:40:22 +0100
Message-ID: <cb65c6cc-7ef6-2ae7-4206-901f8f907d0e@suse.com>
References: <5C3C7511020000780020D2BF@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=JTqL=PY=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1gjjYX-0003eY-Ar
 for xen-devel@lists.xenproject.org; Wed, 16 Jan 2019 11:40:25 +0000
In-Reply-To: <5C3C7511020000780020D2BF@suse.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTQvMDEvMjAxOSAxMjo0MCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gRm9yIFZQU0FEQlcgdGhp
cyBsaWtlbHkgd2FzIGEgcmVzdWx0IG9mIGJhZCBjb3B5LWFuZC1wYXN0ZS4KPiAKPiBGb3IgVlBT
e0wsUn1MRFEgY29tbWVudCBhbmQgY29kZSB3ZXJlIG5vdCBpbiBsaW5lLCBidXQgdGhlbiBhZ2Fp
biB0aGUKPiBjb21tZW50IGFsc28gd2Fzbid0IGZ1bGx5IHVwZGF0ZWQgZnJvbSB0aGUgQVZYMiBv
cmlnaW5hbCBpdCBnb3QgY2xvbmVkCj4gZnJvbS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpSZWxlYXNlLWFja2VkLWJ5OiBKdWVyZ2VuIEdyb3Nz
IDxqZ3Jvc3NAc3VzZS5jb20+CgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
