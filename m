From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: [PATCH 2/8] xen/arm: p2m: Introduce
 p2m_get_page_from_gfn
Date: Thu, 15 Nov 2018 15:35:02 +0200
Message-ID: <CAC1WxdipyzheoV21ftr7KgAgb4iPTA_4tHD3++Qv2KE8EO7npA@mail.gmail.com>
References: <20181106191454.22143-1-julien.grall@arm.com>
 <20181106191454.22143-3-julien.grall@arm.com>
 <CAC1Wxdiko1Avrnxinq4Nk2+9=f9V2GHPvAzwGrRv5nH7WBe=qg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=abz7=n2=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1gNHng-0004iY-0O
 for xen-devel@lists.xenproject.org; Thu, 15 Nov 2018 13:35:16 +0000
Received: by mail-oi1-x243.google.com with SMTP id b141so7708822oii.12
 for <xen-devel@lists.xenproject.org>; Thu, 15 Nov 2018 05:35:14 -0800 (PST)
In-Reply-To: <CAC1Wxdiko1Avrnxinq4Nk2+9=f9V2GHPvAzwGrRv5nH7WBe=qg@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

U29ycnksCgpOb3QgImNvbXBhcmluZ2x5IGNvbXBsZXgiLCBidXQgImVxdWFsbHkgY29tcGxleCIu
IDspCgpTaW5jZXJlbHksCkFuZHJpaSBBbmlzb3YuCtGH0YIsIDE1INC70LjRgdGCLiAyMDE4INC+
IDE1OjMxIEFuZHJpaSBBbmlzb3YgPGFuZHJpaS5hbmlzb3ZAZ21haWwuY29tPiDQv9C40YjQtToK
Pgo+IEhlbGxvIEp1bGllbiwKPgo+INCy0YIsIDYg0LvQuNGB0YIuIDIwMTgg0L4gMjE6MTYgSnVs
aWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4g0L/QuNGI0LU6Cj4gPgo+ID4gSW4gYSBm
b2xsb3ctdXAgcGF0Y2hlcywgd2Ugd2lsbCBuZWVkIHRvIGhhbmRsZSBnZXRfcGFnZV9mcm9tX2dm
bgo+ID4gZGlmZmVyZW50bHkgZm9yIERPTUlEX1hFTi4gVG8ga2VlcCB0aGUgY29kZSBzaW1wbGUg
bW92ZSB0aGUgY3VycmVudAo+ID4gY29udGVudCBpbiBhIG5ldyBzZXBhcmF0ZSBoZWxwZXIgcDJt
X2dldF9wYWdlX2Zyb21fZ2ZuLgo+ID4KPiA+IE5vdGUgdGhlIG5ldyBoZWxwZXIgaXMgYSBub3Qg
YW55bW9yZSBhIHN0YXRpYyBpbmxpbmUgZnVuY3Rpb24gYXMgdGhlIGhlbHBlcgo+ID4gaXMgcXVp
dGUgY29tcGxleC4KPgo+IEluIHRoZSBwYXRjaCAiW1BBVENIIDQvOF0geGVuL2FybTogQWRkIHN1
cHBvcnQgZm9yIHJlYWQtb25seSBmb3JlaWduCj4gbWFwcGluZ3MiIHlvdSBtYWtlIHAybV9nZXRf
cGFnZV9mcm9tX2dmbigpIGNvbXBhcmluZ2x5IGNvbXBsZXgsIGJ1dAo+IHN0aWxsIGtlZXAgaXQg
YXMgc3RhdGljIGlubGluZS4gQ291bGQgeW91IHBsZWFzZSBiZSBjb25zaXN0ZW50IChtYWtpbmcK
PiBib3RoIG9mIHRob3NlIGZ1bmN0aW9ucyBpbmxpbmUgb3Igbm9uLWlubGluZSkKPgo+IFNpbmNl
cmVseSwKPiBBbmRyaWkgQW5pc292LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
