From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v7 01/49] x86emul: rename evex.br to evex.brs
Date: Wed, 19 Dec 2018 15:14:27 +0000
Message-ID: <12ba8aaa-c97a-13d3-db93-5511ed1acdfa@citrix.com>
References: <5B6BF83602000078001DC548@prv1-mh.provo.novell.com>
 <5C1A52ED0200007800207865@prv1-mh.provo.novell.com>
 <5C1A57460200007800207882@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zx63=O4=citrix.com=prvs=884ade4f2=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gZdZf-0002LM-Sl
 for xen-devel@lists.xenproject.org; Wed, 19 Dec 2018 15:15:51 +0000
In-Reply-To: <5C1A57460200007800207882@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTkvMTIvMjAxOCAxNDozNSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gVGhpcyBpcyB0byBiZXR0
ZXIgcmVmbGVjdCB0aGF0IGl0J3MgYW4gYWJicmV2aWF0aW9uIGZvciAiYnJvYWRjYXN0LAo+IHJv
dW5kaW5nLCBvciBTQUUiIHJhdGhlciB0aGFuIGp1c3QgImJyb2FkY2FzdCIuCj4KPiBUYWtlIHRo
ZSBvcHBvcnR1bml0eSBhbmQgYWxzbyBhZGQgU0RNIG5hbWluZyBjb21tZW50cyB0byBib3RoIHVu
aW9uIHZleAo+IGFuZCB1bmlvbiBldmV4Lgo+Cj4gUmVxdWVzdGVkLWJ5OiBBbmRyZXcgQ29vcGVy
IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNo
IDxqYmV1bGljaEBzdXNlLmNvbT4KClJldmlld2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcu
Y29vcGVyM0BjaXRyaXguY29tPgoKVGhhbmtzLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
