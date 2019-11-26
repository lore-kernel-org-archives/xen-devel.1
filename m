Return-Path: <SRS0=lwom=ZS=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 443D3C432C0
	for <xen-devel@archiver.kernel.org>; Tue, 26 Nov 2019 08:32:10 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 21837206BF
	for <xen-devel@archiver.kernel.org>; Tue, 26 Nov 2019 08:32:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 21837206BF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZWGN-0007dL-BR; Tue, 26 Nov 2019 08:31:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=EMZS=ZS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iZWGM-0007dE-0a
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2019 08:31:58 +0000
X-Inumbo-ID: 34c41556-1027-11ea-a39c-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 34c41556-1027-11ea-a39c-12813bfff9fa;
 Tue, 26 Nov 2019 08:31:56 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 0E6B9B358;
 Tue, 26 Nov 2019 08:31:56 +0000 (UTC)
To: Roman Shaposhnik <roman@zededa.com>
References: <0ba2bc19-2388-5fdc-43bd-3ac39497291c@suse.com>
 <CAMmSBy9Ti3nCt2EhT6XOcrBLWabpPqQFHA1G-Fc4N3gRg1qPUg@mail.gmail.com>
 <91d6b37f-6f83-183d-6b1e-297c0381af75@citrix.com>
 <CAMmSBy-Pr23H1U00S5rJWP205FSkx4HX-GiSkKygyopwf3FD9w@mail.gmail.com>
 <20191125004706.GB2012@mail-itl>
 <CAMmSBy9gkVR-ua9=kVn9rNSb2VnvvtzaLL=ZM-GXxCdtRGRtvA@mail.gmail.com>
 <20191126035517.GT5763@mail-itl>
 <CAMmSBy8yawo0Oc0Ba90Cox7jb+vNoQfMqA1Uqap2XGsL-x8ONw@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <954a7a27-88f9-8c17-6df6-79ff144b3c96@suse.com>
Date: Tue, 26 Nov 2019 09:32:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <CAMmSBy8yawo0Oc0Ba90Cox7jb+vNoQfMqA1Uqap2XGsL-x8ONw@mail.gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] UEFI support on Dell boxes
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjYuMTEuMjAxOSAwODowMiwgUm9tYW4gU2hhcG9zaG5payB3cm90ZToKPiBPbiBNb24sIE5v
diAyNSwgMjAxOSBhdCA3OjU1IFBNIE1hcmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNraQo+IDxtYXJt
YXJla0BpbnZpc2libGV0aGluZ3NsYWIuY29tPiB3cm90ZToKPj4gT24gTW9uLCBOb3YgMjUsIDIw
MTkgYXQgMDc6NDQ6MDNQTSAtMDgwMCwgUm9tYW4gU2hhcG9zaG5payB3cm90ZToKPj4+IChYRU4p
ICAwMDAwMGZmOTAwMDAwLTAwMDAwZmZmZmZmZmYgdHlwZT0xMSBhdHRyPTgwMDAwMDAwMDAwMDAw
MDAKPj4+IChYRU4pIFVua25vd24gY2FjaGFiaWxpdHkgZm9yIE1GTnMgMHhmZjkwMC0weGZmZmZm
Cj4+Cj4+IFRoZSBmYXVsdGluZyBhZGRyZXNzIGlzIGluIHRoaXMgcmFuZ2UuIEFuZCBiZWNhdXNl
IG9mIHVua25vd24KPj4gY2FjaGFiaWxpdHksIGl0IGlzbid0IG1hcHBlZC4gVHJ5IGFkZGluZyAn
ZWZpPWF0dHI9dWMnIHRvIHRoZSBYZW4KPj4gY21kbGluZS4KPiAKPiBGZWVscyBsaWtlIHdlJ3Jl
IGdldHRpbmcgZXhhY3RseSB0aGUgc2FtZSBmYWlsdXJlLiBMb2cgYXR0YWNoZWQuCgpDbGVhcmx5
IHRoZSBvcHRpb24gaGFzbid0IGJlZW4gdGFraW5nIGVmZmVjdC4gQ291bGQgeW91IHBsZWFzZQpy
ZXRyeSB3aXRoIHRoaXMgZml4Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvYXJjaGl2ZXMv
aHRtbC94ZW4tZGV2ZWwvMjAxOS0xMS9tc2cwMTQ5NC5odG1sCmluIHBsYWNlPwoKSmFuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
