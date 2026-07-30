Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2272DC54FDF
	for <xen-devel@archiver.kernel.org>; Thu, 30 Jul 2026 10:09:27 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1377415.1623483 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpNhP-0006Zj-FY; Thu, 30 Jul 2026 10:09:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1377415.1623483; Thu, 30 Jul 2026 10:09:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpNhP-0006Zc-Cz; Thu, 30 Jul 2026 10:09:11 +0000
Received: by outflank-mailman (input) for mailman id 1377415;
 Thu, 30 Jul 2026 10:09:09 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <agordeev@linux.ibm.com>) id 1wpNhN-0006ZT-HO
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2026 10:09:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wpNhM-00D9U6-U5
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2026 12:09:08 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <agordeev@linux.ibm.com>)
 id 6a6b22c1-2eae-0a2a0a5409dd-0a2a450ac8fa-14
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jul 2026 12:09:08 +0200
Received: from [148.163.158.5] (helo=mx0b-001b2d01.pphosted.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <agordeev@linux.ibm.com>)
 id 6a6b22c3-f2d2-0a2a450a0019-94a39e052c2e-3
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jul 2026 12:09:08 +0200
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66U6m2hU2316588; Thu, 30 Jul 2026 10:08:26 GMT
Received: from ppma21.wdc07v.mail.ibm.com
 (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4fmuwd6a7b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Jul 2026 10:08:25 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
 by ppma21.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 66U9fHHZ004184;
 Thu, 30 Jul 2026 10:08:25 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
 by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4fn8fkatpu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Jul 2026 10:08:24 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com
 [10.20.54.102])
 by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 66UA8Mar34079042
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 30 Jul 2026 10:08:22 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8C9E62004F;
 Thu, 30 Jul 2026 10:08:22 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C8DEC20040;
 Thu, 30 Jul 2026 10:08:21 +0000 (GMT)
Received: from li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com (unknown
 [9.224.92.206])
 by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTPS;
 Thu, 30 Jul 2026 10:08:21 +0000 (GMT)
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
	:references:subject:to; s=pp1; bh=SyEKmgQDKWQNaqyjGD9/StXJGEDRDY
	1U+s/7IVPb15Q=; b=mpgStl8w7nM9YhaejMlJKR3MpAZdEg3CMrKaAXvLKHr7vT
	6VVwUWTv94MCyV0t0LoEvX4NTx8I4oV6Z0RyamfkVYt+l2AOdDneecdkibOEY1+b
	fD9XwZ3K4X8hUfJXGoIotglUANfOJDNKrE0DS35mkwFOijc9A8vDRLcyW5rJpkQl
	ZSz6TwC2s319vuPGylh8x/WmuWHPvwVDTCys8JeV+xWvLk555y/ELhHSpwIRUICY
	YonccknjvF9P+MZBOhJqIBxdnhuPD4Gkn7+w9bgCc5mVY0U6J1Gm6Uc9d61V0Jez
	zbYakob6m6/arpoFMao3y0RyGCx0NamVLgwru4iQ==
Date: Thu, 30 Jul 2026 12:08:20 +0200
From: Alexander Gordeev <agordeev@linux.ibm.com>
To: Muhammad Usama Anjum <usama.anjum@arm.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
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
        David Hildenbrand <david@kernel.org>,
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
Subject: Re: [PATCH RFC 05/11] mm: convert PTE table entries in ptep_get()
Message-ID: <34eed5fd-c569-49d8-bc4d-a3d4b1207fbd-agordeev@linux.ibm.com>
References: <20260727164715.2866609-1-usama.anjum@arm.com>
 <20260727164715.2866609-6-usama.anjum@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260727164715.2866609-6-usama.anjum@arm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: o0rywYqMRb9-o-diVy_ik6hJzY7jXbKp
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA3MiBTYWx0ZWRfX9YzlV5X9xylI
 niwszbMcVKFzbqv5lB4+x3UMXHiu2Na/LX64PyF/7hm6373GBwUh9Nzp3rKvPU5zk189VQCofLr
 rPG5w4Fu4iCy4m6kL6IwmlpOMbpH93Q=
X-Authority-Analysis: v=2.4 cv=E/z9Y6dl c=1 sm=1 tr=0 ts=6a6b2299 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=RzCfie-kr_QcCd8fBx8p:22 a=7CQSdrXTAAAA:8
 a=rd7UzSewfSqtCNqF-5IA:9 a=CjuIK1q_8ugA:10 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA3MiBTYWx0ZWRfX5SpBi0HAiQ/C
 9ni/l34t00qdV/3lkOyjkRQMHI/bzArsCFIkiciKZ8adXpzfTg+v45rnYJqhyhndiqeJpPiwNep
 VZubCJTxxNPdh7fUODcM7dZfoUnpFjzvPK4ZEbfqEnIme5xp5/3dh/jC+Bz0wOnfq0jzNGqzp01
 zPArarMM0ovv+hNUMHMW7KFO1ciq6TJyi7CqiLbDAikACDO4XCNopg90PkO7ZmmtnKQKZqCc3Iu
 vjfATt8qU+7UDSj5FM+YWzMlFLtZ7yd+VsugakgEKb3nBJHhgB/c4j80i+hmodLARApOX/lUvJi
 hIn4WaO+yfetcmUKLTaNKagXUiUaD1+XmWFrHFYPqNS0/OPuPyGwB/Il8okWMucK5lVYiKp9Avl
 wy0uPYNZ2zKQHtwferVMHYGgVjDdrnJfKZLKq+RVgKww7RVJrU9y33ZnAADV+Y5aXFTSzYQrdU5
 SYDEkUDGowOYGL7zbLg==
X-Proofpoint-GUID: o0rywYqMRb9-o-diVy_ik6hJzY7jXbKp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_02,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300072
X-purgate-ID: tlsNG-4011c0/1785406148-504CFCFC-B01684B5/0/0
X-purgate-type: clean
X-purgate-size: 1409

On Mon, Jul 27, 2026 at 05:46:56PM +0100, Muhammad Usama Anjum wrote:
> ptep_get() now accepts a pointer to hw_pte_t storage but must continue to
> return a logical pte_t value. Add __pte_from_hw() as the conversion hook
> and apply it in the generic ptep_get() implementation.
> 
> Signed-off-by: Muhammad Usama Anjum <usama.anjum@arm.com>
> ---
>  include/linux/pgtable.h       | 2 +-
>  include/linux/pgtable_types.h | 1 +
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> index dad80d264aac2..3003ac9cd81fe 100644
> --- a/include/linux/pgtable.h
> +++ b/include/linux/pgtable.h
> @@ -493,7 +493,7 @@ static inline int pudp_set_access_flags(struct vm_area_struct *vma,
>  #ifndef ptep_get
>  static inline pte_t ptep_get(hw_pte_t *ptep)
>  {
> -	return READ_ONCE(*ptep);
> +	return READ_ONCE(__pte_from_hw(*ptep));

Should it be something like?

	return __pte_from_hw(READ_ONCE(*ptep));

>  }
>  #endif
>  
> diff --git a/include/linux/pgtable_types.h b/include/linux/pgtable_types.h
> index ed5dba42a4f8c..61afe27307ec2 100644
> --- a/include/linux/pgtable_types.h
> +++ b/include/linux/pgtable_types.h
> @@ -6,6 +6,7 @@
>  
>  #ifndef __HAVE_ARCH_HW_PTE_T
>  #define hw_pte_t pte_t
> +#define __pte_from_hw(pte)	(pte)
>  #endif
>  
>  #endif /* _LINUX_PGTABLE_TYPES_H */
> -- 
> 2.47.3
> 

