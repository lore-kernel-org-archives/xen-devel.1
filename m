Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B32606A32A
	for <xen-devel@archiver.kernel.org>; Mon,  9 Nov 2026 09:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CVfpLeBo;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dDRGtwg1
Received: from list by lists.xenproject.org with outflank-mailman.1479716.1683629 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQLWW-0006Qg-Ih; Mon, 09 Nov 2026 09:18:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1479716.1683629; Mon, 09 Nov 2026 09:18:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQLWW-0006QZ-DQ; Mon, 09 Nov 2026 09:18:44 +0000
Received: by outflank-mailman (input) for mailman id 1479716;
 Mon, 09 Nov 2026 09:14:47 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <abel.vesa@oss.qualcomm.com>) id 1xQLSh-0005zZ-Ka
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 09:14:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQLSg-006tTM-MD
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 10:14:46 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <abel.vesa@oss.qualcomm.com>)
 id 6af18f04-8faa-0a2a0a5109dd-0a2a4507d2fa-10
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 10:14:46 +0100
Received: from [205.220.180.131] (helo=mx0b-0031df01.pphosted.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <abel.vesa@oss.qualcomm.com>)
 id 6af18f04-b4ea-0a2a45070019-cddcb4830986-3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 10:14:46 +0100
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A96AAEf2540203
 for <xen-devel@lists.xenproject.org>; Mon, 9 Nov 2026 09:14:44 GMT
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsvc6nj0u-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 09:14:44 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-93f37c94ceeso134962185a.1
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 01:14:44 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b795024730sm161196965e9.4.2026.11.09.01.14.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2026 01:14:42 -0800 (PST)
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
	uzBgUaP0PFQaZpqv52w=; b=CVfpLeBo3svBArcIsMoE8xRGgAiB5mlup0YLE+WU
	miqzZlFGvtGNDDsox8E4acOXK3gFfIwXz4N9NuUoFgsvQYzB36fLfpJjeTRHqc6s
	uy0gSyaVcClNbyTOzA2q8KZ6eX3yeJTqJ/ms2Qw2AhTUM6hxMMbK1fitbXikNI1A
	3N1EEpVY6+IW/Gl778ykaY1gR/3PEmrnDIUD2fTp/fa3Hmb8ffAS6UIbg308OCav
	3+Nx4dhrSnt3yHskSXih/XRxBQbXscbe0NIynFJkTP78h6opo1QkdQ+HiyPEGFcV
	CwIq9i7JbhtLjvjXIsVC9XTOcHDqrOSl9f6bgU8BbCtJVA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794215684; x=1794820484; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dvY4KBfiISm+CQm5KIDUrtb6uzBgUaP0PFQaZpqv52w=;
        b=dDRGtwg1w31fjxdy0/n5RlNjQuPG1R3ffz3R48IcGwYZAf8F9x+AMjM0ZWr12sCAUT
         Ckxk911xnTkvt14ASO7gMZkznwxjueUq6FAekhSIKXVec7s+mRrY3S0S16oeRbBXWing
         jiue/7RN2o0e+awptL0SGF2tffXprTX+olpmMzcfytPPFMCdDrfGcnruLxUFhWyVtZdZ
         H6HFPrV8Iz9+RA/gVxXFodBEiCPZrcXwwzQzRw1VeLNpXzMQi1zpAtUww9V8FjpWrcak
         h3WmX69qEg/yTEDqydNMY9C5MPBdtsJ5QmcBp5gp2lbS9eTC9mMeD35l7whDraRUcUPa
         7ETQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794215684; x=1794820484;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dvY4KBfiISm+CQm5KIDUrtb6uzBgUaP0PFQaZpqv52w=;
        b=FKcu/xcBTyyg/4tr1y7nlPkMON9cZue8Fl+Mjjq3l7XnykRcuTQPx/dYESSPtsOUvG
         HUX53vgacSh2bwqVos01H6T71MWY6TSdZH5n6qG8rLdfTqlYe7zHI/4OXrAMjoryGUyJ
         A48mkKvcCgLitsU/I6aiBZV8hDuxBEP9LuKyq5c/Xg6jFABdZW+gNLiIEoWgXrEyX8pr
         G3wvv6h/8+EgTLBKzPq16TeH43snzNIrcAeV3JyH2j/3jMNsHn0ovFX3kuFKMD+GZDQ1
         XAmt43OgDK+CqpYZEs/k/YVinA8tijQcCY8a8stcXyuNuaTsI9z2R2T6BLqF52zRX6Sx
         1L3w==
