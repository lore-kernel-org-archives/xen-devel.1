From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: [PATCH 2/8] xen/arm: p2m: Introduce
 p2m_get_page_from_gfn
Date: Thu, 20 Dec 2018 13:20:11 +0200
Message-ID: <ce8d0d15-df8c-8303-7d31-b9efeeafa884@gmail.com>
References: <20181106191454.22143-1-julien.grall@arm.com>
 <20181106191454.22143-3-julien.grall@arm.com>
 <CAC1Wxdiko1Avrnxinq4Nk2+9=f9V2GHPvAzwGrRv5nH7WBe=qg@mail.gmail.com>
 <ba051c7c-f957-368a-9556-b857f9f5011c@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Oo4L=O5=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1gZwNE-0008Lo-CC
 for xen-devel@lists.xenproject.org; Thu, 20 Dec 2018 11:20:16 +0000
Received: by mail-lf1-x142.google.com with SMTP id a16so1042909lfg.3
 for <xen-devel@lists.xenproject.org>; Thu, 20 Dec 2018 03:20:15 -0800 (PST)
In-Reply-To: <ba051c7c-f957-368a-9556-b857f9f5011c@arm.com>
Content-Language: en-US
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

CgpPbiAxNS4xMS4xOCAxNzoyMiwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IFRoZSByZWFzb24gSSBk
aWRuJ3QgbW92ZSB0aGUgb3RoZXIgb25lIGluIHAybS5jIGlzIGJlY2F1c2Ugc28gZmFyIHAybS5j
IGlzIG9ubHkgZGVhbGluZyB3aXRoIGF1dG8tdHJhbnNsYXRlZCBndWVzdC4gSSBkaWRuJ3Qgd2Fu
dCB0byBhZGQgZnVuY3Rpb24gcmVsYXRlZCB3aXRoIG5vbi1hdXRvIHRyYW5zbGF0ZWQgZ3Vlc3Qg
aW4gaXQuCj4gCj4gSSBhbHNvIGRvbid0IHRoaW5rIGludHJvZHVjZSBhIG5ldyBmaWxlIGZvciBv
bmUgMTAgbGluZSBmdW5jdGlvbiBpcyByZWFsbHkgdXNlZnVsLgo+IAo+IFNvIHRoYXQgd2FzIHRo
ZSBiZXN0IHNvbHV0aW9uLiBJIGFtIG9wZW4gdG8gb3RoZXIgc3VnZ2VzdGlvbi4KPiAKPiBDaGVl
cnMsCgpSZXZpZXdlZC1ieTogQW5kcmlpIEFuaXNvdiA8YW5kcmlpX2FuaXNvdkBlcGFtLmNvbT4K
Ci0tIApTaW5jZXJlbHksCkFuZHJpaSBBbmlzb3YuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
