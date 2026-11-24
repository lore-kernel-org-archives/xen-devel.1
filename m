Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACB4E606A31E
	for <xen-devel@archiver.kernel.org>; Tue, 24 Nov 2026 06:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Mu+lZvdL;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=If+OPzJU
Received: from list by lists.xenproject.org with outflank-mailman.1500617.1696686 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVjho-0004op-0i; Tue, 24 Nov 2026 06:08:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1500617.1696686; Tue, 24 Nov 2026 06:08:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVjhn-0004oi-UJ; Tue, 24 Nov 2026 06:08:39 +0000
Received: by outflank-mailman (input) for mailman id 1500617;
 Tue, 24 Nov 2026 06:08:38 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <abel.vesa@oss.qualcomm.com>) id 1xVjhm-0004oc-CA
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 06:08:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xVjhl-006LhC-Om
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 07:08:37 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <abel.vesa@oss.qualcomm.com>)
 id 6b0529df-bab6-0a2a0a5309dd-0a2a4501c79a-12
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 07:08:37 +0100
Received: from [205.220.180.131] (helo=mx0b-0031df01.pphosted.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <abel.vesa@oss.qualcomm.com>)
 id 6b0529e3-5bcc-0a2a45010019-cddcb483937c-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 07:08:37 +0100
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AO2kP7u2209280
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 06:08:35 GMT
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4yy1143d-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 06:08:35 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-93f32050e72so986227585a.1
 for <xen-devel@lists.xenproject.org>; Mon, 23 Nov 2026 22:08:35 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ad644140b5sm23005124f8f.17.2026.11.23.22.08.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2026 22:08:33 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=qcppdkim1 header.d=qualcomm.com header.i="@qualcomm.com" header.h="Cc:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=google header.d=oss.qualcomm.com header.i="@oss.qualcomm.com" header.h="In-Reply-To:Content-Disposition:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dvY4KBfiISm+CQm5KIDUrtb6
	uzBgUaP0PFQaZpqv52w=; b=Mu+lZvdLXuWGpOkRTkHFjM/i3/zxBEn62CaGxwiM
	4QAwVoT9XEi4yAVQyTS/Hdf4oK6g4Bc9UAYdPk+DRdycbrtCTJCG8mMPRAhd8Itr
	YJhqFMUPxIvAUoO28f/gr9kwh8uoUQMFVNIJ4mHntvWYoUNjLLZJkNIL9C5NO8j5
	4wzwAtnHxt9pAGjuHvdm/dL4ZGq7SYRNZIslZ6b/jAPWSWpvoexho/kIjWyCe8Go
	XEM9WzZZfx7YDi8VBJiRGkruQKiQYtAWiuR5g/M2YJX70BEeqYi1vnUAfiYQx25H
	1Q6Q3rvSf1diwPrHavfw3ko6BktLi1o93wWElVUR6hp2Ww==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795500515; x=1796105315; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dvY4KBfiISm+CQm5KIDUrtb6uzBgUaP0PFQaZpqv52w=;
        b=If+OPzJUiYHfzVs9MJJ1NuRvikzQpwJfGD96Izk9sOBEmgqLFGc3itDg2Ydzz4MZNG
         kCu+8sRfNFJ0LZjwOiYcGT/o+2J/wFA3YaHgJDVP2Wm+cqk3d7xtKmoM8qhxwfBYT88a
         GFZrL/1oRY6El1IE2Jo0snWZv+sri1pq2wj03964LNXfnaPMtFQYtu1WIISNr3iOuHVO
         msAiUo7OhyjEv2IwTALx3ZQsku+a+inPhDwFAnfM8kiO1ddheM1aU9xiP7g88DlM5Gum
         fOPcaUQuYU11smIM2zYXHmYRweyWnmGarLGZO5fLQlwrYTmzk0nC2Bz3muYCQ3KOlxqp
         V/BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795500515; x=1796105315;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dvY4KBfiISm+CQm5KIDUrtb6uzBgUaP0PFQaZpqv52w=;
        b=AQZUlIoBXZJD2jf8749MQzZV/0YAGT15ZzLVQRpUz9qxnPSNVfjPnUg5uXpDAlo6Qk
         9pw8KG5b813s3rsskcICnTANpr21DrUWlCcIESqdI0Pch5qZ8TcKTgC0yMgtGENpVEJ4
         IM938yzpYu6zUvDZ/ct2at7zQhF2MsmfyltBDC4ObbT5VyCk0xvmAKZmBRdZ8bdXDU8W
         cTZnp7RsCmRBslRhMFczMFYpEG0HdnP10oZ7Nl7TxdGpAB2BOq1P+YrR9OviVG1PxhPm
         Hir+kRtFxf2hqXceWCn+3a8o/LkNrHZnvRPNj5a9j0yqVKPLaxENAOSFcSAZsnBlCjFw
         woMg==
X-Forwarded-Encrypted: i=1; AL+hErF6Lhl3pLIVuyfp0q/7gMzYrRcZa3BqReXEkfmzTik2ZXBYE4Tuhtp8k7vooWtMfHt2NBPOOZev6v8=@lists.xenproject.org
X-Gm-Message-State: APuU4Z/pFGFnM2AOFC22LzNfAkBD6SSD46xNBsdKnH/uijc1Cw6Fw6iF
	TIok8JyElrc5mDvDUMmAKaYOgkHp/nTf3s2iqozk2kgTUgnJfmCP6iHAFz0aEfyLuclZVEdRWLj
	WK2peT3a0GRBfEdOQ1oy4mR7aQV10WEGi5hmnG/gXxmH8rdFpTcF2ViFQgOJuchmGf6//ng==
