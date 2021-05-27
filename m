Return-Path: <SRS0=cWgu=KW=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBE6CC47089
	for <xen-devel@archiver.kernel.org>; Thu, 27 May 2021 11:48:03 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B49A6135C
	for <xen-devel@archiver.kernel.org>; Thu, 27 May 2021 11:48:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B49A6135C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.133061.248099 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmEUS-00054z-OM; Thu, 27 May 2021 11:47:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 133061.248099; Thu, 27 May 2021 11:47:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmEUS-00054s-LJ; Thu, 27 May 2021 11:47:52 +0000
Received: by outflank-mailman (input) for mailman id 133061;
 Thu, 27 May 2021 11:47:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HjtO=KW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lmEUR-00054m-CY
 for xen-devel@lists.xenproject.org; Thu, 27 May 2021 11:47:51 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a091b69d-fe3d-41a7-9949-31783f024f11;
 Thu, 27 May 2021 11:47:50 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6A76C2190B;
 Thu, 27 May 2021 11:47:49 +0000 (UTC)
Received: from director2.suse.de (director2.suse-dmz.suse.de [192.168.254.72])
 by imap.suse.de (Postfix) with ESMTPSA id 3C70711A98;
 Thu, 27 May 2021 11:47:49 +0000 (UTC)
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
X-Inumbo-ID: a091b69d-fe3d-41a7-9949-31783f024f11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1622116069; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ibvBJ8N9gYkmQfCGXm38qHnMjooDW0kvei05CtgEHck=;
	b=PmClcs6MmtUC5Wvg8JD11blA3FjooZ9IxoJaNFUXNuWQBbOlapQw6daJX30ygtTTw5TJZG
	e/SNKhZFJ9iE1W9Gl2BcXmBWwcrjgXT9HhYbxskpe5v/rGr9lswha+SxfJ6AQZH2Owe/Nw
	+Pujx4muTqLLGmg20il0wBatmp5fSFs=
Subject: Re: [PATCH 7/7] video/vesa: adjust (not just) command line option
 handling
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <6d6da76c-ccc8-afa2-bd06-5ae132c354f2@suse.com>
 <7e3f69d7-23e8-397d-72b6-8c489d80ea45@suse.com>
 <3e04b606-4e4f-e181-d3be-bcf99a2c8fa2@citrix.com>
 <3aadebaa-5a0b-e21b-c86a-289c2fae5d44@suse.com>
Message-ID: <e4230879-48b2-651a-b0fa-0e4fbedc04f1@suse.com>
Date: Thu, 27 May 2021 13:47:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <3aadebaa-5a0b-e21b-c86a-289c2fae5d44@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 27.04.2021 16:04, Jan Beulich wrote:
> On 27.04.2021 15:49, Andrew Cooper wrote:
>> However, is there really any value in these options?  I can't see a case
>> where their use will result in a less broken system.
> 
> Well, if we mis-detect VRAM size, the respective option might indeed
> help. I'm less certain of the utility of the mapping option, the more
> that now there's no possible (and implicit) effect on MTRRs anymore.

Actually I was wrong with referring to an implied effect on MTRRs - that
would come from "vesa-ram=". "vesa-map=" may help if we mis-detected the
space we actually need for the mode. However, we'd then be screwed up
elsewhere as well, so I guess I'll add a patch removing "vesa-map=" as
well.

Jan

