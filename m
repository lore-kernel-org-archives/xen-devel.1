Return-Path: <SRS0=Yd2Y=E2=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C46B9C56201
	for <xen-devel@archiver.kernel.org>; Fri, 20 Nov 2020 14:20:34 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B8FB2222A
	for <xen-devel@archiver.kernel.org>; Fri, 20 Nov 2020 14:20:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="H0Kmnhm9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B8FB2222A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.32246.63271 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kg7Gv-00014p-0b; Fri, 20 Nov 2020 14:20:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 32246.63271; Fri, 20 Nov 2020 14:20:20 +0000
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
	id 1kg7Gu-00014i-Sw; Fri, 20 Nov 2020 14:20:20 +0000
Received: by outflank-mailman (input) for mailman id 32246;
 Fri, 20 Nov 2020 14:20:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xyTX=E2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kg7Gu-00014T-5F
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 14:20:20 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 65bd90f2-58a5-45f6-971a-0253e3bb38fa;
 Fri, 20 Nov 2020 14:20:19 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 76A38AC23;
 Fri, 20 Nov 2020 14:20:18 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=xyTX=E2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kg7Gu-00014T-5F
	for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 14:20:20 +0000
X-Inumbo-ID: 65bd90f2-58a5-45f6-971a-0253e3bb38fa
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 65bd90f2-58a5-45f6-971a-0253e3bb38fa;
	Fri, 20 Nov 2020 14:20:19 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605882018; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pcqKyf2F69YpsegYySux8ebDCY1ioanHw5/or7/Lx8k=;
	b=H0Kmnhm9YbmqtRnbtIoTN9FyhUWdeOhBqFeGYWy9ai78thwzWgKYtVWDwMxBDOXM9MTSCw
	oqJAzhqAkXsPndopqGdn6gQVBautnU7gjR01DjKWAms6dTz78xT+ux6SrEyThJf2FT9oat
	lE5t+clvnbJNbUbd8VfWgEvHoJ4xKsg=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 76A38AC23;
	Fri, 20 Nov 2020 14:20:18 +0000 (UTC)
Subject: Re: [PATCH v2 01/12] viridian: don't blindly write to 32-bit
 registers is 'mode' is invalid
To: Paul Durrant <paul@xen.org>
Cc: Paul Durrant <pdurrant@amazon.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20201120094900.1489-1-paul@xen.org>
 <20201120094900.1489-2-paul@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0367ae3b-88a4-1a8d-b174-794b3fe61760@suse.com>
Date: Fri, 20 Nov 2020 15:20:19 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201120094900.1489-2-paul@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 20.11.2020 10:48, Paul Durrant wrote:
> From: Paul Durrant <pdurrant@amazon.com>
> 
> If hvm_guest_x86_mode() returns something other than 8 or 4 then
> viridian_hypercall() will return immediately but, on the way out, will write
> back status as if 'mode' was 4. This patch simply makes it leave the registers
> alone.

IOW 16-bit protected mode and real mode aren't allowed to make
hypercalls (supported also be the earlier switch() in the
function)? But then, to achieve what you want, wouldn't it be
more direct to simply "return HVM_HCALL_completed;" straight
from that earlier switch()'s default case? At which point the
switch() you modify could become if/else? Anyway - you're the
maintainer, I'm just wondering ...

Jan

