From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH] libxl: make sure string is null-terminated
 in libxl__prepare_sockaddr_un
Date: Wed, 22 Aug 2018 15:33:53 +0100
Message-ID: <23421.29777.244485.545133@mariner.uk.xensource.com>
References: <20180822102155.990-1-wei.liu2@citrix.com>
 <23421.19317.737379.269326@mariner.uk.xensource.com>
 <20180822134417.iv5s3ia5mdoxgaar@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=1tiv=lf=citrix.com=prvs=7656d7fe5=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fsUD3-0008DK-0d
 for xen-devel@lists.xenproject.org; Wed, 22 Aug 2018 14:34:09 +0000
In-Reply-To: <20180822134417.iv5s3ia5mdoxgaar@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

V2VpIExpdSB3cml0ZXMgKCJSZTogW1BBVENIXSBsaWJ4bDogbWFrZSBzdXJlIHN0cmluZyBpcyBu
dWxsLXRlcm1pbmF0ZWQgaW4gbGlieGxfX3ByZXBhcmVfc29ja2FkZHJfdW4iKToKPiBPbiBXZWQs
IEF1ZyAyMiwgMjAxOCBhdCAxMjozOTozM1BNICswMTAwLCBJYW4gSmFja3NvbiB3cm90ZToKPiA+
IElmIHRoaXMgbmV3IGNvZGUgaGFzIGFueSBlZmZlY3QgYXQgYWxsLCBpdCB3aWxsIGNvcnJ1cHQg
dGhlIHN0cmluZyBieQo+ID4gdHJ1bmNhdGluZyBpdC4KPiAKPiBDb3JydXB0PyBQZXIgeW91ciBh
bmFseXNpcyBhYm92ZSwgaXNuJ3QgdGhlIGxhc3QgYnl0ZSBhbHdheXMgZ29pbmcgdG8gYmUKPiBu
dWw/IFRoaXMgY2hhbmdlIGlzIHRvIHBsYWNhdGUgY292ZXJpdHkgbW9yZSB0aGFuIGFueXRoaW5n
IGVsc2UuCgpBcyBJIHNhaWQsIGlmIHRoaXMgbmV3IGNvZGUgaGFzIGFueSBlZmZlY3QgYXQgYWxs
LiAgSW4gdGhhdCBjYXNlIHRoZQpsYXN0IGJ5dGUgbXVzdCBiZSBub24tbnVsLiAgSW4gd2hpY2gg
Y2FzZSBzZXR0aW5nIGl0IHRvIG51bCBpcwp0cnVuY2F0aW5nIGl0LgoKSWYgaXQgaXMgbmVjZXNz
YXJ5IHRvIHBsYWNhdGUgQ292ZXJpdHksIGhvdyBhYm91dCBhbiBhc3NlcnQgPwoKPiBJc24ndCBz
ZXR0aW5nIHRoZSBsYXN0IGJ5dGUgdG8gMCBhIGNvbW1vbiBwYXR0ZXJuIHRvIGVuc3VyZSBhCj4g
c3RyaW5nIGlzIG51bGwtdGVybWluYXRlZD8KCk9ubHkgaWYgeW91IGRvbid0IG1pbmQgdHJ1bmNh
dGVkIGl0LiAgV2hpY2ggd2UgZG8sIGhlcmUuICBXaGljaCBpcyB3aHkKdGhlIHByZXZpb3VzIGNv
ZGUgY2hlY2tzIHRvIG1ha2Ugc3VyZSB0aGF0IGl0IGZpdHMsIGluY2x1ZGluZyB0aGUKdHJhaWxp
bmcgbnVsLgoKSWFuLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
