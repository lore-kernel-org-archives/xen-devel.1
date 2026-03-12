Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB976105A58D
	for <xen-devel@archiver.kernel.org>; Thu, 12 Mar 2026 11:42:21 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1252166.1548929 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0eQX-0005hL-U8; Thu, 12 Mar 2026 11:42:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1252166.1548929; Thu, 12 Mar 2026 11:42:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0eQX-0005hE-RB; Thu, 12 Mar 2026 11:42:05 +0000
Received: by outflank-mailman (input) for mailman id 1252166;
 Thu, 12 Mar 2026 11:42:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DV6w=BM=oss.qualcomm.com=vijayanand.jitta@srs-se1.protection.inumbo.net>)
 id 1w0eQW-0005h8-Lt
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2026 11:42:04 +0000
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7c08d6a5-1e08-11f1-b164-2bf370ae4941;
 Thu, 12 Mar 2026 12:42:02 +0100 (CET)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 62C7e1Ri509757
 for <xen-devel@lists.xenproject.org>; Thu, 12 Mar 2026 11:42:01 GMT
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cus9w0m7a-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 12 Mar 2026 11:42:00 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-2aea7747aeeso10846265ad.2
 for <xen-devel@lists.xenproject.org>; Thu, 12 Mar 2026 04:42:00 -0700 (PDT)
Received: from [192.168.1.10] ([38.254.186.229])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2aeae22217dsm53886225ad.4.2026.03.12.04.41.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Mar 2026 04:41:58 -0700 (PDT)
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
X-Inumbo-ID: 7c08d6a5-1e08-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O6HJTG517rx7BZNC+Lqbxk38jHNOTKDXfitY+fGl2Qg=; b=cTWDR23rSNC6RXYv
	NYm5xAfJP6JIuBegbdJxesqHYjbPVMpbyoaplrYspybiURpA1Trs2IBBicGX/68c
	/5p+bLJWsmwM5nkoINvohPNjkwnCV2Td1WLJKuiQev/oeNlwdMwm/GB45fgFyHxJ
	HBiAKD73NnOBoytDQFweyjSwkRPfJWCUyj7pEosaMeJDL4V+7DNFEgrEfn/EASZJ
	6+Gx97SZIgZENJcFW2XKZ7T0QIf+zW3nzwfP8DgMViWz3ZckUTqhX36WvwMOPypt
	LWOJsODEoFAaVja57lITwPwa+tEi6nJkKgY1F91wyXAO/nJARSgaUFBOp4o2h3W9
	cdmcuA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773315720; x=1773920520; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O6HJTG517rx7BZNC+Lqbxk38jHNOTKDXfitY+fGl2Qg=;
        b=P/TrTao7DCJRJDLvwFdYigRJfd0K3vZYzq5FiCjw8tCZs0DgNCddzf51aJwCnLeSJe
         bPSRZmLtw3Ntg97mamZwTkg7iueNvI1/5LV6l2QHvVmcTsLCY1nXsKKtRGU5mhZ7pkLm
         RZhjI/i4GMYmciJboh8e8Uh0emt6RqnrPl9mXShViAm0gWQO3Yb14sxxNWjy/zS6UUEw
         TxpBAA8XB2NvLlb2iRwKtv5NsqvXVe8NVQ4VhxZNxe5PgQUoeCOjicJsaCJHrFM6Ze7q
         D9lbfv5W5NiFWgkudoXaGXcIblaL3aQgYC2dMdJBVuMxnbT6OE/9R0U4oNVStOMfMWBq
         MLuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773315720; x=1773920520;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O6HJTG517rx7BZNC+Lqbxk38jHNOTKDXfitY+fGl2Qg=;
        b=MBARlIaF+NDsA0tPeHCh9Jt0gGmxEHtfeZGOyoRF0IbuxsH6tZ+FO+e0CPd620l2VH
         a6R2Qcz6cyqfSkySGVWEoGCTwzS7bXYpZAqvKT+RxGS1I2oxbSkeCp5q0DiOBji3IqyC
         3J0OMJpCBavuN9WO0bTAgR/ZD+AV+hkDNI8Q1z2qB1TY/ByiUlg/49UvM5s9O7xP79y1
         Ph7WMcCQVXiynatxrvxAMGRbsAgV3zAfUj/q3/sRV8YXnjueK//4vW2PLVw5fo0iSnL2
         C8xSpQFYyD2gtaT/ZbNMUj92pPiwXWQWjohN1Si6Pk5uTZdew6VuEi2wh/SYcQWntdK4
         J6hg==
