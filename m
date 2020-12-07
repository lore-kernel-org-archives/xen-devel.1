Return-Path: <SRS0=Mf7K=FL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9ABBBC4361B
	for <xen-devel@archiver.kernel.org>; Mon,  7 Dec 2020 10:59:04 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4645520809
	for <xen-devel@archiver.kernel.org>; Mon,  7 Dec 2020 10:59:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4645520809
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.46233.82032 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmEEJ-0002SG-5S; Mon, 07 Dec 2020 10:58:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 46233.82032; Mon, 07 Dec 2020 10:58:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmEEJ-0002S9-2G; Mon, 07 Dec 2020 10:58:55 +0000
Received: by outflank-mailman (input) for mailman id 46233;
 Mon, 07 Dec 2020 10:58:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0970=FL=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kmEEH-0002S4-NX
 for xen-devel@lists.xenproject.org; Mon, 07 Dec 2020 10:58:53 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d75af5f2-c1eb-4d77-9e7b-c62ae993d911;
 Mon, 07 Dec 2020 10:58:53 +0000 (UTC)
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
X-Inumbo-ID: d75af5f2-c1eb-4d77-9e7b-c62ae993d911
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1607338733;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=WRaWRjxhCLGqFTOq2DkYisp0CeRSpSlrLti/H4PP4tA=;
  b=QhXqnPhnwuQjeyZT7ZpbNKZCnPTtphGS1ekfcOFdacHo/vFNJQWdEvPQ
   jdZ9EnihM01zXSGOBICR8UKn22AmPxgpZFmTb3nUMz6dQaCJR6lAPBB11
   9ycbFSuyxmaEGdYD1c1U4xzXCLxoAx5U9nI6YG+nBVZ4/zmDRpbnQScvq
   w=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: NpLQ5EvuuHFOdkTesvWLne2urWZLDAlwbjNi8FY8Jmea4vYi9fhBoja92MISrjbqF+KuhLYiqk
 37O3aEPV9Cds1LlfWjKPA8gHcHpzxIqYYX5LLBz+dC8Jlkm/xQY0a4W+4b7Zk0aMGBDVX1FDfT
 Uq8Mbl9oHbjq/ND/V0U+WzuD90dufDkhVhekfN5xpSxpfm9VSyjwuRSIZanUrME6GPl8zrNXUq
 65M/TB2klvVcOlGPFzJ1QpKmXLJocdDHgM50PlyzVQzV6HknFsCKx1tf/KUJnmDWK6T4DvvLuH
 4nI=
X-SBRS: 5.1
X-MesageID: 33850551
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,399,1599537600"; 
   d="scan'208";a="33850551"
Subject: Re: [PATCH] x86/vIO-APIC: make use of xmalloc_flex_struct()
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>
References: <a5a2e6e9-7bfa-75e8-7890-5d102b09835f@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <51bc3c96-d45b-359d-2e30-f0254ca6d229@citrix.com>
Date: Mon, 7 Dec 2020 10:58:47 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <a5a2e6e9-7bfa-75e8-7890-5d102b09835f@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL04.citrite.net (10.13.108.177)

On 07/12/2020 10:49, Jan Beulich wrote:
> ... instead of effectively open-coding it in a type-unsafe way. Drop
> hvm_vioapic_size() altogether, folding the other use in a memset()
> invocation into the subsequent loop.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

