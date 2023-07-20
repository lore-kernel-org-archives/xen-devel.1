Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5161DEB64DC
	for <xen-devel@archiver.kernel.org>; Thu, 20 Jul 2023 07:35:15 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.566396.885161 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMOBU-0004Qm-Fw; Thu, 20 Jul 2023 07:34:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 566396.885161; Thu, 20 Jul 2023 07:34:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMOBU-0004Qf-Ci; Thu, 20 Jul 2023 07:34:48 +0000
Received: by outflank-mailman (input) for mailman id 566396;
 Thu, 20 Jul 2023 07:34:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o2HW=DG=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qMOBS-0004QZ-U4
 for xen-devel@lists.xenproject.org; Thu, 20 Jul 2023 07:34:46 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e5ca102e-26cf-11ee-b23a-6b7b168915f2;
 Thu, 20 Jul 2023 09:34:45 +0200 (CEST)
Received: from [192.168.1.101] (unknown [37.162.143.190])
 by support.bugseng.com (Postfix) with ESMTPSA id 716754EE0C89;
 Thu, 20 Jul 2023 09:34:44 +0200 (CEST)
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
X-Inumbo-ID: e5ca102e-26cf-11ee-b23a-6b7b168915f2
Message-ID: <6b557858-b45c-71aa-97c1-d901c04358b6@bugseng.com>
Date: Thu, 20 Jul 2023 09:34:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [XEN PATCH v2] x86/HVM: address violations of MISRA C:2012 Rules
 8.2 and 8.3
Content-Language: en-US, it
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Michal Orzel <michal.orzel@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
References: <589e9c2ef5f13bf0c035b63f7b2e24fbbb878543.1689773180.git.federico.serafini@bugseng.com>
 <alpine.DEB.2.22.394.2307191726340.3118466@ubuntu-linux-20-04-desktop>
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG srl
In-Reply-To: <alpine.DEB.2.22.394.2307191726340.3118466@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/07/23 02:38, Stefano Stabellini wrote:
> On Wed, 19 Jul 2023, Federico Serafini wrote:
>>   
>> -void hvm_set_rdtsc_exiting(struct domain *d, bool_t enable)
>> +void hvm_set_rdtsc_exiting(struct domain *d, bool enable)
> 
> This is actually getting hvm_set_rdtsc_exiting out-of-sync with its
> declaration in xen/arch/x86/include/asm/hvm/hvm.h ?

You are right, I missed it, thank you.

-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG (http://bugseng.com)

