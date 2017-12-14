From: =?UTF-8?Q?H=c3=a5kon_Alstadheim?= <hakon@alstadheim.priv.no>
Subject: Re: [PATCH V1 1/1] Xen/libxl: Perform PCI reset using
 'reset' SysFS attribute
Date: Thu, 14 Dec 2017 22:31:43 +0100
Message-ID: <76649b03-0dde-dd37-28bd-f29b340aa009@alstadheim.priv.no>
References: <20171207222639.9879-1-Govinda.Tatti@Oracle.COM>
 <20171207222639.9879-2-Govinda.Tatti@Oracle.COM>
 <CAFLBxZZ-KO2Ytu1-fxgdmSZvy=a2C+SBeuweOHWGfbRnPxBRuA@mail.gmail.com>
 <dc8308cf-f6da-7b92-5bbb-05f58fd9e18b@Oracle.COM>
 <CAFLBxZb-S8CiRmpa=ddS-By300Hkwx_hLF66JVX2R3tHvzFcPA@mail.gmail.com>
 <59839a62-9cc4-b3a1-d765-bc372378d976@Oracle.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=cgac=dk=alstadheim.priv.no=hakon@srs-us1.protection.inumbo.net>)
 id 1ePb6e-0000cT-SG
 for xen-devel@lists.xenproject.org; Thu, 14 Dec 2017 21:31:53 +0000
Received: from postfix-relay.alstadheim.priv.no
 (148-252-117.52.3p.ntebredband.no [148.252.117.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: hakon.alstadheim@ntebb.no)
 by asav22.altibox.net (Postfix) with ESMTPSA id 9C15020087
 for <xen-devel@lists.xenproject.org>; Thu, 14 Dec 2017 22:31:47 +0100 (CET)
Received: from smtps.alstadheim.priv.no (localhost [127.0.0.1])
 by postfix-relay.alstadheim.priv.no (Postfix) with ESMTP id DFC15C1313C5
 for <xen-devel@lists.xenproject.org>; Thu, 14 Dec 2017 22:31:45 +0100 (CET)
Received: from [192.168.2.201] (unknown [192.168.2.201])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: hakon)
 by smtps.alstadheim.priv.no (Postfix) with ESMTPSA id B5A8817EFA9
 for <xen-devel@lists.xenproject.org>; Thu, 14 Dec 2017 22:31:45 +0100 (CET)
In-Reply-To: <59839a62-9cc4-b3a1-d765-bc372378d976@Oracle.COM>
Content-Language: en-US
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

CgpEZW4gMTQuIGRlcy4gMjAxNyAyMToyMiwgc2tyZXYgR292aW5kYSBUYXR0aToKPiAKPj4+PiBJ
biB3aGljaCBjYXNlLCB4bCBuZWVkcyB0byBiZSBiYWNrd2FyZHMtY29tcGF0aWJsZSB3aXRoIGtl
cm5lbHMgdGhhdAo+Pj4+IGRvbid0IGhhdmUgeW91ciBuZXcgZmVhdHVyZTogaXQgd2lsbCBoYXZl
IHRvIGNoZWNrIGZvciAlcy9yZXNldCwgYW5kCj4+Pj4gaWYgaXQncyBub3QgdGhlcmUsIHRoZW4g
dHJ5ICUvZG9fZmxyLgo+Pj4gSSB0aGluayB0aGlzIGZpeCB3YXMgcGxhbm5lZCBtb3JlIHRoYW4g
YSB5ZWFyIGJhY2sgYW5kIGV2ZW4gd2UgcHVzaGVkCj4+PiBsaWJ4bAo+Pj4gZml4Cj4+PiAoImRv
X2ZsciIgU3lzRlNhdHRyaWJ1dGUpIGJ1dCBsaW51eCBrZXJuZWwgZml4IHdhcyBub3QgaW50ZWdy
YXRlZCBmb3IKPj4+IHNvbWUKPj4+IHJlYXNvbi4KPj4+IE5vdywgd2UgYXJlIHJldmlzaXRpbmdi
b3RoIGxpbnV4IGtlcm5lbCBhbmQgbGlieGwgY2hhbmdlcy4gSW4KPj4+IG90aGVyLXdvcmRzLAo+
Pj4gImRvX2ZsciIgY2hhbmdlIGlzIG5vdCBiZWluZyB1c2VkdG9kYXkgc2luY2Ugd2UgZG9uJ3Qg
aGF2ZSByZXF1aXJlZCBjb2RlCj4+PiBjaGFuZ2VzCj4+PiBpbiB0aGUgbGludXgga2VybmVsLgo+
PiBBcmUgeW91IHNheWluZyBkb19mbHIgZG9lc24ndCBleGlzdCBhdCBhbGwgaW4gYW55IHZlcnNp
b24gb2YgTGludXgsCj4+IGFuZCBhcyBzdWNoIHRoZSBsaW5lIHlvdSdyZSByZW1vdmluZyBpcyBj
dXJyZW50bHkgcG9pbnRsZXNzPwo+IFllcywgdGhhdCdzIGNvcnJlY3QuIEluIG90aGVyLXdvcmRz
LCBpdCB3aWxsIG5vdCBicmVhayBhbnkgZXhpc3RpbmcgY29kZQo+IG9yIGZ1bmN0aW9uYWxpdHku
CgpFeGNlcHQgZm9yIHBlb3BsZSwgbGlrZSBtZSwgcnVubmluZyB1bm9mZmljaWFsIHBhdGNoZXMg
dG8gbGludXguIEl0CnNob3VsZCBiZSBPSyB0byBhc3N1bWUgdGhleSBhcmUgd2F0Y2hpbmcgdGhp
cyB0aHJlYWQuCgo+IAo+IENoZWVycwo+IEdPVklOREEKPiAKPiBfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IFhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKPiBY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKPiBodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVsCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
