Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ACC210D14AC
	for <xen-devel@archiver.kernel.org>; Mon, 30 Mar 2026 13:03:57 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1267599.1557061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7CHL-0008NJ-Dg; Mon, 30 Mar 2026 13:03:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1267599.1557061; Mon, 30 Mar 2026 13:03:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7CHL-0008NC-9x; Mon, 30 Mar 2026 13:03:39 +0000
Received: by outflank-mailman (input) for mailman id 1267599;
 Mon, 30 Mar 2026 13:03:38 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <bounce-md_30504962.69ca74a8.v1-0bd2a37b017a4187b18ee74058cd82a3@bounce.vates.tech>)
 id 1w7CHK-0008N4-FG
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2026 13:03:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7CHJ-008Fqc-IV
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2026 15:03:37 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <bounce-md_30504962.69ca74a8.v1-0bd2a37b017a4187b18ee74058cd82a3@bounce.vates.tech>)
 id 69ca74a8-e002-0a2a0a5209dd-0a2a45069b50-4
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 15:03:37 +0200
Received: from [198.2.132.14] (helo=mail132-14.atl131.mandrillapp.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from
 <bounce-md_30504962.69ca74a8.v1-0bd2a37b017a4187b18ee74058cd82a3@bounce.vates.tech>)
 id 69ca74a8-3034-0a2a45060019-c602840e56da-3
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 15:03:37 +0200
Received: from pmta09.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail132-14.atl131.mandrillapp.com (Mailchimp) with ESMTP id
 4fkrzD0Xmfz8XRwkm
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 13:03:36 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 0bd2a37b017a4187b18ee74058cd82a3; Mon, 30 Mar 2026 13:03:36 +0000
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
	s=mte1; t=1774875816; x=1775145816;
	bh=cg8xMuCWMMEqVNb+cDFGfpeqWU2pSI2OVfrn3SI5X0o=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=N2KmwhnMagTfyC6N4hOWNWJxOyCQRXaWg0rsV0PKAczKLTFjiF0uJ/a6TY/VNrNx0
	 BxhuwgPm5xUU87zYcJuln4Yf9lDuBObm9Jpu88TfgOkURjEA3g+IEmTOzcBFzUztfZ
	 7jmXexuRN40EHqLHVxtF4b26hKshg6VMWd4WG4+Z13Tz+Xr/GpYver/GIjX2S10maf
	 YVbKUouDdYKJBsmu/E7AQJb6XYn4ThQ+G1H8Zvep1Ha57Cu+CRkaG8m6qaxJQjI4fz
	 AjxwxEp9+8mSUc0EfZeJI6H3sfrrMyIhwcXLFMOxA0XZoNl9wiwyO8SGSgtPxSjgd5
	 +BjFuPBl2tgIg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1774875816; x=1775136316; i=anthony.perard@vates.tech;
	bh=cg8xMuCWMMEqVNb+cDFGfpeqWU2pSI2OVfrn3SI5X0o=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=QAv+2rCEMy6nPAWaHx9rYeFSeC9v2PlOJ7rZCuLBjtZ2aMDvpUIK79dxvyuH8Kpln
	 oEm4StmWDdAdeGQWv5KJv1x9QU15j/dyqhYtU8G/WRjqON8j5zTqMouSDYV6/mUHIX
	 gxNewul+4BAfYuX3mSiKh342VvYDivJUBuQFHu1iEGa8WRPSyoyV7rXGZZC58Cjrbm
	 9Rc8g5se0A3UBwKHhgNSu9Pypp9EHUEpcgv3nWufkBRS19breH2vvb8VkWJ4dkdz8x
	 usopzHIMgR6sRODW5ma0HJrv5neDkkxiDn9RDeldVlAM5JU40TOhSBwSK3pe0yVNdZ
	 UufTIBar6Pn8w==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v9=201/3]=20libxc:=20Report=20EINVAL=20in=20invalid=20xc=5Fresource=5Fop=20use?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1774875814941
To: "Teddy Astie" <teddy.astie@vates.tech>
Cc: xen-devel@lists.xenproject.org, "Juergen Gross" <jgross@suse.com>
Message-Id: <acp0prvC3CFkR5zv@l14>
References: <d7d0fa8ca02d59d34bd3be7ecfacd5c0376fafc0.1773671343.git.teddy.astie@vates.tech>
In-Reply-To: <d7d0fa8ca02d59d34bd3be7ecfacd5c0376fafc0.1773671343.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.0bd2a37b017a4187b18ee74058cd82a3?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260330:md
Date: Mon, 30 Mar 2026 13:03:36 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1774875817-7A1931C2-97C25ABB/0/0
X-purgate-type: clean
X-purgate-size: 412

On Mon, Mar 16, 2026 at 02:34:05PM +0000, Teddy Astie wrote:
> xc_report_op doesn't update errno when called with 0 operations
> (even though it returns -1).
> 
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>

Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,


--
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


