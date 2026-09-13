Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06CFBC88E40
	for <xen-devel@archiver.kernel.org>; Sun, 13 Sep 2026 09:58:29 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1419690.1646661 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x5gyH-00042S-1n; Sun, 13 Sep 2026 09:58:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1419690.1646661; Sun, 13 Sep 2026 09:58:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x5gyG-00042L-V4; Sun, 13 Sep 2026 09:58:00 +0000
Received: by outflank-mailman (input) for mailman id 1419690;
 Sun, 13 Sep 2026 09:58:00 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <asmadeus@codewreck.org>) id 1x5gyE-00042F-TV
 for xen-devel@lists.xenproject.org; Sun, 13 Sep 2026 09:58:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x5gyE-000We8-AZ
 for xen-devel@lists.xenproject.org; Sun, 13 Sep 2026 11:57:58 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <asmadeus@codewreck.org>)
 id 6aa67390-2eae-0a2a0a5409dd-0a2a4509d13c-12
 for <xen-devel@lists.xenproject.org>; Sun, 13 Sep 2026 11:57:57 +0200
Received: from [62.210.214.84] (helo=submarine.notk.org)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <asmadeus@codewreck.org>)
 id 6aa673a3-be1a-0a2a45090019-3ed2d654cfea-3
 for <xen-devel@lists.xenproject.org>; Sun, 13 Sep 2026 11:57:55 +0200
Received: from gaia.codewreck.org (localhost [127.0.0.1])
 by submarine.notk.org (Postfix) with ESMTPS id 3885A14C2D6;
 Sun, 13 Sep 2026 11:57:47 +0200 (CEST)
Received: from localhost (gaia.codewreck.org [local])
 by gaia.codewreck.org (OpenSMTPD) with ESMTPA id 7a5da7f6;
 Sun, 13 Sep 2026 09:57:46 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=2 header.d=codewreck.org header.i="@codewreck.org" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=codewreck.org;
	s=2; t=1789293471;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ojc3Gf8XdcHrzIe5027BZcw/ZHmTep5+/EMX7/cpuQs=;
	b=I8x3cEXOrG0+DRO4ErfU7WXllrlpn1ZY9SxOSJnGpp4NmSMqs/nI1zmAid5c87Tk04wOVz
	9e72wxFXuw7ra/qr3Yk6tk0A0XCriYPhZORmodOQbLN5UPTMjId1z9W1oIcIZ5dM42R+vZ
	Lu0BknfzS8Y4enR2uURKgMjLEE3jZw5uxjCrBG82XKlATKAHlZNEu9uaqsayQ4EnI3RXjI
	ASaMCoEXB1Sn6HAXM+/C1emdjJCf5LSSxEA2dmyurrghSrLZKvFsYE7Q5Bx/DfZERSG7EX
	ThFL/ALnEhkiqknZ57nFQWYzX/LguD+SZDvmP2WThznjfmMW/RDRBw/Sr7K4vQ==
Date: Sun, 13 Sep 2026 18:57:31 +0900
From: Dominique Martinet <asmadeus@codewreck.org>
To: Yifei Gao <gyf161023@gmail.com>
Cc: Eric Van Hensbergen <ericvh@kernel.org>,
	Latchesar Ionkov <lucho@ionkov.net>, v9fs@lists.linux.dev,
	Christian Schoenebeck <linux_oss@crudebyte.com>,
	Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] 9p/xen: fix refcount leak in p9_xen_response() on
 wrong tag
Message-ID: <aqZziy3RqeiJeHKW@codewreck.org>
References: <20260804213550.3409638-1-gyf161023@gmail.com>
 <20260806144255.4167019-1-gyf161023@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260806144255.4167019-1-gyf161023@gmail.com>
X-purgate-ID: tlsNG-bad1c0/1789293477-BF2DC034-5FEE1EE0/0/0
X-purgate-type: clean
X-purgate-size: 1316

Yifei Gao wrote on Thu, Aug 06, 2026 at 02:42:54PM +0000:
> p9_xen_response() looks up the request for an incoming reply with
> p9_tag_lookup(), which takes a reference on the returned p9_req_t. When
> the tag does not resolve to a request in REQ_STATUS_SENT, the function
> warns and continues the loop without dropping that reference, permanently
> leaking the p9_req_t and its msize buffers. The reply header, including
> the tag, is supplied by the backend, so a malicious or buggy 9P backend
> can leak kernel memory on every crafted response.
> 
> Drop the reference before continuing.
> 
> Fixes: 728356dedeff ("9p: Add refcount to p9_req_t")
> Cc: stable@vger.kernel.org
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Yifei Gao <gyf161023@gmail.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Thanks, I've picked this up for 7.4

If someone is interested in the 9pfs xen backend security then sashiko
had a lot of "pre-existing issues" to talk about[1]... I tend to agree
with Stefano's point of view that the 9p backend is mostly trusted
though, so I'll take patches if someone wants to spend the effort, but
won't actively be able to contribute much more.

[1] https://sashiko.dev/#/patchset/20260806144255.4167019-1-gyf161023@gmail.com

-- 
Dominique

