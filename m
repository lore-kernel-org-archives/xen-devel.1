Return-Path: <SRS0=cl0r=IU=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D595C433C1
	for <xen-devel@archiver.kernel.org>; Mon, 22 Mar 2021 14:48:27 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF7726191C
	for <xen-devel@archiver.kernel.org>; Mon, 22 Mar 2021 14:48:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF7726191C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.100252.190910 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOLqZ-0000eU-Ha; Mon, 22 Mar 2021 14:47:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 100252.190910; Mon, 22 Mar 2021 14:47:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOLqZ-0000eN-ET; Mon, 22 Mar 2021 14:47:59 +0000
Received: by outflank-mailman (input) for mailman id 100252;
 Mon, 22 Mar 2021 14:47:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/O5u=IU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lOLqY-0000eI-8F
 for xen-devel@lists.xenproject.org; Mon, 22 Mar 2021 14:47:58 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8a287f36-3800-4acd-a284-7f67d9bfecd5;
 Mon, 22 Mar 2021 14:47:57 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4D0A3ACA8;
 Mon, 22 Mar 2021 14:47:56 +0000 (UTC)
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
X-Inumbo-ID: 8a287f36-3800-4acd-a284-7f67d9bfecd5
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1616424476; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Nq5tWpmWSEJC7niqzN3YI0POON8gQ/7JH/TmS0++xJA=;
	b=C5QiO6cnOFy9lZc9FKtDTwCogp3q8kuGl92YM9/5k3hcMlPhHRlbq/1gCm2BIIWX3piiXz
	isYknDz5OCci+1JNejF/HttMVkz7dpBaqBoI5xTMcfMHfuOOcMyZsVGgU7JgmDnZDjhYBh
	VmX+rbRFTERgWBfon+QCqnkK1e55ygM=
Subject: Re: [XEN PATCH for-4.15] libxl: Replace deprecated QMP command by
 "query-cpus-fast"
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210322141744.522041-1-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <03346623-23bb-78d6-b7f4-fa41ac88e782@suse.com>
Date: Mon, 22 Mar 2021 15:47:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210322141744.522041-1-anthony.perard@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 22.03.2021 15:17, Anthony PERARD wrote:
> We use the deprecated QMP command "query-cpus" which will be remove in
> the upcoming QEMU 6.0 release. There's a replacement which is
> "query-cpus-fast", and have been available since QEMU 2.12 (April
> 2018).

IOW the tool stack then isn't going to work anymore on a system with
a distro provided qemu just around 3 years old?

Jan

