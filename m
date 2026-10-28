Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31934606A31A
	for <xen-devel@archiver.kernel.org>; Wed, 28 Oct 2026 03:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Jve2qMQH;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bokX1XPp
Received: from list by lists.xenproject.org with outflank-mailman.1462820.1673806 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLuSl-00016W-QH; Wed, 28 Oct 2026 03:36:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1462820.1673806; Wed, 28 Oct 2026 03:36:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLuSl-00016P-Ni; Wed, 28 Oct 2026 03:36:31 +0000
Received: by outflank-mailman (input) for mailman id 1462820;
 Wed, 28 Oct 2026 03:36:29 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <zhongqiu.han@oss.qualcomm.com>) id 1xLuSj-00016J-LR
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 03:36:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLuSi-00Ax8f-O3
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 04:36:28 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <zhongqiu.han@oss.qualcomm.com>)
 id 6ae16db4-bab6-0a2a0a5309dd-0a2a4506a6ce-6
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 04:36:28 +0100
Received: from [205.220.168.131] (helo=mx0a-0031df01.pphosted.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <zhongqiu.han@oss.qualcomm.com>)
 id 6ae16dba-195a-0a2a45060019-cddca8830cb6-3
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 04:36:28 +0100
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69S0j9GO2277147
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 03:36:25 GMT
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjy712a80-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 03:36:25 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-89e6ddd4554so403616b3a.3
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 20:36:25 -0700 (PDT)
Received: from [10.133.33.27] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3ae5a48ec90sm899533a91.6.2026.10.27.20.36.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Oct 2026 20:36:24 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=qcppdkim1 header.d=qualcomm.com header.i="@qualcomm.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=google header.d=oss.qualcomm.com header.i="@oss.qualcomm.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/wKdshZSDdNYlVlGGww1CWjddpjIdb7CUnZ1PObkTB4=; b=Jve2qMQHUqrEssgK
	LflW6/l7KZ234zJVmm5v4avWWbV1TcUiioz11IU7xNAS3yhP+6JpgpsoOMhZWZvJ
	IPei/BNfJ7ExWg/tShStITm6QZsRQXDRsGswXFZFnq+o9ga6nmbSa33m3OhRLXWT
	jNycF1Ub6eUUeiAVgYu5ZaX6svI7KSL3EU6+K53Rnc/d554YMUVQJALzktVCxxiV
	q+Kz86xf3mp9SK5/sBZk8qiecR2lpX8aT+GhaHVmok95F2t7X+5DAAukw34dJtRr
	PnVGLMYR/XaeQ9zEg45sqiPgK2kxAakvx9jugL9konNgiu/4GNvqT3B3MXccU96s
	aGnIQQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793158585; x=1793763385; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/wKdshZSDdNYlVlGGww1CWjddpjIdb7CUnZ1PObkTB4=;
        b=bokX1XPpwcYFFqFs83TA5ZIjFB/MRB/4mw8FskWT/MAonIApI5+k8T2Etr4lGTX0Du
         H+eK3gVuNKpuprcUqNCd/5UjUrw1IYnNkT/nMaXuKNBM3X/CtJOPIM8O4r7kD052XnSp
         8KzWCww8tvk1Xh03EpYdfzyKYeuYsuRqI89andk3hwfz1iGqql6gzKy0mZRuuTVDAZvQ
         xyW/7IZyac4IsNPclLx10ME4kiOocCZEz0BhLyoCzr6QXFkB8sSAjVf+XKgosKTwRGFj
         UNj3z/GYX/puATtNqM9/QOAcQIVweOXS0baa57RkT2jZjgkDI/kFoM/bgyjNXXCRxN4X
         FDcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793158585; x=1793763385;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/wKdshZSDdNYlVlGGww1CWjddpjIdb7CUnZ1PObkTB4=;
        b=y4CnKAzotb6ah2bB4uNQph6eDSUW7zgWsSDTax0AdWrYvTQDQJWE5r2E/SJTOlvK58
         JfKDMCjUsNXuiV3U7dfZU0m+wgvvRrB7jJmIMMLDDqxd9+kHDNk4ASLaTSGQEQZL7JPl
         FcjuQndGw0KvUw24ymvvkIV4+UN7Gk2+3xrM2U3e0o1YMpqQ3QUGUC7PK62zvJvnfgTV
         N86ZyuNjE1927OOa6zMiQYtltVqEklIzQDfM4gOJtrsqZTwxk3kT+rTj371haD1l1CJF
         BVj7o3H0FN8TYVaXFnPScRedtvvxC0ki4QI2CuiKyFegdYA7F0JARiJsj6o30xgu9oHs
         ZbCA==
