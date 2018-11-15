From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: [PATCH 2/8] xen/arm: p2m: Introduce
 p2m_get_page_from_gfn
Date: Thu, 15 Nov 2018 15:31:15 +0200
Message-ID: <CAC1Wxdiko1Avrnxinq4Nk2+9=f9V2GHPvAzwGrRv5nH7WBe=qg@mail.gmail.com>
References: <20181106191454.22143-1-julien.grall@arm.com>
 <20181106191454.22143-3-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=abz7=n2=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1gNHk0-0004WY-CF
 for xen-devel@lists.xenproject.org; Thu, 15 Nov 2018 13:31:28 +0000
Received: by mail-oi1-x243.google.com with SMTP id w13so4127628oiw.9
 for <xen-devel@lists.xenproject.org>; Thu, 15 Nov 2018 05:31:27 -0800 (PST)
In-Reply-To: <20181106191454.22143-3-julien.grall@arm.com>
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

SGVsbG8gSnVsaWVuLAoK0LLRgiwgNiDQu9C40YHRgi4gMjAxOCDQviAyMToxNiBKdWxpZW4gR3Jh
bGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPiDQv9C40YjQtToKPgo+IEluIGEgZm9sbG93LXVwIHBh
dGNoZXMsIHdlIHdpbGwgbmVlZCB0byBoYW5kbGUgZ2V0X3BhZ2VfZnJvbV9nZm4KPiBkaWZmZXJl
bnRseSBmb3IgRE9NSURfWEVOLiBUbyBrZWVwIHRoZSBjb2RlIHNpbXBsZSBtb3ZlIHRoZSBjdXJy
ZW50Cj4gY29udGVudCBpbiBhIG5ldyBzZXBhcmF0ZSBoZWxwZXIgcDJtX2dldF9wYWdlX2Zyb21f
Z2ZuLgo+Cj4gTm90ZSB0aGUgbmV3IGhlbHBlciBpcyBhIG5vdCBhbnltb3JlIGEgc3RhdGljIGlu
bGluZSBmdW5jdGlvbiBhcyB0aGUgaGVscGVyCj4gaXMgcXVpdGUgY29tcGxleC4KCkluIHRoZSBw
YXRjaCAiW1BBVENIIDQvOF0geGVuL2FybTogQWRkIHN1cHBvcnQgZm9yIHJlYWQtb25seSBmb3Jl
aWduCm1hcHBpbmdzIiB5b3UgbWFrZSBwMm1fZ2V0X3BhZ2VfZnJvbV9nZm4oKSBjb21wYXJpbmds
eSBjb21wbGV4LCBidXQKc3RpbGwga2VlcCBpdCBhcyBzdGF0aWMgaW5saW5lLiBDb3VsZCB5b3Ug
cGxlYXNlIGJlIGNvbnNpc3RlbnQgKG1ha2luZwpib3RoIG9mIHRob3NlIGZ1bmN0aW9ucyBpbmxp
bmUgb3Igbm9uLWlubGluZSkKClNpbmNlcmVseSwKQW5kcmlpIEFuaXNvdi4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
