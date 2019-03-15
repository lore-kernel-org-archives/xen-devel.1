From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v8 08/50] x86emul: support AVX512{F,
 BW} down conversion moves
Date: Fri, 15 Mar 2019 18:10:20 +0000
Message-ID: <c2047381-fdda-02fe-d0d8-efd4d44dcdcb@citrix.com>
References: <5B6BF83602000078001DC548@prv1-mh.provo.novell.com>
 <5C8B7EC0020000780021F10B@prv1-mh.provo.novell.com>
 <5C8B8122020000780021F161@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=OIle=RS=citrix.com=prvs=970d66146=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1h4rIe-000132-80
 for xen-devel@lists.xenproject.org; Fri, 15 Mar 2019 18:11:20 +0000
In-Reply-To: <5C8B8122020000780021F161@prv1-mh.provo.novell.com>
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

T24gMTUvMDMvMjAxOSAxMDo0MCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gTm90ZSB0aGF0IHRoZSB2
cG1vdnsscyx1c317ZCxxfXcgdGFibGUgZW50cmllcyBpbiBldmV4LWRpc3A4LmMgYXJlCj4gc2xp
Z2h0bHkgZGlmZmVyZW50IGZyb20gd2hhdCBvbmUgd291bGQgZXhwZWN0LCBkdWUgdG8gdGhlbSBy
ZXF1aXJpbmcKPiBFVkVYLlcgdG8gYmUgemVyby4KPgo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCkFja2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcu
Y29vcGVyM0BjaXRyaXguY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
