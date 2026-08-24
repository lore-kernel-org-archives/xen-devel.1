Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3220C5DF81
	for <xen-devel@archiver.kernel.org>; Mon, 24 Aug 2026 14:24:22 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1398882.1635131 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wyVao-0006c8-Hz; Mon, 24 Aug 2026 14:24:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1398882.1635131; Mon, 24 Aug 2026 14:24:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wyVao-0006c0-ER; Mon, 24 Aug 2026 14:24:06 +0000
Received: by outflank-mailman (input) for mailman id 1398882;
 Mon, 24 Aug 2026 14:24:05 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jjherne@linux.ibm.com>) id 1wyVan-0006bu-B3
 for xen-devel@lists.xenproject.org; Mon, 24 Aug 2026 14:24:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wyVal-00F213-VZ
 for xen-devel@lists.xenproject.org; Mon, 24 Aug 2026 16:24:04 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jjherne@linux.ibm.com>)
 id 6a8c53f1-8faa-0a2a0a5109dd-0a2a45018bde-38
 for <xen-devel@lists.xenproject.org>; Mon, 24 Aug 2026 16:24:03 +0200
Received: from [148.163.158.5] (helo=mx0b-001b2d01.pphosted.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jjherne@linux.ibm.com>)
 id 6a8c53fe-5984-0a2a45010019-94a39e057790-3
 for <xen-devel@lists.xenproject.org>; Mon, 24 Aug 2026 16:23:59 +0200
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67OD1eKp826579; Mon, 24 Aug 2026 14:23:46 GMT
Received: from ppma12.dal12v.mail.ibm.com
 (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4g726e9xgr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Aug 2026 14:23:45 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
 by ppma12.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 67OEBK0g007232;
 Mon, 24 Aug 2026 14:23:44 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([172.16.1.72])
 by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4g7p3pxn38-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Aug 2026 14:23:44 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com
 [10.241.53.105])
 by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 67OENgFt31457946
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Aug 2026 14:23:43 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CE46058065;
 Mon, 24 Aug 2026 14:23:42 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1206458061;
 Mon, 24 Aug 2026 14:23:41 +0000 (GMT)
Received: from [0.0.0.0] (unknown [9.61.159.18])
 by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Mon, 24 Aug 2026 14:23:40 +0000 (GMT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=pp1 header.d=ibm.com header.i="@ibm.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=snuerj
	iE6rg8DooF2vkNelHRwkN/IsrVBTzEqx2GOVo=; b=DKIPCW/STZ4s7EAhBy0b69
	5hdZHTRnsVULSxXVMjdnB4p305f7CYZ70YfCOFL8oMj56/uYL9RBQmMUL6lAIRmp
	Hqgu/lTbvqpOT3jyNn0gCIIYGttPcKCK2wEjV5LwIi57LJuDqeFSBlktEK/QNcvU
	xmGXRTCmCkur+pmc+WKz/kUn0efxNZXumSeda0q8xcMK2oSuHJle9TijkGQQ9jAQ
	31mLoTV/S1AyRx0v3PfSR67zc+crl1PGulzU4kJvYIgTjBu3wKAoeV7tWsqXkZkS
	mhtjGjKp0cSJRZjFOqE0/BcqqoG1Vz9Z4KdwSX7K+qIBVEHLJYzbw3Z+dVGliiFg
	==
Message-ID: <e0d602cf-012f-4e1b-a7a9-a17724e80d96@linux.ibm.com>
Date: Mon, 24 Aug 2026 09:51:29 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] qdev: Add force argument to qdev_unplug
To: Dongli Zhang <dongli.zhang@oracle.com>, qemu-devel@nongnu.org,
        qemu-s390x@nongnu.org, xen-devel@lists.xenproject.org
