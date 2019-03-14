From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v7 07/49] x86emul: basic AVX512VL testing
Date: Thu, 14 Mar 2019 16:39:16 +0000
Message-ID: <1f7ab2bc-1206-fddf-26f3-6a4304918bec@citrix.com>
References: <5B6BF83602000078001DC548@prv1-mh.provo.novell.com>
 <5C1A52ED0200007800207865@prv1-mh.provo.novell.com>
 <5C1A580202000078002078B0@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Rzje=RR=citrix.com=prvs=969ff7116=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1h4TgR-0002Lf-3I
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2019 16:58:19 +0000
In-Reply-To: <5C1A580202000078002078B0@prv1-mh.provo.novell.com>
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

T24gMTkvMTIvMjAxOCAxNDozOCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gVGVzdCB0aGUgMTI4LSBh
bmQgMjU2LWJpdCB2YXJpYW50cyBvZiB0aGUgaW5zbnMgd2hpY2ggaGF2ZSBiZWVuCj4gaW1wbGVt
ZW50ZWQgYWxyZWFkeS4KPgo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBz
dXNlLmNvbT4KCkFja2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXgu
Y29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
