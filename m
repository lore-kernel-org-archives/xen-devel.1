Return-Path: <SRS0=1i6W=L5=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A861CC07E99
	for <xen-devel@archiver.kernel.org>; Mon,  5 Jul 2021 17:49:35 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 69D4261960
	for <xen-devel@archiver.kernel.org>; Mon,  5 Jul 2021 17:49:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 69D4261960
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.150578.278401 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0Sim-0007MX-SN; Mon, 05 Jul 2021 17:49:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 150578.278401; Mon, 05 Jul 2021 17:49:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0Sim-0007MM-PP; Mon, 05 Jul 2021 17:49:28 +0000
Received: by outflank-mailman (input) for mailman id 150578;
 Mon, 05 Jul 2021 17:49:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FZXx=L5=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1m0Sil-0007LK-Le
 for xen-devel@lists.xenproject.org; Mon, 05 Jul 2021 17:49:27 +0000
Received: from mail-wm1-x32a.google.com (unknown [2a00:1450:4864:20::32a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fe97b7d8-232c-4a04-8272-a46d293374c0;
 Mon, 05 Jul 2021 17:49:27 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id n33so4415630wms.1
 for <xen-devel@lists.xenproject.org>; Mon, 05 Jul 2021 10:49:27 -0700 (PDT)
Received: from ?IPv6:2a00:23c5:5785:9a01:bdf1:273d:a193:c704?
 ([2a00:23c5:5785:9a01:bdf1:273d:a193:c704])
 by smtp.gmail.com with ESMTPSA id g15sm13732601wrs.50.2021.07.05.10.49.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Jul 2021 10:49:25 -0700 (PDT)
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
X-Inumbo-ID: fe97b7d8-232c-4a04-8272-a46d293374c0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=DfK+fKPKbagG/UGZx/L2duK1xPYKVnNOC+Ob4pC5X2A=;
        b=Z8SST8xd+tRAw8HYICYtmx95zPt2lxLColM4Zdi4mBg+gCAb7ar8/lzuakDQyLb8e0
         n8PpHUCpiNDLMV+SyweGp/IMcHKK1k8D6iK5FZMdS6weEgmUUq7W29jyvyKVg9XPyHcf
         iJ38JRA8YSJOL5J1uMtDgwq8otSCuE9oAWnteOY+tmfV8BLQnh8lPoIeB6QvegTRjzWd
         qRnsrN6jcx0VDvKiWyG8YIxVG0ickUEJnAFgQYfX5Fh/6p9niDnYpI0546nN4Wr7sK36
         XHGAxzEaE0otPLnDnMdNHqnhEQuWmN6G4CDeZzjI+1Hx5jYqF3cD1TqXIH0SIWyNQcQX
         /SgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:subject:to:cc:references
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=DfK+fKPKbagG/UGZx/L2duK1xPYKVnNOC+Ob4pC5X2A=;
        b=bWPVsAPa8CjXd6Coqti4BaCZcGR5E4VGiHcavT+8ynf6FNsB1sUQIMzUK62w8aoDe1
         dPhpEA1x7zvmHY3uIht2PSm6o3rmoZpkuogCtWbBtq6s7JISgOop6GXjFHK0JaaHTpMH
         FlhmfCcLfb8S+nWldpe0gtTcYQkpHzpnoZPjJgWDg4cxaLGQcevrrwhESG2dgW8ee0J9
         e7Zd5XPyVb796fjZySLeg9g2tLuHNRed06WGUNYqNvLJx1lUjOCRt1ZuzBN0/yjGvDqd
         JM0YS2fBUN06/4Q2T579FaLC7HbcV+SU6jCthkF4Oj4+4I//blqdkRuwu9qkFwr4D5Je
         Xijw==
X-Gm-Message-State: AOAM533zSN2IZLtWYrrW5bpdtztBXFEDrcSDvAYK11FXKYlwASuu29zC
	PKKQjE+Km6gK043ViGvMHqs=
X-Google-Smtp-Source: ABdhPJyfv6hUryWExIgxY5ORJ9x7jbiiBY2y/TP5guniV1d+dQHkLPSgLYQ0/xu4ZcHU+OGZQcNwUQ==
X-Received: by 2002:a7b:c248:: with SMTP id b8mr256238wmj.115.1625507366360;
        Mon, 05 Jul 2021 10:49:26 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Reply-To: paul@xen.org
Subject: Re: [PATCH 16/16] x86/P2M: the majority for struct p2m_domain's
 fields are HVM-only
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <d1fd572d-5bfe-21d8-3b50-d9b0646ce2f0@suse.com>
 <e5362b33-0f5b-ba2b-d033-ca0a09e5fd54@suse.com>
Message-ID: <84bc0344-da04-9d12-deef-fd0c0e938b2f@xen.org>
Date: Mon, 5 Jul 2021 18:49:25 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <e5362b33-0f5b-ba2b-d033-ca0a09e5fd54@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 05/07/2021 17:15, Jan Beulich wrote:
> ..., as are the majority of the locks involved. Conditionalize things
> accordingly.
> 
> Also adjust the ioreq field's indentation at this occasion.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 

Reviewed-by: Paul Durrant <paul@xen.org>

