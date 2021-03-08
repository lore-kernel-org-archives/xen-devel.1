Return-Path: <SRS0=fV0s=IG=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 366F3C433DB
	for <xen-devel@archiver.kernel.org>; Mon,  8 Mar 2021 08:18:43 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD81B64FD4
	for <xen-devel@archiver.kernel.org>; Mon,  8 Mar 2021 08:18:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD81B64FD4
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.94649.178219 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJB5x-0007jL-Sc; Mon, 08 Mar 2021 08:18:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 94649.178219; Mon, 08 Mar 2021 08:18:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJB5x-0007jE-Pk; Mon, 08 Mar 2021 08:18:29 +0000
Received: by outflank-mailman (input) for mailman id 94649;
 Mon, 08 Mar 2021 08:18:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mI6H=IG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lJB5w-0007j9-FI
 for xen-devel@lists.xenproject.org; Mon, 08 Mar 2021 08:18:28 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 14f24af3-004e-4ef3-b62a-c152e611ace5;
 Mon, 08 Mar 2021 08:18:27 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9AA15AC54;
 Mon,  8 Mar 2021 08:18:26 +0000 (UTC)
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
X-Inumbo-ID: 14f24af3-004e-4ef3-b62a-c152e611ace5
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615191506; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gbkc2atApil3/y+HiZQ+nWotmtLzxJs7v18JRMoBOAk=;
	b=KlCbWNhvwegnbNeL156FZeM8et5bmxKLJEZeWMgU6g+ZTunnQVcTX/cgho5I0513FdDoab
	Duax6DtGcdQDbRtWqo7qz25uob4wgCUpycLqm7MEw7ktyMCzQa8f2mVpF7ikbDNYqU2tN/
	hRlvHmRySNh5wpT2TD/F3Z1OtA3/t4k=
Subject: Re: [PATCH for-4.15] vtd: make sure QI/IR are disabled before
 initialisation
To: Igor Druzhinin <igor.druzhinin@citrix.com>
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com, wl@xen.org,
 kevin.tian@intel.com, xen-devel@lists.xenproject.org,
 Ian Jackson <iwj@xenproject.org>
References: <1615186802-5908-1-git-send-email-igor.druzhinin@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <de357605-ef0c-82ba-0ae2-ef96f1dd23f3@suse.com>
Date: Mon, 8 Mar 2021 09:18:26 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <1615186802-5908-1-git-send-email-igor.druzhinin@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 08.03.2021 08:00, Igor Druzhinin wrote:
> BIOS might pass control to Xen leaving QI and/or IR in enabled and/or
> partially configured state. In case of x2APIC code path where EIM is
> enabled early in boot - those are correctly disabled by Xen before any
> attempt to configure. But for xAPIC that step is missing which was
> proven to cause QI initialization failures on some ICX based platforms
> where QI is left pre-enabled and partially configured by BIOS.

And those systems then tell us to avoid use of x2APIC? I would have
expected that on modern systems we wouldn't see such quirky firmware
behavior anymore. Anyway, half a sentence to this effect might help
here, as without such firmware behavior the only way to run into
this ought to be use of "no-x2apic" on the command line. Which in
turn might require justification (and potentially a fix elsewhere in
the code to make use of that option unnecessary).

> Unify the behaviour between x2APIC and xAPIC code paths keeping that in
> line with what Linux does.
> 
> Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with some editing of the description. If no other need for a v2
arises, I suppose whatever you come up with could be folded in
while committing.

Also Cc-ing Ian for a release ack.

Jan

