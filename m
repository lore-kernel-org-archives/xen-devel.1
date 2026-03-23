Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 709EDF46102
	for <xen-devel@archiver.kernel.org>; Mon, 23 Mar 2026 13:01:04 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1259322.1552629 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4ete-0004bK-TU; Mon, 23 Mar 2026 13:00:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1259322.1552629; Mon, 23 Mar 2026 13:00:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4ete-0004bD-Qw; Mon, 23 Mar 2026 13:00:42 +0000
Received: by outflank-mailman (input) for mailman id 1259322;
 Mon, 23 Mar 2026 13:00:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/4j2=BX=bounce.vates.tech=bounce-md_30504962.69c13976.v1-cf35a5d89feb464f8c8ecfef9dd581a5@srs-se1.protection.inumbo.net>)
 id 1w4etd-0004b7-GI
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2026 13:00:41 +0000
Received: from mail180-47.suw31.mandrillapp.com
 (mail180-47.suw31.mandrillapp.com [198.2.180.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4aac4b7b-26b8-11f1-b166-2bf370ae4941;
 Mon, 23 Mar 2026 14:00:40 +0100 (CET)
Received: from pmta11.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail180-47.suw31.mandrillapp.com (Mailchimp) with ESMTP id
 4ffYF25Jy8zPm0kGK
 for <xen-devel@lists.xenproject.org>; Mon, 23 Mar 2026 13:00:38 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 cf35a5d89feb464f8c8ecfef9dd581a5; Mon, 23 Mar 2026 13:00:38 +0000
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
X-Inumbo-ID: 4aac4b7b-26b8-11f1-b166-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1774270838; x=1774540838;
	bh=Y0lQ7deiDHXJ97ld/mcVoxOualtAgacMfezryY/K2rg=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=VahbI6eEvddOKKbEhoxLW7o+KJG9ctA/XfnVuKbXXXjAa+BDaxvq3m5ugoLDS6UMa
	 6iO36GE9mklxj2vZnlAvj4lNYgvSA8cYB0YUfmeomIYHzscQRX0X4sGk54ZfATh3S0
	 B9Vo58lBAwVOvBkN4nsBtp6ARtK+B8ofudl9ZjTV+T1zidiZy1gkLYP2birnSz6iOg
	 w86hvnRqPIWsz3PXrJqfbWIDi/yZWtI+ykXjxu3kcLGjRLULeOmJaZnAYUd8g81Ycl
	 bAouOXNo/hdPPdKibmYUCH/kc6J+GpoFH/dg9MdB9/gXOgZhyYbCs/5ubrLsC0Cd3U
	 /DyGs4Yxp87dw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1774270838; x=1774531338; i=anthony.perard@vates.tech;
	bh=Y0lQ7deiDHXJ97ld/mcVoxOualtAgacMfezryY/K2rg=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=z/tk+E6geigTmC+AXlboU0ikIg6aZ4XSXzZOJjmTqpS5Cg5r9w4JkvyNtwt2jtWkH
	 14iiJkyxxjndXpTFHQSxF6MwQL/ihKeSaYeXZ9jByGIwfJdutFW97qir+4wRxrboMt
	 xTt6kyBEjYROY8ndyX6nGRlm1F1ILdS/oUG/jwiAhnnCPvEpPPAa4S5Aua8pPgQVF8
	 Sj07tFheY1ENPjegl/0rBGYxa2IZIZ4R84/GchmOQ9Z6YEVyfMherBgQkju/0LPuhK
	 JrcKBDyja6KDwOur5BBFoWceatlJjY224ljG5F6yDYd+amzAx4lYnr9yiSXYyEJn/N
	 lvf9sLSPrkYsw==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v2=2008/12]=20tools/xenstored:=20implement=20the=20GET/SET=5FQUOTA=20commands?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1774270833297
To: "Juergen Gross" <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, "Julien Grall" <julien@xen.org>
Message-Id: <acE5cC3MAk1yz2nW@l14>
References: <20260320150120.874878-1-jgross@suse.com> <20260320150120.874878-9-jgross@suse.com>
In-Reply-To: <20260320150120.874878-9-jgross@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.cf35a5d89feb464f8c8ecfef9dd581a5?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260323:md
Date: Mon, 23 Mar 2026 13:00:38 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Fri, Mar 20, 2026 at 04:01:16PM +0100, Juergen Gross wrote:
> Add the implementation of the GET_QUOTA and SET_QUOTA wire commands.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> V2:
> - refuse quota value Q_VAL_DISABLED (Anthony Perard)
> - use talloc_strdup() (Anthony Perard)
> - drop comments in domain.h (Anthony Perard)

Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,


--
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


