Return-Path: <SRS0=vACI=J3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40DBBC433ED
	for <xen-devel@archiver.kernel.org>; Fri, 30 Apr 2021 15:56:44 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F133F613DC
	for <xen-devel@archiver.kernel.org>; Fri, 30 Apr 2021 15:56:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F133F613DC
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.120668.228237 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lcVVM-0002At-8e; Fri, 30 Apr 2021 15:56:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 120668.228237; Fri, 30 Apr 2021 15:56:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lcVVM-0002Am-5C; Fri, 30 Apr 2021 15:56:36 +0000
Received: by outflank-mailman (input) for mailman id 120668;
 Fri, 30 Apr 2021 15:56:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=T1Xz=J3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lcVVL-0002Ag-AT
 for xen-devel@lists.xenproject.org; Fri, 30 Apr 2021 15:56:35 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1e8e0e01-b282-4c51-92d0-2ac14970d358;
 Fri, 30 Apr 2021 15:56:34 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D13D8B007;
 Fri, 30 Apr 2021 15:56:33 +0000 (UTC)
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
X-Inumbo-ID: 1e8e0e01-b282-4c51-92d0-2ac14970d358
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619798193; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mkBape74zVUpcS65tnzYtaaB194g47tkPchyQMWnsjw=;
	b=b+vnFQpMsjmmKV5cbSPQO6S2NEBjisYLyHSRgmH0mT3CP/ma553c6OmzIH7WJJxKS+RFZS
	Bm9D2DXwVpyXTJ9enZeThlVJCe5drShrDb/MtPgCVeVMMTK2niRrwm/zcRVUokIq9d1FyC
	yYsCnSj1TU6Y/OUjdetd2uUhRnjM3gE=
Subject: Re: [PATCH] x86: Always have CR4.PKE set in HVM context
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210429221223.28348-1-andrew.cooper3@citrix.com>
 <4781e8f1-d70b-2736-364c-eeed61869031@suse.com>
 <5b1938c7-408a-5912-7e66-b5e207e268bd@citrix.com>
 <1150e1b5-c6a1-7685-8775-0e4039dbc903@suse.com>
 <d7628aff-78e5-c557-0498-b7a60a756b89@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7592b233-2425-f4e9-5677-2dc03d39b65d@suse.com>
Date: Fri, 30 Apr 2021 17:56:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <d7628aff-78e5-c557-0498-b7a60a756b89@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 30.04.2021 16:37, Andrew Cooper wrote:
> On 30/04/2021 11:42, Jan Beulich wrote:
>> On 30.04.2021 12:21, Andrew Cooper wrote:
>>> If I do the rebase, are you happy for this patch to stay as it is (so
>>> the complicated change concerning context switching doesn't get more
>>> complicated), and so we're not knowingly adding new constructs which
>>> need immediate changes?
>> Well, the answer is not just "yes", but in reality I wouldn't mind
>> doing the rebasing myself, if only I knew it wasn't for the purpose of
>> waiting another half year for an ack (or otherwise).
> 
> The patch itself looks entirely fine.  Reviewed-by: Andrew Cooper
> <andrew.cooper3@citrix.com>

Thanks.

> The only observation I've got is that the other instructions in Grp7
> probably want a blanket conversion from generate_exception_if(vex.pfx,
> EXC_UD); to use the unimplemented_insn path instead, but that's clearly
> further work.

Since this is highly inconsistent at present, we first need to put
down a scheme, as I don't think we want _all_ #UD raising converted
to "goto unimplemented_insn". I've been thinking about where to draw
the line every time I've been adding new insns half-way recently,
but I didn't come to any good conclusion yet.

> I'll commit this patch, and the rebase delta on yours ought to just be
> the naming of the helpers.

Plus the dropping of the CR4 writes in write_pkru().

Jan

