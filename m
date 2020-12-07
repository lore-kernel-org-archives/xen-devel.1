Return-Path: <SRS0=Mf7K=FL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3E08C433FE
	for <xen-devel@archiver.kernel.org>; Mon,  7 Dec 2020 09:00:47 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F26F2333D
	for <xen-devel@archiver.kernel.org>; Mon,  7 Dec 2020 09:00:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F26F2333D
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.45976.81548 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmCNY-0004An-4X; Mon, 07 Dec 2020 09:00:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 45976.81548; Mon, 07 Dec 2020 09:00:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmCNY-0004Ag-1P; Mon, 07 Dec 2020 09:00:20 +0000
Received: by outflank-mailman (input) for mailman id 45976;
 Mon, 07 Dec 2020 09:00:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3bhA=FL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kmCNX-0004AA-BT
 for xen-devel@lists.xenproject.org; Mon, 07 Dec 2020 09:00:19 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4de9675a-d5a0-4de0-9deb-86f3f75ce675;
 Mon, 07 Dec 2020 09:00:17 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1A255AD4A;
 Mon,  7 Dec 2020 09:00:16 +0000 (UTC)
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
X-Inumbo-ID: 4de9675a-d5a0-4de0-9deb-86f3f75ce675
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607331616; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6ZOjbW6hH7FMjrZaBIUvpayIw0NyC/l8Xhb1PdwmQAs=;
	b=cJQihNdzr+Y0H9CHTAojeM3LB9QnTKF0lUzTZV6uAxCEKtWKKR8uCuJNN77ySUj05LhjtM
	n3zgbYkclsZ3rtn1uMyI7a+f9gIxAVrCfEtG2MrHPGnUoGfOlMMoup060s1sk/Z8gV+mzX
	z8Kb71LETJwZH4C64jXxqQjgOg3v+2k=
Subject: Re: [PATCH v2 00/17] xen: support per-cpupool scheduling granularity
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org,
 Juergen Gross <jgross@suse.com>
References: <20201201082128.15239-1-jgross@suse.com>
 <a12de6ea-584c-49ca-3a09-f94b65933a62@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c1fb98de-6925-aefa-e06a-5df4369acc3a@suse.com>
Date: Mon, 7 Dec 2020 10:00:18 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <a12de6ea-584c-49ca-3a09-f94b65933a62@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 05.12.2020 00:53, Andrew Cooper wrote:
> Weirdly, there is a second diagnostic showing up which appears to be
> unrelated and non-fatal, but a concerning non-the-less
> 
> mem_access.c: In function 'p2m_mem_access_check':
> mem_access.c:227:6: note: parameter passing for argument of type 'const
> struct npfec' changed in GCC 9.1
>   227 | bool p2m_mem_access_check(paddr_t gpa, vaddr_t gla, const struct
> npfec npfec)
>       |      ^~~~~~~~~~~~~~~~~~~~
> 
> It appears to be related to
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=88469 and is letting us
> know that the ABI changed.  However, Xen is an embedded project with no
> external linkage, so we can probably compile with -Wno-psabi and be done
> with it.

https://gcc.gnu.org/bugzilla/show_bug.cgi?id=91710

I have no idea why the fix suggested there hasn't made it into the
code base yet - iirc I had taken it verbatim and it got rid of the
problem in my builds of the compiler.

I don't, btw, think us being "embedded" is an excuse to suppress
the warning. If there really was a code generation difference here
(and not just a false positive warning), an incremental build
across a switch between older and newer gcc would then be broken.

Jan

