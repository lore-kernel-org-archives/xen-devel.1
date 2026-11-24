Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC8D8606A31E
	for <xen-devel@archiver.kernel.org>; Tue, 24 Nov 2026 07:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jB2OhFnb;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Aw/OpGRS
Received: from list by lists.xenproject.org with outflank-mailman.1500644.1696713 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVlCk-0003MA-12; Tue, 24 Nov 2026 07:44:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1500644.1696713; Tue, 24 Nov 2026 07:44:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVlCj-0003M3-Ui; Tue, 24 Nov 2026 07:44:41 +0000
Received: by outflank-mailman (input) for mailman id 1500644;
 Tue, 24 Nov 2026 07:38:00 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jens.wiklander@oss.qualcomm.com>) id 1xVl6G-0002Az-GY
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 07:38:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xVl6F-008MfK-9B
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 08:37:59 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jens.wiklander@oss.qualcomm.com>)
 id 6b053ec9-bab6-0a2a0a5309dd-0a2a4501c8ae-42
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 08:37:58 +0100
Received: from [205.220.168.131] (helo=mx0a-0031df01.pphosted.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jens.wiklander@oss.qualcomm.com>)
 id 6b053ed4-5bcc-0a2a45010019-cddca8837f6a-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 08:37:58 +0100
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AO2k5aU901797
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 07:37:56 GMT
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com
 [74.125.224.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4w6st1aa-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 07:37:56 +0000 (GMT)
Received: by mail-yx1-f71.google.com with SMTP id
 956f58d0204a3-6798fd97f3aso7047037d50.1
 for <xen-devel@lists.xenproject.org>; Mon, 23 Nov 2026 23:37:56 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=qcppdkim1 header.d=qualcomm.com header.i="@qualcomm.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=google header.d=oss.qualcomm.com header.i="@oss.qualcomm.com" header.h="Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WLDBCseQttjsh+YgjaRZ95arQzmquJXtwPce4pg+uuw=; b=jB2OhFnb5kcQJfBh
	9PooZCIYHGNUVjDcGwumXONQT2rphRiM+HKb+Z5rBcfoZ9URBb6HmUCKyU398p1z
	0DE3n1unAJCPGSKA9qHqDKxoWrwnFiNfWRaB4F0mZuQ+gIyw7qVkk0rFFWIT+hr0
	xlGvD+nbKD4m1GM6eRm0zn5N+zABS6NWAAQ4zM+xLUUTfkXPLcKrmGNQSuaj6NVk
	LSMFCUkYtOrVzKgsE9JjRJp/p/+NgBxqv/l5UGfpSyCfsEnsySH6HhHWtAFvnFTH
	QiJHfUK8nig+0y+RvbrdRu8nHxWlPz45JWmVSfVxj87VvZ9rM/3qatNGi8g/YvkN
	LVZ85g==
ARC-Seal: i=1; a=rsa-sha256; t=1795505875; cv=none;
        d=google.com; s=arc-20260327;
        b=eH/9pL18h+qwOhwx+DptBsIMteWNWDOq6HKuQquiQfJfaSyXS85nOZWkUy4aegblRM
         p4xnzmy+3GKfCSrTRZZ1Da7HWlZ4WOSVq823JRa6eikLhzmtudwADQuiXPfi8vH8mY8K
         3MVSkUkX5g56RPMkWN2qBLgxmzs4Yb7mVPbQj+H2MfnKLCl7iEVXNEEFeIwFeGam+1D+
         orDSerwvf3Hu2gICo8Q7IX/ficjiu5UoApue8O5B9QMhq71uNX0Rm35eJ40+13iYorGj
         OaHMC4Psedy7k/hN5ZVGydKrgtwS/3U8YHDVGeS8gB2e/ZT0aL/TtciTRHSHKGx9EhtV
         2Sjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WLDBCseQttjsh+YgjaRZ95arQzmquJXtwPce4pg+uuw=;
        fh=i2e8h533PsLv8ijZmpRAVdqDZWNTUP3IcoJoTvegRkg=;
        b=MZjDoiJ0CNgO7kXITTM9L6cmvmpdNInwxap5qf7fw7wxH7y1sRrdrlJuiCiFEHF8FQ
         nTUwg0A5aFk0KYcuFNwU9zdwEofzl7/Ot1kEETErAJGbX6yeO0vLY8q7e0d/scSuM53u
         7hhCyosrYJtK7KJpbmAMUTcj9kTx/XJPRsIZ5ICfaXToIIsfCUh9QwoV7yPK9VM/k6Tp
         cWvo4za7Akqlb8KTV1GoelG2nNUssqIAXajx4oaL6C7mPTqjZ/EqLM7WT7ATjlDEQPjY
         R5zYscpSKSCW6LY6YT1echd0AR9QT2FPv5RiIsigXO5yS+SjlL3ouO5PxV3yeyb+GmA9
         CFCA==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795505875; x=1796110675; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WLDBCseQttjsh+YgjaRZ95arQzmquJXtwPce4pg+uuw=;
        b=Aw/OpGRSqNfPO/FrGDRTuDK9qhyBoKOQnaDUrAzPXeHCQDabklsii7ch8BQZIfQ7cf
         g6SuwtGeRoylNlSVJka3xMddZEH+cQMmDoKbxYPrtIeXrYCnHcVJyjkhFsfw8rR1zMFe
         f1BOdqw7ka5SrNArxfsFGriLa/JLOE7coOq4KA871g+CHI8k1htbtoWVvdYwyHsqHECe
         BGamtBxF5LlGw4KUVjiSMyxbcUoZhbrxRJub4PSgBySEFABBKafNeemkki2JYzoHNhgo
         uToBKvjZViTUMqcbEwjhLhnuVuj7HHFgJT4RXNH8OtgvBOm8UHZXzWntCBVcKLxoznJA
         hozw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795505875; x=1796110675;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WLDBCseQttjsh+YgjaRZ95arQzmquJXtwPce4pg+uuw=;
        b=HbrO71mp8iDquKilGcEfN0QALsdXxldpqLObjtIu+p8BLsyn2S+iFmYRwHifpWjJyc
         mcu2p3CoG/2PObjhZMklrx3ApWRRCNboi5oMFbKmRpmb3ivM5eQO78WwGEcI9Ci6yLHc
         m2CnDQHezZiLN13gfjhStcjsULhlhG4Tsfk5cMa7HatU7PWxR7wLKgnwaYCk7Qy5EG5E
         W40aVnW7tjvMuWq3JZ3UVPfnzzxKc1VT21o6Wgc3BGozWxq/8npKGHdVi6rPjQBh0CE+
         wmt3GbvkMN/IozG3e01tfponN+9UvSYZhZXOzVF+xiW+KPknEZgZsUn3KD9akAXxD+XX
         3n/A==
X-Forwarded-Encrypted: i=1; AL+hErHD6jSEDpFxR6rApmWc3ihO3VAFFk32z3Cku/7jpqxJPyyJI/dnyVt3yQ/JmrGWDYtdDjyrPLoSRDs=@lists.xenproject.org
X-Gm-Message-State: APuU4Z/zHIAQrAcp1ChC6gzo39OqLXl0Z7uL69li7wQGUpnoK2Gm8qDJ
	btR4JCe8vN98mxnHN07dyt2s92yF20YsDOtp6HZ6PwtKpukAzgmexYadAvIovNBKwq3TxTtaoRR
	D2SQscDl7SHjGSGs/mur30X55f2jEG8feNL9huAsXYrYSD8DId55QHqHdSJyPCf7RlEEZ0JphSh
	idzrPGD1DBz8vwi5ARp8F79JUSq71whzToKrJgPMRhup/d
X-Gm-Gg: AZFdTZcFVuFvfqkGzXzQ4QKyHlq7c6YvobX6BQR2+YwFHRrV1r5Y5ix9Taq/eMNbAgP
	qjBkT93cgxxPDcN+spbhBqU5ArBBhFOka4EtIvbq+YxeFYdcv/PenxqH0nfybVgneieRrYGcPbY
	EjbTzPzW1cyW4EcXVS41/tP2TP1ROVZunmecpeu/LhYgI/NsRX5zrUjxTw1ZC537H9k5UHkJ7wp
	3wDIynceB0jxibLsYuni+G5iEIoeLXpm3JgaPe+
X-Received: by 2002:a05:690e:450d:10b0:677:cbfc:be28 with SMTP id 956f58d0204a3-67df447c2b9mr2926883d50.75.1795505874963;
        Mon, 23 Nov 2026 23:37:54 -0800 (PST)
X-Received: by 2002:a05:690e:450d:10b0:677:cbfc:be28 with SMTP id
 956f58d0204a3-67df447c2b9mr2926857d50.75.1795505874551; Mon, 23 Nov 2026
 23:37:54 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261105-late-2026-mmap_prepare-v1-0-c56aadfbab8a@kernel.org> <20261105-late-2026-mmap_prepare-v1-11-c56aadfbab8a@kernel.org>
In-Reply-To: <20261105-late-2026-mmap_prepare-v1-11-c56aadfbab8a@kernel.org>
From: Jens Wiklander <jens.wiklander@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 08:37:43 +0100
X-Gm-Features: Aa3M54q5vxZ2pH5GHxV6_gcu1Tnc83EBXhtYw1pJ9H77Fl7U3CQoqAKpEumRrbk
Message-ID: <CAGgiveX=Z5gS7iJWBanyysVUStDRbgTnVktQwJySXw_-xL+sUA@mail.gmail.com>
Subject: Re: [PATCH 11/14] tee: convert shm mmap hook to mmap_prepare
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Juergen Gross <jgross@suse.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Nicholas Piggin <npiggin@gmail.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
        Shrikanth Hegde <sshegde@linux.ibm.com>,
        Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
        Dexuan Cui <decui@microsoft.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowangio@gmail.com>,
        =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>,
        Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>, x86@kernel.org,
        "H. Peter Anvin" <hpa@zytor.com>, Jan Kara <jack@suse.com>,
        Paul Moore <paul@paul-moore.com>,
        Stephen Smalley <stephen.smalley.work@gmail.com>,
        =?UTF-8?B?T25kcmVqIE1vc27DocSNZWs=?= <omosnacek@gmail.com>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Ryan Chen <ryan_chen@aspeedtech.com>,
        Billy Tsai <billy_tsai@aspeedtech.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Jens Wiklander <jenswi@kernel.org>,
        Sumit Garg <sumit.garg@kernel.org>,
        Scott Branden <scott.branden@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Richard Cochran <richardcochran@gmail.com>,
        David Woodhouse <dwmw2@infradead.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, xen-devel@lists.xenproject.org,
        linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        kvm@vger.kernel.org, linux-hyperv@vger.kernel.org,
        virtualization@lists.linux.dev, linux-sgx@vger.kernel.org,
        selinux@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-arm-msm@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: XD9t9toqBTXEd0_nnkiy8-Jc2JO5l2Qb
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAzMCBTYWx0ZWRfX+7h749F2Rfwe
 kJDs5vC39GGDe3sWyWlMEogBXzEkeXxNFEyQvNYlURCn5cNSFDn/iNiMzxDYPzOjkqkpoy+V6pw
 7Bg54ysCS/On/sDtGWKKGXVdvnGN8rc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAzMCBTYWx0ZWRfXydKCp+bg93fp
 hzCZo1tZsy/BseKagBrGLCFxzp2UbsYx/aBNCbsXulR+pgbw8QoVqulaoLzLZmP47dZPbOPUf7o
 +71pAlRF78zNa2bx86NAZTyVo1UWTNUqVWHwodLynJB5LJlzpC21eH+LxaVB5ac85kUMmwMsfJ8
 7HZaBD0AfjHTzZo6MyYn41Y2wEE0vsZxvBzP4G3s8lbtCnng5EtUYLvHwQMZZw/n32UoiBjTNzo
 vFODXfb4qx7Lt/wD8jfBR1GldK0NDo9QK6EHfIKzlkIubVr7q6uEkDlZifUd/WqhGkJvycUgXFi
 Wp6AkFZUfBuG9ngkWsq35wymdWhGQg/ahENFzMA/U+Gt6fb71b1rHBdjob+O4eAcFCkLcFAGE40
 TahY2oQBD5E4zgn7OiY+tYRpuvZHvGlFUBzs3QMA7rVnRSAif/P0ke8b89Y2rU+XXhXvnFghqjA
 VUGJbhD/twR6ZxSVKMA==
X-Proofpoint-ORIG-GUID: XD9t9toqBTXEd0_nnkiy8-Jc2JO5l2Qb
X-Authority-Analysis: v=2.4 cv=V8DoQuni c=1 sm=1 tr=0 ts=6b053ed4 cx=c_pps
 a=ngMg22mHWrP7m7pwYf9JkA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=97S62Xg_vF6B0O42EdoA:9 a=QEXdDO2ut3YA:10 a=yHXA93iunegOHmWoMUFd:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 suspectscore=0 bulkscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611240030
X-purgate-ID: tlsNG-d62444/1795505878-BE2D45FD-48AF6E20/0/0
X-purgate-type: clean
X-purgate-size: 2125
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 5, 2026 at 10:08=E2=80=AFPM Lorenzo Stoakes (ARM) <ljs@kernel.o=
rg> wrote:
>
> Move from the deprecated mmap hook to the new mmap_prepare hook, using th=
e
> PFN remap mmap action to map the shared memory.
>
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> ---
>  drivers/tee/tee_shm.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)

