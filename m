Return-Path: <SRS0=rTFK=FF=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAB84C64E8A
	for <xen-devel@archiver.kernel.org>; Tue,  1 Dec 2020 08:00:21 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6362F2087D
	for <xen-devel@archiver.kernel.org>; Tue,  1 Dec 2020 08:00:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="e1Mzok4m"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6362F2087D
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.41614.74886 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kk0a1-0002JW-Ao; Tue, 01 Dec 2020 08:00:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 41614.74886; Tue, 01 Dec 2020 08:00:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kk0a1-0002Ip-5B; Tue, 01 Dec 2020 08:00:09 +0000
Received: by outflank-mailman (input) for mailman id 41614;
 Tue, 01 Dec 2020 08:00:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KrUB=FF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kk0a0-0002Ig-5I
 for xen-devel@lists.xenproject.org; Tue, 01 Dec 2020 08:00:08 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0815429a-0de1-450f-9b77-1cbf0527beb4;
 Tue, 01 Dec 2020 08:00:07 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6516DAEF5;
 Tue,  1 Dec 2020 08:00:06 +0000 (UTC)
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
X-Inumbo-ID: 0815429a-0de1-450f-9b77-1cbf0527beb4
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606809606; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fCV07YhsFVUYe3rO/+xalK2NDdZq1VldAkeLRsqSiYg=;
	b=e1Mzok4mpu6GVVqkCWuZ/+mDQf/b/LWndGVIsyahQ9VMc9FHRUslLIvS6SvX+EkBGV4kQi
	9ctpRTP7qGQNCTkEJJrd2rc5+NEB2kZIycP1/KR0Rzs5l4UleKWzexO5uHWzgUw7UGR/XM
	psvNbEswRsJfXKdxBHXbp2ve59pjSQE=
Subject: Re: [PATCH] Fix spelling errors.
To: Diederik de Haas <didi.debian@cknow.org>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>, xen-devel@lists.xenproject.org
References: <a60e2c98183d7c873f4e306954f900614fcdb582.1606757711.git.didi.debian@cknow.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6a393816-c418-51c9-25c0-5622ef331099@suse.com>
Date: Tue, 1 Dec 2020 09:00:06 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <a60e2c98183d7c873f4e306954f900614fcdb582.1606757711.git.didi.debian@cknow.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 30.11.2020 18:39, Diederik de Haas wrote:
> --- a/xen/arch/x86/cpu/vpmu.c
> +++ b/xen/arch/x86/cpu/vpmu.c
> @@ -680,7 +680,7 @@ static void pvpmu_finish(struct domain *d, xen_pmu_params_t *params)
>          vcpu_unpause(v);
>  }
>  
> -/* Dump some vpmu informations on console. Used in keyhandler dump_domains(). */
> +/* Dump some vpmu information on console. Used in keyhandler dump_domains(). */

Replace "on" by "to" at the same time?

> --- a/xen/arch/x86/x86_emulate/x86_emulate.c
> +++ b/xen/arch/x86/x86_emulate/x86_emulate.c
> @@ -3246,7 +3246,7 @@ x86_decode(
>              case 0x23: /* mov reg,dr */
>                  /*
>                   * Mov to/from cr/dr ignore the encoding of Mod, and behave as
> -                 * if they were encoded as reg/reg instructions.  No futher
> +                 * if they were encoded as reg/reg instructions. No further
>                   * disp/SIB bytes are fetched.

Please don't discard double blanks between comment sentences. More
often than not they're put this way intentionally.

Both could be easily adjusted while committing. Applicable parts
then
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

