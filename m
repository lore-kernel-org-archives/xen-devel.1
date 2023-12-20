Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86982C3DA6E
	for <xen-devel@archiver.kernel.org>; Wed, 20 Dec 2023 11:40:18 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.657707.1026733 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFuvb-0003wH-Tj; Wed, 20 Dec 2023 11:39:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 657707.1026733; Wed, 20 Dec 2023 11:39:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFuvb-0003wA-NN; Wed, 20 Dec 2023 11:39:55 +0000
Received: by outflank-mailman (input) for mailman id 657707;
 Wed, 20 Dec 2023 11:39:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TKvH=H7=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rFuva-0003w4-7z
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2023 11:39:54 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7dc5b78a-9f2c-11ee-98eb-6d05b1d4d9a1;
 Wed, 20 Dec 2023 12:39:53 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id D024D4EE0C91;
 Wed, 20 Dec 2023 12:39:52 +0100 (CET)
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
X-Inumbo-ID: 7dc5b78a-9f2c-11ee-98eb-6d05b1d4d9a1
MIME-Version: 1.0
Date: Wed, 20 Dec 2023 12:39:52 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Simone Ballarin <simone.ballarin@bugseng.com>, consulting@bugseng.com,
 Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>, Doug Goldstein
 <cardoe@cardoe.com>, Stefano Stabellini <sstabellini@kernel.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 3/6] xen: add deviations for Rule 11.8
In-Reply-To: <73fe1d0e-c9f3-4941-9a15-0250c9bd34b4@suse.com>
References: <cover.1702982442.git.maria.celeste.cesario@bugseng.com>
 <04cdbf21db915634acd49108edab7d6331df35eb.1702982442.git.maria.celeste.cesario@bugseng.com>
 <73fe1d0e-c9f3-4941-9a15-0250c9bd34b4@suse.com>
Message-ID: <b99d8c89879ffccaf2bdcf37a5a9a02b@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2023-12-20 11:50, Jan Beulich wrote:
> On 19.12.2023 12:05, Simone Ballarin wrote:
>> --- a/docs/misra/deviations.rst
>> +++ b/docs/misra/deviations.rst
>> @@ -248,6 +248,13 @@ Deviations related to MISRA C:2012 Rules:
>>         If no bits are set, 0 is returned.
>>       - Tagged as `safe` for ECLAIR.
>> 
>> +   * - R11.8
>> +     - Violations caused by container_of are due to pointer 
>> arithmetic operations
>> +       with the provided offset. The resulting pointer is then 
>> immediately cast back to its
>> +       original type, which preserves the qualifier. This use is 
>> deemed safe.
>> +       Fixing this violation would require to increase code 
>> complexity and lower readability.
>> +     - Tagged as `safe` for ECLAIR.
>> +
> 
> Going forward can you please avoid adding trailing whitespace. "git am"
> doesn't really like that, and hence it requires extra steps to clean 
> up.
> 
> Jan

Noted, sorry for the inconvenience.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

