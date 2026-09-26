Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAC01C98328
	for <xen-devel@archiver.kernel.org>; Sat, 26 Sep 2026 09:36:00 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1434741.1654409 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xAOoN-00058u-Lg; Sat, 26 Sep 2026 09:35:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1434741.1654409; Sat, 26 Sep 2026 09:35:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xAOoN-00058m-HO; Sat, 26 Sep 2026 09:35:15 +0000
Received: by outflank-mailman (input) for mailman id 1434741;
 Sat, 26 Sep 2026 09:35:14 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <philmd@oss.qualcomm.com>) id 1xAOoM-00058g-5r
 for xen-devel@lists.xenproject.org; Sat, 26 Sep 2026 09:35:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xAOoL-00BxD5-6C
 for xen-devel@lists.xenproject.org; Sat, 26 Sep 2026 11:35:13 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <philmd@oss.qualcomm.com>)
 id 6ab79177-e002-0a2a0a5209dd-0a2a45038ab4-40
 for <xen-devel@lists.xenproject.org>; Sat, 26 Sep 2026 11:35:12 +0200
Received: from [205.220.180.131] (helo=mx0b-0031df01.pphosted.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <philmd@oss.qualcomm.com>)
 id 6ab791cf-fae8-0a2a45030019-cddcb4836458-3
 for <xen-devel@lists.xenproject.org>; Sat, 26 Sep 2026 11:35:12 +0200
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68Q6OcCO3899527
 for <xen-devel@lists.xenproject.org>; Sat, 26 Sep 2026 09:35:10 GMT
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx5mw8ma0-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Sat, 26 Sep 2026 09:35:10 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-90cdc69a7b5so25468566d6.2
 for <xen-devel@lists.xenproject.org>; Sat, 26 Sep 2026 02:35:10 -0700 (PDT)
Received: from [192.168.69.225] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fef4fc959sm110478295e9.2.2026.09.26.02.35.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 26 Sep 2026 02:35:08 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=qcppdkim1 header.d=qualcomm.com header.i="@qualcomm.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=google header.d=oss.qualcomm.com header.i="@oss.qualcomm.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:Content-Language:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+0a8ywQTFMp/tnfN3u+xSfg3xISyQdBYzxdRITV/pVU=; b=K/EFsaZb3ia4TC7h
	0CdSFJrJQywIJgZwzaAlar7S6kWwmJhtj0v1QHHfozIZQxO1Xc3xiqLZ09bhYqJ0
	2irG1g8DE/6LijO5sjpFs6At5he3iXbO7vrvrYrD0g/QT2hEnZ/a8BlMyiYtyKJq
	Hhj1Jzw09P4xSvZFUcrkzbrC9KoqzeTGJs+Gx49iUSvmG4BmP/11qglZzhFSiwKW
	jxSxZms/lG89a7Ly5w9xoMQ7xMl89+Zu4YY0Q2+yRy8StDnc0NY6u0KzWk1WQEKR
	wqkitPEEiPjTunPGaNvioYd199ypiFOf1wTvuR1szy9Suf0c9NTM9qbOM0mcv9EW
	3bzwqw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790415310; x=1791020110; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+0a8ywQTFMp/tnfN3u+xSfg3xISyQdBYzxdRITV/pVU=;
        b=Dkjswhk8Y9woCw4pDHmH5c2Uw3pGF4mO2Xg/CDE+6QLxqNdhhfy52Or2R0RqwGlN5f
         G9ajBdc3GexMKhPb4y4SdlKBXTf9VBji8Ulb5UjiC+OAXCEHPQN5qDg4qpBU/VfORqg/
         a9DZwejKHIU6EztjBNatYMmqbt6dFK98CStWwqvb+j3vNTIFbJJnofT8OMwbO4aYjcse
         aBfgx4Z+kOq7/E81YwPCg2KJ0hfbJlI9tBGZdA8iqIuwKsilXvG9EdlRJMqaQslfjpi5
         Qv7wrNro+2LtsuZowStjxK+Kye8IRZXodoFrjrnqJVvHQzxDxoqAEFwXdFY9w4LU7RJI
         9fTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790415310; x=1791020110;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+0a8ywQTFMp/tnfN3u+xSfg3xISyQdBYzxdRITV/pVU=;
        b=qBBXa9+Z4ycltw38S9cb/qdxXqx/ZClr/mp9Y9FmHQnC3uQ3TcgmhQyM0zQHc8TqAq
         ghFWId7aDjbJczP48yFwyl0679q+uo6YHwTElsIRNXZDeha/LrcP83reoX7MbSEhJ7N+
         s/+h4VEXvaclP28mPkg3xoTfpUljd50RokxcZSwQE9YYQOEzQGZVA2sDelv/nwkPPWjE
         RyfY5kRcPj6pK1mqn6n0idsIpmhL4jbxEbUuRuIkxveG9zq8iYWLei24Xx9iE+0cy53o
         NbbSN2qb+SDf580GyEnls29Qc3Mb6MKxZNE0tltSA0yDZfKu04gGfinl3M5uesYNWp60
         oB2Q==
