Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F903F557FA
	for <xen-devel@archiver.kernel.org>; Mon, 20 Apr 2026 09:38:58 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1285558.1566550 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEl5N-0001Dt-ID; Mon, 20 Apr 2026 09:38:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1285558.1566550; Mon, 20 Apr 2026 09:38:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEl5N-0001Dm-Fc; Mon, 20 Apr 2026 09:38:33 +0000
Received: by outflank-mailman (input) for mailman id 1285558;
 Mon, 20 Apr 2026 09:38:32 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <bounce-md_30504962.69e5f415.v1-2562406edfd4437cb382af627caa7011@bounce.vates.tech>)
 id 1wEl5M-0001Dg-He
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 09:38:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEl5L-00AEIs-QA
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 11:38:31 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <bounce-md_30504962.69e5f415.v1-2562406edfd4437cb382af627caa7011@bounce.vates.tech>)
 id 69e5f412-5cb7-0a2a0a5109dd-0a2a450a9e6c-20
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 11:38:31 +0200
Received: from [198.2.137.11] (helo=mail137-11.atl71.mandrillapp.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <bounce-md_30504962.69e5f415.v1-2562406edfd4437cb382af627caa7011@bounce.vates.tech>)
 id 69e5f415-56b3-0a2a450a0019-c602890b5271-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 11:38:31 +0200
Received: from mta004-md-usw2.delv.a.intuit.com (localhost [127.0.0.1])
 by mail137-11.atl71.mandrillapp.com (Mailchimp) with ESMTP id
 4fzgQs3lJ1zDRT5HY
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 09:38:29 +0000 (UTC)
Received: from [37.26.189.201] by mandrillapp.com id
 2562406edfd4437cb382af627caa7011; Mon, 20 Apr 2026 09:38:29 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=mte1 header.d=mandrillapp.com header.i="@mandrillapp.com" header.h="From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:Content-Type:Content-Transfer-Encoding"; dkim=pass header.s=mte1 header.d=vates.tech header.i="julian.vetter@vates.tech" header.h="From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:Content-Type:Content-Transfer-Encoding"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1776677909; x=1776947909;
	bh=QE5mUC97O9np+hjQ/d+sTOK0LSQ1Hp/wQ2SjgL069Qk=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=XZRGFnAI38bN9P5WCnMjJrELG/LITRa12DYRre5vuTGYsXct7o7JOGe6EoFPB8US6
	 +C2Mfc89xXZXZ+bdVR3IYX985NL/MSLnGW54+9kcd17hAc7aeCY1Q45+WGbjOVO7ux
	 RyjdVYgPLBHxUfgkifIWgTPRUCUc1rE1dXyKlVzwcV0Paudu6tE3EEQa7xAqEBDowd
	 5utMCQkJtRRcHWFuUAd0XSIt3NHtaOJHrcCv/ijgfmrWo2ZdNG3qWMMVUqYk6gk4mH
	 Vhqt/FjWQvjLdyjt8m5dSrLDHw89IcZYF7JlFowMDTUXXS+L+I4WaD4r+i5KnIYaJe
	 iyC6+zWapJQVQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1776677909; x=1776938409; i=julian.vetter@vates.tech;
	bh=QE5mUC97O9np+hjQ/d+sTOK0LSQ1Hp/wQ2SjgL069Qk=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=MuNphuZzYgliH+3rPVvCBNynLpLIH9FzUO0S2pkiQEn1iHVNuI/AFsVUpk/iQxn2e
	 LfSIJnCnxuh+6VQAiWfVRhoOTEHCTaXYzEJRGM+ORNa0N6HmiIRE6ayXImrq5r7fxc
	 r6G+wuoDxftfM7faO3qklULSN8d7NQoUrtTO5Hn6LTVbLxxX1HkAjEie4lqWzs740m
	 tX3rDWgCh57uVQL4mJi2SWEael0DHeiw1PpeUXwOSBfLrFgUs5HAHgkDOffgfJrGv8
	 ne1BgGZ672vcPiqKiDrI4SpIDH7Vp1q/TGrhCdMdfCXIvOTkl9TUyzkloEk3x2G3MS
	 d4o1Cs4Vz20jg==
From: "Julian Vetter" <julian.vetter@vates.tech>
Subject: =?utf-8?Q?[PATCH=20v6=200/3]=20Support=20multiple=20ioreq=20pages?=
X-Mailer: git-send-email 2.53.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1776677908510
To: xen-devel@lists.xenproject.org
Cc: "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Julien Grall" <julien@xen.org>, "Stefano Stabellini" <sstabellini@kernel.org>, "Julian Vetter" <julian.vetter@vates.tech>
Message-Id: <20260420093820.825969-1-julian.vetter@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.2562406edfd4437cb382af627caa7011?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260420:md
Date: Mon, 20 Apr 2026 09:38:29 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1776677911-80C788B7-73BFD4C6/0/0
X-purgate-type: clean
X-purgate-size: 1241

Hello Jan,
thank you again for your thorough feedback. I have addressed your
comments. I just have one remaining issue. For the temporary MFNs array
I now use a static array, i.e., mfns[IOREQ_NR_PAGES_MAX], with a
IOREQ_NR_PAGES_MAX = DIV_ROUND_UP(HVM_MAX_VCPUS, PAGE_SIZE / sizeof(ioreq_t)).
Is this appropriate? Or should I leave the HVM_MAX_VCPUS out of this and
instead use a fixed constant value? Also for now I haven't taken the
path to permanently store the MFNs as you suggested. I'm not sure, but I
don't think it's really necessary. Since this array will rarely exceed
the size of 2 or 3.

Signed-off-by: Julian Vetter <julian.vetter@vates.tech>
---
Julian Vetter (3):
  ioreq: switch ioreq page allocation to vmap
  ioreq: Indent ioreq_server_alloc_mfn() body one level deeper
  x86/ioreq: Extend ioreq server to support multiple ioreq pages

 xen/arch/x86/hvm/ioreq.c |  63 ++++++++++++++++---
 xen/common/ioreq.c       | 127 ++++++++++++++++++++++++++-------------
 xen/include/xen/ioreq.h  |  13 +++-
 3 files changed, 151 insertions(+), 52 deletions(-)

-- 
2.53.0



--
Julian Vetter | Vates Hypervisor & Kernel Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


