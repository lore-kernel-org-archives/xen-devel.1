Return-Path: <SRS0=rPNm=MB=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 638C3C07E99
	for <xen-devel@archiver.kernel.org>; Fri,  9 Jul 2021 11:38:10 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1AE63613BF
	for <xen-devel@archiver.kernel.org>; Fri,  9 Jul 2021 11:38:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1AE63613BF
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=kojedz.in
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.153584.283744 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1opS-00013z-OC; Fri, 09 Jul 2021 11:37:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 153584.283744; Fri, 09 Jul 2021 11:37:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1opS-00013s-LN; Fri, 09 Jul 2021 11:37:58 +0000
Received: by outflank-mailman (input) for mailman id 153584;
 Fri, 09 Jul 2021 11:37:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WfOa=MB=kojedz.in=richard@srs-us1.protection.inumbo.net>)
 id 1m1opR-00013m-5O
 for xen-devel@lists.xenproject.org; Fri, 09 Jul 2021 11:37:57 +0000
Received: from pi.kojedz.in (unknown [2a01:be00:10:201:0:80:0:1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 390c37d2-c40f-4c5c-a2a2-854c795d10c7;
 Fri, 09 Jul 2021 11:37:56 +0000 (UTC)
Received: from webmail.srv.kojedz.in (pi.kojedz.in
 [IPv6:2a01:be00:10:201:0:80:0:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: richard@kojedz.in)
 by pi.kojedz.in (Postfix) with ESMTPSA id 48674C82B;
 Fri,  9 Jul 2021 13:37:54 +0200 (CEST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 390c37d2-c40f-4c5c-a2a2-854c795d10c7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kojedz.in; s=mail;
	t=1625830674; bh=9TDpvRUgQHV5MexC+f/YDj+szEufaxX9H8TuNjhJiEQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=gd1WDA1KJho1YBoeqw/m++cdtrkpgjOmTrbNOhn0LGJe1Oa38ynnSf4M+dnbwh5qS
	 UVBWDlaneRbbTGPNVy2VM6QTkAET9kALwTZx1A83qr/qWPJWEDfZhpJT25RnKRGRCs
	 r53+JIpdBbK+HyGOXGcylJDVd0nXIxDgBx7K1FbfeEFMt/lmnp958ObxrtF6W/W9fY
	 3rGn/PmIHOpC1hwQIqZkAX0cpU5UJRnu3yERuXUnhZVvpXMWHGgQ2ICCLRPSMCGRUw
	 qtrq/RMGNhstqypAXz+3SNihwxx/HXXFmZQAcX7TP7zHvnpdaq2PW/j1Hb0a/6wPRf
	 vfK0yzpS7mAyMFANsUpwcqNSlyWsNCd2jdzsemNzJkOJFepOorNqRqy7yvZBTCOyQB
	 kSMJPUhaIPv9GXKuKwBwqO84G36hoquP8PCEXW+T2gcQ5UO2t3wf2E7iT3L0fsmi3/
	 1zanrxO25NssppzGwyW9EmciQabEScIrwDXphqlYRtw/2AqhEy10wj9PqeYng59Epo
	 JEnp9drj2pmU0yYZz/6vFXGVBuw8YNgga3QWnY3HNzkMUS9ubm8XLXtcyK5gv+wYNo
	 pUTrzDGT2TmMxKeIYCI+vt3hcTx+xA0ZQRDRqDrR7miun8f8KWkUgagZIgyD7Lg8/P
	 xoyV7b9B3VFufsBhMmlrO/tQ=
MIME-Version: 1.0
Date: Fri, 09 Jul 2021 13:37:54 +0200
From: Richard Kojedzinszky <richard@kojedz.in>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: fix vbd rd_sects stat
In-Reply-To: <4cb7a1b3-00ce-5866-12b5-a7df8f7a878a@citrix.com>
References: <585c34fd96c6e22847333d9d18843c0f@kojedz.in>
 <522642c6-6ad9-28d4-469e-53583441287e@citrix.com>
 <61970531-A990-44B4-8614-320141E7C2D7@kojedz.in>
 <4cb7a1b3-00ce-5866-12b5-a7df8f7a878a@citrix.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <5fa286cab6fa4612547862040729a9ab@kojedz.in>
X-Sender: richard@kojedz.in
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

Dear Andrew,

Many thanks.

Meanwhile I would like to promote our xenstat-exporter, which we use for 
monitoring our vps instances.

https://github.com/euronetzrt/xenstat-exporter

We've spotted the bug during browsing the metrics.

Regards,
Richard

2021-07-09 13:30 időpontban Andrew Cooper ezt írta:
> On 09/07/2021 10:32, Richard Kojedzinszky wrote:
>> Then please add signed-by headers. :)
> 
> Ok.   I have fixed up and committed the patch.
> 
> https://xenbits.xen.org/gitweb/?p=xen.git;a=commitdiff;h=89d57f291e37b4769ab26db919eba46548f2e13e
> 
> This will want queueing for backporting
> 
> ~Andrew

