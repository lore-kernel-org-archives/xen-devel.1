Return-Path: <SRS0=Brpk=EF=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DFC6C4363A
	for <xen-devel@archiver.kernel.org>; Fri, 30 Oct 2020 12:09:02 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F3042076E
	for <xen-devel@archiver.kernel.org>; Fri, 30 Oct 2020 12:09:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="tD1/BUDQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9F3042076E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.15754.38871 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYTD5-0003ZM-JO; Fri, 30 Oct 2020 12:08:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 15754.38871; Fri, 30 Oct 2020 12:08:47 +0000
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
	id 1kYTD5-0003ZF-Fb; Fri, 30 Oct 2020 12:08:47 +0000
Received: by outflank-mailman (input) for mailman id 15754;
 Fri, 30 Oct 2020 12:08:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2BB6=EF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kYTD4-0003ZA-CY
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 12:08:46 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 54d39326-7a1e-4829-88de-1f68dd07a060;
 Fri, 30 Oct 2020 12:08:45 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C1B3FB1A6;
 Fri, 30 Oct 2020 12:08:44 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=2BB6=EF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kYTD4-0003ZA-CY
	for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 12:08:46 +0000
X-Inumbo-ID: 54d39326-7a1e-4829-88de-1f68dd07a060
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 54d39326-7a1e-4829-88de-1f68dd07a060;
	Fri, 30 Oct 2020 12:08:45 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1604059724;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4W7X/iL6SHyoV2HFBiU0f1MfNU1Gk1c3QN/6fMVpXSE=;
	b=tD1/BUDQqXHqmqqQmO+yafkIBK/Y527xSM3bBFdSJ+P51JE5tuHdAyNAqOx7SX7SuuQ/QO
	Pt3nX3AbiExBtMCF4DexZt/DE4GBIy4nnBHcAz5OcevBAukdrozTWeCMUsjToUF8ufUSFu
	2spSZQsGHT4VVkINyRSXuzfBhR5SGPw=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id C1B3FB1A6;
	Fri, 30 Oct 2020 12:08:44 +0000 (UTC)
Subject: Re: [PATCH v1 1/2] No insert of the build timestamp into the x86 xen
 efi binary
To: =?UTF-8?Q?Fr=c3=a9d=c3=a9ric_Pierret_=28fepitre=29?=
 <frederic.pierret@qubes-os.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1603725003.git.frederic.pierret@qubes-os.org>
 <64fc67bc2227d6cf92e079228c9f8d2d6404b001.1603725003.git.frederic.pierret@qubes-os.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <93b0b06e-cb73-66eb-3535-e7ab2ca60bf8@suse.com>
Date: Fri, 30 Oct 2020 13:08:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <64fc67bc2227d6cf92e079228c9f8d2d6404b001.1603725003.git.frederic.pierret@qubes-os.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 30.10.2020 13:03, Frédéric Pierret (fepitre) wrote:

> --- a/xen/arch/x86/Makefile
> +++ b/xen/arch/x86/Makefile
> @@ -170,6 +170,7 @@ EFI_LDFLAGS += --major-image-version=$(XEN_VERSION)
>  EFI_LDFLAGS += --minor-image-version=$(XEN_SUBVERSION)
>  EFI_LDFLAGS += --major-os-version=2 --minor-os-version=0
>  EFI_LDFLAGS += --major-subsystem-version=2 --minor-subsystem-version=0
> +EFI_LDFLAGS += --no-insert-timestamp

Generally I prefer binaries to carry timestamps, when they are
intended to do so (i.e. when they have a respective field). So
I think if no timestamp is wanted, it should be as an option
(not sure about the default).

This said, I didn't think time stamps got meaningfully in the
way of reproducible builds - ignoring the minor differences
cause by them, especially when they sit at well known offsets
in the binaries, shouldn't be a big deal.

Jan