X-Forwarded-Encrypted: i=1; AJvYcCU5C2eoehPtztnGgGjmJjlJiAePxnr13+kKlXtoDMijtDIDHbQdrddW3oDZ2XIy5gzawg52xLA0cJw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YynlZETX8Q18oxGPOOVZXBGEnEzTocjvIc71L1M57eBS/Ksz/70
	I0dA9U5A/NVYf6l70/yEreHn1NkJc8g7zNK8JLnfAllbE4NJVe2ZS3hGUUp4gV0mpW4V1z469um
	Wp1pWaVNUS8rUWF9nFOONeEd2V5eDM+NyropHlVAX+5bSbCTuiKsrY5LfERHykUKNk9lTxQ==
X-Gm-Gg: ATEYQzy5/jHpT4NQKokwv7c7LBehJ32wF5KOAIb4WwB4RcCHNCYk2MNmnWt2v+qzh80
	EaROVNP0Ywmh8rrubbuTl1HE4NoOL8UoQV3dCNit4bCqPwiUKt6L4RkvzqMoCuuGa6YPWH4J1sD
	dhYafz8kR9nP4RyVhkefs1rVPk85pwXQI2XNdyem0miF9he2LSs+EpRC0kjXVEUb1WnU9CEfFsN
	CgBgyDNRehEGNcOvAlNF5vDhOQsc+pqkSqKCnhfsRmL5Eog7+3RePLjOFqpJBAwEQ8Frbd9fA8F
	lzWtyFprfSP8WpgavyCbJzxLqlGMayBkbJl73KLFzc4FRAs1CnyAlElAI/ZSimgue+lSPR70lFb
	nKqxOHHbjTqrIjb5hRX8Lt1JUXdjzf+8V289pbLL1JzRNjY9sUw2/Cqk8PQ==
X-Received: by 2002:a17:902:e807:b0:2ae:478f:2ec with SMTP id d9443c01a7336-2aeae89119emr62683655ad.29.1773315719588;
        Thu, 12 Mar 2026 04:41:59 -0700 (PDT)
X-Received: by 2002:a17:902:e807:b0:2ae:478f:2ec with SMTP id d9443c01a7336-2aeae89119emr62683115ad.29.1773315719067;
        Thu, 12 Mar 2026 04:41:59 -0700 (PDT)
Message-ID: <57537059-4989-4704-ae6a-72576d031216@oss.qualcomm.com>
Date: Thu, 12 Mar 2026 17:10:25 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 1/3] of: Add convenience wrappers for of_map_id()
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Nipun Gupta <nipun.gupta@amd.com>,
        Nikhil Agarwal
 <nikhil.agarwal@amd.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Marc Zyngier <maz@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Thomas Gleixner <tglx@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Richard Zhu <hongxing.zhu@nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas
 <bhelgaas@google.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Juergen Gross <jgross@suse.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Prakash Gupta <prakash.gupta@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-pci@vger.kernel.org, imx@lists.linux.dev,
        xen-devel@lists.xenproject.org, linux-arm-msm@vger.kernel.org
References: <20260309-parse_iommu_cells-v10-0-c62fcaa5a1d8@oss.qualcomm.com>
 <20260309-parse_iommu_cells-v10-1-c62fcaa5a1d8@oss.qualcomm.com>
 <3plcdobbd6teiluzijzk33yepbpsur24tnmjr32sco7a4loptm@xmzmsaurvmvj>
