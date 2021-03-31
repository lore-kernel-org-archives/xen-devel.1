Return-Path: <SRS0=azK0=I5=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7F32C433B4
	for <xen-devel@archiver.kernel.org>; Wed, 31 Mar 2021 16:04:56 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C30B61029
	for <xen-devel@archiver.kernel.org>; Wed, 31 Mar 2021 16:04:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C30B61029
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.104010.198463 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRdKp-0003fR-DY; Wed, 31 Mar 2021 16:04:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104010.198463; Wed, 31 Mar 2021 16:04:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRdKp-0003fK-AV; Wed, 31 Mar 2021 16:04:47 +0000
Received: by outflank-mailman (input) for mailman id 104010;
 Wed, 31 Mar 2021 16:04:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hPDw=I5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lRdKn-0003fD-JQ
 for xen-devel@lists.xenproject.org; Wed, 31 Mar 2021 16:04:45 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1ee41738-7e12-4b24-a387-c50d2487d3be;
 Wed, 31 Mar 2021 16:04:44 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E59F0B308;
 Wed, 31 Mar 2021 16:04:43 +0000 (UTC)
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
X-Inumbo-ID: 1ee41738-7e12-4b24-a387-c50d2487d3be
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617206684; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zSkK+LeVr3rPCrrI9TRbmfQGk5hSY+T+rfFSwnszRsw=;
	b=E1V7wEtn4zcWfa94Z2yfNxERCZ8wZ/8T5/MhYopRuT3bNXxnmvK3HXi0enrwD5uEaFSxOR
	xDQHeWWCmBI+z9IptPvEcDY8QUwe0X344ExCatzWuE0E7tvMMxCQDxYtBSzngK5jKZkHBv
	AyOrQje8gK8KkpD3dOVGCXbWZl1uR+0=
Subject: Re: [PATCH v3 02/11] x86/hvm: drop domain parameter from vioapic/vpic
 EOI callbacks
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <20210331103303.79705-1-roger.pau@citrix.com>
 <20210331103303.79705-3-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b9a244b9-834d-4e41-3e39-504277b0c916@suse.com>
Date: Wed, 31 Mar 2021 18:04:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210331103303.79705-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 31.03.2021 12:32, Roger Pau Monne wrote:
> EOIs are always executed in guest vCPU context, so there's no reason to
> pass a domain parameter around as can be fetched from current->domain.
> 
> No functional change intended.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> Reviewed-by: Paul Durrant <paul@xen.org>
> ---
> Changes since v1:
>  - New in this version.

Just to make it explicit - possibly same thing as with patch 1,
depending on how exactly the issue there gets taken care of.

Jan

