Return-Path: <SRS0=2fhb=FG=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 794A0C64E7C
	for <xen-devel@archiver.kernel.org>; Wed,  2 Dec 2020 09:25:24 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF4BC20872
	for <xen-devel@archiver.kernel.org>; Wed,  2 Dec 2020 09:25:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF4BC20872
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.42554.76573 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkONt-00049D-F8; Wed, 02 Dec 2020 09:25:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 42554.76573; Wed, 02 Dec 2020 09:25:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkONt-000496-C8; Wed, 02 Dec 2020 09:25:13 +0000
Received: by outflank-mailman (input) for mailman id 42554;
 Wed, 02 Dec 2020 09:25:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UQyH=FG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kkONs-000491-4m
 for xen-devel@lists.xenproject.org; Wed, 02 Dec 2020 09:25:12 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3a9b3c6e-0669-4457-9192-3736b16c5fca;
 Wed, 02 Dec 2020 09:25:10 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7A262ADCA;
 Wed,  2 Dec 2020 09:25:09 +0000 (UTC)
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
X-Inumbo-ID: 3a9b3c6e-0669-4457-9192-3736b16c5fca
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606901109; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=efiM/dz3vSPkG+X5au0xOu1pZEnQd/QJBfpCmrN6BzY=;
	b=VaxlxOrVAC0IaoB+0wHID+d9tcWM6GnkB6ZnhEW8XKBcVOE0o7v5elU4YAj79pBegu8nyA
	d3YGavOQnKuOf9aQ6ukV1omZcjENX5EwusBfTqprxR8hu1mtPae7E6fRTea9BwjsXHHcb4
	0Ay/NO3QyxaukSmJtqOfkmyhMbCJMMw=
Subject: Re: [PATCH] x86/IRQ: bump max number of guests for a shared IRQ to 31
To: Igor Druzhinin <igor.druzhinin@citrix.com>
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com, wl@xen.org,
 xen-devel@lists.xenproject.org
References: <1606780777-30718-1-git-send-email-igor.druzhinin@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b98d3517-6c9d-6f40-6e28-cde142978143@suse.com>
Date: Wed, 2 Dec 2020 10:25:09 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <1606780777-30718-1-git-send-email-igor.druzhinin@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 01.12.2020 00:59, Igor Druzhinin wrote:
> Current limit of 7 is too restrictive for modern systems where one GSI
> could be shared by potentially many PCI INTx sources where each of them
> corresponds to a device passed through to its own guest. Some systems do not
> apply due dilligence in swizzling INTx links in case e.g. INTA is declared as
> interrupt pin for the majority of PCI devices behind a single router,
> resulting in overuse of a GSI.
> 
> Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>
> ---
> 
> If people think that would make sense - I can rework the array to a list of
> domain pointers to avoid the limit.

Not sure about this. What is the biggest number you've found on any
system? (I assume the chosen value of 31 has some headroom.)

Instead I'm wondering whether this wouldn't better be a Kconfig
setting (or even command line controllable). There don't look to be
any restrictions on the precise value chosen (i.e. 2**n-1 like is
the case for old and new values here, for whatever reason), so a
simple permitted range of like 4...64 would seem fine to specify.
Whether the default then would want to be 8 (close to the current
7) or higher (around the actually observed maximum) is a different
question.

Jan

