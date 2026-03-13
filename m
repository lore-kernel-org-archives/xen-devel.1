Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6630107BCD2
	for <xen-devel@archiver.kernel.org>; Fri, 13 Mar 2026 17:16:26 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1254263.1550189 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w167H-0007gk-6M; Fri, 13 Mar 2026 17:16:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1254263.1550189; Fri, 13 Mar 2026 17:16:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w167H-0007gd-3Q; Fri, 13 Mar 2026 17:16:03 +0000
Received: by outflank-mailman (input) for mailman id 1254263;
 Fri, 13 Mar 2026 17:16:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w9UI=BN=bounce.vates.tech=bounce-md_30504962.69b4464e.v1-e5ac64dadfbf4569aed401b63a593563@srs-se1.protection.inumbo.net>)
 id 1w167F-0007gX-KN
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2026 17:16:01 +0000
Received: from mail134-15.atl141.mandrillapp.com
 (mail134-15.atl141.mandrillapp.com [198.2.134.15])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4e3f5306-1f00-11f1-b164-2bf370ae4941;
 Fri, 13 Mar 2026 18:16:00 +0100 (CET)
Received: from pmta10.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail134-15.atl141.mandrillapp.com (Mailchimp) with ESMTP id
 4fXWNH0c8PzPm0Pr9
 for <xen-devel@lists.xenproject.org>; Fri, 13 Mar 2026 17:15:59 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 e5ac64dadfbf4569aed401b63a593563; Fri, 13 Mar 2026 17:15:58 +0000
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
X-Inumbo-ID: 4e3f5306-1f00-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1773422159; x=1773692159;
	bh=tE2e4A6RQlJDuxiYQ0qjv7al0p4qz5Tb+9MzYknAow4=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=kQU2lD8pLnpvWn0ZlG0FHsHEbmgOcPtgMAyN5cUPSXMLkYBG5X0N7/nhq4pMtOobk
	 8gxjywqf+6lRFXBHUvBcQCMvH3bbgf2pJpEyw5fj+SFTNUgBBQsN7nESN3Dcs8L7f1
	 ADpPiS+8u7GF/uWr91FSnuLhxT96F27UQKdJ6q+cFrhUYun7RVZzZ/5rING+qLtSeR
	 tLveZ2ejNDecdxnmoEkpDEfdm+sT2O/qFy5PTtw+ytZ502RszolvGgYoioKU13N2G3
	 w6VFpGTO60ukRiED1+eaCS7ZDstiz3zXm/L9KFPqxcrB7SnlVso0GABJwSbtETQj7N
	 O58r7rzJJ8YFA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1773422159; x=1773682659; i=anthony.perard@vates.tech;
	bh=tE2e4A6RQlJDuxiYQ0qjv7al0p4qz5Tb+9MzYknAow4=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=ZC02SthzFFBOu+pYTdYuHbdN2th0x0Q0YG/6m52QfkWP3IZfpcGBjXrG3XfhtOGsV
	 GzN+rbk6gk2yR96dYtV6fbsPMMJ60C4RahHPFUn65pFinULlA6ah8SCzaByaZUYXPH
	 x09hd4WY68Axm2lnps0dl36I+BlS2FLLu+2QDfvX2rhfb80gFcfH+YBbrXXnt9BcbH
	 3+skf5rE83jPVP7AO54bXTs8Ujdb5ahzOE2jFC6Jeo7j4cbVhNGhWB5JYAiqMRmWAK
	 fcGrwGFci1j9Cp9ub3Szip82tnQ+Gev8a73OCE9BU6lMsWqjweGmZGxnYrUOa50u/i
	 qppGhfiA1D0mg==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=2005/11]=20tools/xenstored:=20split=20acc[]=20array=20in=20struct=20domain?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1773422158432
To: "Juergen Gross" <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, "Julien Grall" <julien@xen.org>
Message-Id: <abRGTofDcyVxRarZ@l14>
References: <20260305135208.2208663-1-jgross@suse.com> <20260305135208.2208663-6-jgross@suse.com>
In-Reply-To: <20260305135208.2208663-6-jgross@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.e5ac64dadfbf4569aed401b63a593563?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260313:md
Date: Fri, 13 Mar 2026 17:15:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Thu, Mar 05, 2026 at 02:52:02PM +0100, Juergen Gross wrote:
> Prepare using per-domain quota by splitting the acc[] array in struct
> domain into an array with the current accounting data, and an array
> of type struct quota for the per-domain quota and the seen max value
> of the domain.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,


--
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


