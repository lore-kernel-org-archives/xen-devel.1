Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEAE6C433F5
	for <xen-devel@archiver.kernel.org>; Wed, 15 Dec 2021 10:52:10 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.247326.426458 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxRss-000113-VX; Wed, 15 Dec 2021 10:51:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 247326.426458; Wed, 15 Dec 2021 10:51:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxRss-00010w-Sh; Wed, 15 Dec 2021 10:51:42 +0000
Received: by outflank-mailman (input) for mailman id 247326;
 Wed, 15 Dec 2021 10:51:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v6+1=RA=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1mxRsr-00010q-3J
 for xen-devel@lists.xenproject.org; Wed, 15 Dec 2021 10:51:41 +0000
Received: from sender3-of-o51.zoho.com (sender3-of-o51.zoho.com
 [136.143.184.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f9d9b8ec-5d94-11ec-85d3-df6b77346a89;
 Wed, 15 Dec 2021 11:51:38 +0100 (CET)
Received: from [10.10.1.128] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1639565493847551.7972671181299;
 Wed, 15 Dec 2021 02:51:33 -0800 (PST)
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
X-Inumbo-ID: f9d9b8ec-5d94-11ec-85d3-df6b77346a89
ARC-Seal: i=1; a=rsa-sha256; t=1639565495; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Aq6kNSN+rgVghSZPLKDWo+9+IP/vezblYyocWYagUJDnR3sAYPHws1M7vsOYJ7dxE6ajgXJchnlNCnbhX2DxNs/wZm174O8b6SpD7HaySr6J1VXfSRB2sKUZxPiZOQZN/RJkvOxtGl6x+P9AMoC7yCHX/VQiW8RJEzW1DiZq9qc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1639565495; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=Yb/PzMW1nL5/GwsT7rhPmBY+IyuRV/dbBMCsFjfLduY=; 
	b=eLAX4HzuVkQFmKv93T0RqKDV8W2NQU7SkVYd1hMQMWhlfYGHJTGQVCmpWaL7YqQcEBOXah3mbdpvuMFjZEwUHO3HuDKZdMErLPFGxxQw+5F+0AbCm6dsJyTJmcNFPtja8FLlMIzJim3ujWa/RUW2s9tJIBQhKl0nBkKGrbD3/TU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1639565495;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=Yb/PzMW1nL5/GwsT7rhPmBY+IyuRV/dbBMCsFjfLduY=;
	b=aZ5Pe358m/x4kZzhRlbviArkIzDGzPtGjfarFC4WBHIlkpfS9r4PsmwY5tE0bueW
	voqNVHQml4Hf1ci43H6IEUCex1rFqt6rvhiIK0GXP3xc0Yg8OLQ49RajcVZSQdzlZXJ
	/8yXvYiAEVtS+yWZTzRua3elrPILiUHdILBP25lc=
Subject: Re: [PATCH] x86/cpuid: Introduce dom0-cpuid command line option
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20211214211600.2751-1-andrew.cooper3@citrix.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Message-ID: <8cb4e5cb-5eb3-6967-91de-97c222645ecb@apertussolutions.com>
Date: Wed, 15 Dec 2021 05:51:06 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211214211600.2751-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 12/14/21 4:16 PM, Andrew Cooper wrote:
> Specifically, this lets the user opt in to non-default for dom0.
> 
> Split features[] out of parse_xen_cpuid(), giving it a lightly more
> appropraite name, so it can be shared with parse_xen_cpuid().
> 
> Collect all dom0 settings together in dom0_{en,dis}able_feat[], and apply it
> to dom0's policy when other tweaks are being made.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
> CC: Daniel Smith <dpsmith@apertussolutions.com>
> 
> RFC, because I think we've got a preexisting error with late hwdom here.  We
> really should not be cobbering a late hwdom's settings (which were provided in
> the usual way by the toolstack in dom0).
> 
> Furthermore, the distinction gets more murky in a hyperlaunch future where
> multiple domains may be constructed by Xen, and there is reason to expect that
> a full toolstack-like configuration is made available for them.

For hyperlaunch, perhaps Christohper and I should revisit the DTB to add 
a cpuid field/mask where CPU features can be masked out.

> One option might be to remove the special case from init_domain_cpuid_policy()
> and instead make a call into the cpuid code from create_dom0().  It would have
> to be placed between domain_create() and alloc_dom0_vcpu0() for dynamic sizing
> of the FPU block to work.  Thoughts?


v/r,
dps

