Return-Path: <SRS0=IV2x=DI=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27EAFC4727C
	for <xen-devel@archiver.kernel.org>; Thu,  1 Oct 2020 10:55:13 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BFB67207DE
	for <xen-devel@archiver.kernel.org>; Thu,  1 Oct 2020 10:55:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="NAvhKYCa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BFB67207DE
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1189.3969 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNwEp-0000fW-3o; Thu, 01 Oct 2020 10:55:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1189.3969; Thu, 01 Oct 2020 10:55:03 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNwEp-0000fP-0j; Thu, 01 Oct 2020 10:55:03 +0000
Received: by outflank-mailman (input) for mailman id 1189;
 Thu, 01 Oct 2020 10:55:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jQH2=DI=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kNwEo-0000fG-Jh
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 10:55:02 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3224e030-c294-42e1-9b8c-c9e573b2e348;
 Thu, 01 Oct 2020 10:55:01 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=jQH2=DI=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kNwEo-0000fG-Jh
	for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 10:55:02 +0000
X-Inumbo-ID: 3224e030-c294-42e1-9b8c-c9e573b2e348
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 3224e030-c294-42e1-9b8c-c9e573b2e348;
	Thu, 01 Oct 2020 10:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1601549701;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=c8WJl4FCPhwG3wElqcuyPsTZPYQsAKsKXAsqf6rKdYs=;
  b=NAvhKYCaPjsza2Ev4zuVDqvNLtx1N+E+E5koNybfXDKxbd3k2D5a19wc
   Mr3KQ0TfzfRQtXrc6DQSZatTtQWPfP1udVP1x4qucON74+Kdz8Cu1QuqZ
   LgW+NGy5M5NVqxdlOHIgj40HFz1lfVzMiQexHtOzMoQ+cK2CLETSwimMi
   w=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: QgiMuZgrebGWDPm9zs87Pe4SM90UdhXPtn0f6GTAohN3O2jqqJsg57tUn4yv5O2i7ypZSbpOIi
 dE3Yj6Q8NGni7jFtHJGDRPF5n5fmDcgBdMojQAipzxcg2X8AuntWWhyGwDyFxZ5j7cMxoyi3di
 rZjGQPBGeMoOQKXiCuFcoR2rmDfLfc7KjTPzympfDxBlle1a39xEDq+xKMfsFknxweFESRHP1P
 x4yPtGbyUuaR7e2+sZ8LdcgseDTNFVvA67fYMaGteI7P60d3rjMcmQ5MXMhpUjGfYvinca8lqq
 nuM=
X-SBRS: None
X-MesageID: 28328134
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,323,1596513600"; 
   d="scan'208";a="28328134"
Date: Thu, 1 Oct 2020 12:54:53 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 6/8] xen/xsm: Drop xsm_hvm_param_nested()
Message-ID: <20201001105453.GD19254@Air-de-Roger>
References: <20200930134248.4918-1-andrew.cooper3@citrix.com>
 <20200930134248.4918-7-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200930134248.4918-7-andrew.cooper3@citrix.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL06.citrite.net (10.13.108.179)

On Wed, Sep 30, 2020 at 02:42:46PM +0100, Andrew Cooper wrote:
> The sole caller has been removed.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

