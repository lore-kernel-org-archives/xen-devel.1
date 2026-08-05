Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A28B5C55184
	for <xen-devel@archiver.kernel.org>; Wed,  5 Aug 2026 00:07:25 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1382702.1626027 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrP9y-00040f-9S; Wed, 05 Aug 2026 00:07:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1382702.1626027; Wed, 05 Aug 2026 00:07:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrP9y-00040X-6R; Wed, 05 Aug 2026 00:07:02 +0000
Received: by outflank-mailman (input) for mailman id 1382702;
 Wed, 05 Aug 2026 00:07:00 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sstabellini@kernel.org>) id 1wrP9w-00040R-73
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 00:07:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrP9v-00AAsM-53
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 02:06:59 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a727e98-2eae-0a2a0a5409dd-0a2a450ce694-6
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 02:06:58 +0200
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a727ea0-f479-0a2a450c0019-aceafc1fe8cc-3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 02:06:57 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id DB19F40AD8;
 Wed,  5 Aug 2026 00:06:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38F9A1F00A3D;
 Wed,  5 Aug 2026 00:06:54 +0000 (UTC)
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
	s=k20260515; t=1785888415;
	bh=fQGXTT1iD4XOXkRDxR3dG4pIjyvECfsrSvRyXf46TZw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=VzgzDjhi9Ja1W5hLt58pREs7AZFSvpvy+GUFRil24u3tV25E8RAAKfLuev7/BOVmP
	 vHrhIqZhEvjxvB+PAVngR+Oc7nuvxKikPu/g+GEGygo4OY3dKClZNCVXwp1HJEleR+
	 vxA09ZFsznPAeqmkWkTOlIEyfzrVBmq3rM33fMghLrZbdudoWcu0Fzdw3HRuXOwX21
	 Goe8hzAwyafEPHVULdX1pg5cN7/3/qGFxy4somCLRZzzRVSSf48H8Le4EmPr1PlG5Y
	 T4jU8POAIlgo2zsnrojq27axy/FhY0EDnxLvcOMc844HsFlT2JPUauNxRn0NyO2qpZ
	 po8godmRCI81g==
Date: Tue, 4 Aug 2026 17:06:53 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
To: Yifei Gao <gyf161023@gmail.com>
cc: Eric Van Hensbergen <ericvh@kernel.org>, 
    Latchesar Ionkov <lucho@ionkov.net>, 
    Dominique Martinet <asmadeus@codewreck.org>, v9fs@lists.linux.dev, 
    Christian Schoenebeck <linux_oss@crudebyte.com>, 
    Juergen Gross <jgross@suse.com>, 
    Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, 
    stable@vger.kernel.org
Subject: Re: [PATCH] 9p/xen: fix refcount leak in p9_xen_response() on wrong
 tag
In-Reply-To: <20260804213550.3409638-1-gyf161023@gmail.com>
Message-ID: <ebcebd30-68e2-1650-f0e6-b69e4239619c@kernel.org>
References: <20260804213550.3409638-1-gyf161023@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-purgate-ID: tlsNG-d25034/1785888418-03AD4A5B-1C0A336A/0/0
X-purgate-type: clean
X-purgate-size: 1717

On Tue, 4 Aug 2026, Yifei Gao wrote:
> p9_xen_response() looks up the request for an incoming reply with
> p9_tag_lookup(), which takes a reference on the returned p9_req_t. When
> the tag does not resolve to a request in REQ_STATUS_SENT, the function
> warns and continues the loop without dropping that reference, permanently
> leaking the p9_req_t and its msize buffers. The reply header, including
> the tag, is supplied by the backend, so a malicious or buggy 9P backend
> can leak kernel memory on every crafted response.

Most backend are trusted, including this. So I would avoid "malicious".


> Drop the reference before continuing, mirroring the equivalent path in
> trans_fd.c.
 
It doesn't look like trans_fd.c behaves like this patch?


> Fixes: f66c72bea129 ("xen/9pfs: receive responses")

This should be 728356dedeff

Aside from the above, the code change looks correct

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> Cc: stable@vger.kernel.org
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Yifei Gao <gyf161023@gmail.com>
> ---
>  net/9p/trans_xen.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/net/9p/trans_xen.c b/net/9p/trans_xen.c
> index f9fb2db7a066..8eea0da8797f 100644
> --- a/net/9p/trans_xen.c
> +++ b/net/9p/trans_xen.c
> @@ -203,6 +203,8 @@ static void p9_xen_response(struct work_struct *work)
>  		req = p9_tag_lookup(priv->client, h.tag);
>  		if (!req || req->status != REQ_STATUS_SENT) {
>  			dev_warn(&priv->dev->dev, "Wrong req tag=%x\n", h.tag);
> +			if (req)
> +				p9_req_put(priv->client, req);
>  			cons += h.size;
>  			virt_mb();
>  			ring->intf->in_cons = cons;
> -- 
> 2.43.0
> 

