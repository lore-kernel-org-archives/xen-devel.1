Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 401E2606A323
	for <xen-devel@archiver.kernel.org>; Tue, 24 Nov 2026 23:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YdvJDNZU;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LbzxSFSv
Received: from list by lists.xenproject.org with outflank-mailman.1501674.1697734 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVzzU-0003RR-Dl; Tue, 24 Nov 2026 23:32:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1501674.1697734; Tue, 24 Nov 2026 23:32:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVzzU-0003RK-Al; Tue, 24 Nov 2026 23:32:00 +0000
Received: by outflank-mailman (input) for mailman id 1501674;
 Tue, 24 Nov 2026 23:31:59 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <philmd@oss.qualcomm.com>) id 1xVzzT-0003RE-DB
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 23:31:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xVzzS-0050tP-Px
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 00:31:58 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <philmd@oss.qualcomm.com>)
 id 6b061dfa-e002-0a2a0a5209dd-0a2a4505841e-48
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 00:31:58 +0100
Received: from [205.220.168.131] (helo=mx0a-0031df01.pphosted.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <philmd@oss.qualcomm.com>)
 id 6b061e6c-4cb1-0a2a45050019-cddca88319b8-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 00:31:57 +0100
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AOMaaBZ3520031
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 23:31:56 GMT
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5f00h9sg-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 23:31:55 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id
 00721157ae682-869553205a7so70952667b3.1
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 15:31:55 -0800 (PST)
Received: from [192.168.69.234] (pmd666.hd.free.fr. [82.67.153.177])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab6b110c3csm29788684f8f.36.2026.11.24.15.31.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Nov 2026 15:31:53 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=qcppdkim1 header.d=qualcomm.com header.i="@qualcomm.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=google header.d=oss.qualcomm.com header.i="@oss.qualcomm.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Content-Language:From:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G1ZAm7akP9D8mbltmYnzmqncqYxXc4x3mIjxdEr9bU4=; b=YdvJDNZUyxhdhS6J
	arsYzy3lKCqdBPApC8vjWOmux1EIZ/i1OW6ayttqTLrpcttLnVewWbiIMUWRLJz0
	RmmzuEZZCfCRwALk8iiU5w1FrdEn80w8EaCCPuo1QryLIYZsv52MaPN7dB5/Fx6z
	l6jCl47R23yif+/qQfkM5FhT8f14UNd2fOQ2jupj4TKMNHZrqVPmmT6zOyrtzDL+
	5l4JKsIwHiZQIhO4ZAJ6D3jyEh4dbR9gTyjgAnpZqeLCk36mMOeNAxvWBa4P3WlY
	+e2yGHnhMeCh/SpVzWeo/Iwoh3bYrLMJDCh6MNDsq527n5lkVfRmsYCXMJgLDRBL
	uQNQSA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795563115; x=1796167915; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=G1ZAm7akP9D8mbltmYnzmqncqYxXc4x3mIjxdEr9bU4=;
        b=LbzxSFSv5hG/YXHbvJmU1yYLp5rZGkThwChjYhVvgiDoH0HDCf1qQ/+MlhM9ZBstmz
         Yg31y4LMDvtUmxmLpg+IMpdTJwUXvLPpUbwh9KJTyw8dW8S3v/m+SXO/NVGrzAq9kCRZ
         fH6g/6TmmC5b37+rVmrtERO5rHdC6m/962rRi0qkHNfL50XdnGmr+DVR/VzfRGLFCqou
         aApS6Iliz8jsOSJogOC7WNw1Q9s+vww28jAaf06Db4vy6+lC+RjXt/HiXMda3/iXAvTf
         4v9Zcq5EQwbrsLPb5Keyy/aEfkBPxeGCqSM7plKwHdNEX0OMYNmibD2FKJ2ygH95PSn3
         J5Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795563115; x=1796167915;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G1ZAm7akP9D8mbltmYnzmqncqYxXc4x3mIjxdEr9bU4=;
        b=OXDCT0zDpy2HaKHAmrHPMhncBiGKzFiJJlMfJZ2AjcKXX5eUyQD1biy0PFZ7P5Wze6
         ikZo4AK/w0/YqHzMfDnURI0Vpqeb6+3pkg/PBdt7r3jelRqDHwdC6Iybv/H+3SZWNJK2
         VYdisEBIGXfFXSOJShks3I0E93l3yTZ6TbO9yxti8yRO24ND6M0BQBQ6k2pSx5coTkx9
         TeOD56NEcpDAfjfB9+uAuEP5b5KOTE60VcH/ik15U0n2pm/feJ5rlEvtEBpy1N/Mh0Yf
         Ucs5qRyKGRW4llk14GnYHMamrQbBBKUi26aXHVd4aLfxoTGOiL24/2J4YJob5f1XovWc
         Nbew==
X-Gm-Message-State: APuU4Z+J8XB5d/LUkiIk3hFK20MHRoBYYeZ13Z0Rb/FzDZ6cI9rHOU3f
	qEKRXXDIC+VTG/GA035kOXRxZkibGjYkxqduBSMfu8KJg2no9gFeXm2s5Zgi4GoJJ+R7iELbS/t
	fxK1UQAmym7p+J/NcH/cvlrFNKlm6HOtXtXz63vi6lGFTWE2Da3qpFU0JZTXe/3m32ZjcAQ==
