Return-Path: <SRS0=Jb4W=DF=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63368C2D0A8
	for <xen-devel@archiver.kernel.org>; Mon, 28 Sep 2020 07:55:02 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E39F321775
	for <xen-devel@archiver.kernel.org>; Mon, 28 Sep 2020 07:55:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="jwCbnA51"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E39F321775
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kMnzj-0002WX-21; Mon, 28 Sep 2020 07:54:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qi+E=DF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kMnzi-0002WS-40
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2020 07:54:46 +0000
X-Inumbo-ID: 1e90b853-aec5-4715-8424-2d5a579463c6
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1e90b853-aec5-4715-8424-2d5a579463c6;
 Mon, 28 Sep 2020 07:54:45 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1601279684;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xgNli4JE2fg9qE+1VFrafq9RL3RhVntYQDnrb4wE+aA=;
 b=jwCbnA51wpXKu96h+qx6p6WufrY3RK71x1etTBuaShaREjl5JhlVdMmUYGph/rF/TDz63J
 MA5/2E0YkFvPsnho34/NPbhVhI+JdI6SUN6t/pXqO85AIVuDB5BqjBFWj7wz822V5uoIr5
 KyLFlnyyr6UZtSmHvQfumvs/iQuUM+k=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5F958B022;
 Mon, 28 Sep 2020 07:54:44 +0000 (UTC)
Subject: Re: [PATCH] x86/S3: Fix Shadow Stack resume path
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20200927153657.304553-1-marmarek@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3603d2b1-7b7e-b97d-4a09-1206fe502ebf@suse.com>
Date: Mon, 28 Sep 2020 09:54:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200927153657.304553-1-marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 27.09.2020 17:36, Marek Marczykowski-Górecki wrote:
> Fix the resume path to load the shadow stack pointer from saved_ssp (not
> saved_rsp), to match what suspend path does.
> 
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


