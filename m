Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98A68EFB7F9
	for <xen-devel@archiver.kernel.org>; Tue, 24 Feb 2026 09:29:23 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1239611.1541005 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuoj2-0000e8-Vh; Tue, 24 Feb 2026 09:29:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1239611.1541005; Tue, 24 Feb 2026 09:29:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuoj2-0000e1-Rq; Tue, 24 Feb 2026 09:29:04 +0000
Received: by outflank-mailman (input) for mailman id 1239611;
 Tue, 24 Feb 2026 09:29:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cbIO=A4=bounce.vates.tech=bounce-md_30504962.699d6f59.v1-46a639a02fe14996b3b88983f3acca86@srs-se1.protection.inumbo.net>)
 id 1vuoj2-0000dv-Ef
 for xen-devel@lists.xenproject.org; Tue, 24 Feb 2026 09:29:04 +0000
Received: from mail186-12.suw21.mandrillapp.com
 (mail186-12.suw21.mandrillapp.com [198.2.186.12])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3ec6e299-1163-11f1-9ccf-f158ae23cfc8;
 Tue, 24 Feb 2026 10:28:58 +0100 (CET)
Received: from pmta10.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail186-12.suw21.mandrillapp.com (Mailchimp) with ESMTP id
 4fKsqF2SBJz705l40
 for <xen-devel@lists.xenproject.org>; Tue, 24 Feb 2026 09:28:57 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 46a639a02fe14996b3b88983f3acca86; Tue, 24 Feb 2026 09:28:57 +0000
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
X-Inumbo-ID: 3ec6e299-1163-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1771925337; x=1772195337;
	bh=04YoqKiKHQcMfVq+TVh0j4NzIw104UMWK3IitvuKzl0=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=Km0ZJD/k5KL9QuwPaBmPq9fPlf2SRzANMSCzzC9qqcJ69VJzQYHNkRTfAyDeYu/WW
	 VELcgZCC60bY9zhRBbTrskuUSkY+GrHXoaugKZKyfG+hpeG+txUgbrZ5W5VDFrt01b
	 NREHEOZ9MOSDP7NZg9/Yq69F6YQxDFyIPKjpcg6p4GXx9RsnFnQrFQRHXT8fQKRCdH
	 kPn0+kF4n//wpQDDOShb9ADvmSDrKAIHQpPmNBwwnDibMcCsxhvvTCg1J42mgwcF0E
	 J+X+NNX2zvnAdDfM/bzo/nH6ulrESeqJpd78bUGS4fzX9iA6vFu6AkZvGHp23m+g59
	 zd9y/H3HCDkIA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1771925337; x=1772185837; i=teddy.astie@vates.tech;
	bh=04YoqKiKHQcMfVq+TVh0j4NzIw104UMWK3IitvuKzl0=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=htVWx7MJs0biJMP8naC0CA04G2xmh6zGj/xIMoDn3acbgwhAGy5F9SAf/b0VrfB+n
	 e8F5ZhXRBc/fTj7+o8HzNv4jnbptXLQU1w/mcktpLGfluIFM+xf8tQN4ow4HNqmpUv
	 KwlU5dbqQ8Ub8duW5Iz70Ln3XC2yKRnPWRf7zRQooZe+Jd+CCb4Mkn5Q5vw70sRFs8
	 UtsBprPK9uvuOdKMPyEEfh3yv/9ts/IHPVGa7NoJd/P0dpKtahRMViX0R0V2u0kUOy
	 w2mQgbZZCu0YerGmeZwkrKDioRTJGfTftmNS4SyT8Jz2NIzCNGbyeZOuMOkLLB1hh5
	 dUy6u6IJ74vpw==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v7=201/2]=20libxc:=20Report=20consistent=20errors=20in=20xc=5Fresource=5Fop?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1771925336678
Message-Id: <f569a8f0-8df9-4e5a-b3ed-ae600c3c0bd3@vates.tech>
To: "Jan Beulich" <jbeulich@suse.com>
Cc: "Anthony PERARD" <anthony.perard@vates.tech>, "Juergen Gross" <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <c8677e4588eff14197e47070587f31df1567c030.1771860109.git.teddy.astie@vates.tech> <0d7afac2-d358-4b0e-b828-31ebba6357d2@suse.com>
In-Reply-To: <0d7afac2-d358-4b0e-b828-31ebba6357d2@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.46a639a02fe14996b3b88983f3acca86?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260224:md
Date: Tue, 24 Feb 2026 09:28:57 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 23/02/2026 =C3=A0 17:15, Jan Beulich a =C3=A9crit=C2=A0:
> On 23.02.2026 17:06, Teddy Astie wrote:
>> xc_report_op returns -1 in some error conditions.
>> Make sure it returns -ENOMEM in out of memory errors and -EINVAL
>> in invalid usages errors.
> 
> Isn't this a move in the wrong direction? -1 as a return value is quite o=
kay.
> errno wants setting to indicate the cause of the error (if called functio=
ns
> don't already set it properly).
> 

To me, passing error through errno here feels more like a workaround 
rather than a proper error handling. It doesn't feel consistent in libxc 
overall (some functions returns a negative value corresponding to a 
error number while some others -1; in some cases we update errno).

What are the error handling rules for xenctrl ?

> Also nit: s/xc_report_op/xc_resource_op/ .
> 

ack

> Jan
> 

Teddy


--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



