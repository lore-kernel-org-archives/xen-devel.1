Return-Path: <SRS0=7THE=S4=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92F79C43218
	for <xen-devel@archiver.kernel.org>; Fri, 26 Apr 2019 10:27:02 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6CEEA206BA
	for <xen-devel@archiver.kernel.org>; Fri, 26 Apr 2019 10:27:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6CEEA206BA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJy4A-0001NW-ED; Fri, 26 Apr 2019 10:26:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6UZT=S4=citrix.com=prvs=0129f9400=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hJy49-0001NP-3E
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2019 10:26:49 +0000
X-Inumbo-ID: ca70d674-680d-11e9-8d49-c71cd57e1f77
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ca70d674-680d-11e9-8d49-c71cd57e1f77;
 Fri, 26 Apr 2019 10:26:45 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,397,1549929600"; d="scan'208";a="84488117"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23746.56546.290749.650435@mariner.uk.xensource.com>
Date: Fri, 26 Apr 2019 11:26:42 +0100
To: osstest service owner <osstest-admin@xenproject.org>
In-Reply-To: <osstest-135301-mainreport@xen.org>
References: <osstest-135301-mainreport@xen.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [osstest test] 135301: regressions - FAIL
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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190426102642.cccRQpypaz65xT7-2yrUXSW99g5_5r81sX9-SAk3nFE@z>

b3NzdGVzdCBzZXJ2aWNlIG93bmVyIHdyaXRlcyAoIltvc3N0ZXN0IHRlc3RdIDEzNTMwMTogcmVn
cmVzc2lvbnMgLSBGQUlMIik6Cj4gZmxpZ2h0IDEzNTMwMSBvc3N0ZXN0IHJlYWwgW3JlYWxdCj4g
aHR0cDovL2xvZ3MudGVzdC1sYWIueGVucHJvamVjdC5vcmcvb3NzdGVzdC9sb2dzLzEzNTMwMS8K
PiAKPiBSZWdyZXNzaW9ucyA6LSgKPiAKPiBUZXN0cyB3aGljaCBkaWQgbm90IHN1Y2NlZWQgYW5k
IGFyZSBibG9ja2luZywKPiBpbmNsdWRpbmcgdGVzdHMgd2hpY2ggY291bGQgbm90IGJlIHJ1bjoK
PiAgdGVzdC1hcm02NC1hcm02NC1leGFtaW5lICAgIDExIGV4YW1pbmUtc2VyaWFsL2Jvb3Rsb2Fk
ZXIgZmFpbCBSRUdSLiB2cy4gMTM0ODI4CgpGb3JjZSBwdXNoZWQuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
