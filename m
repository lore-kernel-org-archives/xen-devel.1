From: Paul Semel <semelpaul@gmail.com>
Subject: Re: [XTF] [PATCH v2] lib.c: added unsigned 64bits
 division for 32 bits arch
Date: Sat, 7 Apr 2018 21:58:35 +0200
Message-ID: <080483cb-2328-e39d-8661-436185f2df62@gmail.com>
References: <f39b5f31-7c52-80d4-5c01-91ad5f98a092@citrix.com>
 <20180407193530.27341-1-semelpaul@gmail.com>
 <1e775032-0093-1336-ff5e-b5d07e473828@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=q0iy=g4=gmail.com=semelpaul@srs-us1.protection.inumbo.net>)
 id 1f4tzg-0004kv-EL
 for xen-devel@lists.xenproject.org; Sat, 07 Apr 2018 19:59:24 +0000
Received: by mail-wm0-x233.google.com with SMTP id t67so9565727wmt.0
 for <xen-devel@lists.xenproject.org>; Sat, 07 Apr 2018 12:59:22 -0700 (PDT)
In-Reply-To: <1e775032-0093-1336-ff5e-b5d07e473828@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: wipawel@amazon.de
List-Id: xen-devel@lists.xenproject.org

T24gMDQvMDcvMjAxOCAwOTo1MyBQTSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAwNy8wNC8x
OCAyMDozNSwgUGF1bCBTZW1lbCB3cm90ZToKPj4gdGhpcyBpcyBhIHNpbXBsZSBpbXBsZW1lbnRh
dGlvbiBvZiB1bnNpZ25lZCA2NGJpdHMgZGl2aXNpb25zCj4+IGZvciAzMiBiaXRzIGFyY2hzLgo+
Pgo+PiBTaWduZWQtb2ZmLWJ5OiBQYXVsIFNlbWVsIDxzZW1lbHBhdWxAZ21haWwuY29tPgo+IAo+
IEknbSB0ZXJyaWJseSBzb3JyeSBub3QgdG8gaGF2ZSBzcG90dGVkIHRoaXMgYmVmb3JlLCBidXQg
dGhlIGNvZGUKPiBhY3R1YWxseSBsb29rcyByYXRoZXIgZmFtaWxpYXIuCj4gCj4gR3JlcCBmb3Ig
ZGl2bW9kNjQgaW4gdGhlIHNvdXJjZS4KPiAKPiB+QW5kcmV3Cj4gCgpObyBwcm9ibGVtLCBJIGFt
IHJlYWxseSBzb3JyeSB0b28gbm90IHRvIGhhdmUgc3BvdHRlZCB0aGlzIGJlZm9yZSAhCgotLSAK
UGF1bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
