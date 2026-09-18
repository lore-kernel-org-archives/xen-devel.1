Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47A49C982D8
	for <xen-devel@archiver.kernel.org>; Fri, 18 Sep 2026 12:58:25 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1425295.1649342 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7YAJ-0003xO-DY; Fri, 18 Sep 2026 12:58:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1425295.1649342; Fri, 18 Sep 2026 12:58:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7YAJ-0003xH-9z; Fri, 18 Sep 2026 12:58:07 +0000
Received: by outflank-mailman (input) for mailman id 1425295;
 Fri, 18 Sep 2026 12:58:05 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <agordeev@linux.ibm.com>) id 1x7YAH-0003xB-C6
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2026 12:58:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x7YAG-006At9-Kp
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2026 14:58:04 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <agordeev@linux.ibm.com>)
 id 6aad3547-bab6-0a2a0a5309dd-0a2a4508dffc-46
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 14:58:04 +0200
Received: from [148.163.158.5] (helo=mx0b-001b2d01.pphosted.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <agordeev@linux.ibm.com>)
 id 6aad355b-f659-0a2a45080019-94a39e05e4cc-3
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 14:58:04 +0200
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68IA2ka3990915; Fri, 18 Sep 2026 12:57:18 GMT
Received: from ppma13.dal12v.mail.ibm.com
 (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4gmxcvfgrx-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 18 Sep 2026 12:57:17 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
 by ppma13.dal12v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id
 68I9oGpj507832; Fri, 18 Sep 2026 12:57:16 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
 by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4gra3yxedq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Sep 2026 12:57:16 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com
 [10.20.54.106])
 by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 68ICvEb851904874
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Sep 2026 12:57:14 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9D53820043;
 Fri, 18 Sep 2026 12:57:14 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EB2DB20040;
 Fri, 18 Sep 2026 12:57:13 +0000 (GMT)