X-Forwarded-Encrypted: i=1; AKwUvBzUVk/s/fMLn5lL1why4f+UIuYIBboaqGCeK4x+dzstSJCNq7Rra3cEljc+zGNUc/vCDRbAorbZFb4=@lists.xenproject.org
X-Gm-Message-State: AFq9FYLBMmO9H3LfECnEBk9GdXqjdIEEERrgZacEuZalsiIV8zwfjPx/
	tKvR2ufPhhpdbjywu4y3azjE8tzcKZl3i6ZBbbg0VhhQLBzUneF+6zvFxewOJWOjteL6VZDnxX2
	7ZyzO3yh7kjXpFTafpEwgFqhzyuARiMoQlqvdP5pk9V34BNj84PUh+lmgIvczCO2VMpgSEw==
X-Gm-Gg: AYBFou0l030Gcd8br4cS6xLzEOnXFhP5nfBYfvIf29uPYgMId5F5SscwOJxRNE+zonM
	Nx9Mr73pbXygo7+w5A27/hkMFJrnsWN02/AWmaJ0IH2fHNhxPfvZgaXR/yOn4o0lixeyfFGSoOw
	uQzatOZ2zlygpD4HIP6Vh3zs5VNDhWu545zlwdIKezl1gtn9lefOinSq5scOCmhZ3waLFhkahaN
	DzVv9Ysr1Dg7TBNZ0ABbwmqcn+5IDKtVJYd75YUy3Ix4zQI4VTQxcGC7kk3hqO6y7HKlQ82kwQQ
	vFuioLvrNaFQiT2JnmwnMG99udHrrFuF3Gu7JV0cc0Hsi8SkLw5rnnjZ5RWb1r3A1XfpEOCn2tj
	nq0gMN7L3h6Xn11w+Zq6Qm3IxOsgk5S9bgiT217RibuwUy+7Otdt8OrF2DWoZ6FdRnT4m7Zp7Vg
	toivEk8LRsBVeYuUhAL0kfEsJsgmBSHy9nqahwHORoA4s=
X-Received: by 2002:a17:90b:5863:b0:3ac:b3ff:b476 with SMTP id 98e67ed59e1d1-3ae581836a6mr818178a91.38.1793158584995;
        Tue, 27 Oct 2026 20:36:24 -0700 (PDT)
X-Received: by 2002:a17:90b:5863:b0:3ac:b3ff:b476 with SMTP id 98e67ed59e1d1-3ae581836a6mr818144a91.38.1793158584441;
        Tue, 27 Oct 2026 20:36:24 -0700 (PDT)
Message-ID: <e5bd0521-36d1-447d-b71a-94a2e07414e2@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 11:36:16 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/9] cpufreq: governor: Initialize kobj_type release
 callback statically
To: Ian Rogers <irogers@google.com>, Kees Cook <kees@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Zhihao Cheng <chengzhihao1@huawei.com>,
        Sumanth Korikkar <sumanthk@linux.ibm.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>, driver-core@lists.linux.dev,
        llvm@lists.linux.dev, linux-hardening@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-pm@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org,
        linux-s390@vger.kernel.org, gfs2@lists.linux.dev,
        xen-devel@lists.xenproject.org, linux-mtd@lists.infradead.org,
        amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, Viresh Kumar <viresh.kumar@linaro.org>,
        zhongqiu.han@oss.qualcomm.com
