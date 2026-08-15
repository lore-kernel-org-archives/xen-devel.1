Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29693C5AD5A
	for <xen-devel@archiver.kernel.org>; Sat, 15 Aug 2026 13:53:59 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1391828.1631313 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wvEp7-0006Tp-Ay; Sat, 15 Aug 2026 13:53:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1391828.1631313; Sat, 15 Aug 2026 13:53:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wvEp7-0006Th-75; Sat, 15 Aug 2026 13:53:21 +0000
Received: by outflank-mailman (input) for mailman id 1391828;
 Sat, 15 Aug 2026 13:53:20 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <philmd@oss.qualcomm.com>) id 1wvEp5-0006Ta-VO
 for xen-devel@lists.xenproject.org; Sat, 15 Aug 2026 13:53:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wvEp5-00C8ZG-CK
 for xen-devel@lists.xenproject.org; Sat, 15 Aug 2026 15:53:19 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <philmd@oss.qualcomm.com>)
 id 6a806f22-2eae-0a2a0a5409dd-0a2a45098056-24
 for <xen-devel@lists.xenproject.org>; Sat, 15 Aug 2026 15:53:19 +0200
Received: from [205.220.168.131] (helo=mx0a-0031df01.pphosted.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <philmd@oss.qualcomm.com>)
 id 6a806f4d-be1a-0a2a45090019-cddca8837854-3
 for <xen-devel@lists.xenproject.org>; Sat, 15 Aug 2026 15:53:18 +0200
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67FDMGoG219108
 for <xen-devel@lists.xenproject.org>; Sat, 15 Aug 2026 13:53:16 GMT
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g2hd7rxtw-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Sat, 15 Aug 2026 13:53:16 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-936d067836eso196910285a.0
 for <xen-devel@lists.xenproject.org>; Sat, 15 Aug 2026 06:53:16 -0700 (PDT)
Received: from [192.168.69.229] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499899b5f86sm115714325e9.5.2026.08.15.06.53.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 15 Aug 2026 06:53:14 -0700 (PDT)
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
	2QVIRMmy6CwNjWFI8w4TaBxFhy+gC22lWK+qfX3lm84=; b=bIMiGvozReWfRNFq
	uChwj2wozeU5DMnQHusId0X2qHQ6FtcA2S21wm1WDQ8ZrCW2YoOzTVhyWltG3OQi
	DGy6Px21Sa0C1tpbf+Kgf2tI+8wdshEn1oc/NLhcHPguLHoCHrqNfpwVUr3wOI/c
	aVgjjh+hp/lM7zWD/WziDmoIgj2RyrSd7WbzwzRCeaGasODOWu9krbtvK3gOvSw3
	5CBhh9HYjWYwqXup2PnAcCpq878RIBr699gJSpYHsz0Ku0aHlnXASPuy9rOItn3W
	r15akix/H6wpt+cfE7V1qBukBpGvhevD0G8H3S1viD4NtmX9DdVP2823BN4YkR++
	4CHCCA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786801995; x=1787406795; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2QVIRMmy6CwNjWFI8w4TaBxFhy+gC22lWK+qfX3lm84=;
        b=iN6/sxO78q8in+HP+DUgsZZcjpIgzdsmm7gGdeNDjZ/Sy4iZousWjPhxuaUOljyTKn
         LNX88FLBPqn8HB5NNHWLtxpm2HsKBpbCMpFbg/ehqkdXVdmS3EVyi7vWfe25RUwrKNSA
         3NdgJ7cod/LWXuTVyLTFNA08xh5LNeGxrGzcog8OOOXGyCXafdCvZKYXee97AtU9cKfe
         SE/0Ymq/Eb188r4AvEXCd7fmo++xvS2zH1HobVECX3b7C3Awqwpf9iRUOxDsNKKyUPBs
         sCa6nTz+cYtKa1q2lCoPs+CJtQbO1Ty4IyrJgc9pAvuxLzBqDyVud6UR4MPLdtSSzXfb
         IRag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786801995; x=1787406795;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2QVIRMmy6CwNjWFI8w4TaBxFhy+gC22lWK+qfX3lm84=;
        b=S98GDOp9wWPPEGbNDctkO4FDlJQtDT49GCFdStCSy4ScdhKKvYLZcOi7+kh7iAj2CN
         J3NZRbTjciJXCduhUYdvZvtx3IJyqIHbdvWSDdFZ/5EEqmN4dQ8ew5btwV28wPBxtres
         llTzAvDJ98QWmzr0Nt3SwUczflNaeM6zskf8AcS0IH4rt/e1P3gOpGRcUM0e08KbtSvc
         2TN5SwIW9BP/obxyeT6SY3zahIrYJAaNIsl4jVkNB9QzSmM8/rmNgZYXPEHlsFVW4oQF
         0Ubh7vN6+Ifp4TYYRVElrYB1RzqiKh46o89ZOMjFMPVfDAjXHm4c8f5lWii3YeXvd42K
         vnsA==
