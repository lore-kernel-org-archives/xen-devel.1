Return-Path: <SRS0=oC9Q=C6=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8968FC4363C
	for <xen-devel@archiver.kernel.org>; Mon, 21 Sep 2020 20:45:00 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2478A21BE5
	for <xen-devel@archiver.kernel.org>; Mon, 21 Sep 2020 20:44:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="TgUfJcvq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2478A21BE5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKSfx-0002X0-Jt; Mon, 21 Sep 2020 20:44:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=okJh=C6=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1kKSfw-0002Wv-7i
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2020 20:44:40 +0000
X-Inumbo-ID: 11161cdb-1620-46d6-9e06-2f32386ea6ce
Received: from aserp2120.oracle.com (unknown [141.146.126.78])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 11161cdb-1620-46d6-9e06-2f32386ea6ce;
 Mon, 21 Sep 2020 20:44:39 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08LKdCRp085819;
 Mon, 21 Sep 2020 20:44:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=7ujMtTvfd+IOkCnn7iI/GoTDPJ8pxvj1u7VSyDhDIiE=;
 b=TgUfJcvqhnH4X5TErTOA7ctRXSXQGoVSuGYWQLux1TS6gP/EFUFQnZPW1RbI+0E3cL3B
 in/KONvWNSkpL0McwdWOCYcEE71inohanA9TuEaBwbVsC+zymxPchZWkmSx8xBtSpz45
 n4nSBlQUHVmHXIe079bdqGiphbvhJyNT4NA7Zc1AGj/hU0sZ8Gjz7k8rSC1nxwxqxoDc
 M/3OmSs0Xen7YIDCD5IseKHAjxpvC1Wd93RKD+UTZE2zo/tF5x3Gs3ujB2MuqgPbpVVb
 G2l9kt0/DZBWdfye+7ecmzj4ylCxjUBE6JtHlfJDOmpinNW39aF0e9JhEBK/pXjcS2Z0 kg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2120.oracle.com with ESMTP id 33n9xks3vf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 21 Sep 2020 20:44:24 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08LKdmAx065052;
 Mon, 21 Sep 2020 20:44:24 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3020.oracle.com with ESMTP id 33nuw1usdt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 21 Sep 2020 20:44:24 +0000
Received: from abhmp0009.oracle.com (abhmp0009.oracle.com [141.146.116.15])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 08LKiFvM023808;
 Mon, 21 Sep 2020 20:44:20 GMT
Received: from [10.74.86.189] (/10.74.86.189)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 21 Sep 2020 13:44:14 -0700
Subject: Re: [PATCH 6/6] x86/xen: open code alloc_vm_area in arch_gnttab_valloc
To: Christoph Hellwig <hch@lst.de>, Andrew Morton <akpm@linux-foundation.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Minchan Kim <minchan@kernel.org>, Nitin Gupta <ngupta@vflare.org>,
 x86@kernel.org, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org
References: <20200918163724.2511-1-hch@lst.de>
 <20200918163724.2511-7-hch@lst.de>
From: boris.ostrovsky@oracle.com
Organization: Oracle Corporation
Message-ID: <0833b9a8-5096-d105-a850-1336150eada1@oracle.com>
Date: Mon, 21 Sep 2020 16:44:10 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.2.1
MIME-Version: 1.0
In-Reply-To: <20200918163724.2511-7-hch@lst.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9751
 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 malwarescore=0
 mlxscore=0 suspectscore=2 adultscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009210152
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9751
 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 malwarescore=0
 suspectscore=2 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1011
 mlxlogscore=999 bulkscore=0 mlxscore=0 phishscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009210152
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


On 9/18/20 12:37 PM, Christoph Hellwig wrote:
>  
> +static int gnttab_apply(pte_t *pte, unsigned long addr, void *data)
> +{
> +	pte_t ***p = data;
> +
> +	**p = pte;
> +	(*p)++;
> +	return 0;
> +}
> +
>  static int arch_gnttab_valloc(struct gnttab_vm_area *area, unsigned nr_frames)
>  {
>  	area->ptes = kmalloc_array(nr_frames, sizeof(*area->ptes), GFP_KERNEL);
>  	if (area->ptes == NULL)
>  		return -ENOMEM;
> -
> -	area->area = alloc_vm_area(PAGE_SIZE * nr_frames, area->ptes);
> -	if (area->area == NULL) {
> -		kfree(area->ptes);
> -		return -ENOMEM;
> -	}
> -
> +	area->area = get_vm_area(PAGE_SIZE * nr_frames, VM_IOREMAP);
> +	if (!area->area)
> +		goto out_free_ptes;
> +	if (apply_to_page_range(&init_mm, (unsigned long)area->area->addr,
> +			PAGE_SIZE * nr_frames, gnttab_apply, &area->ptes))


This will end up incrementing area->ptes pointer. So perhaps something like


pte_t **ptes = area->ptes;

if (apply_to_page_range(&init_mm, (unsigned long)area->area->addr,
                        PAGE_SIZE * nr_frames, gnttab_apply, &ptes)) {

       ...

}


-boris

