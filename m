Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EEA8C53219
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2026 11:35:08 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1372397.1619744 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wog59-00084f-3w; Tue, 28 Jul 2026 11:34:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1372397.1619744; Tue, 28 Jul 2026 11:34:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wog59-00084Y-0m; Tue, 28 Jul 2026 11:34:47 +0000
Received: by outflank-mailman (input) for mailman id 1372397;
 Tue, 28 Jul 2026 11:34:45 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmitry.baryshkov@oss.qualcomm.com>)
 id 1wog57-00084S-Ku
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 11:34:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wog57-004Jg6-1T
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 13:34:45 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmitry.baryshkov@oss.qualcomm.com>)
 id 6a6893d2-bab6-0a2a0a5309dd-0a2a4501e6c2-6
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 13:34:44 +0200
Received: from [205.220.180.131] (helo=mx0b-0031df01.pphosted.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmitry.baryshkov@oss.qualcomm.com>)
 id 6a6893d3-5984-0a2a45010019-cddcb4834248-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 13:34:44 +0200
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66SBHMZB2482996
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 11:34:42 GMT
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpq9hh689-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 11:34:42 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-51c19493ac2so55059831cf.1
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 04:34:42 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5b2be090b6asm1974708e87.36.2026.07.28.04.34.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jul 2026 04:34:40 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=qcppdkim1 header.d=qualcomm.com header.i="@qualcomm.com" header.h="Cc:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=google header.d=oss.qualcomm.com header.i="@oss.qualcomm.com" header.h="In-Reply-To:Content-Disposition:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Gbo+tER6P2agi65+IoK11DMG
	JudcKhnoP053vnEPwzE=; b=TpNp3W2Oolckm9QwP32Ki0zrr3+eXlkVSRJxgTpc
	dOvS4kJVGPq8EpW3KdYCXMC6GL21HF1+SUxsIUEY+50un8chx1Q20NBl0s/w2lpb
	tdMvRzHZuuYefLKBTi/YahSW9JEBDT3i9Fn4e/bqTnn13ikgHOnw2oCky9nfjykS
	iOgcNvdevzotQWJXvlG9qz7WUQTpv/Y51/bss4rCCAW45ipiUdj2eBeybrv7qr5t
	AWbKT+X+x++79ZHApw0NKIP/IK0MjrDEbruHOHP5Ew7tmrTiuUiG5YyOntpDHsKu
	sO+oYyE+1kH+pPVHC9jns2tXo5A3YU2Ky2cNf7TtxYzvgg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785238482; x=1785843282; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Gbo+tER6P2agi65+IoK11DMGJudcKhnoP053vnEPwzE=;
        b=heEg9j4u7MLJEHSv4WnJt17ui8Wx4pUSYKySHBE4N3D9dXuFCOl06A0knQdnu5LkF5
         dUWsk6S2uwE8FRv+3HQe/mnBE4ufA+hwhGt7sZn6NVDRSIaMcks3tTHsyj/sTHXYRqfk
         3K1vKHx4NNaBm8flHl2wZ91ePMYfnfnafS24c9375oAaJl5UYZIWlxYXzBTSXK0EC7mq
         QWEkdBGWY05KGVZZOyIyn21BcNDY3G12yRQFTtZPZYAVdhduiy8zpAzv4ljWIhiwIjsN
         yUJNbyx7nydlSqv9noi75wgeqQ1r87/2oBhPuk2CiCT+GW4di3p+6i531z8HIhLwt+tX
         FUjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785238482; x=1785843282;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gbo+tER6P2agi65+IoK11DMGJudcKhnoP053vnEPwzE=;
        b=LBgaygmTszvWyVrOX4GxGjQXej67cGex+6mTsZejYf448SmcujWhnc6SBcMy1aV4Uw
         nd8Idjv7aH6Zn4S2ryel4NJSvX8qwkNxM+wNh7WCZfam7V0qcgs4XRPsVtfLP/vd/W9P
         AFxyekZ5CDJoWItrfXGz82r9H3cJb/xcRJ8CTptXQ/1HEykNCHpewd9XeJMizZA889oI
         1T9wBnarJCWESWxqqCzk2bN6/3XJ3Z4ylPJJApa0vz8WUbFh+NgULORcH3MvUnYk89yE
         3XhgonROl5BZ1++D9HnF6w0EzHbgVxNtiRuTpdbuKxK9X0NH6PlkzKpNpLBEEtr1/1dm
         OSWA==