X-Forwarded-Encrypted: i=1; AHgh+RpLo1cYEFzBG2+2KSm5AWWCu/Jpektb94yOS4mZdIU5EiPqgAmf8i/WP59fR/yTrFJ4W0w1q+gNU5I=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyAtQnhV3sRCcvTGWPGZy3Q4+T/+1XHv/qEbF6NKCYwghMprRjx
	NnZRtDXiHcpE7gyr/b9EQQ+gxJ+a7G5XnTVnXz5D2wp90V1EPy4qd/SLVEok28KtKknjxJwUbr6
	e4MCYDHGqkKRUOmVht5ohqo9JNjfqOBn6KNv8pVsFrDcvXCb77w7tRrflMf8TxGiECLVR6A==
X-Gm-Gg: AR+sD1017rNiujzdUSviQqcqzQWJixpPUx0l4khIVzmlpbqNUMow0pT8J475tDXHdQN
	v+E0WUsflG9IsfyQnaWiS/kyKgFWFwQwhjzSePPHKvV+58nES93I/0ffgU40RXnmIhCiaXnTrat
	4l6YvNW3l9S/p9sjIdibZwtaxCDveyIEqXqi3nZXAOKT/i8gg9jTrLQE8EZdcVsF0h0BFpcLbO4
	PYYyz6W5paqWVkpWzlg95ZW+mto5Gw8TEhuQUnPs+GdkHUUrAAPNNwVbzXvIf9T4gItkY/bHPYN
	DgR40LPWJt8XCEAV1utXs24KibGOfGD64mctVZGC5BStqSFF0LsJUJ2skycv4RrTkK6fTS9sF+J
	xigAvWa2enoYQ1IO7JRnQQCBbsbbMijoCYMI=
X-Received: by 2002:a05:620a:3d01:b0:915:a111:86ae with SMTP id af79cd13be357-936d238c318mr914137185a.35.1786801995565;
        Sat, 15 Aug 2026 06:53:15 -0700 (PDT)
X-Received: by 2002:a05:620a:3d01:b0:915:a111:86ae with SMTP id af79cd13be357-936d238c318mr914135185a.35.1786801995124;
        Sat, 15 Aug 2026 06:53:15 -0700 (PDT)
Message-ID: <fa0c9b5c-81c5-4289-92b4-2d77329cbde4@oss.qualcomm.com>
Date: Sat, 15 Aug 2026 15:53:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/i386/pc: xen: reinstate the "xenfv" machine alias
Content-Language: en-US
To: Dario Faggioli <dfaggioli@suse.com>, qemu-devel@nongnu.org
Cc: philmd@linaro.org, xen-devel@lists.xenproject.org, sstabellini@kernel.org,
        anthony@xenproject.org, paul@xen.org,
        Paolo Bonzini <pbonzini@redhat.com>,
        Richard Henderson <richard.henderson@linaro.org>,
        "Michael S. Tsirkin" <mst@redhat.com>
