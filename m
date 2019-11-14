Return-Path: <SRS0=jwRU=ZG=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05EE1C432C3
	for <xen-devel@archiver.kernel.org>; Thu, 14 Nov 2019 07:52:51 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CFF3820718
	for <xen-devel@archiver.kernel.org>; Thu, 14 Nov 2019 07:52:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CFF3820718
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iV9vS-0002hI-Pl; Thu, 14 Nov 2019 07:52:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=RDJJ=ZG=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iV9vR-0002hD-AA
 for xen-devel@lists.xenproject.org; Thu, 14 Nov 2019 07:52:21 +0000
X-Inumbo-ID: aec72925-06b3-11ea-a246-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id aec72925-06b3-11ea-a246-12813bfff9fa;
 Thu, 14 Nov 2019 07:52:19 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B0958AC12;
 Thu, 14 Nov 2019 07:52:18 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20191113162229.1140-1-jgross@suse.com>
 <747354cb-cd91-200d-d271-9cb2f2fb56ac@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <b51b1dda-1cd7-ae97-50e3-b03610d99f4e@suse.com>
Date: Thu, 14 Nov 2019 08:52:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <747354cb-cd91-200d-d271-9cb2f2fb56ac@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen: make debugger support configurable
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMuMTEuMTkgMTg6MjYsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gT24gMTMvMTEvMjAxOSAx
NjoyMiwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4gRGVidWdnZXIgc3VwcG9ydCBpbiB0aGUgaHlw
ZXJ2aXNvciBpcyByYXJlbHkgdXNlZCBhbmQgaXQgaXMgb3BlbmluZyBhCj4+IHdheSBmb3IgZG9t
MCB0byBtb2RpZnkgdGhlIHJ1bm5pbmcgaHlwZXJ2aXNvciBieSB2ZXJ5IGVhc3kgbWVhbnMuCj4+
Cj4+IEFkZCBhIEtjb25maWcgb3B0aW9uIHRvIGNvbnRyb2wgc3VwcG9ydCBvZiBnZGJzeC4gRGVm
YXVsdCBpcyBvZmYuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0Bz
dXNlLmNvbT4KPj4gLS0tCj4+ICAgeGVuL0tjb25maWcuZGVidWcgICAgICAgICAgICAgIHwgIDQg
KysrKwo+PiAgIHhlbi9hcmNoL3g4Ni9LY29uZmlnICAgICAgICAgICB8ICAxIC0KPj4gICB4ZW4v
YXJjaC94ODYvZG9tY3RsLmMgICAgICAgICAgfCAgNCArKysrCj4+ICAgeGVuL2NvbW1vbi9LY29u
ZmlnICAgICAgICAgICAgIHwgIDMgLS0tCj4+ICAgeGVuL2NvbW1vbi9kb21haW4uYyAgICAgICAg
ICAgIHwgIDIgKy0KPj4gICB4ZW4vaW5jbHVkZS9hc20teDg2L2RlYnVnZ2VyLmggfCAzMCArKysr
KysrKysrKysrKysrKystLS0tLS0tLS0tLS0KPj4gICB4ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaCAg
ICAgICAgfCAgNCArKysrCj4+ICAgNyBmaWxlcyBjaGFuZ2VkLCAzMSBpbnNlcnRpb25zKCspLCAx
NyBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL3hlbi9LY29uZmlnLmRlYnVnIGIveGVu
L0tjb25maWcuZGVidWcKPj4gaW5kZXggMjI1NzNlNzRkYi4uODRhNmUxYjhlYiAxMDA2NDQKPj4g
LS0tIGEveGVuL0tjb25maWcuZGVidWcKPj4gKysrIGIveGVuL0tjb25maWcuZGVidWcKPj4gQEAg
LTEzLDkgKzEzLDEzIEBAIGNvbmZpZyBERUJVRwo+PiAgIAo+PiAgIGlmIERFQlVHIHx8IEVYUEVS
VCA9ICJ5Igo+PiAgIAo+PiArY29uZmlnIEdEQlNYCj4+ICsJYm9vbAo+PiArCj4+ICAgY29uZmln
IENSQVNIX0RFQlVHCj4+ICAgCWJvb2wgIkNyYXNoIERlYnVnZ2luZyBTdXBwb3J0Igo+PiAgIAlk
ZXBlbmRzIG9uIFg4Ngo+PiArCXNlbGVjdCBHREJTWAo+PiAgIAktLS1oZWxwLS0tCj4+ICAgCSAg
SWYgeW91IHdhbnQgdG8gYXR0YWNoIGdkYiB0byBYZW4gdG8gZGVidWcgWGVuIGlmIGl0IGNyYXNo
ZXMKPj4gICAJICB0aGVuIHNheSBZLgo+IAo+IENSQVNIX0RFQlVHIGFuZCBHREJTWCBhcmUgdW5y
ZWxhdGVkLgo+IAo+IFRoZSBmb3JtZXIgaXMgZ2Ric3R1YiBvdmVyIHNlcmlhbCBmb3IgWGVuIGl0
c2VsZiAod2hpY2ggSSd2ZSBuZXZlciBzZWVuCj4gdXNlZCwgYW5kIHRoZXJlZm9yZSBkb3VidCBm
dW5jdGlvbnMpLCB3aGlsZSB0aGUgbGF0dGVyIGlzIGEgc2V0IG9mIGRvbTAKPiBoeXBlcmNhbGxz
IHVzZWQgYnkgdGhlIGdkYnN4IHV0aWxpdHkuCj4gCj4gSSdtIGhhcHB5IHRvIG1ha2UgQ09ORklH
X0dEQlNYIG1vcmUgdXNlZnVsIHRoYW4gaXQgY3VycmVudGx5IGlzLCBidXQgSQo+IGRvbid0IHRo
aW5rIHRoZSB0d28gb3B0aW9ucyB3YW50IGNvbmZsYXRpbmcuCgpBaCwgb2theS4KCldpbGwgc2Vu
ZCBWMiB3aXRoIDIgcGF0Y2hlczogb25lIGZvciBwdXR0aW5nIG1vcmUgY29kZSB1bmRlcgpDT05G
SUdfQ1JBU0hfREVCVUcgYW5kIG9uZSBmb3IgaW50cm9kdWNpbmcgQ09ORklHX0dEQlNYLgoKCkp1
ZXJnZW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