X-Forwarded-Encrypted: i=1; AKwUvBzvUzJHqBlfmL3/EOUNWJUDdGpayWlmsDeEnbVoLGzGGu0CKbZrz5AozhVF2gk8P8r+eYkKG+xMhE0=@lists.xenproject.org
X-Gm-Message-State: AFuF++mfIMI45K0b5phksw3tpYooZ6IPQVmblGAvh0/iDjoc4jCCaG4D
	cjrIv1CF4Ezlmj8Uqq8AmrG/DyhzSF9JKADSSCMCFghieKS0L6el47AGTkWDRju/J7gnOmt5FpO
	WbdTie2EKjvhEno2cjWefB8tEpvpScTqSy0ZnVvDtA/O2YflfQgJdfmamo0R6VLbe6Y75nQ==
X-Gm-Gg: AYBFou0AUG3mTboDwzGkrIMihBqG8BIBxZceFhnF3SPVueEnI0QyvDt9fcJkoM7uLL2
	B2V3n0eiN1cPFsvBjb5bpc2U589M1CEjpH0hO+thPfctl7jiZuQ7UghkTKaKDlcZ6Kehjhn1nXq
	lyDM1fObsZe1m+GjRMp2tuEJeJWja9C9g4GMnCaoyB9rioJqYwN5SiE7NTFc/1KDcV09LnuelO6
	UdEYv5v2W8lqfaICLWpluedweqpyv/eYrJh7SlgurAhfeNo7F54FwjrCqJMFLqAXCEyTlS7Zc+N
	5hchq6duesIfAwBM2Q9plrGxamRnJLQtqgIU3g/l4adOz5F7hkKTDcZx0ZB7K9+FzmhSJ6FLgzJ
	72A28pwgkJRw1LNNbSknUkrWAmNRnX38dMQ==
X-Received: by 2002:a05:620a:3912:b0:93a:2d2b:a5ed with SMTP id af79cd13be357-93c43dccd3dmr936000185a.47.1790415310091;
        Sat, 26 Sep 2026 02:35:10 -0700 (PDT)
X-Received: by 2002:a05:620a:3912:b0:93a:2d2b:a5ed with SMTP id af79cd13be357-93c43dccd3dmr935994385a.47.1790415309590;
        Sat, 26 Sep 2026 02:35:09 -0700 (PDT)
Message-ID: <5687f0f3-052a-4e16-9747-0be60296e07a@oss.qualcomm.com>
Date: Sat, 26 Sep 2026 11:35:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 028/114] hw/intc: use kvm_enabled() in APLIC AIA
 helpers
Content-Language: en-US
To: Yonggang Luo <luoyonggang@gmail.com>, qemu-devel@nongnu.org
Cc: Cornelia Huck <cohuck@redhat.com>, xen-devel@lists.xenproject.org,
        Chao Liu <chao.liu@processmission.com>,
        Igor Mammedov <imammedo@redhat.com>,
        Alistair Francis <alistair.francis@wdc.com>,
        Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
        Peter Xu <peterx@redhat.com>, Eric Blake <eblake@redhat.com>,
        Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
        Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        Sunil V L <sunilvl@ventanamicro.com>,
        Stefan Hajnoczi <stefanha@redhat.com>,
        Palmer Dabbelt <palmer@dabbelt.com>, Fabiano Rosas <farosas@suse.de>,
        Xianglai Li <lixianglai@loongson.cn>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Max Filippov <jcmvbkbc@gmail.com>, qemu-ppc@nongnu.org,
        Zhao Liu <zhao1.liu@intel.com>, Paolo Bonzini <pbonzini@redhat.com>,
        Bibo Mao <maobibo@loongson.cn>, "Michael S. Tsirkin" <mst@redhat.com>,
        Laurent Vivier <laurent@vivier.eu>,
        David Hildenbrand <david@kernel.org>,
        Richard Henderson <richard.henderson@linaro.org>,
        =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
        Nicholas Piggin <npiggin@gmail.com>, qemu-riscv@nongnu.org,
        kvm@vger.kernel.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
        =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
        Stafford Horne <shorne@gmail.com>,
        =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
        Markus Armbruster <armbru@redhat.com>, Weiwei Li <liwei1518@gmail.com>,
        Song Gao <17746591750@163.com>, qemu-arm@nongnu.org,
        qemu-s390x@nongnu.org, Brian Cain <brian.cain@oss.qualcomm.com>
