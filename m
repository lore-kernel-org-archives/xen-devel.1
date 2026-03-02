Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B29E3EA4E07
	for <xen-devel@archiver.kernel.org>; Mon,  2 Mar 2026 14:26:16 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1244261.1543698 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vx4DV-0007bH-3F; Mon, 02 Mar 2026 14:25:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1244261.1543698; Mon, 02 Mar 2026 14:25:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vx4DU-0007b9-Vi; Mon, 02 Mar 2026 14:25:48 +0000
Received: by outflank-mailman (input) for mailman id 1244261;
 Mon, 02 Mar 2026 14:25:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k0sz=BC=bounce.vates.tech=bounce-md_30504962.69a59ddd.v1-60e17a7ffa8142d7a53ab178543b7c2f@srs-se1.protection.inumbo.net>)
 id 1vx4DT-0007b2-TI
 for xen-devel@lists.xenproject.org; Mon, 02 Mar 2026 14:25:47 +0000
Received: from mail178-23.suw51.mandrillapp.com
 (mail178-23.suw51.mandrillapp.com [198.2.178.23])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id acc85e85-1643-11f1-9ccf-f158ae23cfc8;
 Mon, 02 Mar 2026 15:25:35 +0100 (CET)
Received: from pmta13.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail178-23.suw51.mandrillapp.com (Mailchimp) with ESMTP id
 4fPh6j3NX6z35hTTc
 for <xen-devel@lists.xenproject.org>; Mon,  2 Mar 2026 14:25:33 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 60e17a7ffa8142d7a53ab178543b7c2f; Mon, 02 Mar 2026 14:25:33 +0000
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
X-Inumbo-ID: acc85e85-1643-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1772461533; x=1772731533;
	bh=mdLDX9eD5d+3ZMlNItmrm+QdS3R/t0XHGWI+EnCSP1g=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=KaI7wtHnMo0ypLIdipwCjPKvaGtNo7KC8Pmw/PWpfbZGtBPjXZDvRg2FKB9Cg9tKY
	 hWoEjNl6gOeWqnFRJIJ3V2SukkmHkxdpkEob3AQej4JG6QYD/QlPxUZiw2WJ2aVLa2
	 tFTxT/Qe3Aq0Gc9hgOnt1nWZMkia7FK1kpEbpFCLU2u37SUu5fmI1tKINFZLMBd/6I
	 0cceDis5dJ/gfpHU7Y36TbFLok0BbqSI+rGhFcD1FTvptciM6gHcna6yAIDGBUQnDu
	 UGIvvJSgj6u8ls8MXL61YN67aRFNg/s3vb718rR5/QIiQsjbFUv9tRn/uNAjDQuziC
	 uNIDoaNkqrFnQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1772461533; x=1772722033; i=anthony.perard@vates.tech;
	bh=mdLDX9eD5d+3ZMlNItmrm+QdS3R/t0XHGWI+EnCSP1g=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=iqAz9FYIDqvVI/1HAeahqPtHW5joc7hlpMAF4WfxQ+b5PbpXh1fTe2pH2rt3GaMcd
	 wJaGV49sotUgpkeJUIkU6m47e6ni0KkixhZUj+FwKMJbD8e/qoM6wDgIxF8ebWhKDm
	 a8S1z/GXMRrtR8/G3dxWiXxnNmQ37HNx/YgER2nItm50dHVVZkNQhOvQ9mr9zSLZ/x
	 oKJtv/2+ShOpo2bbIquUzNkUaFhAwiew0hIa75UdtiQ5U1ZPfMhrQjl5lFQ1jpgWrO
	 z/nN4wCgebzq5vblBO4MyOhDUfficquj523J68FtktIDhmoHv2etLUKjQRBpQ/8vgD
	 GD3D93oAK4B7A==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v5]=20xen/domain:=20introduce=20DOMID=5FANY?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1772461531919
To: dmukhin@ford.com
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org
Message-Id: <aaWd2d8yzU-mQ6Ub@l14>
References: <20260205235126.3764953-1-dmukhin@ford.com>
In-Reply-To: <20260205235126.3764953-1-dmukhin@ford.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.60e17a7ffa8142d7a53ab178543b7c2f?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260302:md
Date: Mon, 02 Mar 2026 14:25:33 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Thu, Feb 05, 2026 at 03:51:26PM -0800, dmukhin@ford.com wrote:
> diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
> index bfc9149096a3..714e71441498 100644
> --- a/tools/libs/light/libxl_create.c
> +++ b/tools/libs/light/libxl_create.c
> @@ -676,15 +676,14 @@ int libxl__domain_make(libxl__gc *gc, libxl_domain_config *d_config,
>                  if (ret < 0)
>                      break;
>  
> -                v &= DOMID_MASK;
> -                if (!libxl_domid_valid_guest(v))
> -                    continue;
> -
> -                local_domid = v;
> +                local_domid = v & DOMID_MASK;
>              } else {
>                  local_domid = info->domid; /* May not be valid */
>              }
>  
> +            if (!libxl_domid_valid_guest(local_domid))
> +                local_domid = DOMID_ANY;

Well, that make it possible to have DOMID_ANY selected when a "random"
domid was asked for, and this value is more likely than any other domid.
I don't think it's wise to change that. The domid generated in the
random case was already valid, no need to check again.

Coud you move the new validity check into the case where domid isn't
"random" or introduce a new case in the if/else chain ?
(something like that for the second option: if (domid==random) elif
(domid.is_valid) else (use domid))

Thanks,


--
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


