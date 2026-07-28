Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB955C54F4C
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2026 15:40:45 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1374869.1622148 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wojuv-0005pX-Pr; Tue, 28 Jul 2026 15:40:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1374869.1622148; Tue, 28 Jul 2026 15:40:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wojuv-0005pQ-Mu; Tue, 28 Jul 2026 15:40:29 +0000
Received: by outflank-mailman (input) for mailman id 1374869;
 Tue, 28 Jul 2026 15:40:27 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <nicola.vetrini@bugseng.com>) id 1wojut-0005pJ-KM
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 15:40:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wojut-003HLT-1G
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 17:40:27 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <nicola.vetrini@bugseng.com>)
 id 6a68cd6a-2eae-0a2a0a5409dd-0a2a4508e58c-0
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 17:40:26 +0200
Received: from [162.55.131.47] (helo=support.bugseng.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <nicola.vetrini@bugseng.com>)
 id 6a68cd69-f659-0a2a45080019-a237832fb1d8-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 17:40:26 +0200
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id B0DEE4EE013F;
 Tue, 28 Jul 2026 17:40:25 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; none
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1785253225;
	b=sFjqgIsPBKBu79RsU303nPRSd8ZLDv7MhSBK8avI+bXpWRYnJYreLsVUHo1ttbIlTxH/
	 xKzaw6R/56vxeOGUdVYF6ifZvqZcmXLwaIoNKUtaCJzUhAx4z7JFXngEjCj38WcKjjLqv
	 xsQ3MRcx+NQ7Zb2pVtoz16CaOjWKYmvtdfdr4fGb6jrReA2WDRnPdQsbP3RXNGB4J1cfu
	 AH2CY6PgfT9Uo3Bf8oE/ZoUdYt9+iui87YrQfLlwpjHruMrR97FxWXvSKvmucNMLhYizl
	 3rDGPd/UUoNxQ9W4BG340hVF2lZJIK6x4Dvlhql+fFCNF0NSiPl8GQgD+oU/0Bs215sZc
	 ufAIktbYcvIZ3YkI8XLSFMbvPxoM8teifYjkWWHku/x+81G/yIC32731Em0ZeZokScvqm
	 OvdiWl9xlPWi7+Me34k7p0kRS0/KPM2JYkeDzjwk1sulZpkhoTvmXBA5uzwVcftA/piGR
	 YUwKcLDgeJrxoUyzUL4fG8RkjgUqIerkdkoxq2LMY4Ju6RqOWTjWCpKrBk1CRPGttYkAa
	 YszOk68O1M0cpgQwsZlav14XKa9elRIzVHNE4X0L4zjBowJm6hqnEIcess/zaYWChI6gj
	 ulNGFpje3jSf5d0a7M7eZcAyLEcLiZPjOh4zMrBg5BrTt2LEE1dMWvHo9Onunec=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1785253225;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=GZRxfA2a9r/rHRg7Nrds5A0i0EklgCR+q1mAt63ipz4=;
	b=1vEIiLa7QY1YzBdjSESHCr5XdjfE+5HrQYP1sOkmCkHUWjZzQ7eDhQcx3K3JfLM5i2VN
	 vNI6ciYHl53fJoSlYJI8hxjf2LACTtWE0bytQsVPJRKUeL+Kqn0o3ExV9pPNm3eiZxLP+
	 RQtgMxgOfAw0AHobrMgknridlDjd64PLIydSzq3RZGFSpC/eooV4OJPL6LhVcyvlKYwL+
	 7kirKFCDSea1+5WUSbFGnpRLq5Lg+djJcO8TtjYLHUk6AeIhHJ5Fj44VlfUNnx+rwLkcC
	 YWQ1ivFDu6x47GVLPO6BHsgg7htfPuvMraxOQ9QanUNaMgCFBdLXyTYSd7U3+CE9SEWFU
	 33OsOeKL6rg73HABuM2OjkoxF4/K9X4GkZrtFDP7yIeUtvaDlYnf87VO5eCKRRvtDsWeD
	 F0xcXMVqUUZ97pXb59xYclYrYSPOLRA1fdUpvvShkXOO+FpvqLISGrmNl9QS/eFb60Cs9
	 cniUEJT+ZUSnDvnJV+hqYlIlij6K4zB/6b3oy53/6WVNCqGCcRanxSUHfZz9D3rd+OA0W
	 2nbRmM4fDycabyI2AAzIveuxWpdenypLgnPUy0bf204F7iS60XIUa9T6E7+m3lSuDXOr5
	 ePP8r+WEbLGUlVQtGJXDg9uLgFFeKEXS+XyxIifZ7Ist8/Z8lfvUmK8WeG4nDQg=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
MIME-Version: 1.0
Date: Tue, 28 Jul 2026 17:40:25 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Anthony PERARD
 <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH 7/7] gnttab: unreachable code when GNTTAB_MAX_VERSION < 2
In-Reply-To: <436c0688-8b9a-4e56-9d4c-c81dcfbea56e@suse.com>
References: <38850629-8bfa-4737-99ff-0fd3f489e56e@suse.com>
 <436c0688-8b9a-4e56-9d4c-c81dcfbea56e@suse.com>
Message-ID: <013f1cb3f76ed613be42d4f6157e3d0d@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1785253226-CE54487B-6A6677BC/0/0
X-purgate-type: clean
X-purgate-size: 757

On 2026-07-28 15:53, Jan Beulich wrote:
> I'm surprised Eclair doesn't spot the large chunks of unreachable code 
> on
> Arm, i.e. violations of Misra C:2012 rule 2.1.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> This pretty certainly isn't dealing with everything. For example, with
> another helper the gt_version field could likely also become 
> conditional.
> With some more effort the nr_status_frames field similarly could become
> conditional.
> 
[...]

Hard to judge only looking at the diff. Is this code unreachable in the 
arm64-allcode analysis configuration as well?

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