References: <20261027223847.652884-1-irogers@google.com>
 <20261027223847.652884-5-irogers@google.com>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <20261027223847.652884-5-irogers@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDAxNCBTYWx0ZWRfX1AQFRVz7DjUF
 c+eUq9EI1ygcSsMW+PGKKK1S6ssgYUIgpdjOJTkAzAlQQsor77tcnLp0k0W+rEyYj7mVIRx4geA
 LkvuAceBHalIhZlfLqgfcWRO11lT0CsHRHsf7aVc2ThX5OWmYt4IDQSzqpWr06C2Sc0pit6jUwJ
 BoDw5XNm/OorxP4MFrhx7MXsJ30sFOfuz2ipc6BhNQ5M/nSXctvjK60SLTQaMojx7ocWNeumm1z
 oWqpe9LGiSpP3BJGPw38yQj/40m6wyzjPS332jfbg002PVCIa/yV2ecHX3oWL/HN6Q+ILpzGrxi
 xikOEEyGf6RI5PAqolr59WPgaOnKTEN80p9Gk6lJCFEc4YjdDvO5eyCEYCzTIT7RL8kSBCa/WeK
 CBUN1PPGv//Cy8q6S0vX/xfM701GGxOHsmwyRbXaOhSDOSP2e9DFlGO3DqWc4P/ka16IkzN2czp
 5frtVUv89uvfrEBpzyw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDAxNCBTYWx0ZWRfXyZhWMKDAmbeY
 zMJ10E+DQGqijAtoEjpdyf2yt2ttShUbHOyW3em1FFtYM0LDwWgYJWR6CyGhpK6cA8Exw0mHHCA
 bMcZPQjnsQ7uVydy7a1tU3fomprTCXE=
X-Authority-Analysis: v=2.4 cv=JspkP84C c=1 sm=1 tr=0 ts=6ae16db9 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=1XWaLZrsAAAA:8 a=MbyaxBA4Lnn_ULkWIDkA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: NxWYWPHZQuhhiN-mlMypILlsxQZvRQlS
X-Proofpoint-ORIG-GUID: NxWYWPHZQuhhiN-mlMypILlsxQZvRQlS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280014
X-purgate-ID: tlsNG-16d1c6/1793158588-F5A0C77B-074958EF/0/0
X-purgate-type: clean
X-purgate-size: 4733
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Ian,

Thanks for the update.

On 10/28/2026 6:38 AM, Ian Rogers wrote:
> Export cpufreq_dbs_data_release() and set .kobj_type.release statically
> in the ondemand and conservative governors so their gov_attr_set
> kobjects have a valid release callback statically initialized, matching
> cpufreq_governor_dbs. Remove the redundant runtime assignment in

"matching cpufreq_governor_dbs" is a bit confusing to me
(cpufreq_governor_dbs() was removed back in v4.8 by commit e788892ba3cc
("cpufreq: governor: Get rid of governor events")), as it doesn't
seem to refer to anything in the tree. Perhaps we could just drop it,
e.g.:

Export cpufreq_dbs_data_release() and initialize .kobj_type.release
statically in the ondemand and conservative governors instead of
assigning it at runtime in cpufreq_dbs_governor_init().


The code change itself looks good to me. With the changelog updated
(in a respin if the series needs one for other reasons, or when
applying):

Reviewed-by: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>

