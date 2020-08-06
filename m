Return-Path: <SRS0=cbMO=BQ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8438C433E0
	for <xen-devel@archiver.kernel.org>; Thu,  6 Aug 2020 12:01:45 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 799CC22D0B
	for <xen-devel@archiver.kernel.org>; Thu,  6 Aug 2020 12:01:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="eKiFr4Bs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 799CC22D0B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k3c1t-00016c-Hj; Thu, 06 Aug 2020 09:17:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zvyT=BQ=oracle.com=dan.carpenter@srs-us1.protection.inumbo.net>)
 id 1k3c1s-00016X-GN
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2020 09:17:40 +0000
X-Inumbo-ID: b16f0903-b9ee-4fed-8855-6bd9964c2b6c
Received: from userp2130.oracle.com (unknown [156.151.31.86])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b16f0903-b9ee-4fed-8855-6bd9964c2b6c;
 Thu, 06 Aug 2020 09:17:39 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0769DMXU134762;
 Thu, 6 Aug 2020 09:17:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=1mPUi5W2MorAFmoBzG9tPbGD54xKE1Byrx1RzDX0UmU=;
 b=eKiFr4Bs/bpWdX6yLxeMc5sFEBJ30+bhMqjEFXaCXU9wW5n47PIATToBiWpr+CLVaKDP
 8A0tZz0TZdkw0tEIcpW0won99EJYkQ61jOuiGMnuepmHxUSOsxqA5JJ5wKYcJVq9OHaq
 pBALBvxS0QXNV4kM/rwuYDhi3OakRkd3/PSjnbSO/1A48svKmA+oG131xfSZev+LJtub
 qaecgcJ+E6qYTHY8Lb+CsIAGpJ7PEWqQfkjE/RVUhkE/V9xIB61oP9mBuPunQR0qJtkJ
 7UQpAp1LRsK/9rfQca8fG0SveJMrEtCLE+oBzPX+VjLOeCGIz1EAujV989TnlId5PiMo fg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 32r6gwssfh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 06 Aug 2020 09:17:29 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0769CwME158826;
 Thu, 6 Aug 2020 09:17:28 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3020.oracle.com with ESMTP id 32pdnvtwtd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 06 Aug 2020 09:17:28 +0000
Received: from abhmp0007.oracle.com (abhmp0007.oracle.com [141.146.116.13])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0769HI56012706;
 Thu, 6 Aug 2020 09:17:18 GMT
Received: from kadam (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 06 Aug 2020 02:17:17 -0700
Date: Thu, 6 Aug 2020 12:17:09 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Oleksandr Andrushchenko <andr2000@gmail.com>
Subject: Re: [PATCH 2/6] drm/xen-front: Fix misused IS_ERR_OR_NULL checks
Message-ID: <20200806091709.GU5493@kadam>
References: <20200731125109.18666-1-andr2000@gmail.com>
 <20200731125109.18666-3-andr2000@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200731125109.18666-3-andr2000@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9704
 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0 mlxscore=0
 bulkscore=0 adultscore=0 phishscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2008060065
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9704
 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 bulkscore=0 spamscore=0
 impostorscore=0 mlxscore=0 mlxlogscore=999 adultscore=0 priorityscore=1501
 phishscore=0 clxscore=1011 suspectscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2008060065
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
Cc: jgross@suse.com, sstabellini@kernel.org,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, airlied@linux.ie,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, daniel@ffwll.ch,
 xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Looks great!  Thanks.

Reviewed-by: Dan Carpenter <dan.carpenter@oracle.com>

regards,
dan carpenter


