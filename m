Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63190CA600A
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2026 18:16:54 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1442676.1660253 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEWC5-0000vj-Tu; Wed, 07 Oct 2026 18:16:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1442676.1660253; Wed, 07 Oct 2026 18:16:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEWC5-0000vO-QZ; Wed, 07 Oct 2026 18:16:45 +0000
Received: by outflank-mailman (input) for mailman id 1442676;
 Wed, 07 Oct 2026 18:16:44 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <josef@toxicpanda.com>) id 1xEWC4-0000r8-Pm
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 18:16:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xEWC4-002L24-6m
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 20:16:44 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ac68c67-bab6-0a2a0a5309dd-0a2a450be6f2-44
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 20:16:44 +0200
Received: from [209.85.160.172] (helo=mail-qt1-f172.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ac68c8b-b7e8-0a2a450b0019-d155a0acb918-3
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 20:16:44 +0200
Received: by mail-qt1-f172.google.com with SMTP id
 d75a77b69052e-533930955a4so19991111cf.3
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 11:16:43 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.251])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-53571f185d7sm26074811cf.2.2026.10.07.11.16.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Oct 2026 11:16:42 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=toxicpanda.com header.i="@toxicpanda.com" header.h="Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1791397003; x=1792001803; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jtyJNESs2NfaCrmwRAvvPnxlfOHCunirXFuek+zM5MM=;
        b=fH3AE8L3Bd0TIZ/fShZcK5AOn+WjPY+A+urEgTFIOlGIbZ4sMrRrF3cOYN3XRjlf4o
         uhlHmO5qBIMew4ToKfq+UUPPerhyYdHvjCwoj2nCP0tmwsGSQQL2cX9Z75OSqfVDFyt/
         rMoxSGd0H6D8MkvZaz7WPkcgTOx9bImsxYTvWpORxcpx3nd96zuVB/azlVtWanObRgu9
         jZoN0atVGbqN5cScDjgBn6hqztdNgBXikHOmP03f/1bkDo1nxkghhpX9bQMS0xOjxHpB
         oNwHZCrA6AnsJR6vlUTRzwwj84WSKIOJIoGAbs86hWoeKi14Is+1P5Npc7Dz5jVDWl1T
         BYfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791397003; x=1792001803;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jtyJNESs2NfaCrmwRAvvPnxlfOHCunirXFuek+zM5MM=;
        b=BwBzBjrwmXxRa6ixqwUXiLATmfTlRjx4XJL72CLICR8q/CxFHpqRowMw7nwRmr1pJs
         vp3zr9y4mFrln8Fox5y5vwAEoUre924bEe2HM0t41pmV5CEpZogPUvHyzLDYj+0k6hwe
         4h6cBX5hSHEGe2XUfTAGcqc34bLGh+jhSBSgcUyFNm6GtjDA9bKtL3MWYquXVgGztJen
         R2VA2TDgGgROZ1Zx/LF70tymaVf1Q8Fl5zJONcCgBKsACW8ZeTlJAgb/qSqZztL1sOKz
         XMSP1PV/mc2WcuEMzCsm5YQmgArlV9gRf0BLHHn8GHGdgMyagglf+z/8XPfiLERWjtOM
         1AWw==
X-Forwarded-Encrypted: i=1; AKwUvBwCxghR7z+t/lBZzmul3nwWZl7+mjI3gE/dS6KRgwkC1+2qmmXrrzyRdQJUiJaPp1ep/AwCLclD9+0=@lists.xenproject.org
X-Gm-Message-State: AFuF++lOgPnEnBAaaF5zucf/Ln3RWDDUnfZ96mjKSPGNZgUqmYrm09Rm
	2lBT7fAPRbFfJIIWTF5cYeQg2AJI+CwEENwGtwWVJ+oS3Xw0B+KTuyYmLU52JeeHfOu10sN0pu4
	R4hAvcxMS+w==
