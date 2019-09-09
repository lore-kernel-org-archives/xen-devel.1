Return-Path: <SRS0=Lk9n=XE=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EE88C4740A
	for <xen-devel@archiver.kernel.org>; Mon,  9 Sep 2019 11:45:39 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F18EE218AF
	for <xen-devel@archiver.kernel.org>; Mon,  9 Sep 2019 11:45:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F18EE218AF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7I6k-0002VY-QL; Mon, 09 Sep 2019 11:45:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=NFaf=XE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i7I6j-0002V7-6S
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2019 11:45:21 +0000
X-Inumbo-ID: 4bfb2922-d2f7-11e9-ac0a-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4bfb2922-d2f7-11e9-ac0a-12813bfff9fa;
 Mon, 09 Sep 2019 11:45:19 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 77B04AD29;
 Mon,  9 Sep 2019 11:45:18 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20190909104407.13666-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <42143b5c-bb3f-b5f1-a14e-eb717ae26575@suse.com>
Date: Mon, 9 Sep 2019 13:45:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190909104407.13666-1-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86: Misc trivial cleanup of bootsym_phys()
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Lukasz Hawrylko <lukasz.hawrylko@linux.intel.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMDkuMjAxOSAxMjo0NCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBJbiBzbXBib290LCB0
aGVyZSBpcyBubyBuZWVkIHRvIGFic3RyYWN0IHNldHVwX3RyYW1wb2xpbmUoKSBhd2F5LiAgRHJv
cCB0aGUKPiBkZWZpbmUgYW5kIHVzZSBib290c3ltX3BoeXMoKSBkaXJlY3RseS4KPiAKPiBJbiB0
Ym9vdCwgdGhlIDMgc2l6ZSBjYWxjdWxhdGlvbnMgYXJlIGludmFyaWFudCBvZiB0aGVpciBib290
c3ltX3BoeXMoKS9fX3BhKCkKPiB0cmFuc2Zvcm1hdGlvbnMsIGJ1dCB0aGUgY29tcGlsZXIgY2Fu
J3QgdGVsbCB0aGlzLiAgRHJvcCB0aGUgdHJhbmZvcm1hdGlvbnMsCj4gd2hpY2ggc2ltcGxpZmll
cyB0aGUgY29tcGlsZWQgZnVuY3Rpb24uCj4gCj4gICBhZGQvcmVtb3ZlOiAwLzAgZ3Jvdy9zaHJp
bms6IDAvMSB1cC9kb3duOiAwLy0xMzQgKC0xMzQpCj4gICBGdW5jdGlvbiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBvbGQgICAgIG5ldyAgIGRlbHRhCj4gICB0Ym9vdF9zaHV0
ZG93biAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA2MjAgICAgIDQ4NiAgICAtMTM0Cj4g
ICBUb3RhbDogQmVmb3JlPTMzMzcwNDIsIEFmdGVyPTMzMzY5MDgsIGNoZyAtMC4wMCUKPiAKPiBT
aWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoK
UmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
