From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH v2] x86/altp2m: Allow setting the #VE info
 page for an arbitrary VCPU
Date: Thu, 20 Sep 2018 11:16:09 +0300
Message-ID: <ad5e7dc5-8b7e-97b5-48f4-862db4fb24ae@bitdefender.com>
References: <20180904045922.31609-1-apop@bitdefender.com>
 <CABfawh=xspBY1rz5jWNiaOomiT8teO=pMLR+axYxptHarqAi5Q@mail.gmail.com>
 <5ed49738-7653-197c-6206-d2b8fcd94cb5@bitdefender.com>
 <CABfawhnF8gftAOhByfb8cizyvOXbH-uHoX0vMpP18gA6etZ8Fw@mail.gmail.com>
 <d6e421a2-34b0-5f83-f985-5a1814bf3c8b@bitdefender.com>
 <CABfawhk6qTg=By4Dsy_hi_bZVsPEnJVmYHB6NDkTpzvHFGejPw@mail.gmail.com>
 <81c0e6f9-46b6-d956-1f16-70dfeb28aaaa@citrix.com>
 <CABfawhntiphM+xpiioW76AVy6gOXS4fA8P5jO7KYF_Rt6u9q7g@mail.gmail.com>
 <75ba39c8-228f-da7c-63df-24534e3a4271@bitdefender.com>
 <20180920081448.3kf2dozi5f3drk4d@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=tdcx=mc=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1g2u8S-0007Qv-R9
 for xen-devel@lists.xenproject.org; Thu, 20 Sep 2018 08:16:28 +0000
Received: from mx-sr.buh.bitdefender.com (mx-sr.buh.bitdefender.biz
 [10.17.80.103])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id 26A06305FFA2
 for <xen-devel@lists.xenproject.org>; Thu, 20 Sep 2018 11:16:27 +0300 (EEST)
Received: from smtp02.buh.bitdefender.net (smtp.bitdefender.biz [10.17.80.76])
 by mx-sr.buh.bitdefender.com (Postfix) with ESMTP id 19B9A7FBFF
 for <xen-devel@lists.xenproject.org>; Thu, 20 Sep 2018 11:16:27 +0300 (EEST)
In-Reply-To: <20180920081448.3kf2dozi5f3drk4d@zion.uk.xensource.com>
Content-Language: en-US-large
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Adrian Pop <apop@bitdefender.com>, Sergej Proskurin <proskurin@sec.in.tum.de>, Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gOS8yMC8xOCAxMToxNCBBTSwgV2VpIExpdSB3cm90ZToKPj4+IFJldmlld2VkLWJ5OiBUYW1h
cyBLIExlbmd5ZWwgPHRhbWFzQHRrbGVuZ3llbC5jb20+Cj4+IEFyZSB0aGVyZSBhbnkgaXNzdWVz
IHByZXZlbnRpbmcgdGhpcyBwYXRjaCB0byBnbyBpbj8gUG9zc2libHkgbWlzc2luZyBhY2tzPwo+
IEkgZG9uJ3QgdGhpbmsgc28sIHVubGVzcyBhbiBleHBsaWNpdCBhY2sgZm9yIHRoZSBkZWxldGlv
biBvZiB0aGF0Cj4gY29tbWVudCBpcyByZXF1aXJlZC4gSW4gYW55IGNhc2U6Cj4gCj4gQWNrZWQt
Ynk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Cj4gCj4gSSB3aWxsIGNvbW1pdCB0aGlz
IHBhdGNoIHNob3J0bHkuCgpUaGFua3MhCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
