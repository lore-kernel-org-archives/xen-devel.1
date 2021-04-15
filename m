Return-Path: <SRS0=iyTO=JM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9ECA4C433ED
	for <xen-devel@archiver.kernel.org>; Thu, 15 Apr 2021 11:30:04 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B6A06137D
	for <xen-devel@archiver.kernel.org>; Thu, 15 Apr 2021 11:30:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B6A06137D
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.111052.212263 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lX0C0-00047M-7I; Thu, 15 Apr 2021 11:29:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 111052.212263; Thu, 15 Apr 2021 11:29:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lX0C0-00047F-49; Thu, 15 Apr 2021 11:29:52 +0000
Received: by outflank-mailman (input) for mailman id 111052;
 Thu, 15 Apr 2021 11:29:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x7n8=JM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lX0By-00047A-Ny
 for xen-devel@lists.xenproject.org; Thu, 15 Apr 2021 11:29:50 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 19b47889-7762-4300-bab7-f0106133c823;
 Thu, 15 Apr 2021 11:29:49 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B960CAF21;
 Thu, 15 Apr 2021 11:29:48 +0000 (UTC)
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
X-Inumbo-ID: 19b47889-7762-4300-bab7-f0106133c823
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1618486188; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aY1fFPLe38xV6UqK1llnCTUoM75VF5m0en74SE/ft70=;
	b=Wdi5W7Wm9lxTmMZfAIVANVFpNglpgkePIeoi0XN406TiQd5e7udjZav73kX9cDh+rDGd/v
	4f754izy+A0m5de2C46hzj2Q3EL0Z102Oh3dGHOl4kyTGW0tJGXkQypALEn/rZuN0LZDF6
	GpwcU9FaI/JN+10SMleKipOzPei6zvI=
Subject: Re: [PATCH] x86/vPMU: Extend vPMU support to version 5
From: Jan Beulich <jbeulich@suse.com>
To: Igor Druzhinin <igor.druzhinin@citrix.com>, andrew.cooper3@citrix.com,
 roger.pau@citrix.com, kevin.tian@intel.com, jun.nakajima@intel.com
Cc: wl@xen.org, xen-devel@lists.xenproject.org
References: <1618334701-8263-1-git-send-email-igor.druzhinin@citrix.com>
 <01a59c84-c9ed-f9ca-1316-c9fc36ecde30@suse.com>
Message-ID: <51316c95-f65c-565c-b8a9-3af52a4852e4@suse.com>
Date: Thu, 15 Apr 2021 13:29:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <01a59c84-c9ed-f9ca-1316-c9fc36ecde30@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 14.04.2021 14:28, Jan Beulich wrote:
> On 13.04.2021 19:25, Igor Druzhinin wrote:
>> Version 5 is backwards compatible with version 3. This allows to enable
>> vPMU on Ice Lake CPUs.
>>
>> Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>
> 
> Acked-by: Jan Beulich <jbeulich@suse.com>

Actually I've just noticed that I can't ack this, as the source file
is deemed part of VT-x. I wonder whether we should drop this, as it's
been quite a while since vPMU code was made HVM-independent.

Jan