X-Gm-Gg: AZFdTZcmHTiST5ZfTM4FJykC2B7b7d1ftv7fJ18lXu1yUtlIz+ubvRuDRMWJF34Ee0f
	FGiZ/fjmyIol502e1/iZLBV75EcPaXV1xCzrM4dcZ16eiSna8XP+YKg1EhsRBh4kRcqEajTZbKp
	3gD91nIAvXHApO4v83+X3PVHZA0mPKDZYrnT10mVRHXxR0UX/Tk6BCPpeb3R7jREtaXnr5wxbgU
	gAtyAofwx9Rthy94mSTFkzTvS7QRs2DEcnxOlvv0X61OZElytwtjCxhPLl1A8XRoCU+xqp4NqoK
	h9t8A6KrChoSzPfdkUUqxmJC1X2ETJhqVSfkQop02RZbpSxYCJ1DcS2tK1/8Rdf8gje8tiRoIyR
	FeHe8B38nehlycfK6Nehk8VBjzJZYy9s1SS39m8wdYUOguPCpieL7syKP8DesKHE=
X-Received: by 2002:a05:620a:3185:b0:93e:94a4:a97d with SMTP id af79cd13be357-949ba683204mr2433055685a.0.1795500514601;
        Mon, 23 Nov 2026 22:08:34 -0800 (PST)
X-Received: by 2002:a05:620a:3185:b0:93e:94a4:a97d with SMTP id af79cd13be357-949ba683204mr2433050285a.0.1795500514001;
        Mon, 23 Nov 2026 22:08:34 -0800 (PST)
Date: Tue, 24 Nov 2026 08:08:29 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
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
        Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
        Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>, x86@kernel.org,
        "H. Peter Anvin" <hpa@zytor.com>, Jan Kara <jack@suse.com>,
        Paul Moore <paul@paul-moore.com>,
        Stephen Smalley <stephen.smalley.work@gmail.com>,
        Ondrej =?utf-8?B?TW9zbsOhxI1law==?= <omosnacek@gmail.com>,
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
Subject: Re: [PATCH 10/14] soc: qcom: rmtfs_mem: convert mmap hook to
 mmap_prepare
Message-ID: <7zkdydihgjnqxerwzbebrcryry37hcqc47dpzqmoxdgc7qt3i6@uanst4lmvvkn>
References: <20261105-late-2026-mmap_prepare-v1-0-c56aadfbab8a@kernel.org>
 <20261105-late-2026-mmap_prepare-v1-10-c56aadfbab8a@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261105-late-2026-mmap_prepare-v1-10-c56aadfbab8a@kernel.org>
X-Proofpoint-ORIG-GUID: efKiJHs2-rb5DG90_G7lwA58mISsdTBF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAyNCBTYWx0ZWRfX5rogzdCNvt/4
 KiB/6T70LZ1ScvEkpI9wpC9KU+CEW+f69LkS/T+paHwqgEdtPAz2bgsyuSh3nVe5y5npSjOmPNp
 DyPwurzBnEt8EwpQcfTcF7IFFwf0Otg=
X-Authority-Analysis: v=2.4 cv=JYspPkKV c=1 sm=1 tr=0 ts=6b0529e3 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=2UNkV1bVvYdQOko7pskA:9 a=CjuIK1q_8ugA:10
 a=QtEvL3ry9E0A:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAyNCBTYWx0ZWRfX7E5iQsIc0zgW
 Qlxbv/vxOrnkSCkiBfMr4wBW7rJESxCaReBROSi+mbrHVOSc9LNAHZfvdIkq3DgZQWxbHjeigki
 ccY9qLvLWvOBb+RqjKYXT9JHeRfOkNmutbpPKt5Poiks7Eq39NXWB5B9kGvzPOqjj+0UknvUbb4
 UHLrjvhkVFolYTdXwoOfhuIskn7247SYUQz7V1YAWYI+hyxv23esEWVPnQj6r8t/+xF392z2/K8
 Vko5Rii/ooG4m51jh8FRFQ7bohp+CtRLjBM//HwSXSc4hg98k6D5WKNlIwN21PODKjsLZntrwQG
 0oP16pEheCvcpT0PpHK66QQ375CJWFhB+dJrdItkubY8+mN/aQ3lBaoNv5bFjUSTnB62xdwPJdz
 3mmI2KrVirYcXUTf8xaEpSYEuLQmmuBCGzK1NibJgOxV91sXXwhPUVsLgQWWHHpSgdLem7/m6Nw
 jDvXeViNmA/phPElehQ==
X-Proofpoint-GUID: efKiJHs2-rb5DG90_G7lwA58mISsdTBF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240024
X-purgate-ID: tlsNG-d62444/1795500517-BC8E15FD-A5BA44AA/0/0
X-purgate-type: clean
X-purgate-size: 303
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 26-11-05 21:05:41, Lorenzo Stoakes (ARM) wrote:
> Move from the deprecated mmap hook to the new mmap_prepare hook, using the
> PFN remap mmap action to map the region.
> 
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

LGTM, so:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