References: <20260923131635.1894-1-luoyonggang@gmail.com>
 <20260923131635.1894-29-luoyonggang@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260923131635.1894-29-luoyonggang@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: pSqq_rJvESYb51SIYBMyExJPLEJRV2ZV
X-Authority-Analysis: v=2.4 cv=QvPLTlyd c=1 sm=1 tr=0 ts=6ab791ce cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=gis2z1_H4pcAoy-0X7kA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: pSqq_rJvESYb51SIYBMyExJPLEJRV2ZV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI2MDAzOCBTYWx0ZWRfX1bniLuczMD2S
 Ge65g1Rfzm/ftJMuFJB0/Z6LfbwmMloEKW85ZOfo7lFL6PvtQhuCxWnzeQvMpGo3eWjjJAm9cqO
 jmdbUSjlwmkV/jhgQHBU5LkzUqMgtnUg8gjsRClQyXJf2Pm/iW4/qLvLVH/RjivZcvEZtKAszbo
 XyCq7yIvybVvzQCzO5WqRQIIXia8i/qMOs/iwB9byiM8v+KScCOY7fHGHnlYEcxrGMwqzniydmp
 HkI+wmwm2DEbcTHN2dugAArj+otNvuZC1eG8i7ElXfTQW3E7ky4O9fYAcqj2ljpFOMO4ejr8eL9
 VZQb9L48pjEdgRY2H9FFPOCa68ZwU2UsN276WiHFT1DFyLwkwqceGEvird5I7Xxy/0Vu+PdkCeu
 TCzLayAt/CYq6Q+jETQ5ln2kUQM28QoRTXo9ZgGnIhTtwq4LK/bMxdHpBfOOOIjKj0BwA11tnQ2
 eoGaBScL76vJFs91PRQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI2MDAzOCBTYWx0ZWRfX8ELaN2UJQIQh
 YwY4rUgkBEpPl9Egk/UDX+BAv9wUEl0qne9tVU3kOBY859CoV4dLQS0r954e2E4Xl2cQidva1+w
 gnUUD8hHFCO4PNN5tuS5ANAf+zU3Tpw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609260038
X-purgate-ID: tlsNG-33051d/1790415312-6CEDA4E9-7B8D4F32/0/0
X-purgate-type: clean
X-purgate-size: 1476

On 23/9/26 15:15, Yonggang Luo wrote:
> - Replace CONFIG_KVM ifdefs in riscv_use_emulated_aplic and
>    riscv_aplic_set_kvm_msicfgaddr with kvm_enabled().

Can you provide your S-o-b tag please?

> ---
>   hw/intc/riscv_aplic.c | 14 ++++++++------
>   1 file changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/intc/riscv_aplic.c b/hw/intc/riscv_aplic.c
> index d8e25bfda14..03a0852b8b8 100644
> --- a/hw/intc/riscv_aplic.c
> +++ b/hw/intc/riscv_aplic.c
> @@ -167,7 +167,10 @@ bool riscv_is_kvm_aia_aplic_imsic(bool msimode)
>   
>   bool riscv_use_emulated_aplic(bool msimode)
>   {
> -#ifdef CONFIG_KVM
> +    if (!kvm_enabled()) {
> +        return true;
> +    }
> +
>       if (tcg_enabled()) {
>           return true;
>       }
> @@ -177,21 +180,20 @@ bool riscv_use_emulated_aplic(bool msimode)
>       }
>   
>       return kvm_kernel_irqchip_split();
> -#else
> -    return true;
> -#endif
>   }
>   
>   void riscv_aplic_set_kvm_msicfgaddr(RISCVAPLICState *aplic, hwaddr addr)
>   {
> -#ifdef CONFIG_KVM
> +    if (!kvm_enabled()) {
> +        return;
> +    }
> +
>       if (riscv_use_emulated_aplic(aplic->msimode)) {
>           addr >>= APLIC_xMSICFGADDR_PPN_SHIFT;
>           aplic->kvm_msicfgaddr = extract64(addr, 0, 32);
>           aplic->kvm_msicfgaddrH = extract64(addr, 32, 32) &
>                                    APLIC_MMSICFGADDRH_VALID_MASK;
>       }
> -#endif
>   }
>   
>   /*


