From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH v2] x86/altp2m: Allow setting the #VE info
 page for an arbitrary VCPU
Date: Wed, 5 Sep 2018 21:53:15 +0300
Message-ID: <2a3be7af-a4cc-f35a-acce-f45f719808cc@bitdefender.com>
References: <20180904045922.31609-1-apop@bitdefender.com>
 <CABfawh=xspBY1rz5jWNiaOomiT8teO=pMLR+axYxptHarqAi5Q@mail.gmail.com>
 <5ed49738-7653-197c-6206-d2b8fcd94cb5@bitdefender.com>
 <CABfawhnF8gftAOhByfb8cizyvOXbH-uHoX0vMpP18gA6etZ8Fw@mail.gmail.com>
 <d6e421a2-34b0-5f83-f985-5a1814bf3c8b@bitdefender.com>
 <CABfawhk6qTg=By4Dsy_hi_bZVsPEnJVmYHB6NDkTpzvHFGejPw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=im1i=lt=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1fxcva-0005Dk-No
 for xen-devel@lists.xenproject.org; Wed, 05 Sep 2018 18:53:22 +0000
Received: from mx-sr.buh.bitdefender.com (mx-sr.buh.bitdefender.biz
 [10.17.80.103])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id EFE39305FFB1
 for <xen-devel@lists.xenproject.org>; Wed,  5 Sep 2018 21:53:20 +0300 (EEST)
Received: from smtp03.buh.bitdefender.org (smtp.bitdefender.biz [10.17.80.77])
 by mx-sr.buh.bitdefender.com (Postfix) with ESMTP id D65547FC77
 for <xen-devel@lists.xenproject.org>; Wed,  5 Sep 2018 21:53:20 +0300 (EEST)
In-Reply-To: <CABfawhk6qTg=By4Dsy_hi_bZVsPEnJVmYHB6NDkTpzvHFGejPw@mail.gmail.com>
Content-Language: en-US-large
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Tamas K Lengyel <tamas@tklengyel.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Adrian Pop <apop@bitdefender.com>, Sergej Proskurin <proskurin@sec.in.tum.de>, Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gOS81LzE4IDk6NDAgUE0sIFRhbWFzIEsgTGVuZ3llbCB3cm90ZToKPj4+IFNvdW5kcyBnb29k
LCB0aGFua3MhCj4+IE1heSB3ZSB0YWtlIHRoYXQgYXMgYW4gQWNrZWQtYnksIG9yIGFyZSB0aGVy
ZSBhcmUgb3RoZXIgdGhpbmdzIHlvdSB0aGluawo+PiB3ZSBzaG91bGQgYWRkcmVzcz8KPiBBIFJl
dmlld2VkLWJ5IHdvdWxkIGJlIGFwcHJvcHJpYXRlLCBJIGRvbid0IHRoaW5rIHRoZSBmaWxlcyB0
b3VjaGVkIGluCj4gdGhpcyBwYXRjaCBmYWxsIHVuZGVyIG91ciB1bWJyZWxsYS4KCllvdSdyZSBy
aWdodCwgSSBqdXN0IHNhdyB0aGUgQ2MgYnV0IGRpZG4ndCBjaGVjay4KCgpUaGFua3MsClJhenZh
bgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