Received: from li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com (unknown
 [9.224.92.206])
 by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTPS;
 Fri, 18 Sep 2026 12:57:13 +0000 (GMT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=pp1 header.d=ibm.com header.i="@ibm.com" header.h="Cc:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=vvXTEBXtIpBfma8CBebbY+SSqqX1Qu
	WR6+4vIHcllvk=; b=byvnC9DgZuLKYo4mY9QFMiFQ6Zc5eAvVokdOQ/jMnu/ROL
	Ihy697HfGNSs027KQksAAkjwX7YaRrLsOO1g/6wd0s+CHm/STBQ5bGQE02PrUNuG
	/jNGEuQyMJ0GgJpPIZLUjqfcXRUhYNBUGxSiAGrMMe/ZN3ie+9Negm0sXqB2qPGg
	G78+ulSPRFoKyeDh2Y4ugEz6Mth2PVTjmT/mNSj1OZo6IEDn3Mmfrt4AuGBiF3It
	82M05ljqdaF9c5/06LrZaWpRH1x7tFsqkPtu0asE5M/h1WbsI4/lZhbLwmk3A6qp
	RqNdQRRqouleichhat5Xw20CbOufAHP17/U7CBSg==
Date: Fri, 18 Sep 2026 14:57:12 +0200
From: Alexander Gordeev <agordeev@linux.ibm.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Muhammad Usama Anjum <usama.anjum@arm.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Tvrtko Ursulin <tursulin@ursulin.net>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Dimitri Sivanich <dimitri.sivanich@hpe.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        Helge Deller <deller@gmx.de>, Juergen Gross <jgross@suse.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Muchun Song <muchun.song@linux.dev>,
        Oscar Salvador <osalvador@suse.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        "Liam R. Howlett" <liam@infradead.org>,
        Lorenzo Stoakes <ljs@kernel.org>, Will Deacon <will@kernel.org>,
        "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
        Nick Piggin <npiggin@gmail.com>, Peter Zijlstra <peterz@infradead.org>,
        Andrey Ryabinin <ryabinin.a.a@gmail.com>,
        Pasha Tatashin <pasha.tatashin@soleen.com>,
        Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>,
        Uladzislau Rezki <urezki@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Andrii Nakryiko <andrii@kernel.org>,
        Eduard Zingerman <eddyz87@gmail.com>,
        Kumar Kartikeya Dwivedi <memxor@gmail.com>,
        Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Namhyung Kim <namhyung@kernel.org>, SJ Park <sj@kernel.org>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Jan Kara <jack@suse.cz>, Jason Gunthorpe <jgg@ziepe.ca>,
        Leon Romanovsky <leon@kernel.org>, Miaohe Lin <linmiaohe@huawei.com>,
        Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>,
        Christoph Lameter <cl@gentwo.org>, Mike Rapoport <rppt@kernel.org>,
        Johannes Weiner <hannes@cmpxchg.org>, ziy@nvidia.com, pfalcato@suse.de,
        ryan.roberts@arm.com, linux-kernel@vger.kernel.org,
        intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-parisc@vger.kernel.org, xen-devel@lists.xenproject.org,
        linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
        linux-arch@vger.kernel.org, kasan-dev@googlegroups.com,
        linux-trace-kernel@vger.kernel.org, bpf@vger.kernel.org,
        linux-perf-users@vger.kernel.org, damon@lists.linux.dev
Subject: Re: [PATCH v2 0/8] mm: distinguish PTE table storage from PTE values
Message-ID: <d4080bad-1546-4a9a-9325-7ab91161a9b9-agordeev@linux.ibm.com>
References: <20260903103002.1091859-1-usama.anjum@arm.com>
 <dd6ecac2-9bd2-4184-a034-9e13afa614bb@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dd6ecac2-9bd2-4184-a034-9e13afa614bb@kernel.org>
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDE3NyBTYWx0ZWRfX0a+YmMinfqLY
 thIpqQ3k+YsaEL1Nu5Xtb4MVEpoHSHo6PXFxsq+F/Wx3xKw0f3hhtQwBUt801YS/UAG/0atek9m
 HF3E84n9wG4sj7upDsGZ+DoHJXM8gUk=
X-Proofpoint-ORIG-GUID: m4DES1QILxZeg9-Jkqr1aSPqQzDTxZM1
X-Proofpoint-GUID: m4DES1QILxZeg9-Jkqr1aSPqQzDTxZM1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE3NyBTYWx0ZWRfX/T2l95nFB1Uq
 xYhD9MK3T3CmjxCnR5kdtXxgndhWw6MxRYXoXqGlboj2UoA37O8EdLIe4YiWjjUCSxbCjYPDLdb
 zLflGPxTioAC9+xJzOGZkBco09vb3ShkcVMCROX8/GZfFwvrgzmx7n0qXL0rX5zPKB/njtDxwgb
 gMHToemhE70TFtiB9Pj1PeVjgH1oGQscKJTsEGRxHL5kVet2L1efcSErMDeLFJpVDhkGjX606/4
 v67gUAI8g2+alWIwtI8/jPJ+6ph22PnYWj6b88V7/Iglrvc/jT0GvjzhQ6L6hTrFOvO8q+nsLfd
 IM1uuwdfshQ6+5Im7f+26qdGKHnOEavHW8zEdphBYVrG/drJ0FH1jWiiDkeaELYlUGloVtsBlh+
 7nM/BRgAPEjc6uhD2wSkdjVssp3wph+7cmdpYUKnvEQX/Ft2fdQFowSRajI1e1u1DVerG791p4M
 bjrU9H6l+Tvys0K+DAw==
X-Authority-Analysis: v=2.4 cv=F+7C5ahN c=1 sm=1 tr=0 ts=6aad352d cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=RzCfie-kr_QcCd8fBx8p:22 a=36OLCuKFP8Pi5wnj2vYA:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 clxscore=1011 malwarescore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180177
X-purgate-ID: tlsNG-c1860d/1789736284-CC77387B-635A3935/0/0
X-purgate-type: clean
X-purgate-size: 604

On Fri, Sep 11, 2026 at 06:55:18PM +0200, David Hildenbrand (Arm) wrote:

Hi David, Muhammad,

Sorry for the long delay.

> Unless there is more feedback on the overall approach, the next step for this is
> to have at least one architecture support posted.
> 
> We should only merge this if at least one architecture (better two? :) arm64 and
> s390x? ) would merge the architecture bits.

I am going to give it a try, hopefully next week.

> That is, we should get an ACK from the arch maintainer son the common code bits
> and the arch bits.
> 
> -- 
> Cheers,

Thanks!

> David

