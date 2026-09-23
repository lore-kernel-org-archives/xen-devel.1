Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27DDEC98302
	for <xen-devel@archiver.kernel.org>; Wed, 23 Sep 2026 14:20:20 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1430766.1653251 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9NpD-0007d1-2S; Wed, 23 Sep 2026 14:19:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1430766.1653251; Wed, 23 Sep 2026 14:19:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9NpC-0007cu-VO; Wed, 23 Sep 2026 14:19:54 +0000
Received: by outflank-mailman (input) for mailman id 1430766;
 Wed, 23 Sep 2026 14:19:53 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <agordeev@linux.ibm.com>) id 1x9NpB-0007aC-Nx
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 14:19:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9NpA-009PQt-ON
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 16:19:52 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <agordeev@linux.ibm.com>)
 id 6ab3e008-e002-0a2a0a5209dd-0a2a4501b32c-2
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 16:19:52 +0200
Received: from [148.163.156.1] (helo=mx0a-001b2d01.pphosted.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <agordeev@linux.ibm.com>)
 id 6ab3e006-5984-0a2a45010019-94a39c019666-3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 16:19:52 +0200
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68N8Zw1U1031879; Wed, 23 Sep 2026 14:19:11 GMT
Received: from ppma21.wdc07v.mail.ibm.com
 (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4gske1useb-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Wed, 23 Sep 2026 14:19:11 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
 by ppma21.wdc07v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id
 68NCp1Qt007936; Wed, 23 Sep 2026 14:19:10 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
 by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4gvbt2s7yt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Sep 2026 14:19:10 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com
 [10.20.54.101])
 by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 68NEJ8X148628044
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 23 Sep 2026 14:19:08 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1776520040;
 Wed, 23 Sep 2026 14:19:08 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5C68F20043;
 Wed, 23 Sep 2026 14:19:07 +0000 (GMT)
Received: from li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com (unknown
 [9.224.92.206])
 by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTPS;
 Wed, 23 Sep 2026 14:19:07 +0000 (GMT)
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
	:references:subject:to; s=pp1; bh=2QrGt4Pc68eDNguGqvx9OXhAmFpd9e
	Q/n73e2TGYr7Y=; b=Ayo5EVpsou0Bg5ugqBjm1S51XWE2MeL2ndK2c3GelXo1lK
	5hqPlah33xvQY5TiqA2OfPyJI1ZfTumV1sglYPdZ7J+lNyzWArp/be+tEWybqdm3
	7Ve5yTDM8a3+Wg9738uiD6xhWxhhylckW5ZqezRi8Cc9Q5AEunEWV7aQhM7NO27B
	Okbrx6sv1HOopcrolJiHRaZ338lgyLIYvzb9FxdGj5pvFeSaKMzAE4F41qbtjSQq
	AV2hzyIV7EIC4N8FA7xw5n0/wfnzR+ZzBswzL4IaeXJmPTTJzIuRCesqj3zRD8qt
	+Z1j6e4HHxla/ubKARuqvWe/47TX0HQ0l8xHnmJQ==
Date: Wed, 23 Sep 2026 16:19:06 +0200
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
Subject: Re: [PATCH v2 0/8] mm: distinguish PTE table storage from PTE values
Message-ID: <5a0c73a1-6875-49fc-8f85-28808cd6be19-agordeev@linux.ibm.com>
References: <20260903103002.1091859-1-usama.anjum@arm.com>
 <1401e907-04ff-4ee5-ad03-00d88531a091-agordeev@linux.ibm.com>
 <e4bf62ca-886e-429b-a268-3c0ef7903bc8@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e4bf62ca-886e-429b-a268-3c0ef7903bc8@arm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: jvicsneNpoTmGgGlWjYDZudGR7T2so9J
X-Authority-Analysis: v=2.4 cv=EOCTQFZC c=1 sm=1 tr=0 ts=6ab3dfdf cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=uAbxVGIbfxUO_5tXvNgY:22 a=m85HiHUexkU1pPaUjCgA:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA1NiBTYWx0ZWRfX9B/05+SWggVO
 7agvUqd8dhoypg0FPuJExRBm8O+PxCJzpiY8LotmGeU/DhT6/xu2/Uj3hl/SR7hiQoNSed7OI9+
 TYVYgcC+u3rRF7SNRXDHxINKwsUMnTo=
X-Proofpoint-GUID: jvicsneNpoTmGgGlWjYDZudGR7T2so9J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA1NiBTYWx0ZWRfX4HZcFdO5tIXY
 snGn2A3Db+S3OG1OjdgVbfGZEGUTHcIaKBobABDkMlLHsfwV9fFr8s4ZCTnpAdQPz9gYCpcRvNL
 meevVhPsIY2xb+UjLfiuVZTJR5I9Zgb+lOAD2ZqjDqXobpTi1VgByCxa+Ljb1FmoZoT62x64nIQ
 fdbmdyOp5uOBulJ9CpL0SOdFeWBnq23WXXdkmA4qDJBSelEfQbx6eUpb5+qNjYHhR6WCsLgthO5
 OBtuzT2aI8D749f3QJiK8fKsdS96je+rKxtHth8BGDr1UF7hBJcUQiLfUmB5WMY7DowN0JvY/Jx
 4rIY70z4mFoa/Tic/6RAu9AhrTMaPpFzTTPwaqBT8FJxQwKV98aap20VP54g4vtUBeIGWlNiLHY
 vnukgu+KUPBn3PwkU+WliZg6ZldU5ChvdsqyiDG96cfqv7YaCvZMLzqxSd3YW2i1WLbfmVoGiqY
 oe0K7aX7lcrg4NwlsCQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230056
X-purgate-ID: tlsNG-d62444/1790173192-1E07B757-7558B9D8/0/0
X-purgate-type: clean
X-purgate-size: 488

On Wed, Sep 23, 2026 at 02:47:08PM +0100, Muhammad Usama Anjum wrote:
> > However, is there a particular reason this series is against mm-new?
> > Should it be against the master, it would be easier for me to try it in our CI.
> 
> I think, mm-new is the branch in which this series would be picked up. This is
> why its based on that. Are you referring to mm/master?

No, to the Linus master.
I will try to backport it and give it a try.

> -- 
> Thanks,
> Usama

Thanks!

