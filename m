Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74545EC01DF
	for <xen-devel@archiver.kernel.org>; Mon, 23 Mar 2026 12:17:19 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1259271.1552569 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4eDF-00040n-S6; Mon, 23 Mar 2026 12:16:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1259271.1552569; Mon, 23 Mar 2026 12:16:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4eDF-00040g-Pb; Mon, 23 Mar 2026 12:16:53 +0000
Received: by outflank-mailman (input) for mailman id 1259271;
 Mon, 23 Mar 2026 12:16:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d/Ak=BX=bounce.vates.tech=bounce-md_30504962.69c12f2f.v1-a5e3975b30d84401bdaa110970505a20@srs-se1.protection.inumbo.net>)
 id 1w4eDD-00040a-VT
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2026 12:16:52 +0000
Received: from mail180-47.suw31.mandrillapp.com
 (mail180-47.suw31.mandrillapp.com [198.2.180.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2a7bb2cb-26b2-11f1-9ccf-f158ae23cfc8;
 Mon, 23 Mar 2026 13:16:49 +0100 (CET)
Received: from pmta11.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail180-47.suw31.mandrillapp.com (Mailchimp) with ESMTP id
 4ffXGR3sYrzPm14yr
 for <xen-devel@lists.xenproject.org>; Mon, 23 Mar 2026 12:16:47 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 a5e3975b30d84401bdaa110970505a20; Mon, 23 Mar 2026 12:16:47 +0000
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
X-Inumbo-ID: 2a7bb2cb-26b2-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1774268207; x=1774538207;
	bh=vtzE71XAUj4mlCbmZ2v6MGX3kySlZN51bKY0UKkBOkI=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=pJdoeWeRvo/gCOCYVPJpVb2wqPoG8BLMrVNGGViexcpE3RP7iNpJmIUIc17l/FFNi
	 sakkMwcldNf1B9JocJQ46SMjAvJlYdo73CDQdnnWYaCRh6Z0O6HFXymzWdw+dujzKX
	 hhNjwxozeIqh8W9ijiJbuR32ByEz1nPXPUJOMHN2GOIVDRD0GCL22lTo7On5QaXAm0
	 XVuvNdsWLasoI2jaXdbUdHqilQ73/gxZDrOsvG7CQOu1mXuPg+bte3T/g43nl6ysvB
	 3wyepCLhn8Sv0DAy6UKL7Qz3U3HjBKcsZ4A7S9TWlxY/9qhDwH/X7MhQ1m1BadijPa
	 VNS9ic+3k8QXw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1774268207; x=1774528707; i=anthony.perard@vates.tech;
	bh=vtzE71XAUj4mlCbmZ2v6MGX3kySlZN51bKY0UKkBOkI=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=pqv//eQzGyr4Dl7OgNnTnWJ5giFfmulSwllqedpYdUTu/VubJhyKnZcV9Q2u4/OlU
	 zNGxlY70RA75Kb6MpU2Fx48Tb9OrjGAy5gr17v5WvM2T2pYc4cdvFjDUWAaGbTbrU4
	 qsbBzxdhrcDGyXma8WtPopw1lXAXZt9vov9Bja5TXBKLGlTETxxqcM+9/eRgTlPWuf
	 7aXgSPL4ZdXZzq8EzXwBg4rI0mTrDw15V8zzFflw4kKis089RjINcpDEYkDiFLfBE7
	 xIGnn2MkVQDBBIl6VxlMaWP/nlc/w4zxvltw+1XgFyCm0dv6FKmVtdjC5nhSQ1/bno
	 LZicl/njPE9kA==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v2=2001/12]=20tools/libs/store:=20add=20get-=20and=20set-quota=20related=20functions?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1774268206650
To: "Juergen Gross" <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, "Julien Grall" <julien@xen.org>
Message-Id: <acEvLoRZmZjv9Fma@l14>
References: <20260320150120.874878-1-jgross@suse.com> <20260320150120.874878-2-jgross@suse.com>
In-Reply-To: <20260320150120.874878-2-jgross@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.a5e3975b30d84401bdaa110970505a20?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260323:md
Date: Mon, 23 Mar 2026 12:16:47 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Fri, Mar 20, 2026 at 04:01:09PM +0100, Juergen Gross wrote:
> Add functions for getting and setting Xenstore quota to libxenstore:
> 
> xs_get_quota_names(): get the names of the supported quota.
> 
> xs_get_global_quota(): get the value of one global quota.
> 
> xs_set_global_quota(): set the value of one global quota.
> 
> xs_get_domain_quota(): get the value of one quota of a domain.
> 
> xs_set_domain_quota(): set the value of one quota of a domain.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,


--
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


