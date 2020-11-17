Return-Path: <SRS0=l9VS=EX=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF067C5519F
	for <xen-devel@archiver.kernel.org>; Tue, 17 Nov 2020 16:50:00 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B2E7221FC
	for <xen-devel@archiver.kernel.org>; Tue, 17 Nov 2020 16:50:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="R3dC9uLh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3B2E7221FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.29149.58400 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kf4An-0007DN-W1; Tue, 17 Nov 2020 16:49:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 29149.58400; Tue, 17 Nov 2020 16:49:41 +0000
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
	id 1kf4An-0007DG-Ss; Tue, 17 Nov 2020 16:49:41 +0000
Received: by outflank-mailman (input) for mailman id 29149;
 Tue, 17 Nov 2020 16:49:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+6JM=EX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kf4Am-00077m-53
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2020 16:49:40 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3f556ac0-d195-4ff7-bb21-03b18afd8f2e;
 Tue, 17 Nov 2020 16:49:38 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B9E01AC1F;
 Tue, 17 Nov 2020 16:49:37 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=+6JM=EX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kf4Am-00077m-53
	for xen-devel@lists.xenproject.org; Tue, 17 Nov 2020 16:49:40 +0000
X-Inumbo-ID: 3f556ac0-d195-4ff7-bb21-03b18afd8f2e
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 3f556ac0-d195-4ff7-bb21-03b18afd8f2e;
	Tue, 17 Nov 2020 16:49:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605631777; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I0mNzBaXvcn3Sk2ApEMgXh0UxObpBe/rTdVRcDEr1rM=;
	b=R3dC9uLhLmq+KOLI7JjiEENCabij7NKDrIzCz2PNgaeYrDJayQujfyUuFXPrfTDn6sKjnT
	qyWQT2jjh6bDSvUgSnaV96nxPRic2PD0att0yYXlkEO64Y8nuZvULqEuUXPzmc0DRAwlga
	2NWn5PK1ejGVWGbOhFu0Dv4qzB+Ap/Y=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id B9E01AC1F;
	Tue, 17 Nov 2020 16:49:37 +0000 (UTC)
Subject: Re: [PATCH 11/12] xen/hypfs: add scheduling granularity entry to
 cpupool entries
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Dario Faggioli <dfaggioli@suse.com>,
 xen-devel@lists.xenproject.org
References: <20201026091316.25680-1-jgross@suse.com>
 <20201026091316.25680-12-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1c3a991b-f7c4-6aeb-6b3d-f7a8865e821a@suse.com>
Date: Tue, 17 Nov 2020 17:49:37 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <20201026091316.25680-12-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 26.10.2020 10:13, Juergen Gross wrote:
> @@ -1057,6 +1063,43 @@ static struct hypfs_entry *cpupool_dir_findentry(struct hypfs_entry_dir *dir,
>      return hypfs_gen_dyndir_entry_id(&cpupool_pooldir, id);
>  }
>  
> +static int cpupool_gran_read(const struct hypfs_entry *entry,
> +                             XEN_GUEST_HANDLE_PARAM(void) uaddr)
> +{
> +    const struct hypfs_dyndir_id *data;
> +    struct cpupool *cpupool;

const?

> +    const char *name = "";
> +
> +    data = hypfs_get_dyndata();
> +    if ( !data )
> +        return -ENOENT;
> +
> +    spin_lock(&cpupool_lock);
> +
> +    cpupool = __cpupool_find_by_id(data->id, true);
> +    if ( cpupool )
> +        name = sched_gran_get_name(cpupool->gran);
> +
> +    spin_unlock(&cpupool_lock);
> +
> +    if ( !cpupool )

May I suggest to check !*name here, to avoid giving the impression
of ...

> +        return -ENOENT;
> +
> +    return copy_to_guest(uaddr, name, strlen(name) + 1) ? -EFAULT : 0;

... success (but an empty name) in this admittedly unlikely event?

Jan