X-Gm-Gg: AZFdTZcC6z5YcRmi3PLhE3P0lQif1NNZ2Yl3T1dOOSEGd4/8Q0R6BhOTrRiNlw/tg4g
	PvTUBN3OZuDK35BEammtF9kCZ9qZ6ylXEGW/kusM+/JcVyFY/WTm+NEt9WqbRwnZctlF4FmqEaI
	RZeiVqtj/f8u5pXleyCKXG7tcyEovq/xDALSfF3PFIiRvsI8j+yOUMOnjssS1XxDXXlFMBEt4j2
	fDkIzJnHCw7G6P7I3dtMfUwsqgjUXi9Kzp2PMan4VWLA6JMWVCdvrDN3lPX+BN9rTcIAcyutcEc
	Q85Z0o/hBgTPzzjEvMZT+tLeunB7NMKaC72gkUB1tHudViX9jZUNA1J7Wj5I9RH9VX9OHoI0ndH
	Zqc5wFHAi1AaAKqLUO7Y/nvFSxOxI2U7tBC0vJVA+B9rf6XRWH/WoFeU0RYqeZ6wjzYI5mPeiMf
	NRVG4z3Gk=
X-Received: by 2002:a05:690c:e3d2:b0:873:5c0f:27c with SMTP id 00721157ae682-8b5204ad248mr71151117b3.38.1795563114749;
        Tue, 24 Nov 2026 15:31:54 -0800 (PST)
X-Received: by 2002:a05:690c:e3d2:b0:873:5c0f:27c with SMTP id 00721157ae682-8b5204ad248mr71150797b3.38.1795563114026;
        Tue, 24 Nov 2026 15:31:54 -0800 (PST)
Message-ID: <2f326926-16e7-478d-bc57-86052033199b@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 00:31:52 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 09/21] i386/xen: Don't inject event on invalid port in
 qmp_xen_event_inject()
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: xen-devel@lists.xenproject.org, kvm@vger.kernel.org,
        Paolo Bonzini <pbonzini@redhat.com>,
        Peter Maydell
 <peter.maydell@linaro.org>, Paul Durrant <paul@xen.org>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Anthony PERARD <anthony@xenproject.org>,
        "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
        "Michael S . Tsirkin" <mst@redhat.com>,
        Richard Henderson <richard.henderson@linaro.org>,
        Marcelo Tosatti <mtosatti@redhat.com>,
        =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
        Jason Wang <jasowangio@gmail.com>, Hui Peng <benquike@gmail.com>,
        Mark Syms <mark.syms@citrix.com>, Feifan Qian <bea1e@proton.me>,
        David Woodhouse <dwmw@amazon.co.uk>
References: <20261124232247.23169-1-dwmw2@infradead.org>
 <20261124232247.23169-10-dwmw2@infradead.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261124232247.23169-10-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: HZnqHRRYtTGzxXy2BEr2hGDOdnvdjeP6
X-Proofpoint-GUID: HZnqHRRYtTGzxXy2BEr2hGDOdnvdjeP6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA5MiBTYWx0ZWRfX6QbHAoH/BRyN
 wBBsnVWl1P6xFZ1s5rFun0T+v5gMfXjlUkKUrybD3uwf4FBp07HTv5D5fzLMLQSv8GIh/k0AbpF
 lc27fcGxv2nOH63uxMg+/1HKnj50dpM=
X-Authority-Analysis: v=2.4 cv=JqtkP84C c=1 sm=1 tr=0 ts=6b061e6b cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=nz36NW0qrpeEijYxj/H2Ew==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=p0WdMEafAAAA:8 a=pBOR-ozoAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA5MiBTYWx0ZWRfXwwRBsbq9M8Qd
 g7z+bPszE0b37mvP4dct0vl+IwvAv+Hm3KKU9Q1haEp+MRxHIchfkoFajK2IcfKhMzeLfeMjgAI
 5HDvZhNsgU9P7ws8irUjZoWKodlMEzgO8i7tLpcgzgfrbO7/zde8wJIWbPZQJL+OWKS1XRdOFHm
 PUAcNMVx1cPylbJOD73H0kU6ENnCx/v9qDM6XxYuCQ+NKY8RfFziA5DBQb7yEbv5ViXbT51E2rQ
 KapXj8ge5Bwvq4/21tWrdR3BD/lT8z3a1OJ7nbOCl5GR3YBQ0F91ZyqeepIvD8g6O3KsHFtka+M
 Qdt/smpzhR2hh/CvQLSx2eQPUUUB3Ixowb97vB+hTjPaCId5ICvzODsgpkksx/Io5hdEjSe5Us0
 ql9c/WRLd1m2DdUaSnihciqaZZjRF/G0dL9JOSiGX8e7pz+EDKWvBdx1GTyV3QobeKneuNRlVci
 /FVpc+OqeXN8EHWcUqg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_06,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611240092
X-purgate-ID: tlsNG-c201ff/1795563118-F4AA72A1-1ED2952A/0/0
X-purgate-type: clean
X-purgate-size: 663
X-Spam-Status: No, score=-22.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 25/11/26 00:22, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> qmp_xen_event_inject() reported the invalid port with error_setg() but
> then carried on regardless, passing it to set_port_pending(). Return
> after setting the error.
> 
> Fixes: 507cb64d6e66 ("i386/xen: add monitor commands to test event injection")
> Reported-by: Hui Peng <benquike@gmail.com>
> Closes: https://gitlab.com/qemu-project/qemu/-/work_items/4525
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/i386/kvm/xen_evtchn.c | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