Cc: dave@treblig.org, mst@redhat.com, imammedo@redhat.com, anisinha@redhat.com,
        philmd@mailo.com, aurelien@aurel32.net, mjrosato@linux.ibm.com,
        alifm@linux.ibm.com, farman@linux.ibm.com,
        richard.henderson@linaro.org, iii@linux.ibm.com, david@kernel.org,
        pasic@linux.ibm.com, borntraeger@linux.ibm.com, cohuck@redhat.com,
        alex@shazbot.org, clg@redhat.com, akrowiak@linux.ibm.com,
        sstabellini@kernel.org, anthony@xenproject.org,
        edgar.iglesias@gmail.com, pbonzini@redhat.com, berrange@redhat.com,
        eblake@redhat.com, armbru@redhat.com, joe.jin@oracle.com
References: <20260824011420.752806-1-dongli.zhang@oracle.com>
 <20260824011420.752806-2-dongli.zhang@oracle.com>
Content-Language: en-US
From: "Jason J. Herne" <jjherne@linux.ibm.com>
In-Reply-To: <20260824011420.752806-2-dongli.zhang@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=TfimcxQh c=1 sm=1 tr=0 ts=6a8c53f2 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=V8glGbnc2Ofi9Qvn3v5h:22 a=VnNF1IyMAAAA:8
 a=FruuJEGAiHTvyaHKMgMA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDExOCBTYWx0ZWRfX/sGe/3QdJoQm
 qPzp0gLAcfanbJPTl1nR4nUu/o1R9m2DvR2DzEOnuZ2rrrhasEpaA6zrcjQBZ261SaYqBRtAm1J
 MLG90I/dS1ECTlDlzr3tqrZpf+GfOvw=
X-Proofpoint-GUID: XiL9O1weRXIWbPKfJOeN-9rFunGOTdur
X-Proofpoint-ORIG-GUID: ZlIk7Ysfmegwkpi-yzgmKjQdmmBW57Ng
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDExOCBTYWx0ZWRfX6qxJAEXyn3y7
 n59RSs33gjCun9mhaKmZCCvuSN60lT8xFfj1cU/xGRHFo4u2wzhIoOC0Qj1c0LwU0XQEzxhugY+
 2N+0HTRai78ltEAf1Jp++opGT8zPdvvc/6lX/K0nlBbYSKxaqiUlp/rQbOlTAN0riExHvql2ZnX
 +Xk7WZ5NCJlf/Ryx9T1jbiM08INw1BMmOGgpWwEJoRmUeputjaehKPzPklHN3xT2YVxW3lyxQNk
 IzFWhAknDyN8tVZOERBdceVRXSGaHbij/0qPM/Hs8WAAm76JH1JhOSCUH/WV8ugpfvPp9pUblA0
 uNERqKsGuCVs1eaYr8HHqKYWQyXTAI1ceh0VnSk8uXIpNnom39xuNaVmDA7gpXiNUa9usRjvxOF
 qiZNlJOH9XvM+6wTTF5+f+p/c/o19+Wcl3Ugq7dlRdXgqgjgV6oPCj6E02Gz21sgzgAQig1uyjo
 V2/kWGVPrZs0i1DePKA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_04,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1011 phishscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240118
X-purgate-ID: tlsNG-d62444/1787581439-1D272757-112CE8CD/0/0
X-purgate-type: clean
X-purgate-size: 537



On 8/23/26 9:13 PM, Dongli Zhang wrote:
> ...
> diff --git a/hw/vfio/ap.c b/hw/vfio/ap.c
> index 6e2a1223ea..8e7c72dc8b 100644
> --- a/hw/vfio/ap.c
> +++ b/hw/vfio/ap.c
> @@ -79,7 +79,7 @@ static void vfio_ap_req_notifier_handler(void *opaque)
>           return;
>       }
>   
> -    qdev_unplug(DEVICE(vapdev), &err);
> +    qdev_unplug(DEVICE(vapdev), false, &err);
>   
>       if (err) {
>           warn_reportf_err(err, VFIO_MSG_PREFIX, vapdev->vdev.name);
Reviewed-by: Jason J. Herne <jjherne@linux.ibm.com>

