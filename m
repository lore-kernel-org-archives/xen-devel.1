Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6017CD5BC8
	for <xen-devel@archiver.kernel.org>; Tue, 26 May 2026 19:02:54 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1320133.1587512 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRx2q-00070Z-7N; Tue, 26 May 2026 19:02:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1320133.1587512; Tue, 26 May 2026 19:02:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRx2q-00070R-2a; Tue, 26 May 2026 19:02:28 +0000
Received: by outflank-mailman (input) for mailman id 1320133;
 Tue, 26 May 2026 19:02:27 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sstabellini@kernel.org>) id 1wRx2p-00070L-3U
 for xen-devel@lists.xenproject.org; Tue, 26 May 2026 19:02:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wRx2o-008gg3-CD
 for xen-devel@lists.xenproject.org; Tue, 26 May 2026 21:02:26 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a15ee3a-bab6-0a2a0a5309dd-0a2a45079d3a-16
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 21:02:26 +0200
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a15ee40-229c-0a2a45070019-aceafc1fc83a-3
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 21:02:26 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 1D3D941A40;
 Tue, 26 May 2026 19:02:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9CD31F000E9;
 Tue, 26 May 2026 19:02:23 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=k20260515 header.d=kernel.org header.i="@kernel.org" header.h="Date:From:To:cc:Subject:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779822144;
	bh=5v/ujptFF4DT0D6zYuyceaf/1trBKA8PwBcNsci0YZg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=FuROTpMl/ITCiqAcC7+kjLeWUAWR1IEFzbrhnMxgzETF7Bs22NhUiKZq28FrhJ2GV
	 BSIWmkeLFBipXbLhKB9gz6i1qk8s4JecDnshC7v8VkGK7tgFztBZgqvImAv/HhlBUV
	 PDd3XA19YKCAsXRs06tp24ud/JzNU3cuPvVKi8SB+7Ur2qeDXy7mnc/wNQuefqDI5x
	 +Ju6REmcNA1w4ANQ2zYIorFFRv8Hgot8Yt2Bi380zqTMA5M2aOH3ZshiMRtTeY2/FF
	 jNLch4k5yeq5kUV3fd4eeiJka+uUWY1xd6ClnTMSco3PJReT9ZQK5cU/ovsvD4Wn6Z
	 PxadA5OaFOKCA==
Date: Tue, 26 May 2026 12:02:23 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Anthony PERARD <anthony.perard@vates.tech>
cc: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
    xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v4 13/13] Setup ssh access to test systems
In-Reply-To: <1779458083.8631fc262581453bbf619ec5b2062170.19e4ff78945000f373@vates.tech>
Message-ID: <alpine.DEB.2.22.394.2605261201180.182011@ubuntu-linux-20-04-desktop>
References: <cover.30e6171ddf1c6a72eadf4af0a77c892d4f18d811.1777898148.git-series.marmarek@invisiblethingslab.com> <13f837cd9f394d3b4eddb4849156b8ed5d06d31b.1777898148.git-series.marmarek@invisiblethingslab.com>
 <1779458083.8631fc262581453bbf619ec5b2062170.19e4ff78945000f373@vates.tech>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-705442622-1779822144=:182011"
X-purgate-ID: tlsNG-ef75cf/1779822146-0A772C48-9E8E0929/0/0
X-purgate-type: clean
X-purgate-size: 1090

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-705442622-1779822144=:182011
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 22 May 2026, Anthony PERARD wrote:
> On Mon, May 04, 2026 at 02:35:52PM +0200, Marek Marczykowski-Górecki wrote:
> > For this add also bridge package, so xenbr0 can be configured with
> > /etc/network/interfaces.
> > This allows extracting more logs out of the test system.
> > 
> > Create empty /etc/network/interfaces, so the 'networking' service starts
> > cleanly even if no interfaces are configured this way. This is
> > necessary, as dropbear service depends on networking.
> > 
> > Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> 
> Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Since Anthony has reviewed the entire series, on the whole series:

Acked-by: Stefano Stabellini <sstabellini@kernel.org>
--8323329-705442622-1779822144=:182011--

