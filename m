Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98824C624D6
	for <xen-devel@archiver.kernel.org>; Thu,  3 Sep 2026 15:03:44 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1407436.1640524 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x28yI-00079H-9m; Thu, 03 Sep 2026 15:03:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1407436.1640524; Thu, 03 Sep 2026 15:03:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x28yI-00079A-6x; Thu, 03 Sep 2026 15:03:22 +0000
Received: by outflank-mailman (input) for mailman id 1407436;
 Thu, 03 Sep 2026 15:03:21 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <steve.wahl@hpe.com>) id 1x28yE-000794-U0
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 15:03:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x28yD-0048ez-TX
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 17:03:17 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <steve.wahl@hpe.com>)
 id 6a998c25-2eae-0a2a0a5409dd-0a2a4503c6f0-44
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 17:03:12 +0200
Received: from [148.163.147.86] (helo=mx0a-002e3701.pphosted.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <steve.wahl@hpe.com>)
 id 6a998c2e-fae8-0a2a45030019-94a39356b20e-3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 17:03:11 +0200
Received: from pps.filterd (m0134421.ppops.net [127.0.0.1])
 by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 683DC2CB2638187; Thu, 3 Sep 2026 15:02:42 GMT
Received: from p1lg14881.it.hpe.com (p1lg14881.it.hpe.com [16.230.97.202])
 by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4gf9easqk8-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Thu, 03 Sep 2026 15:02:42 +0000 (GMT)
Received: from p1lg14885.dc01.its.hpecorp.net (unknown [10.119.18.236])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by p1lg14881.it.hpe.com (Postfix) with ESMTPS id 1DE43806B11;
 Thu,  3 Sep 2026 15:02:30 +0000 (UTC)
Received: from swahl-home.5wahls.com (unknown [16.231.227.39])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (Client did not present a certificate)
 by p1lg14885.dc01.its.hpecorp.net (Postfix) with ESMTPS id 947A6804D13;
 Thu,  3 Sep 2026 15:02:26 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=pps0720 header.d=hpe.com header.i="@hpe.com" header.h="Cc:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps0720; bh=6TAteaV3/Nh3xyO8rweCVU4LF2
	M9k1ERu5CdY2OPHF8=; b=RkG3JGUfihRR+cJ8YXXVtmF8EDz0rk9vtdI0qkgnCr
	KByWQ6Yn7es8zEketN67z6HcIOjrf2T+CYij5Wl1x2Evl64YQgUwLrbOxZKnCV4j
	UaD10sRn/DmuE48xTbmoT9Z1GXcNv9S5/KDDCCU7tcEMJA2RTntWnZFIdF80LJT4
	vYw7KmAvZ9kqYxf+S4WxJZSFr5nh8OVggqljNUc9JW1+5ZpUDbv7Bx0fqOApM+fL
	yM2hwQPT9lq6WSvo9VzcKVaRtWECxTCdZe4vTuWcKqu6M1DdoCxPIB661BQ0tjDa
	nfcoubf9v8JItVmqbnQIOy/Ys5jrgSU8rUk/tcIyfPAQ==
Date: Thu, 3 Sep 2026 10:02:24 -0500
From: Steve Wahl <steve.wahl@hpe.com>
To: Daniil Tatianin <d-tatianin@yandex-team.ru>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        Daniil Tatianin <99danilt@gmail.com>, "H. Peter Anvin" <hpa@zytor.com>,
        Steve Wahl <steve.wahl@hpe.com>, Justin Ernst <justin.ernst@hpe.com>,
        Kyle Meyer <kyle.meyer@hpe.com>,
        Dimitri Sivanich <dimitri.sivanich@hpe.com>,
        Russ Anderson <russ.anderson@hpe.com>, Juergen Gross <jgross@suse.com>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] x86/apic: Remove dead disable_esr machinery
