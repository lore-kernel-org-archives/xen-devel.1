Return-Path: <SRS0=htIg=C3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21D89C43463
	for <xen-devel@archiver.kernel.org>; Fri, 18 Sep 2020 14:45:33 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 869BE20665
	for <xen-devel@archiver.kernel.org>; Fri, 18 Sep 2020 14:45:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="vFqUyTN4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 869BE20665
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kJHd8-0003OU-Vt; Fri, 18 Sep 2020 14:44:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K9We=C3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kJHd7-0003OP-Ka
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2020 14:44:53 +0000
X-Inumbo-ID: bf3fe18d-ae5a-49db-9082-b7c84c774db0
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bf3fe18d-ae5a-49db-9082-b7c84c774db0;
 Fri, 18 Sep 2020 14:44:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1600440291;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qu8ptTH8Nuy6VT5kqE6qdjo6lAGb566LmfG07k1ie+0=;
 b=vFqUyTN4sc9C7yF2Q6hXvt6e0vLSog/EII2RtyjvoFQtEdKe98fw7kB5TifGVvtDzo3gCG
 ug0efgUuL2aTZ1vFj11z3+AEuuBcrILIFR7u2uUJRGM0ZQ6eaYEN7N0+xMLZH0RHkxJsiY
 1CP/+KPKjSacO4eFuXaUS2j+g7yNUyk=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9C1A2B31F;
 Fri, 18 Sep 2020 14:45:25 +0000 (UTC)
Subject: Re: [PATCH v5 1/5] efi/boot.c: Make file->ptr const void*
To: Trammell Hudson <hudson@trmm.net>
References: <20200917154048.1140580-1-hudson@trmm.net>
 <20200917154048.1140580-2-hudson@trmm.net>
Cc: xen-devel@lists.xenproject.org
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ac4e55ae-feeb-d928-f799-2268511ab276@suse.com>
Date: Fri, 18 Sep 2020 16:44:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200917154048.1140580-2-hudson@trmm.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

On 17.09.2020 17:40, Trammell Hudson wrote:
> Other than the config file parser that edits the image inplace,
> no other users of the file sections requires write access to the
> data.
> 
> Signed-off-by: Trammell Hudson <hudson@trmm.net>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
albeit ...

> @@ -592,7 +593,7 @@ static bool __init read_file(EFI_FILE_HANDLE dir_handle, CHAR16 *name,
>              efi_arch_handle_module(file, name, options);
>          }
>  
> -        ret = FileHandle->Read(FileHandle, &file->size, file->ptr);
> +        ret = FileHandle->Read(FileHandle, &file->size, file->str);

... I'm not particularly happy about this part of the change.
But yes - what do you do.

Jan

