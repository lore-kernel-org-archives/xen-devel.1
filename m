From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH v2] x86/altp2m: Allow setting the #VE info
 page for an arbitrary VCPU
Date: Thu, 20 Sep 2018 11:38:04 +0300
Message-ID: <745d932d-4dd3-4ceb-dc6f-8abf39b65672@bitdefender.com>
References: <20180904045922.31609-1-apop@bitdefender.com>
 <CABfawh=xspBY1rz5jWNiaOomiT8teO=pMLR+axYxptHarqAi5Q@mail.gmail.com>
 <5ed49738-7653-197c-6206-d2b8fcd94cb5@bitdefender.com>
 <CABfawhnF8gftAOhByfb8cizyvOXbH-uHoX0vMpP18gA6etZ8Fw@mail.gmail.com>
 <d6e421a2-34b0-5f83-f985-5a1814bf3c8b@bitdefender.com>
 <CABfawhk6qTg=By4Dsy_hi_bZVsPEnJVmYHB6NDkTpzvHFGejPw@mail.gmail.com>
 <81c0e6f9-46b6-d956-1f16-70dfeb28aaaa@citrix.com>
 <CABfawhntiphM+xpiioW76AVy6gOXS4fA8P5jO7KYF_Rt6u9q7g@mail.gmail.com>
 <75ba39c8-228f-da7c-63df-24534e3a4271@bitdefender.com>
 <5BA358C502000078001EA284@prv1-mh.provo.novell.com>
 <20180920083109.a6useayrolg5rhtl@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=tdcx=mc=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1g2uTf-00018J-Gx
 for xen-devel@lists.xenproject.org; Thu, 20 Sep 2018 08:38:23 +0000
Received: from mx-sr.buh.bitdefender.com (mx-sr.buh.bitdefender.biz
 [10.17.80.103])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id E1E78305FFA1
 for <xen-devel@lists.xenproject.org>; Thu, 20 Sep 2018 11:38:21 +0300 (EEST)
Received: from smtp02.buh.bitdefender.net (smtp.bitdefender.biz [10.17.80.76])
 by mx-sr.buh.bitdefender.com (Postfix) with ESMTP id DA8127FC04
 for <xen-devel@lists.xenproject.org>; Thu, 20 Sep 2018 11:38:21 +0300 (EEST)
In-Reply-To: <20180920083109.a6useayrolg5rhtl@zion.uk.xensource.com>
Content-Language: en-US-large
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, George Dunlap <george.dunlap@citrix.com>
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Adrian Pop <apop@bitdefender.com>, Sergej Proskurin <proskurin@sec.in.tum.de>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gOS8yMC8xOCAxMTozMSBBTSwgV2VpIExpdSB3cm90ZToKPj4+PiBSZXZpZXdlZC1ieTogVGFt
YXMgSyBMZW5neWVsIDx0YW1hc0B0a2xlbmd5ZWwuY29tPgo+Pj4gQXJlIHRoZXJlIGFueSBpc3N1
ZXMgcHJldmVudGluZyB0aGlzIHBhdGNoIHRvIGdvIGluPyBQb3NzaWJseSBtaXNzaW5nIGFja3M/
Cj4+IFdlbGwsIGFmYWljcyB0aGUgcGF0Y2ggaGFzIG5vIHg4NiBtYWludGFpbmVyIGFjaywgbm9y
IC0gY29uc2lkZXJpbmcgaXQncwo+PiBhbiBtbSBmdW5jdGlvbiBzaXR0aW5nIGluIHRoZSAid3Jv
bmciIGZpbGUsIGF0IGxlYXN0IG9uZSBmcm9tIHRoZSBtbQo+PiBtYWludGFpbmVyLiBBcyBtZW50
aW9uZWQgYSBudW1iZXIgb2YgdGltZXMgYmVmb3JlLCBpdCBpcyB0aGUgc3VibWl0dGVyJ3MKPj4g
cmVzcG9uc2liaWxpdHkgdG8gY2hhc2UgYWNrcywgbm90IHRoZSBjb21taXR0ZXJzJyBvciBtYWlu
dGFpbmVycycuCj4gCj4gT2gsIHNvcnJ5LiBJIGhhdmUgbWlzc2VkIHRoYXQgdGhpcyBhdCBsZWFz
dCBuZWVkcyBhbiBhY2sgZnJvbSBHZW9yZ2UuCj4gSSB3aWxsIHdhaXQgdW50aWwgRU9EIGZvciBH
ZW9yZ2UgdG8gZ2l2ZSBhbiBhY2suIElmIHRoZXJlIGlzbid0IG9uZSBieQo+IHRoZW4gSSB3aWxs
IHJldmVydCB0aGUgcGF0Y2ggaW4gc3RhZ2luZy4KCkFkZGVkIEdlb3JnZSB0byB0aGUgZW1haWwg
cmVjaXBpZW50cy4KCgpUaGFua3MsClJhenZhbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
