Return-Path: <SRS0=i2DS=CC=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AD16C433DF
	for <xen-devel@archiver.kernel.org>; Mon, 24 Aug 2020 13:01:32 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D09DF2074D
	for <xen-devel@archiver.kernel.org>; Mon, 24 Aug 2020 13:01:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="TpgkjbB4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D09DF2074D
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAC64-0008Ma-Fy; Mon, 24 Aug 2020 13:01:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N/Qh=CC=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kAC63-0008MQ-3y
 for xen-devel@lists.xenproject.org; Mon, 24 Aug 2020 13:01:11 +0000
X-Inumbo-ID: bf92c072-8434-4ea2-b0a5-73d34a3059a8
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bf92c072-8434-4ea2-b0a5-73d34a3059a8;
 Mon, 24 Aug 2020 13:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1598274070;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=8jOZ4iAYrH/QW+ppF9gwhfU7Vi3NFRdoOeSrJDtPHgo=;
 b=TpgkjbB4PwS/0uk2OMeE+MUvCMgT0CFy/hdVOss3F74Qz6Kus3o7R1B0
 lJ9jBwhhb8rQJCMOPdIjlfALKM9Y7BacECmJ9wSbk+mKOiM1MXItcxTqs
 Fgt/zHieYJyiXsY4H5rLsXfbLTwnNsriv9/62DSM+qUWa+wXN6ZgOhlza E=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 5ErYUjvnpShH7GHecBO+Rxk80uGHU+smAC9d+tCeda8Yz/bzX4ZunTx9YkAgtC71UJjq0upii3
 fd18zwdeHvnlVBNiNaeU8DNDZe/l8HTQHx0FVzu1Y71dGEGbQe3xBCt4pwoszjwRRTzQiGrQqa
 F/Iq/joLRi9HiJ9F4ozFtgqikRz0+C1zY/gRIDG8ussVlMOXwhciBWfqjuATX0Prsc6P7UtdKx
 G3iVwewGOnYQWJSNnwQu8xZKnMNDYLAK9hKe4tvRTihSiRDa/CihCJoG9qpVqW4Klb+9555zNT
 RGQ=
X-SBRS: 2.7
X-MesageID: 25292792
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,348,1592884800"; d="scan'208";a="25292792"
Subject: Re: [PATCH v2 3/5] x86: don't override INVALID_M2P_ENTRY with
 SHARED_M2P_ENTRY
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <5d456607-b36b-9802-1021-2e6d01d7f158@suse.com>
 <7176ab91-d7c8-ccb0-cfa5-724c0687b454@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <cf64e65c-9de9-8626-7890-152b546c0dda@citrix.com>
Date: Mon, 24 Aug 2020 14:00:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <7176ab91-d7c8-ccb0-cfa5-724c0687b454@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 24/08/2020 13:34, Jan Beulich wrote:
> While in most cases code ahead of the invocation of set_gpfn_from_mfn()
> deals with shared pages, at least in set_typed_p2m_entry() I can't spot
> such handling (it's entirely possible there's code missing there). Let's
> try to play safe and add an extra check.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

I agree that this is an improvement.

Therefore, tentatively Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

However, I don't think it is legitimate for set_gpfn_from_mfn() to be
overriding anything.

IMO, we should be asserting something like (pfn == SHARED_M2P_ENTRY) ==
(d == dom_cow).

Any code not passing this properly is almost certainly broken anyway,
and fixing up behind its back like this doesn't feel like a clever idea
(in debug builds at least).

~Andrew