Reviewed-by: Jens Wiklander <jens.wiklander@oss.qualcomm.com>

Thanks,
Jens

>
> diff --git a/drivers/tee/tee_shm.c b/drivers/tee/tee_shm.c
> index daa4af1e089e..8fcbf0232aeb 100644
> --- a/drivers/tee/tee_shm.c
> +++ b/drivers/tee/tee_shm.c
> @@ -567,10 +567,9 @@ static int tee_shm_fop_release(struct inode *inode, =
struct file *filp)
>         return 0;
>  }
>
> -static int tee_shm_fop_mmap(struct file *filp, struct vm_area_struct *vm=
a)
> +static int tee_shm_fop_mmap_prepare(struct vm_area_desc *desc)
>  {
> -       struct tee_shm *shm =3D filp->private_data;
> -       size_t size =3D vma->vm_end - vma->vm_start;
> +       struct tee_shm *shm =3D desc->file->private_data;
>
>         /* Refuse sharing shared memory provided by application */
>         if (shm->flags & TEE_SHM_USER_MAPPED)
> @@ -580,17 +579,18 @@ static int tee_shm_fop_mmap(struct file *filp, stru=
ct vm_area_struct *vma)
>                 return -EINVAL;
>
>         /* check for overflowing the buffer's size */
> -       if (vma->vm_pgoff + vma_pages(vma) > shm->size >> PAGE_SHIFT)
> +       if (desc->pgoff + vma_desc_pages(desc) > shm->size >> PAGE_SHIFT)
>                 return -EINVAL;
>
> -       return remap_pfn_range(vma, vma->vm_start, shm->paddr >> PAGE_SHI=
FT,
> -                              size, vma->vm_page_prot);
> +       mmap_action_remap_full(desc, shm->paddr >> PAGE_SHIFT);
> +
> +       return 0;
>  }
>
>  static const struct file_operations tee_shm_fops =3D {
>         .owner =3D THIS_MODULE,
>         .release =3D tee_shm_fop_release,
> -       .mmap =3D tee_shm_fop_mmap,
> +       .mmap_prepare =3D tee_shm_fop_mmap_prepare,
>  };
>
>  /**
>
> --
> 2.56.0
>