> cpufreq_dbs_governor_init().
> 
> This prepares for annotating struct kobj_type::release with
> __must_init.
> 
> Signed-off-by: Ian Rogers <irogers@google.com>
> ---
>   drivers/cpufreq/cpufreq_conservative.c | 5 ++++-
>   drivers/cpufreq/cpufreq_governor.c     | 4 ++--
>   drivers/cpufreq/cpufreq_governor.h     | 1 +
>   drivers/cpufreq/cpufreq_ondemand.c     | 5 ++++-
>   4 files changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/cpufreq/cpufreq_conservative.c b/drivers/cpufreq/cpufreq_conservative.c
> index 02bfd46543e9..146a2353b1a2 100644
> --- a/drivers/cpufreq/cpufreq_conservative.c
> +++ b/drivers/cpufreq/cpufreq_conservative.c
> @@ -318,7 +318,10 @@ static void cs_limits(struct cpufreq_policy *policy)
>   
>   static struct dbs_governor cs_governor = {
>   	.gov = CPUFREQ_DBS_GOVERNOR_INITIALIZER("conservative"),
> -	.kobj_type = { .default_groups = cs_groups },
> +	.kobj_type = {
> +		.release = cpufreq_dbs_data_release,
> +		.default_groups = cs_groups,
> +	},
>   	.gov_dbs_update = cs_dbs_update,
>   	.alloc = cs_alloc,
>   	.free = cs_free,
> diff --git a/drivers/cpufreq/cpufreq_governor.c b/drivers/cpufreq/cpufreq_governor.c
> index f3bd3dbe7c41..f8b5aca09b6b 100644
> --- a/drivers/cpufreq/cpufreq_governor.c
> +++ b/drivers/cpufreq/cpufreq_governor.c
> @@ -419,7 +419,7 @@ static void free_policy_dbs_info(struct policy_dbs_info *policy_dbs,
>   	gov->free(policy_dbs);
>   }
>   
> -static void cpufreq_dbs_data_release(struct kobject *kobj)
> +void cpufreq_dbs_data_release(struct kobject *kobj)
>   {
>   	struct dbs_data *dbs_data = to_dbs_data(to_gov_attr_set(kobj));
>   	struct dbs_governor *gov = dbs_data->gov;
> @@ -427,6 +427,7 @@ static void cpufreq_dbs_data_release(struct kobject *kobj)
>   	gov->exit(dbs_data);
>   	kfree(dbs_data);
>   }
> +EXPORT_SYMBOL_GPL(cpufreq_dbs_data_release);
>   
>   int cpufreq_dbs_governor_init(struct cpufreq_policy *policy)
>   {
> @@ -488,7 +489,6 @@ int cpufreq_dbs_governor_init(struct cpufreq_policy *policy)
>   	policy->governor_data = policy_dbs;
>   
>   	gov->kobj_type.sysfs_ops = &governor_sysfs_ops;
> -	gov->kobj_type.release = cpufreq_dbs_data_release;
>   	ret = kobject_init_and_add(&dbs_data->attr_set.kobj, &gov->kobj_type,
>   				   get_governor_parent_kobj(policy),
>   				   "%s", gov->gov.name);
> diff --git a/drivers/cpufreq/cpufreq_governor.h b/drivers/cpufreq/cpufreq_governor.h
> index 806d8fb4dff1..1026712bb79b 100644
> --- a/drivers/cpufreq/cpufreq_governor.h
> +++ b/drivers/cpufreq/cpufreq_governor.h
> @@ -150,6 +150,7 @@ static inline struct dbs_governor *dbs_governor_of(struct cpufreq_policy *policy
>   }
>   
>   /* Governor callback routines */
> +void cpufreq_dbs_data_release(struct kobject *kobj);
>   int cpufreq_dbs_governor_init(struct cpufreq_policy *policy);
>   void cpufreq_dbs_governor_exit(struct cpufreq_policy *policy);
>   int cpufreq_dbs_governor_start(struct cpufreq_policy *policy);
> diff --git a/drivers/cpufreq/cpufreq_ondemand.c b/drivers/cpufreq/cpufreq_ondemand.c
> index 9942dbb38dae..7386d043c665 100644
> --- a/drivers/cpufreq/cpufreq_ondemand.c
> +++ b/drivers/cpufreq/cpufreq_ondemand.c
> @@ -374,7 +374,10 @@ static struct od_ops od_ops = {
>   
>   static struct dbs_governor od_dbs_gov = {
>   	.gov = CPUFREQ_DBS_GOVERNOR_INITIALIZER("ondemand"),
> -	.kobj_type = { .default_groups = od_groups },
> +	.kobj_type = {
> +		.release = cpufreq_dbs_data_release,
> +		.default_groups = od_groups,
> +	},
>   	.gov_dbs_update = od_dbs_update,
>   	.alloc = od_alloc,
>   	.free = od_free,


-- 
Thx and BRs,
Zhongqiu Han

