Return-Path: <SRS0=p1A9=2C=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A148BC43603
	for <xen-devel@archiver.kernel.org>; Thu, 12 Dec 2019 18:30:36 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 787822073D
	for <xen-devel@archiver.kernel.org>; Thu, 12 Dec 2019 18:30:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="htkMrFA6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 787822073D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifTEE-00007Y-VH; Thu, 12 Dec 2019 18:30:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=oKAs=2C=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1ifTEC-00007K-Qb
 for xen-devel@lists.xenproject.org; Thu, 12 Dec 2019 18:30:20 +0000
X-Inumbo-ID: 6cbda6fa-1d0d-11ea-88e7-bc764e2007e4
Received: from userp2130.oracle.com (unknown [156.151.31.86])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6cbda6fa-1d0d-11ea-88e7-bc764e2007e4;
 Thu, 12 Dec 2019 18:30:08 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xBCILdfF065095;
 Thu, 12 Dec 2019 18:30:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2019-08-05;
 bh=jdYlNasovEzctO/D5dYLkQh+fKQP1bnYDPj0kFsSE5Y=;
 b=htkMrFA6M2V9m5APanf/ZIvNE8zC7AMFkbbGOotIifbreTkA3TBSx/0WrO8SuSHABDUH
 jE377f7BFwyhyqaUCQyix3dvagOgRJp2WAQKIlADlNo7npkYronyB4+R26QtxXFh19S6
 ewEJzhhMtckB7fhPUmf1PcL46S3uE57/2rGOolAhouMHtQp+KveiV9JmkbQWYiQN2eqt
 +QqkDXRLyn3d4a4oBQ6RLjKfoulqddfv7rjeRACb96hONymMDhqWXdVlnt3wx/u+Jhx3
 Z5lwpwM5vIaLhpRdjSAK5sNBnnSa07A7rUbJ3v4p3J8EDq9aTLLVl84K2YlzeeOeOhCR 5A== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2130.oracle.com with ESMTP id 2wrw4nhnr4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 12 Dec 2019 18:30:07 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xBCILFq9146342;
 Thu, 12 Dec 2019 18:30:06 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3020.oracle.com with ESMTP id 2wums9tawx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 12 Dec 2019 18:30:06 +0000
Received: from abhmp0003.oracle.com (abhmp0003.oracle.com [141.146.116.9])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id xBCIU5Rx017566;
 Thu, 12 Dec 2019 18:30:05 GMT
Received: from bostrovs-us.us.oracle.com (/10.152.32.65)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 12 Dec 2019 10:30:05 -0800
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org
References: <20191212141750.1896-1-jgross@suse.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <65142ae8-66ff-56f5-b2ca-9791c6c47289@oracle.com>
Date: Thu, 12 Dec 2019 13:30:04 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20191212141750.1896-1-jgross@suse.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9469
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-1912120141
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9469
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-1912120141
Subject: Re: [Xen-devel] [PATCH] xen/balloon: fix ballooned page accounting
 without hotplug enabled
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAxMi8xMi8xOSA5OjE3IEFNLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+IFdoZW4gQ09ORklH
X1hFTl9CQUxMT09OX01FTU9SWV9IT1RQTFVHIGlzIG5vdCBkZWZpbmVkCj4gcmVzZXJ2ZV9hZGRp
dGlvbmFsX21lbW9yeSgpIHdpbGwgc2V0IGJhbGxvb25fc3RhdHMudGFyZ2V0X3BhZ2VzIHRvIGEK
PiB3cm9uZyB2YWx1ZSBpbiBjYXNlIHRoZXJlIGFyZSBzdGlsbCBzb21lIGJhbGxvb25lZCBwYWdl
cyBhbGxvY2F0ZWQgdmlhCj4gYWxsb2NfeGVuYmFsbG9vbmVkX3BhZ2VzKCkuCj4KPiBUaGlzIHdp
bGwgcmVzdWx0IGluIGJhbGxvb25fcHJvY2VzcygpIG5vIGxvbmdlciBiZSB0cmlnZ2VyZWQgd2hl
bgo+IGJhbGxvb25lZCBwYWdlcyBhcmUgZnJlZWQgaW4gYmF0Y2hlcy4KPgo+IFJlcG9ydGVkLWJ5
OiBOaWNob2xhcyBUc2lyYWtpcyA8bmlrby50c2lyYWtpc0BnbWFpbC5jb20+Cj4gU2lnbmVkLW9m
Zi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgoKUmV2aWV3ZWQtYnk6IEJvcmlz
IE9zdHJvdnNreSA8Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5jb20+CgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