Content-Language: en-US
From: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
In-Reply-To: <3plcdobbd6teiluzijzk33yepbpsur24tnmjr32sco7a4loptm@xmzmsaurvmvj>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: dmzzP9AJWWl2KSzxbHtoUQGOWLSQDdY2
X-Authority-Analysis: v=2.4 cv=IIIPywvG c=1 sm=1 tr=0 ts=69b2a688 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=FuYIH7Xx0xzBSkYrynBYgw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=7CQSdrXTAAAA:8 a=VwQbUJbxAAAA:8 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8
 a=6wy38kV5EeFARYyu09AA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=a-qgeE7W1pNrGK8U0ZQC:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDA5MiBTYWx0ZWRfXzQrPjahLaj9b
 caQyE7C+n4u2opSdCAjEsA4hi/z2dbSeQ/Vp0aL8RAE+3Z1GXK6JuPXTPNbjSUvqX7qQxC3LcVM
 D6SghshldR0xm/Swhyq9vCEjeNSJMrEqo9FbkB7UdKG7TlJO7Im4+gMwS7FhiCI8IAArIBzhoLo
 JXwWjd19+Fr/2ioodLhN1qh8buI8ZYvHzM4v0KtZlBpaC9qQW6pTJwzHkLFhLoRfhH/ZGoqEPEI
 iMz23prFfghScJimKWJpO6bVtTIz/SwVv6TvvhaudYlaTMdNRMCdwbfYJB7Kf9MGJsSj9LVdFXk
 SGeWoeqJb85BFn9uOQyAxSHvVFOONlE1eyGrQUoQNz7OwQZ3mulWyjtCkSESDdZCOe8e81OERhN
 sMJH/xemkoSdKVufb4YTO4P1FnqSu7ukscVruzIZ++R/iG+oOaiyXuhKYnvd14Gd92jXGngJZAR
 1ZlWg+lSGIgGX6ZG/Xg==
X-Proofpoint-ORIG-GUID: dmzzP9AJWWl2KSzxbHtoUQGOWLSQDdY2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120092



On 3/10/2026 2:46 AM, Dmitry Baryshkov wrote:
> On Mon, Mar 09, 2026 at 01:03:37AM +0530, Vijayanand Jitta wrote:
>> From: Robin Murphy <robin.murphy@arm.com>
>>
>> Since we now have quite a few users parsing "iommu-map" and "msi-map"
>> properties, give them some wrappers to conveniently encapsulate the
>> appropriate sets of property names. This will also make it easier to
>> then change of_map_id() to correctly account for specifier cells.
>>
>> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
>> Reviewed-by: Frank Li <Frank.Li@nxp.com>
>> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
>> Signed-off-by: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
>> ---
>>  drivers/cdx/cdx_msi.c                    |  3 +--
>>  drivers/iommu/of_iommu.c                 |  4 +---
>>  drivers/irqchip/irq-gic-its-msi-parent.c |  2 +-
>>  drivers/of/base.c                        | 36 ++++++++++++++++++++++++++++++++
>>  drivers/of/irq.c                         |  3 +--
>>  drivers/pci/controller/dwc/pci-imx6.c    |  6 ++----
>>  drivers/pci/controller/pcie-apple.c      |  3 +--
>>  drivers/xen/grant-dma-ops.c              |  3 +--
>>  include/linux/of.h                       | 18 ++++++++++++++++
>>  9 files changed, 62 insertions(+), 16 deletions(-)
>>
>> +
>> +/**
>> + * of_map_msi_id - Translate an ID using "msi-map" bindings.
> 
> Which ID are we talking about wrt. MSI interrupts?
> 

id refers to the device’s requester ID (RID/BDF or platform stream ID),
not an MSI interrupt number; it is the key used in msi-map to obtain
the translated MSI device ID (id_out).

I'll update the kernel doc as below to clarify.


* @id: Requester ID of the device (e.g. PCI RID/BDF or a platform
*      stream/device ID) used as the lookup key in the msi-map table.

Thanks,
Vijay

>> + * @np: root complex device node.
>> + * @id: device ID to map.
>> + * @target: optional pointer to a target device node.
>> + * @id_out: optional pointer to receive the translated ID.
>> + *
>> + * Convenience wrapper around of_map_id() using "msi-map" and "msi-map-mask".
>> + *
>> + * Return: 0 on success or a standard error code on failure.
>> + */
>> +int of_map_msi_id(const struct device_node *np, u32 id,
>> +		  struct device_node **target, u32 *id_out)
>> +{
>> +	return of_map_id(np, id, "msi-map", "msi-map-mask", target, id_out);
>> +}
>> +EXPORT_SYMBOL_GPL(of_map_msi_id);
> 


