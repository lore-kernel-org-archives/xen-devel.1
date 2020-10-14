Return-Path: <SRS0=XJfI=DV=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E288C433E7
	for <xen-devel@archiver.kernel.org>; Wed, 14 Oct 2020 16:10:22 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 92DA721D7F
	for <xen-devel@archiver.kernel.org>; Wed, 14 Oct 2020 16:10:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="NOaMDIt9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 92DA721D7F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.6847.17977 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSjLn-0003SF-V7; Wed, 14 Oct 2020 16:10:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6847.17977; Wed, 14 Oct 2020 16:10:03 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSjLn-0003Ra-RV; Wed, 14 Oct 2020 16:10:03 +0000
Received: by outflank-mailman (input) for mailman id 6847;
 Wed, 14 Oct 2020 16:10:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VoTD=DV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kSjLm-0003KW-HE
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 16:10:02 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 58938394-22fa-4520-8430-193962dc4735;
 Wed, 14 Oct 2020 16:10:00 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B83B2AB95;
 Wed, 14 Oct 2020 16:09:59 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=VoTD=DV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kSjLm-0003KW-HE
	for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 16:10:02 +0000
X-Inumbo-ID: 58938394-22fa-4520-8430-193962dc4735
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 58938394-22fa-4520-8430-193962dc4735;
	Wed, 14 Oct 2020 16:10:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1602691799;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=koDW1ZCC/VC0xA34aReXt7n81VfkMgCPkcz9C6Wbfcc=;
	b=NOaMDIt9D/DLqCTA0XTh4+slPUIp1K8yWz4RolDu0/jOKMsULQW88R6TZsbFmn+dYRHRZD
	3qSnVm7LWUwDMWr6rfjXK62sniMBy+k4ZSIrWgiFARjsd+j/ZVurukGaLC9WQAPYXZZZJd
	rF3eRDqcblxFsZMjRHfLkEnyx8y02KE=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id B83B2AB95;
	Wed, 14 Oct 2020 16:09:59 +0000 (UTC)
Subject: Re: [PATCH 2/2] x86/mwait-idle: Customize IceLake server support
To: Igor Druzhinin <igor.druzhinin@citrix.com>
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
 roger.pau@citrix.com, wl@xen.org, jun.nakajima@intel.com,
 kevin.tian@intel.com, Chen Yu <yu.c.chen@intel.com>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>
References: <1602558169-23140-1-git-send-email-igor.druzhinin@citrix.com>
 <1602558169-23140-2-git-send-email-igor.druzhinin@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <13a10ad7-fc10-d055-3780-6d1a2be13549@suse.com>
Date: Wed, 14 Oct 2020 18:09:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <1602558169-23140-2-git-send-email-igor.druzhinin@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 13.10.2020 05:02, Igor Druzhinin wrote:
> From: Chen Yu <yu.c.chen@intel.com>
> 
> On ICX platform, the C1E auto-promotion is enabled by default.
> As a result, the CPU might fall into C1E more offen than previous
> platforms. So disable C1E auto-promotion and expose C1E as a separate
> idle state.
> 
> Beside C1 and C1E, the exit latency of C6 was measured
> by a dedicated tool. However the exit latency(41us) exposed
> by _CST is much smaller than the one we measured(128us). This
> is probably due to the _CST uses the exit latency when woken
> up from PC0+C6, rather than PC6+C6 when C6 was measured. Choose
> the latter as we need the longest latency in theory.
> 
> Signed-off-by: Chen Yu <yu.c.chen@intel.com>
> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> [Linux commit a472ad2bcea479ba068880125d7273fc95c14b70]
> Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