X-Gm-Gg: AYBFou2xwscozbM1gL0IPf1T846JYrlamKAr0+ihehobAAg/s7uSOfUIOwtQZuTZcAd
	hkWl94FuVs4TX9QX2q8R7N2JUvRLBUAxUhJ2YcdY1f6XDRLUy0Gjw74zvmFKi8bYQAqq7dwNlVo
	UEuMsQbkIND+XTH5IXhWV6LHt0pZe+tX7ZyVfhkRHwa3NfKCSwxmXt/MOQmFwg0FFa8kfs84yj0
	D/sOZl31lVJAjy5KDE9jTwzWXF/+3/43WI2dHyqFyS1F2wflV3IDbYATyGd6uf/l0bu1wul8Lsf
	ujZL+VeiC1gZJ7DcGDj9Djxk7Jb9y7jOs7eK45lhb+TSsxdWXp0R46MfrHOXIVkg/wQ2anT9qyr
	XZrAxztDM8VK3wvCv5PgOtbLU/cKkRZ13FPWpdHOc8I7yLEN3jfT+wFPehVFSHTjeE4U9Y7nUeI
	lOHA74G22BSFqxjsL+Q/RAmog2aqKwY78/qw0mKas+AtxjpavpbM6D1dfHPyCZBPnXF9gymBW0H
	O9/ILwJFkVFKWPSUeWi5UyGsw==
X-Received: by 2002:ac8:6f10:0:b0:530:5152:75f0 with SMTP id d75a77b69052e-53575522f94mr50565161cf.22.1791397002737;
        Wed, 07 Oct 2026 11:16:42 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Wed, 07 Oct 2026 18:16:18 +0000
Subject: [PATCH net-next 5/9] e1000: use pskb_may_pull() in the 82544 TSO
 workaround
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-b4-pskb-pull-tail-drivers-v1-5-9512b0fb977b@toxicpanda.com>
References: <20261007-b4-pskb-pull-tail-drivers-v1-0-9512b0fb977b@toxicpanda.com>
In-Reply-To: <20261007-b4-pskb-pull-tail-drivers-v1-0-9512b0fb977b@toxicpanda.com>
To: Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Eric Dumazet <edumazet@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
 Andrew Lunn <andrew+netdev@lunn.ch>
Cc: Saeed Mahameed <saeedm@nvidia.com>, Tariq Toukan <tariqt@nvidia.com>, 
 Mark Bloch <mbloch@nvidia.com>, Leon Romanovsky <leon@kernel.org>, 
 Juergen Gross <jgross@suse.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
 Tony Nguyen <anthony.l.nguyen@intel.com>, 
 Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
 Manish Chopra <manishc@marvell.com>, Rahul Verma <rahulv@marvell.com>, 
 GR-Linux-NIC-Dev@marvell.com, Shahed Shaikh <shshaikh@marvell.com>, 
 Simon Horman <horms@kernel.org>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org, 
 xen-devel@lists.xenproject.org, intel-wired-lan@lists.osuosl.org, 
 Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1791396985; l=1221;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=yldyXc+k9IUGHFBVvbXY7100U73O47dmandGyjhHpkE=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QNqFTCEFL30xWoiEbNRl0xB0Ou+bDMfIq1Ujmi8Mmc+Z3YK0ZHA9JyEcAtxrEeF+xJvGJrfmT0r
 2sKFeMZQHNwo=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-purgate-ID: tlsNG-42698a/1791397004-1BAD09EA-E0A11FA6/0/0
X-purgate-type: clean
X-purgate-size: 1223

e1000_xmit_frame() uses __pskb_pull_tail() to pull up to 4 bytes of
payload into the head for the 82544 TSO workaround.  It already checks
the result.  Switch to pskb_may_pull(), which takes the length the head
should end up with and checks it against the skb, so this driver no
longer calls __pskb_pull_tail() directly.

Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 drivers/net/ethernet/intel/e1000/e1000_main.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/intel/e1000/e1000_main.c b/drivers/net/ethernet/intel/e1000/e1000_main.c
index d7f5c6f16142..3a55b211f5a6 100644
--- a/drivers/net/ethernet/intel/e1000/e1000_main.c
+++ b/drivers/net/ethernet/intel/e1000/e1000_main.c
@@ -3155,9 +3155,8 @@ static netdev_tx_t e1000_xmit_frame(struct sk_buff *skb,
 				    & 4)
 					break;
 				pull_size = min((unsigned int)4, skb->data_len);
-				if (!__pskb_pull_tail(skb, pull_size)) {
-					e_err(drv, "__pskb_pull_tail "
-					      "failed.\n");
+				if (!pskb_may_pull(skb, len + pull_size)) {
+					e_err(drv, "pskb_may_pull failed.\n");
 					dev_kfree_skb_any(skb);
 					return NETDEV_TX_OK;
 				}

-- 
2.55.0


