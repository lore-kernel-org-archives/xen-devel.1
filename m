Return-Path: <SRS0=G2aE=2Y=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59DD9C2D0C2
	for <xen-devel@archiver.kernel.org>; Fri,  3 Jan 2020 11:10:46 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C506206DB
	for <xen-devel@archiver.kernel.org>; Fri,  3 Jan 2020 11:10:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C506206DB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1inKqW-0002Bq-W5; Fri, 03 Jan 2020 11:10:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Pr65=2Y=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1inKqV-0002Bj-Do
 for xen-devel@lists.xenproject.org; Fri, 03 Jan 2020 11:10:23 +0000
X-Inumbo-ID: a28d34c2-2e19-11ea-a44b-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a28d34c2-2e19-11ea-a44b-12813bfff9fa;
 Fri, 03 Jan 2020 11:10:22 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id EB5EBB119;
 Fri,  3 Jan 2020 11:10:21 +0000 (UTC)
To: Roman Shaposhnik <roman@zededa.com>
References: <CAMmSBy9x9mjae1tGBS4-BiUTnB5S=2=cHoXFiPku3Gffv7a=6g@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5841995c-dda3-09fb-4d73-bb23fa63113e@suse.com>
Date: Fri, 3 Jan 2020 12:11:05 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <CAMmSBy9x9mjae1tGBS4-BiUTnB5S=2=cHoXFiPku3Gffv7a=6g@mail.gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] Where's Xen VGA console kbd driver?
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
Cc: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzEuMTIuMjAxOSAyMzoxNywgUm9tYW4gU2hhcG9zaG5payB3cm90ZToKPiBoZXJlJ3MgYSBz
aWxseSBxdWVzdGlvbjogd2hlbmV2ZXIgWGVuIGlzIHByb3ZpZGVkIHdpdGggYSBWR0EgY29uc29s
ZSwKPiB3aGVyZSdzIHRoZSBrZXlib2FyZCBkcml2ZXIgY29taW5nIGZyb20/IFF1aWNrIHRvIG15
IHN1cnByaXNlLCBteQo+IGNhc3VhbCBpbnNwZWN0aW9uIG9mIHRoZSBkcml2ZXJzLyBmb2xkZXIg
ZGlkbid0IHJldmVhbCBtdWNoLgoKSG93IGRvICJWR0EgY29uc29sZSIgYW5kICJrZXlib2FyZCBk
cml2ZXIiIG1hdGNoIHVwPyBUaGUgZm9ybWVyCmlzIGFuIG91dHB1dCBkZXZpY2U7IGluIFhlbiB0
aGVyZSBzaW1wbHkgaXMgbm8gaW5wdXQgY291bnRlcnBhcnQuCklmIHlvdSBuZWVkIG9uZSB3aXRo
IGJvdGggaW5wdXQgYW5kIG91dHB1dCwgeW91J2xsIG5lZWQgdG8gbWFrZQp1c2Ugb2YgYSBzZXJp
YWwgY29uc29sZSwgbm90IHRoZSBWR0Egb25lLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
