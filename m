Return-Path: <SRS0=exI2=BB=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D05FFC433E3
	for <xen-devel@archiver.kernel.org>; Wed, 22 Jul 2020 09:08:41 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F04C20717
	for <xen-devel@archiver.kernel.org>; Wed, 22 Jul 2020 09:08:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=xen.org header.i=@xen.org header.b="6D2J+hGt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9F04C20717
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jyAjg-0003PA-Ps; Wed, 22 Jul 2020 09:08:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=u0rb=BB=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jyAjf-0003P5-DQ
 for xen-devel@lists.xenproject.org; Wed, 22 Jul 2020 09:08:23 +0000
X-Inumbo-ID: e3f39d50-cbfa-11ea-a18b-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e3f39d50-cbfa-11ea-a18b-12813bfff9fa;
 Wed, 22 Jul 2020 09:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wX1Eu/u/kjAZ3efLZ2Y25RplLLxRiLVlINm0rbq4U98=; b=6D2J+hGtF1HieE1ujaUHTZTQKX
 0uqZCfxIEafhkFu/2+tPlCCIQh74oBBdRFhDZAKdYAKi9ZRrhEodcK0n5QuMZ8nQPdHF6MJXkCxUR
 PQwIjoJj5gT95SKVKt+68ABn3KlLeURHFXRUw6T4IMIKT1d9g4yuGxKJjIi+WonW2tiI=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jyAjS-0001t0-P2; Wed, 22 Jul 2020 09:08:10 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jyAjS-0001i7-E0; Wed, 22 Jul 2020 09:08:10 +0000
Subject: Re: [PATCH v2 04/11] x86/xen: add system core suspend and resume
 callbacks
To: Anchal Agarwal <anchalag@amazon.com>, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, hpa@zytor.com, x86@kernel.org,
 boris.ostrovsky@oracle.com, jgross@suse.com, linux-pm@vger.kernel.org,
 linux-mm@kvack.org, kamatam@amazon.com, sstabellini@kernel.org,
 konrad.wilk@oracle.com, roger.pau@citrix.com, axboe@kernel.dk,
 davem@davemloft.net, rjw@rjwysocki.net, len.brown@intel.com, pavel@ucw.cz,
 peterz@infradead.org, eduval@amazon.com, sblbir@amazon.com,
 xen-devel@lists.xenproject.org, vkuznets@redhat.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dwmw@amazon.co.uk, benh@kernel.crashing.org
References: <cover.1593665947.git.anchalag@amazon.com>
 <20200702182205.GA3531@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
From: Julien Grall <julien@xen.org>
Message-ID: <b8445e93-deed-1a28-cd3b-993d42c78251@xen.org>
Date: Wed, 22 Jul 2020 10:08:05 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200702182205.GA3531@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
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

Hi,

On 02/07/2020 19:22, Anchal Agarwal wrote:
> diff --git a/include/xen/xen-ops.h b/include/xen/xen-ops.h
> index 2521d6a306cd..9fa8a4082d68 100644
> --- a/include/xen/xen-ops.h
> +++ b/include/xen/xen-ops.h
> @@ -41,6 +41,8 @@ u64 xen_steal_clock(int cpu);
>   int xen_setup_shutdown_event(void);
>   
>   bool xen_is_xen_suspend(void);
> +void xen_setup_syscore_ops(void);

The function is only implemented and used by x86. So shouldn't this be 
declared in an x86 header?

Cheers,

-- 
Julien Grall

