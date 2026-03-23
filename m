Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBF2CD58B00
	for <xen-devel@archiver.kernel.org>; Mon, 23 Mar 2026 12:30:22 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1259293.1552604 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4eQ3-0007EE-8U; Mon, 23 Mar 2026 12:30:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1259293.1552604; Mon, 23 Mar 2026 12:30:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4eQ3-0007De-3X; Mon, 23 Mar 2026 12:30:07 +0000
Received: by outflank-mailman (input) for mailman id 1259293;
 Mon, 23 Mar 2026 12:30:06 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <bounce-md_30504962.69c13249.v1-ed46999a40e74170bdeb461a50a6a598@bounce.vates.tech>)
 id 1w4eQ2-000730-9k
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2026 12:30:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w4ePz-0053Q6-Fw
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2026 13:30:05 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <bounce-md_30504962.69c13249.v1-ed46999a40e74170bdeb461a50a6a598@bounce.vates.tech>)
 id 69c13249-2eae-0a2a0a5409dd-0a2a4508da10-26
 for <xen-devel@lists.xenproject.org>; Mon, 23 Mar 2026 13:30:04 +0100
Received: from [198.2.180.47] (helo=mail180-47.suw31.mandrillapp.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from
 <bounce-md_30504962.69c13249.v1-ed46999a40e74170bdeb461a50a6a598@bounce.vates.tech>)
 id 69c1324a-1950-0a2a45080019-c602b42f6fae-3
 for <xen-devel@lists.xenproject.org>; Mon, 23 Mar 2026 13:30:03 +0100
Received: from pmta11.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail180-47.suw31.mandrillapp.com (Mailchimp) with ESMTP id
 4ffXYj6tgjzPm0j4t
 for <xen-devel@lists.xenproject.org>; Mon, 23 Mar 2026 12:30:01 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 ed46999a40e74170bdeb461a50a6a598; Mon, 23 Mar 2026 12:30:01 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=mte1 header.d=mandrillapp.com header.i="@mandrillapp.com" header.h="From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:Date:MIME-Version:Content-Type:Content-Transfer-Encoding"; dkim=pass header.s=mte1 header.d=vates.tech header.i="anthony.perard@vates.tech" header.h="From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:Date:MIME-Version:Content-Type:Content-Transfer-Encoding"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1774269002; x=1774539002;
	bh=y1V7BqEKGkvI+4qlEXrBrla1YQmq6kydGHT2fu4x/Xs=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=N39V2ww4tvomhMEOvb9EgMfw6HGqnaxXFUXIC9j5Pzk5cZlMNBau27t17Cs0Aj/VM
	 GN+Jzlbj0LY6ULDOjw1vya1fFaDW3kY4WwunOHIg6efrG8vNJnEHDtsilwCSOZY8tU
	 v8v7QHpPJOHeE8MMNWZWAaS3vlqi8i3epdzlQc8CS8e/Rqdjjnb8s3k5QN7aJPeXS7
	 jOYv2WJJwteBfJ/rYyzmKlx/RY1Fxbo5sCJ8ZKQE+TtMoCbTh9nel/Rvg1a3CBC18R
	 Plf1cC+MajxFwmfGa0o/PDJdhQAL+ng+z+dHdrt0Em/0/ElB0Cg9zKcgtELGMpgKKx
	 IkBAht8RtDkow==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1774269002; x=1774529502; i=anthony.perard@vates.tech;
	bh=y1V7BqEKGkvI+4qlEXrBrla1YQmq6kydGHT2fu4x/Xs=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=F/8S/6dnTMOVUpr0JPTDsRdn747Qc3418Mp+Vrkimn2jWHTbYqs/etZGD8+EYYY6v
	 3+1iQ4kQmsJ2uQTIBbbw74XToKnX/exThbzZEt+2sEeyJ0fqAxrJ2vdYcoOCGE1faY
	 g4lovK78jAZF/ZXicYiPRoNUa/WnpbS4WAX1zDsY8ijfDgQjHOBijWv+DR/afa39FP
	 PKL1vA1vc9J5YdsmjnK67okB4WnGSXyS6wYo+yJNQ2yDJffPAq98228LCQM/faQsBs
	 ODt+Ytvd6MoMz/Fk0b63UccdnhQK0YLOk3fYp8Rkg4FHkAtqgVasYFs4km7bXzG7f7
	 qyPPLULaILweQ==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v2=2002/12]=20tools/xenstored:=20add=20helper=20to=20parse=20domid?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1774269001303
To: "Juergen Gross" <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, "Julien Grall" <julien@xen.org>
Message-Id: <acEySKHLW9beKXbS@l14>
References: <20260320150120.874878-1-jgross@suse.com> <20260320150120.874878-3-jgross@suse.com>
In-Reply-To: <20260320150120.874878-3-jgross@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.ed46999a40e74170bdeb461a50a6a598?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260323:md
Date: Mon, 23 Mar 2026 12:30:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1774269003-F0C1A726-6AAC8D14/0/0
X-purgate-type: clean
X-purgate-size: 680

On Fri, Mar 20, 2026 at 04:01:10PM +0100, Juergen Gross wrote:
> Today a domid passed in by a command is parsed using atoi(). This
> will still "succeed" even with a domid like "x", resulting in "0" to
> be used instead.
> 
> Use a common domid parser instead rejecting everything but integers
> in the range 0..65535 like specified in docs/misc/xenstore.txt.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> V2:
> - new patch (kind of suggested by Anthony Perard)

Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,


--
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


