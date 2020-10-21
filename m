Return-Path: <SRS0=90EN=D4=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AE83C56202
	for <xen-devel@archiver.kernel.org>; Wed, 21 Oct 2020 12:05:49 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 981A42237B
	for <xen-devel@archiver.kernel.org>; Wed, 21 Oct 2020 12:05:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="Km/3LS+6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 981A42237B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.10055.26476 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVCrm-0007ap-Q4; Wed, 21 Oct 2020 12:05:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10055.26476; Wed, 21 Oct 2020 12:05:18 +0000
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
	id 1kVCrm-0007ai-L8; Wed, 21 Oct 2020 12:05:18 +0000
Received: by outflank-mailman (input) for mailman id 10055;
 Wed, 21 Oct 2020 12:05:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JBpP=D4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kVCrk-0007ad-Jp
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2020 12:05:16 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4ec8a28d-5e38-4130-8606-d6200dfeea44;
 Wed, 21 Oct 2020 12:05:15 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 82DD9AFB7;
 Wed, 21 Oct 2020 12:05:14 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=JBpP=D4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kVCrk-0007ad-Jp
	for xen-devel@lists.xenproject.org; Wed, 21 Oct 2020 12:05:16 +0000
X-Inumbo-ID: 4ec8a28d-5e38-4130-8606-d6200dfeea44
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 4ec8a28d-5e38-4130-8606-d6200dfeea44;
	Wed, 21 Oct 2020 12:05:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603281914;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7VOUx0DkW26czOinrAAOSNh8nOmYfjZLZ1vWW+O55sE=;
	b=Km/3LS+6FmllUUOLRK18on/0dx+PQweec3Ocn58jwjjF8CznUozt7/37pxiLKkOozCBcMV
	B0ZkC692a1cTJHPOTLDpbRoJL9L+oWFrDBSUK5A1cHTJXcHRkY48mDEYo5V/Ux1uW1dnwN
	3V5PSnOjH0TEu8AMO/TSFkBp5pUa+wE=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 82DD9AFB7;
	Wed, 21 Oct 2020 12:05:14 +0000 (UTC)
Subject: Re: [PATCH 0/2] tools/libs: fix build rules to correctly deal with
 multiple public headers
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <2c9a0407-1bd1-6898-d1e3-9be4c869684b@suse.com>
Message-ID: <d0e9f859-5ac5-d683-e7eb-535184a561b0@suse.com>
Date: Wed, 21 Oct 2020 14:05:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <2c9a0407-1bd1-6898-d1e3-9be4c869684b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 19.10.2020 09:19, Jan Beulich wrote:
> 1: fix header symlinking rule
> 2: fix uninstall rule for header files

Actually I've noticed these issues were introduced relatively
recently only, in particular after 4.14. I've added

Fixes: bc44e2fb3199 ("tools: add a copy of library headers in tools/include")

to both of them, albeit with the above they won't need even
just considering of backport.

Jan

