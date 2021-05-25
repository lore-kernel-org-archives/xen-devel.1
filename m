Return-Path: <SRS0=5a5X=KU=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AB99C2B9F8
	for <xen-devel@archiver.kernel.org>; Tue, 25 May 2021 11:10:38 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B85EF6108D
	for <xen-devel@archiver.kernel.org>; Tue, 25 May 2021 11:10:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B85EF6108D
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.132160.246620 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llUww-0001Fd-0d; Tue, 25 May 2021 11:10:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 132160.246620; Tue, 25 May 2021 11:10:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llUwv-0001FW-Ta; Tue, 25 May 2021 11:10:13 +0000
Received: by outflank-mailman (input) for mailman id 132160;
 Tue, 25 May 2021 11:10:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=n3nm=KU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1llUwu-0001FQ-K0
 for xen-devel@lists.xenproject.org; Tue, 25 May 2021 11:10:12 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4e61f08c-466f-49e1-81c1-d20ba199a94d;
 Tue, 25 May 2021 11:10:11 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A6A50AF1E;
 Tue, 25 May 2021 11:10:10 +0000 (UTC)
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
X-Inumbo-ID: 4e61f08c-466f-49e1-81c1-d20ba199a94d
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1621941010; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4c9DPkZDWWjIpADE7/pAG+BfjKlKpEyZb+9oX4SaWDw=;
	b=TwnIHqoUXLdS5hFLXVi2ILIPQvzXD7b3EqmqdLDsl5FiXFFZUN1ol5zoXsRHx38Cjrhy26
	GztfRBnqN3kgyjeKMqLQ8OFrusmyVAKBW8rdHQd/jLbR5jpFEEafXrIw19IsF4JJxbDm/W
	B0UeFj6O07lqqlQG9S2M4PWsx+An0Hw=
Subject: Ping: [PATCH 0/3] firmware/shim: build adjustments
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Ian Jackson <iwj@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <19695ffc-34d8-b682-b092-668f872d4e57@suse.com>
Message-ID: <eb87b360-5a3a-63d1-5992-a544cc861aa6@suse.com>
Date: Tue, 25 May 2021 13:10:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <19695ffc-34d8-b682-b092-668f872d4e57@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 30.04.2021 16:39, Jan Beulich wrote:
> Originally I meant to finally get v2 of "firmware/shim: honor symlinks
> during Xen tree setup" sorted. However, the suggestion to use find's
> -L option, while a suitable equivalent of the -xtype primary, has the
> same drawback: It doesn't distinguish between relative and absolute
> symlinks (and we specifically want to skip relative ones). Locally I'm
> using '(' -type f -o -lname '/*' ')' now, but -lname again being non-
> standard I didn't think it would even be worth submitting. While
> looking into that I did notice a few other anomalies, though, which
> this series tries to address.
> 
> I notice tools/firmware/xen-dir/ isn't included in "X86 ARCHITECTURE".
> I wonder whether that should be added.
> 
> 1: update linkfarm exclusions
> 2: drop XEN_CONFIG_EXPERT uses
> 3: UNSUPPORTED=n

Ping?

Jan

