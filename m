From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] arm: fix Dom0 creation after ef72c93df9
Date: Mon, 22 Oct 2018 14:42:26 +0100
Message-ID: <df3a9a7c-ea20-3699-f0ad-2b3b1226dade@citrix.com>
References: <20181022134021.30090-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=tti2=nc=citrix.com=prvs=826755171=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gEaTV-0006oj-M9
 for xen-devel@lists.xenproject.org; Mon, 22 Oct 2018 13:42:29 +0000
In-Reply-To: <20181022134021.30090-1-wei.liu2@citrix.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gMjIvMTAvMTggMTQ6NDAsIFdlaSBMaXUgd3JvdGU6Cj4gQVJNIERvbTAgY3JlYXRpb24gd2Fz
IGJyb2tlbiBieSB0aGUgc2FpZCBjb21taXQgYmVjYXVzZSBBUk0gbmVpdGhlcgo+IHByb3ZpZGVk
IFhFTl9ET01DVExfQ0RGX2h2bV9ndWVzdCBub3IgaGFkIENPTkZJR19QViBzZXQuCj4KPiBTZXQg
WEVOX0RPTUNUTF9DREZfaHZtX2d1ZXN0IGZsYWcgZm9yIEFSTSBEb20wIHRvIGZpeCB0aGUgaXNz
dWUuIEFsc28KPiBzZXQgWEVOX0RPTUNUTF9DREZfaGFwIHdoaWxlIGF0IGl0Lgo+Cj4gU2lnbmVk
LW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KClJldmlld2VkLWJ5OiBBbmRy
ZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