X-Forwarded-Encrypted: i=1; AHgh+Rod7DbuRoowikOyzmpAglHXG1fEcz0obHnNRH3G/IQdUWXoXN7TMdXk6s2xCsGqCv80HE+pzqr/Ruo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw+bl5Ag7HYoHS5WCxwiWdaBVXrnObtU9rCdsLOdQzVse8brpoT
	913zwg/nLYBWQP9RqfocjmTPNkpoO92k3I5ww84G8MOh07+v/rpd0RO+v/Jy++vlWl7L4mbkq84
	7/AfL0qCLkwHwVaS2MCmLZQ/3PdhuE4zKhCebQTZ/oRx93L5jkEvHGo+NCONT7h7SPOa/ug==
X-Gm-Gg: AR+sD13OzW/myjnYGqO65VwmkZhF1jnk4JcHYiKEAOse61y9/47GvGr7aPNYmi2pFu3
	JnrUdcqMp2ubFmGF79aPMdXcskqyNaVFdny7vA172b9GXhVWmS+d58Iu910Fadv0UmqLlm+UNfl
	Eb7DMh55DSKHSXORIc8bmZTivn1o6B39sw09E8P877s9GV+VVtz0ATIXAWKlgQHw/aJROczK9Pt
	ikxKOB8KA06AESC455aFK+E1LqZh5+X2TJFldhFHAg+mG52PoGuk1vSmk3gLJv5Zkw8hN9ie6EZ
	SieiLCD/gZpbDDFMqOXkkT7ZVsVbialTkhXL+iOjJrx/husRPhMjcx9m5rSjgckfG7ytz9owdzU
	vF0sOItda9G+KzyNtQKcIs/wHjsCRBM9aHRLb1Uu/AKeOuzDNHHoX4n8tj3pC8bQzCiNgUbWi0j
	Q0tIr70pICtWJ6WA==
X-Received: by 2002:a05:622a:138e:b0:528:320b:305e with SMTP id d75a77b69052e-529d6feab04mr15912781cf.35.1785238482071;
        Tue, 28 Jul 2026 04:34:42 -0700 (PDT)
X-Received: by 2002:a05:622a:138e:b0:528:320b:305e with SMTP id d75a77b69052e-529d6feab04mr15912161cf.35.1785238481464;
        Tue, 28 Jul 2026 04:34:41 -0700 (PDT)
Date: Tue, 28 Jul 2026 14:34:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>,
        Nipun Gupta <nipun.gupta@amd.com>,
        Nikhil Agarwal <nikhil.agarwal@amd.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Richard Zhu <hongxing.zhu@nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Juergen Gross <jgross@suse.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-pci@vger.kernel.org,
        imx@lists.linux.dev, xen-devel@lists.xenproject.org,
        Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
Subject: Re: [PATCH v16 3/3] of: Respect #{iommu,msi}-cells in maps
Message-ID: <fuqnxdknkajqotzmmlknwnthqpku7as5kpvmgogexl5bi7x6y4@tthbasf5lqvc>
References: <20260603-parse_iommu_cells-v16-0-dc509dacb19a@oss.qualcomm.com>
 <20260603-parse_iommu_cells-v16-3-dc509dacb19a@oss.qualcomm.com>
 <3f5c974f-425d-47a5-9fda-e05de1f39d79@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3f5c974f-425d-47a5-9fda-e05de1f39d79@linaro.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDEwMiBTYWx0ZWRfXx4aFZijdDnZV
 kwusz6uVa/oCoFkJPJitgcZxVCzsOAKfDGkeELSx6nmNRYaEMemPVZj214kMEVhm9c20xzd1Vui
 Wh2QltQPb8CCOyiVUUYwfx6kYuENmOw=
