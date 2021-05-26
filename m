Return-Path: <SRS0=sPV+=KV=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42964C2B9F7
	for <xen-devel@archiver.kernel.org>; Wed, 26 May 2021 08:32:00 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 03B8D613CC
	for <xen-devel@archiver.kernel.org>; Wed, 26 May 2021 08:31:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 03B8D613CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.132388.246958 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lloxC-0006fi-AR; Wed, 26 May 2021 08:31:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 132388.246958; Wed, 26 May 2021 08:31:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lloxC-0006fb-6B; Wed, 26 May 2021 08:31:50 +0000
Received: by outflank-mailman (input) for mailman id 132388;
 Wed, 26 May 2021 08:31:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZGBu=KV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lloxB-0006fV-Ii
 for xen-devel@lists.xenproject.org; Wed, 26 May 2021 08:31:49 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7228b69c-c542-4673-93ab-84065a47279e;
 Wed, 26 May 2021 08:31:48 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 92AB7B122;
 Wed, 26 May 2021 08:31:47 +0000 (UTC)
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
X-Inumbo-ID: 7228b69c-c542-4673-93ab-84065a47279e
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1622017907; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c+k/yzqGlAGx0UctOAHow0WXoiiTdCLO+6Z7UG8i2ro=;
	b=erRdeD3VOz6+be+GDCqCdp+jSfHsaqPflBPKbpQXDaEojRPCZS4h4rNFFh5u/DdwLFThH5
	2gDsFPilL9ZTdjprn+6w4JAs7watJUHM2RlVZqgJAbwhiqFefsvDVnfJT++J7PDmlYWHkf
	AxF5qJIRCXSlpt7mU7sZMY6fd1MH+lc=
Subject: Re: [PATCH v2] firmware/shim: UNSUPPORTED=n
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Dario Faggioli <dfaggioli@suse.com>
References: <19695ffc-34d8-b682-b092-668f872d4e57@suse.com>
 <72b98382-34ba-6e9d-c90e-c913dfe66258@suse.com>
 <YK4Gbz0fat7DRY+o@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <50ca498e-a95f-f187-2fdb-70f5a1978bfe@suse.com>
Date: Wed, 26 May 2021 10:31:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <YK4Gbz0fat7DRY+o@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 26.05.2021 10:27, Roger Pau Monné wrote:> It's also confusing that the scheduler that gets set as the default> when shim exclusive is selected is not available to enable/disable:> > [*] Credit scheduler support (NEW)> [*] Credit2 scheduler support (NEW)>     Default Scheduler? (Null Scheduler)  --->
I don't view this as confusing - we want the null scheduler there in
this case, unconditionally. But yes, the prompt's condition could of
course also have "PV_SHIM || " added.

Jan

