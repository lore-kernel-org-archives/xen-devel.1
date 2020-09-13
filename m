Return-Path: <SRS0=wOSV=CW=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 868D6C433E2
	for <xen-devel@archiver.kernel.org>; Sun, 13 Sep 2020 17:13:57 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3BB0620723
	for <xen-devel@archiver.kernel.org>; Sun, 13 Sep 2020 17:13:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Juv1J9ih"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3BB0620723
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kHVZ3-0005sY-HQ; Sun, 13 Sep 2020 17:13:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VW4I=CW=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1kHVZ1-0005sT-Pf
 for xen-devel@lists.xenproject.org; Sun, 13 Sep 2020 17:13:19 +0000
X-Inumbo-ID: c7ee5792-a5ad-4b28-81f1-0739157befed
Received: from aserp2120.oracle.com (unknown [141.146.126.78])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c7ee5792-a5ad-4b28-81f1-0739157befed;
 Sun, 13 Sep 2020 17:13:08 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08DH4iC8191502;
 Sun, 13 Sep 2020 17:07:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=xVtLGu7xP2YfYZ/5jujoneuZlmPA2+dwH8I7NLyPQ1c=;
 b=Juv1J9ih7aW9VwvSNOXrVn+lQ4/bY66fgMAgys7R6MsdDkbG+kKYFizO9UnPrQdS0FYR
 +ezg0OJOUY1uvU8MGRH551lzfWXsOWSUFz6a4UJGMiDkcNUU5Feup7d9OHIFYenEikuu
 C/UnQWnDb5PRRG4jPJrR+8XnwadKGotc5vHgqrdGPQ1ezckIfBrzqwv9imTfKgbGnvXn
 711q1eISZIqV86FM0NWO25rot6HkB/h8FGKSy4colpRNegADVYS0TN3neDlC5In0rLOH
 4wqPX+bPOBhDmiUf4csMsZx6svd9dvWTO8/52NkIc9i8ZFRXwgyhrKnchFHwyCeTi8JS 5A== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2120.oracle.com with ESMTP id 33gp9ku66c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Sun, 13 Sep 2020 17:07:47 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08DH5fF1064033;
 Sun, 13 Sep 2020 17:07:47 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3020.oracle.com with ESMTP id 33hm2vghh7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 13 Sep 2020 17:07:46 +0000
Received: from abhmp0008.oracle.com (abhmp0008.oracle.com [141.146.116.14])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 08DH7gN6025265;
 Sun, 13 Sep 2020 17:07:42 GMT
Received: from [10.74.86.192] (/10.74.86.192)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Sun, 13 Sep 2020 17:07:41 +0000
Subject: Re: [PATCH v3 01/11] xen/manage: keep track of the on-going suspend
 mode
To: Anchal Agarwal <anchalag@amazon.com>, tglx@linutronix.de, mingo@redhat.com,
 bp@alien8.de, hpa@zytor.com, x86@kernel.org, jgross@suse.com,
 linux-pm@vger.kernel.org, linux-mm@kvack.org, kamatam@amazon.com,
 sstabellini@kernel.org, konrad.wilk@oracle.com, roger.pau@citrix.com,
 axboe@kernel.dk, davem@davemloft.net, rjw@rjwysocki.net,
 len.brown@intel.com, pavel@ucw.cz, peterz@infradead.org,
 eduval@amazon.com, sblbir@amazon.com, xen-devel@lists.xenproject.org,
 vkuznets@redhat.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dwmw@amazon.co.uk, benh@kernel.crashing.org
References: <cover.1598042152.git.anchalag@amazon.com>
 <9b970e12491107afda0c1d4a6f154b52d90346ac.1598042152.git.anchalag@amazon.com>
From: boris.ostrovsky@oracle.com
Organization: Oracle Corporation
Message-ID: <986e074e-9c9f-ce09-ffb8-ed8f5d528d98@oracle.com>
Date: Sun, 13 Sep 2020 13:07:36 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.2.1
MIME-Version: 1.0
In-Reply-To: <9b970e12491107afda0c1d4a6f154b52d90346ac.1598042152.git.anchalag@amazon.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9743
 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 bulkscore=0 mlxlogscore=999
 malwarescore=0 mlxscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009130155
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9743
 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxlogscore=999
 adultscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 impostorscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009130155
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


On 8/21/20 6:25 PM, Anchal Agarwal wrote:
> From: Munehisa Kamata <kamatam@amazon.com>  
>
> Guest hibernation is different from xen suspend/resume/live migration.
> Xen save/restore does not use pm_ops as is needed by guest hibernation.
> Hibernation in guest follows ACPI path and is guest inititated , the
> hibernation image is saved within guest as compared to later modes
> which are xen toolstack assisted and image creation/storage is in
> control of hypervisor/host machine.
> To differentiate between Xen suspend and PM hibernation, keep track
> of the on-going suspend mode by mainly using a new API to keep track of
> SHUTDOWN_SUSPEND state.
> Introduce a simple function that keeps track of on-going suspend mode
> so that PM hibernation code can behave differently according to the
> current suspend mode.
> Since Xen suspend doesn't have corresponding PM event, its main logic
> is modfied to acquire pm_mutex.
>
> Though, accquirng pm_mutex is still right thing to do, we may
> see deadlock if PM hibernation is interrupted by Xen suspend.
> PM hibernation depends on xenwatch thread to process xenbus state
> transactions, but the thread will sleep to wait pm_mutex which is
> already held by PM hibernation context in the scenario. Xen shutdown
> code may need some changes to avoid the issue.
>
> [Anchal Agarwal: Changelog]:
>  RFC v1->v2: Code refactoring
>  v1->v2:     Remove unused functions for PM SUSPEND/PM hibernation
>  v2->v3:     Added logic to use existing pm_notifier to detect for ARM
> 	     and abort hibernation for ARM guests. Also removed different
> 	     suspend_modes and simplified the code with using existing state
> 	     variables for tracking Xen suspend. The notifier won't get
> 	     registered for pvh dom0 either.
>
> Signed-off-by: Anchal Agarwal <anchalag@amazon.com>
> Signed-off-by: Munehisa Kamata <kamatam@amazon.com>


BTW, just to make sure --- Thomas' comments about commit message format
(SoB order, no changelog, etc) apply to all patches, not just #5.


-boris