X-Proofpoint-GUID: K15ILiHgqwl9YfwDn6Y-yu_m9MC4jyIm
X-Proofpoint-ORIG-GUID: K15ILiHgqwl9YfwDn6Y-yu_m9MC4jyIm
X-Authority-Analysis: v=2.4 cv=Aa6B2XXG c=1 sm=1 tr=0 ts=6a6893d2 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=7CQSdrXTAAAA:8
 a=EUspDBNiAAAA:8 a=wdqIz0_Y7svv89iKmCwA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDEwMiBTYWx0ZWRfXymEKIBBOBYD/
 KnaS1UtRUtFVfCdKvPcr3/9zxHBU0aJfsrf1srHMB36tc3ujsgdF50AuQGZjo3E83ATNZvQ26ko
 wJmuDOSjysTifyxkeJW6K6JV76uZsUklAH4JS0ppNL6JrOVJYY7si2rEIeHbNAQit51ijwHWkZb
 5soXCr2apgoR6dc93fb8Yn0Pj+DWEwSwHBDk+qJql7SL3j7ipGb+W1pd49orupU7X1NP5N0PvWS
 N+Wc4s2LmI9HHx3Rc970NkXi64KmXdfjbk0z6oYFSlLVeKDEZwRPLE5OqcFsyGCCEiKUsBfJkYG
 nN8zzCwrDLqGaDxls3oSPThHsZPJUKOT5CbtENDejKLXVQcMxUefk+ZM0N03GE351EVjm6Sme/J
 3VVBn7bVihA0WAHlnV1bTAtyEZ/ux5MbZyBCFYBEtID2mPMVm4wlqHI3fdiMqM6txJjnqhp8qUB
 R0+VlCMZLTkZaljzyGg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_03,2026-07-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 phishscore=0 malwarescore=0 clxscore=1011
 lowpriorityscore=0 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280102
X-purgate-ID: tlsNG-d62444/1785238484-BF86F757-53343BE6/0/0
X-purgate-type: clean
X-purgate-size: 2793

On Thu, Jul 23, 2026 at 03:17:24PM +0200, Neil Armstrong wrote:
> Hi,
> 
> On 6/3/26 09:13, Vijayanand Jitta wrote:
> > From: Robin Murphy <robin.murphy@arm.com>
> > 
> > So far our parsing of {iommu,msi}-map properties has always blindly
> > assumed that the output specifiers will always have exactly 1 cell.
> > This typically does happen to be the case, but is not actually enforced
> > (and the PCI msi-map binding even explicitly states support for 0 or 1
> > cells) - as a result we've now ended up with dodgy DTs out in the field
> > which depend on this behaviour to map a 1-cell specifier for a 2-cell
> > provider, despite that being bogus per the bindings themselves.
> > 
> > Since there is some potential use in being able to map at least single
> > input IDs to multi-cell output specifiers (and properly support 0-cell
> > outputs as well), add support for properly parsing and using the target
> > nodes' #cells values, albeit with the unfortunate complication of still
> > having to work around expectations of the old behaviour too.
> > 
> > Since there are multi-cell output specifiers, the callers of of_map_id()
> > may need to get the exact cell output value for further processing.
> > Update of_map_id() to set args_count in the output to reflect the actual
> > number of output specifier cells.
> > 
> > Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> > Signed-off-by: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
> > Signed-off-by: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
> > ---
> >   drivers/of/base.c  | 168 +++++++++++++++++++++++++++++++++++++++++------------
> >   include/linux/of.h |   6 +-
> >   2 files changed, 135 insertions(+), 39 deletions(-)
> > 
> > diff --git a/drivers/of/base.c b/drivers/of/base.c
> > index d658c2620135..ac7961cbab94 100644
> > --- a/drivers/of/base.c
> > +++ b/drivers/of/base.c
> > @@ -2116,19 +2116,49 @@ int of_find_last_cache_level(unsigned int cpu)
> >   	return cache_level;
> >   }
> > +/*
> > + * Some DTs have an iommu-map targeting a 2-cell IOMMU node while
> > + * specifying only 1 cell. Fortunately they all consist of value '1'
> > + * as the 2nd cell entry with the same target, so check for that pattern.
> > + *
> > + * Example:
> > + *	IOMMU node:
> > + *		#iommu-cells = <2>;
> > + *
> > + *	Device node:
> > + *		iommu-map = <0x0000 &smmu 0x0000 0x1>,
> > + *			    <0x0100 &smmu 0x0100 0x1>;
> 
> So the sm8650 PCIe controllers has:
> 
> pcie@1c08000:
> 			iommu-map = <0     &apps_smmu 0x1480 0x1>,
> 				    <0x100 &apps_smmu 0x1481 0x1>;

To silence the warning, update the iommu maps to:

			iommu-map = <0     &apps_smmu 0x1480 0x0 0x1>,
				    <0x100 &apps_smmu 0x1481 0x0 0x1>;


-- 
With best wishes
Dmitry

