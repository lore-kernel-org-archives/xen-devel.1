Return-Path: <SRS0=Mbyf=GH=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B28BC433E0
	for <xen-devel@archiver.kernel.org>; Mon,  4 Jan 2021 17:09:34 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E9F6F224DE
	for <xen-devel@archiver.kernel.org>; Mon,  4 Jan 2021 17:09:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E9F6F224DE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.61396.108010 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwTMC-0008Q2-Gw; Mon, 04 Jan 2021 17:09:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61396.108010; Mon, 04 Jan 2021 17:09:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwTMC-0008Pr-DH; Mon, 04 Jan 2021 17:09:24 +0000
Received: by outflank-mailman (input) for mailman id 61396;
 Mon, 04 Jan 2021 17:09:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yCAg=GH=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1kwTMB-0008OD-IW
 for xen-devel@lists.xenproject.org; Mon, 04 Jan 2021 17:09:23 +0000
Received: from aserp2120.oracle.com (unknown [141.146.126.78])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 77027ba8-7efa-45fa-9690-74f2ba628884;
 Mon, 04 Jan 2021 17:09:21 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 104H4ogC140659;
 Mon, 4 Jan 2021 17:09:15 GMT
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2120.oracle.com with ESMTP id 35tgskn88h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 04 Jan 2021 17:09:15 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 104H94QF043364;
 Mon, 4 Jan 2021 17:09:15 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3020.oracle.com with ESMTP id 35v1f7km7x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 04 Jan 2021 17:09:14 +0000
Received: from abhmp0009.oracle.com (abhmp0009.oracle.com [141.146.116.15])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 104H6VNe015857;
 Mon, 4 Jan 2021 17:06:32 GMT
Received: from [10.39.231.107] (/10.39.231.107)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 04 Jan 2021 09:06:31 -0800
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
X-Inumbo-ID: 77027ba8-7efa-45fa-9690-74f2ba628884
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=J5k5DeGvMpPqUMJyYkGeK/yUDSNwrUNHoyOn6tdl7zg=;
 b=yRBr7xn8Y/QUhdIUTvzA+pV7dJ1dT4i/PvCqBbRcmicJhQ9xjMmQ4xc5mkeBodZ9b7Nj
 Z+Sbm5n0MfN/IlYFYv9DjppYsdukulMqJyUmDvbwxWVJfuurgx+kZHRCt4lYGb6GJ1UC
 0AE1aqmuq7zn3InITLv4Y2fwTR0yzoFrB9ZSjPM6K8QhxaKOHlZTHidQRwMwvOTCLJd6
 oclMQz8ytZlNKqtRG7xG7mDMOwNsRtrdTOlbLpNFy2QUv5q1IOUwIhodLN0FV9akwaQT
 8o4Mx7j0vCWTxOK+YPP7sAJC3MYl7kygWHHinnq2QBczKCYqRUFE61IsHRmabfSDt9SN dQ== 
Subject: Re: [PATCH 5/5] x86/xen: Don't register PV spinlock IPI when it isn't
 going to be used
To: David Woodhouse <dwmw2@infradead.org>, x86@kernel.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
        Juergen Gross <jgross@suse.com>, Paul Durrant <pdurrant@amazon.com>,
        jgrall@amazon.com, karahmed@amazon.de,
        xen-devel <xen-devel@lists.xenproject.org>
References: <20201224115323.3540130-1-dwmw2@infradead.org>
 <20201224115323.3540130-6-dwmw2@infradead.org>
From: boris.ostrovsky@oracle.com
Organization: Oracle Corporation
Message-ID: <b6681a06-4c00-61a9-2112-63ee3eb8d86d@oracle.com>
Date: Mon, 4 Jan 2021 12:06:30 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201224115323.3540130-6-dwmw2@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9854 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 phishscore=0
 suspectscore=0 spamscore=0 bulkscore=0 adultscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101040111
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9854 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 spamscore=0 malwarescore=0
 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 adultscore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101040111


On 12/24/20 6:53 AM, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
>
> When xen_have_vector_callback is false, we still register the PV spinlock
> kicker IPI on the secondary CPUs. Stop doing that.
>
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>  arch/x86/xen/spinlock.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/arch/x86/xen/spinlock.c b/arch/x86/xen/spinlock.c
> index 799f4eba0a62..b240ea483e63 100644
> --- a/arch/x86/xen/spinlock.c
> +++ b/arch/x86/xen/spinlock.c
> @@ -68,7 +68,7 @@ void xen_init_lock_cpu(int cpu)
>  	int irq;
>  	char *name;
>  
> -	if (!xen_pvspin)
> +	if (!xen_pvspin || !xen_have_vector_callback)
>  		return;
>  
>  	WARN(per_cpu(lock_kicker_irq, cpu) >= 0, "spinlock on CPU%d exists on IRQ%d!\n",
> @@ -93,7 +93,7 @@ void xen_init_lock_cpu(int cpu)
>  
>  void xen_uninit_lock_cpu(int cpu)
>  {
> -	if (!xen_pvspin)
> +	if (!xen_pvspin || !xen_have_vector_callback)
>  		return;
>  
>  	unbind_from_irqhandler(per_cpu(lock_kicker_irq, cpu), NULL);
> @@ -115,7 +115,7 @@ PV_CALLEE_SAVE_REGS_THUNK(xen_vcpu_stolen);
>  void __init xen_init_spinlocks(void)
>  {
>  	/*  Don't need to use pvqspinlock code if there is only 1 vCPU. */
> -	if (num_possible_cpus() == 1 || nopvspin)
> +	if (num_possible_cpus() == 1 || nopvspin || !xen_have_vector_callback)


xen_init_spinlock() will not be called without vector callbacks so this test is not really necessary.


OTOH this also implies that we will never update virt_spin_lock_key.


-boris


>  		xen_pvspin = false;
>  
>  	if (!xen_pvspin) {