Message-ID: <apmMACewurxfEIM4@swahl-home.5wahls.com>
References: <20260902220124.2931854-1-d-tatianin@yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260902220124.2931854-1-d-tatianin@yandex-team.ru>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDEzMSBTYWx0ZWRfXzl0gP59njn+0
 O+jTJY1gjEqhGkSbF5NnrvLif0btpqRDfsySduIvfoTlLTLoYfZ7lI0bjFDDeo2t265Hxt/y+Yk
 82IvK34GeTEXpTjeWTiZpKWpye0Y66LUzILkICdCsWW4GW0ewSTRDgS5Me5SxT4WGZ0KQJL/3KX
 YCSV3BP/wZsTpy9ERf51YovIRaKYXcov/L06M4UDAcFByPLOa7iR/NINkTESdxuW9z4Lp687Or2
 703YATDyRl5tK3sZkZ7UKZFJ/x7Qny+vreovcX20T/GQ3xQfXss6VzvaFdSmuJmrig7M5PZedtt
 ka1BSn1iN5DvHMZISr8egkMTyNwpzhvG5eSj+t2RjCNUMqay0nlOCyggflAy5DQslkyVB9GQ+HR
 8gcwsVD/raOGpwYR0pgF7atSje01laawPLedOCHK72SGfQwdVzz1FM6bij+goSmND+i+hlRXPg+
 PtlHGBENFImzXggN+hA==
X-Proofpoint-GUID: KRbW7X3Xe2iRh7ECSVMrgjSsOhtLl8wD
X-Authority-Analysis: v=2.4 cv=Ws8b99fv c=1 sm=1 tr=0 ts=6a998c12 cx=c_pps
 a=FAnPgvRYq/vnBSvlTDCQOQ==:117 a=FAnPgvRYq/vnBSvlTDCQOQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=gQcMVamqm3wCPoSYhaRC:22 a=ay80y3fxfMS_JZZz1qJy:22 a=pGLkceISAAAA:8
 a=6R7veym_AAAA:8 a=MvuuwTCpAAAA:8 a=NplOCkrURqmMbNQE9EIA:9 a=CjuIK1q_8ugA:10
 a=ILCOIF4F_8SzUMnO7jNM:22
X-Proofpoint-ORIG-GUID: KRbW7X3Xe2iRh7ECSVMrgjSsOhtLl8wD
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDEzMSBTYWx0ZWRfXz2ORE9b1HUyF
 lz4pQx+2MQY25VsJoPkhml4i1XtXcF2mMwlFlByyBlDylHNtfbOJ/ymuM0jnE2QlqTjC07OLI7z
 BGQ/mmLPi1+sv2xbrAfivFTHh1HMlA0=
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 clxscore=1011 suspectscore=0
 adultscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030131
X-purgate-ID: tlsNG-33051d/1788447792-76EF74E9-86362B09/0/0
X-purgate-type: clean
X-purgate-size: 1165

On Thu, Sep 03, 2026 at 01:01:23AM +0300, Daniil Tatianin wrote:
> From: Daniil Tatianin <99danilt@gmail.com>
> 
> apic::disable_esr was a quirk for the 32-bit NUMA-Q, Summit, ES7000 and
> bigsmp platforms, which left the local APIC error status register alone
> because "something untraceable" produced bad interrupts on those
> machines. NUMA-Q, Summit and ES7000 went away in 2014 with commit
> b5660ba76b41 ("x86, platforms: Remove NUMAQ"), commit 7cf6c94591bb
> ("x86, apic: Remove support for IBM Summit/EXA chipset") and commit
> 58f5d2d44883 ("x86, apic: Remove support for ia32-based Unisys ES7000"),
> and the last setter went with commit 0abf508675c0 ("x86/smp: Drop
> 32-bit "bigsmp" machine support"). Every remaining APIC driver
> initializes the flag to zero.
> 
> Remove the flag, the ESR setup bypass keyed on it and the 32-bit only
> ESR clearing hammer in setup_local_APIC(), which was gated on the same
> flag and therefore equally dead.
> 
> No functional changes.
> 
> Signed-off-by: Daniil Tatianin <d-tatianin@yandex-team.ru>

Acked-by: Steve Wahl <steve.wahl@hpe.com>


-- 
Steve Wahl, Hewlett Packard Enterprise

