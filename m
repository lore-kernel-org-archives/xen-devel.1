Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FC5FCCA46C
	for <xen-devel@archiver.kernel.org>; Fri, 16 Oct 2026 11:56:03 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1451712.1666620 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHgXP-0005Yb-Je; Fri, 16 Oct 2026 11:55:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1451712.1666620; Fri, 16 Oct 2026 11:55:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHgXP-0005YU-Gs; Fri, 16 Oct 2026 11:55:51 +0000
Received: by outflank-mailman (input) for mailman id 1451712;
 Fri, 16 Oct 2026 11:55:49 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a14491762b0008425@swg.vates.tech>)
 id 1xHgXN-0005Y5-R5
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 11:55:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHgXN-00B7RW-0z
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 13:55:49 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a14491762b0008425@swg.vates.tech>)
 id 6ad210c4-e002-0a2a0a5209dd-0a2a4508bb66-2
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 13:55:49 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a14491762b0008425@swg.vates.tech>)
 id 6ad210c4-f659-0a2a45080019-b9ff1c229491-3
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 13:55:48 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a14491762b0008425.002 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 16 Oct 2026 11:55:46 +0000
Received: from [192.168.1.37] (lfbn-gre-1-371-96.w90-112.abo.wanadoo.fr
 [90.112.87.96]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 4B62781F7E;
 Fri, 16 Oct 2026 13:55:45 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=0uMpCFm7buZbVhzF2vicy8K+E1v5Wui3L8wPOuiAiTQ=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=iDc4WGJyB+k5B5eAnoWUWl/NdQ5PjJLxMRaBVhxP2QnShM6wzs2iENLk2QrFmPA1sviJwpB3Z
 QPZaXzzvGkbxJhKiZfi3oz9HSY3mbrRFwFTuKW+GnJ2Nzowi+qeYjlgXO57w8StbaQuN9zmXTPr
 QJ69WKCDIk8WIg+zvetolZ9DmJeih5orft3fSf5dRCx4gXVzs6NAYWuYO7dgVV1YBLm/DbTUd7g
 ozzXleBqXGcMmUolg18oKRGxdN8t846A0JPowXkIFZC7OOOSjzoIYISRKfaffIcZyoE0oICnlh/
 B4KMh9TFuddSI4Xpy3RPrQzfHbylzytFdaH9MRP2//Nw==
X-Zone-Loop: 63b887f582a4af8029abc1b4b5fcafbff874835313ba
x-campaign-type: default
x-transaction-id: 10c49e7c-7cb8-476a-b46e-3e2fa5ee401e
x-swg-uid: 01-8aead4c8-162b-4f04-adbe-74a26ee88b23
X-Mailer: Sweego
Message-ID:
 <1792151746.8631fc262581453bbf619ec5b2062170.1a14491762b0008425@vates.tech>
x-swg-bid: 1792151746.8631fc262581453bbf619ec5b2062170.1a14491762b0008425
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 1/3] tools/libxenstat: don't crash when /sys/class/net
 can't be opened
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
To: Olivier Lambert <olivier.lambert@vates.tech>
Cc: xen-devel@lists.xenproject.org, 
 Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>, 
 Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <1792142036.8631fc262581453bbf619ec5b2062170.1a143fd4e9d0008425@vates.tech>
References: <20261016091259.1254879-1-olivier.lambert@vates.tech>
 <1792142036.8631fc262581453bbf619ec5b2062170.1a143fd4e9d0008425@vates.tech>
Date: Fri, 16 Oct 2026 13:55:37 +0200
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792151740; l=1596;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=fhar9MJDyWMvMIXdG8Yp+q2cbkS7ri5yufdQtR1u2gk=;
 b=6UsnZkh9A9kekyTOcJ9/PH9hUHExN5kGGabJGSeS1W44bctBTAnnDMltaRkMGB+Zw+gx/7V1a
 D+ll7ophuZJA6tWOFv4FloCV+gJBsZeOdBZVWXatjUrVVeHD4MVFXSJ
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1792151745397
X-purgate-ID: tlsNG-c1860d/1792151748-D735D87B-8E1EF807/0/0
X-purgate-type: clean
X-purgate-size: 1596

> getBridge() doesn't check the return value of opendir(), so readdir()
> and closedir() are passed a NULL pointer when /sys/class/net can't be
> opened, e.g. when sysfs isn't mounted. As getBridge() is called on every
> network collection, the libxenstat user (xentop for instance) crashes
> instead of simply not finding a bridge.
> 
> Return early in that case. The caller's buffer is zero-initialised, so
> no bridge is reported, which xenstat_collect_networks() handles since
> commit 0c53660c1cf3 ("tools/libxenstat: don't lose all VIFs when dom0
> has no Linux bridge").
> 
> Fixes: 1fd93d4f8cb8 ("xenstat: Linux dom0 statistics for case we use network bonding")
> Assisted-by: Claude-Code:claude-opus-5-5
> Signed-off-by: Olivier Lambert <olivier.lambert@vates.tech>
> ---
>  tools/libs/stat/xenstat_linux.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/tools/libs/stat/xenstat_linux.c b/tools/libs/stat/xenstat_linux.c
> index 2a7d2f1a96..ec627f3ef5 100644
> --- a/tools/libs/stat/xenstat_linux.c
> +++ b/tools/libs/stat/xenstat_linux.c
> @@ -75,6 +75,9 @@ static void getBridge(const char *excludeName, char *result, size_t resultLen)
>  	char tmp[512] = { 0 };
>  
>  	d = opendir("/sys/class/net");
> +	if (d == NULL)
> +		return;
> +
We might want a message telling it failed as it's already done in the
file for SYSFS_VBD_PATH.

I'd propose:
if (d == NULL) {
    perror("Error opening /sys/class/net");
    return;
}

Reviewed-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>

-- 
Baptiste Le Duc <baptiste.le-duc@vates.tech>