X-Forwarded-Encrypted: i=1; AL+hErEqpVniOA+4EerX37nL7IqWH/o53dc2A/uhcXeP4C56EUCT8i623PktTmxuDmUi4BDf7YIFXXEyjKQ=@lists.xenproject.org
X-Gm-Message-State: APuU4Z8jTg8iRUtyoZ2xy+lS5FaK0Pqbf5eFsnlEXB8kEV69re7gzCCK
	ieSecjXfN3jGKhBJ7ms4UCkTQCjnuOYCfVFV1Oik1xpuwbsucazjmHEJ/M0ZKxs/lALAQW/Edm5
	hjHYMnn7qsT18LoyLsoI7DOgBwXbtl02H1rSjitPC/hs1E14zpRI/1q3IT8xn5LIhDZWt8Q==
X-Gm-Gg: AYBFou07mBUglnzyRM4zat4R07LQtr3xiaRZa++UqAgZcJBWqNHRfPqdOCK6PwRqr7L
	IbMy40BJkd3LfToTO8k+rLXLgLIvZizueB8KBSD75hjsQJe9vt6NdiInJ/CrrBcndV0RIm+oa2W
	SdVGFxVN5XoMJZi8Ki5jfPlUvK++Cerui+bAytTN3cJ2U853TrgwQklzAySGHpSzHf+MOAvxQER
	fnGbw3zn0hs7kHhSP6VCX9Cik3NJ596tMaOS4jbCU1k2zHfysLuFHZ2omZUiWwqbdt4xTUHuZ25
	G22RdixIxrlNdjeJeTEEQHpzUwaS4jvftCNxWMNJssj1yAur0oH7Julu1rkK4uP1AIBQW81CPxV
	x4emMvF3/N/tC1hwSNUCbc40u2ID77to3uZAQd+QImGC/m2tAmkH2I14lWyyLG50=
X-Received: by 2002:a05:620a:1a16:b0:93c:65e3:df81 with SMTP id af79cd13be357-94604d2c6e2mr886323785a.13.1794215683436;
        Mon, 09 Nov 2026 01:14:43 -0800 (PST)
X-Received: by 2002:a05:620a:1a16:b0:93c:65e3:df81 with SMTP id af79cd13be357-94604d2c6e2mr886320985a.13.1794215682798;
        Mon, 09 Nov 2026 01:14:42 -0800 (PST)
Date: Mon, 9 Nov 2026 11:14:38 +0200
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
Message-ID: <tr3hhmd6gqvvzrngazyovx7jfbw6k45yjw2mipqu3aegsy5oda@7qromidf5btb>
References: <20261105-late-2026-mmap_prepare-v1-0-c56aadfbab8a@kernel.org>
 <20261105-late-2026-mmap_prepare-v1-10-c56aadfbab8a@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261105-late-2026-mmap_prepare-v1-10-c56aadfbab8a@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAzNiBTYWx0ZWRfX/XE7Nmk8mEn6
 cukMfIEeM0IFpxpk4W0w82he3ZHeb5htjwJh9CVhUJt7l16FwNzfSRX5pDW0wTKXXAZNjcVyZSY
 cctr0n4lNH93Hd8Qhv1eGgGTvJuzazgmDgN2AueYSJCY8D+MRaeWunP/7/RJqa0zz5nb6opyXxQ
 bkxhMMzciWTQ89/UmPRbYXgt5MYLS4dckK93JPiV5/1PnMDwTYYs4ZBUE7cQbiA6ReSZc/VZizU
 e8+d2UEot0uTdPZzS/dj5OjNqyNFpKscFcZ/WL5Lt3i83COQhlLHau7URutFi3yps9winPIRWqw
 67wnXdelHOvaeJgkzicmG6fzUauw9JiiW0KhxSg6jUbaP5+ZdKFYeCf1pmSqWyaboAuPwV1tN5/
 NJYZUJMzvkZ0jnzdH/mk/bN/8ktLYk/c7b6b2A24BwJ0b1IRKHwSr7Ku7erUShsquZWNSVdvac5
 AXAcaUKx6zU9JrpNchQ==
X-Authority-Analysis: v=2.4 cv=WOjqzXsR c=1 sm=1 tr=0 ts=6af18f04 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=2UNkV1bVvYdQOko7pskA:9 a=CjuIK1q_8ugA:10
 a=QtEvL3ry9E0A:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAzNiBTYWx0ZWRfX+lk1l5+ymbjs
 t1bDAfLJLImjkp4uS4CQVQ9S8gmBM246DDarkv/tw+mWXWiJZqd9noF/5f5WQnctiYFAE852bIP
 T1HAZtnZGqFPDuZ7LSt7xVTvrNN0Qvs=
X-Proofpoint-ORIG-GUID: H_UWWEf7qns_P0dEONoTfHTVYguEewm1
X-Proofpoint-GUID: H_UWWEf7qns_P0dEONoTfHTVYguEewm1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 priorityscore=1501 clxscore=1011
 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090036
X-purgate-ID: tlsNG-ef75cf/1794215686-34AC8AE4-6E5961C2/0/0
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

