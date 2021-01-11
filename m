Return-Path: <SRS0=O81L=GO=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA2EAC433E0
	for <xen-devel@archiver.kernel.org>; Mon, 11 Jan 2021 09:33:47 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B56822516
	for <xen-devel@archiver.kernel.org>; Mon, 11 Jan 2021 09:33:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B56822516
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.64723.114378 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kytZs-0002Lb-VX; Mon, 11 Jan 2021 09:33:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 64723.114378; Mon, 11 Jan 2021 09:33:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kytZs-0002LU-Rf; Mon, 11 Jan 2021 09:33:32 +0000
Received: by outflank-mailman (input) for mailman id 64723;
 Mon, 11 Jan 2021 09:33:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ekcf=GO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kytZq-0002LN-Sb
 for xen-devel@lists.xenproject.org; Mon, 11 Jan 2021 09:33:30 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cef59463-cbe4-4dae-ba2f-01b2154ee0bf;
 Mon, 11 Jan 2021 09:33:30 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3C4D5AE40;
 Mon, 11 Jan 2021 09:33:29 +0000 (UTC)
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
X-Inumbo-ID: cef59463-cbe4-4dae-ba2f-01b2154ee0bf
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610357609; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PkvVtBbM0CZRHOZiwBqhW6FK+qkS3P/q0oJdKVbwvlY=;
	b=KUR9V/84ECyT2Hi1canAV3qbRRtu6gWL5aEXFZWgDffNInDwZRJXNOFbODdxuj13s1xFbm
	j6y/cTX+wtq7bDj9ION5dNlrcFJT6d0IhRrITFsqlacVLBIptv2qjdi64vbnVPWOiZDyoV
	BzIun/UVgz/8JZAs6ZWviL5mnYBILD4=
Subject: Re: [PATCH] x86/acpi: remove dead code
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210111092640.98423-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <fe2bcd17-f51b-4b0c-ff60-4a09d3973ad0@suse.com>
Date: Mon, 11 Jan 2021 10:33:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210111092640.98423-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 11.01.2021 10:26, Roger Pau Monne wrote:
> After the recent changes to acpi_fadt_parse_sleep_info the bad label
> can never be called with facs mapped, and hence the unmap can be
> removed.
> 
> Additionally remove the whole label, since it was used by a
> single caller. Move the relevant code from the label.
> 
> No functional change intended.
> 
> CID: 1471722
> Fixes: 16ca5b3f873 ('x86/ACPI: don't invalidate S5 data when S3 wakeup vector cannot be determined')

I kind of consider a "Fixes:" tag contrary to "No functional change
intended", but I guess Coverity considering this an issue warrants
the tag at least in a way.

> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