References: <20260730162238.3308286-1-dfaggioli@suse.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260730162238.3308286-1-dfaggioli@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE1MDEwMCBTYWx0ZWRfXxIunQVPBwaqE
 RYlf2ZhjsNQIkich1pd4GByVR6DbhSA6mwjxf7kxUHuUErmXqIaWIsIl+PAEUoLAxW9t/SMh0dy
 bKdIQPmXjSR02JRtAipy+LVb/cDq75NbqpsBIbWgUd7szpKMUjagDsM4AwmLXvx7IKG/r/wEUNq
 X0cahRAzr6fWQxq1X44J5Oy2mXopfTLzucnvoX2X2617DBY/J8inNbZkqC5D6uycbmAWxRJynBk
 N0T1KzTaVkl3UEFMws9lo7a3KBEyptIV9nDTjCahLur1+NhdB+/YpaIV8EduqlZKuR0WarK6Ay/
 R8EIwefd/AAiuxwzqF6+WkWyht4GAvONmcKX7JvxxD6Hb9txaqeONSoIU9SbtYa3elDcgNAyKcG
 MlLsbMn+DFB6OMRZf1EsUX1VpjnXRgGJdpiyXDdqiap+5hJbr8gaUfrhRDGjnPq2RI0vU/0KBZY
 DkzoSEgn3G6+zyZh22w==
X-Proofpoint-GUID: VADGCNYQOU3lPmmVvKdQS-BorU6mZdfQ
X-Authority-Analysis: v=2.4 cv=Ja2Ma0KV c=1 sm=1 tr=0 ts=6a806f4c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=iox4zFpeAAAA:8 a=EUspDBNiAAAA:8 a=KGrwjuuvIC_z2q61s9oA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=WzC6qhA0u3u7Ye7llzcV:22
X-Proofpoint-ORIG-GUID: VADGCNYQOU3lPmmVvKdQS-BorU6mZdfQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE1MDEwMCBTYWx0ZWRfX2XEps0kSeQSZ
 3++s4B/lQ7ms8A7Haa8iMvUiXUM6f5SjSylXFFZcoSiZT5ZJpYmZYUJeuNszymqm/dK3epU9UDe
 OrRKvtyBTZ7BRTvdzta3H2NAWywjIGM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-15_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 adultscore=0
 bulkscore=0 impostorscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608150100
X-purgate-ID: tlsNG-bad1c0/1786801999-3A8D9034-DB1FA6E5/0/0
X-purgate-type: clean
X-purgate-size: 1383

On 30/7/26 18:22, Dario Faggioli wrote:
> Commit 7d2778dea32a4924a469f1cc5767042c8f5b4eea ("hw/i386/pc:
> Remove deprecated pc-q35/pc-i440fx/xenfv 3.1 machines") removed
> the Xen machine type that was providing the "xenfv" alias. As a
> consequence, since the tools are apparently relying on such alias,
> we're getting this, as soon as one tries to start a Xen (HVM) VM:
> 
>    qemu-system-i386: unsupported machine type: "xenfv"
>    Use -machine help to list supported machines
> 
> Reinstate the alias and let it point to the only Xen machine we
> still have.
> 
> Fixes: 7d2778dea3 hw/i386/pc: Remove deprecated pc-q35/pc-i440fx/xenfv 3.1 machines
> Signed-off-by: Dario Faggioli <dfaggioli@suse.com>
> ---
>   hw/i386/pc_piix.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index 82457bdb16..0a911ce59e 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -658,6 +658,7 @@ static void xenfv_machine_4_2_options(MachineClass *m)
>   {
>       pc_i440fx_machine_4_2_options(m);
>       m->desc = "Xen Fully-virtualized PC";
> +    m->alias = "xenfv";
>       m->max_cpus = HVM_MAX_VCPUS;
>       m->default_machine_opts = "accel=xen,suppress-vmdesc=on";
>   }

Oops.

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

Queued adding the @stable tag for backport.

