Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B96EC56207
	for <xen-devel@archiver.kernel.org>; Thu,  6 Aug 2026 14:43:33 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1384867.1627611 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrzJV-0005cO-Kp; Thu, 06 Aug 2026 14:43:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1384867.1627611; Thu, 06 Aug 2026 14:43:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrzJV-0005cH-I0; Thu, 06 Aug 2026 14:43:17 +0000
Received: by outflank-mailman (input) for mailman id 1384867;
 Thu, 06 Aug 2026 14:43:16 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gyf161023@gmail.com>) id 1wrzJU-0005cB-P2
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 14:43:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrzJT-004AKZ-J6
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 16:43:15 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <gyf161023@gmail.com>)
 id 6a749d72-bab6-0a2a0a5309dd-0a2a4506e8b2-28
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 16:43:15 +0200
Received: from [209.85.222.173] (helo=mail-qk1-f173.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <gyf161023@gmail.com>)
 id 6a749d82-195a-0a2a45060019-d155deade5ac-3
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 16:43:15 +0200
Received: by mail-qk1-f173.google.com with SMTP id
 af79cd13be357-92ed3993c1eso122815385a.1
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 07:43:15 -0700 (PDT)
Received: from LAPTOP-DPAKMOI4.it.purdue.edu (pal-210-106-74.itap.purdue.edu.
 [128.210.106.74]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-9088a219ea8sm35070376d6.37.2026.08.06.07.43.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Aug 2026 07:43:13 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786027394; x=1786632194; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mQCss4lFgE6Dwf1NizCh8ZHT2e94D2G9yvtYGo+Xll0=;
        b=aZTJbtITyY6Y9eLkwnxb/0uNSxHV9TlnK46I6nZZlacGx7iw6pF50IiTJ2AlvipjKg
         mTm/XJxazqQaxEmFgMxN0uQ4RV4fHtWHGNfvfPz3rVsjGJ3vrQKR3hMwU7ByG3JeGh7j
         Gm1BNYsT0IelzmgpWAGNuQvPQRej+6GY3ur3lz+Mf/E1A+DGgGE6O+gVoNiGZAPbeRPC
         VFEQUtOlMVO89hNXHa+1mtK7qI4pynvM1WU8o8cJpOabrDQ/8j5iIONM0fE2ToUpvScc
         /3VhdH881N0NvCdhmyr7VtaCLGvDE8Tu7rzHPXRyMZ0ErjVnRnxtnLmJNWRxgEt+QwX1
         abvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786027394; x=1786632194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mQCss4lFgE6Dwf1NizCh8ZHT2e94D2G9yvtYGo+Xll0=;
        b=oK6s9JO0IOKa+xvGp8sSOGC6cwmGIHekoguGABCWFD3Dk6JC5l/RwHFagNSOhcKjDq
         29abejOqKAIHtk2bSbGp9kvy53eSZalIp+PBcurvlD3a5JsxkVTiu2CDvD+94gB6a18g
         zz8Vhx88dKyWoFxomu5Lo6nsFVyJojSKmtS3sEKkfPRj7KDcFkk31jlkvrtzlRpOcX6l
         iY0tQ7LgpF4qJQzARjfxaI0W6vSbARHRGFwDA+SURlsEaR8ZuTQGo+Ckmr3eqP/jx03I
         o08BlXyOOq1210mn9Vn1Isjp2dL56vDztuI8VK3sZapTmVSj9/wCFyi76qYpXx704xp+
         RkyA==
X-Forwarded-Encrypted: i=1; AHgh+RrN4cePeeUnr2lLzt7++JGHkzr81cb2luWu7ZHUJjuHk1JBxSOptfpNP0y80CpcdYSmdBmbcy9+33E=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzWXZea0WTBQgYCyQnon6Fpx1yyQJxnysUJD9upH5ppH52fyHhg
	jqQbHudbI/oi6FfA0RADMJNHdw76lLSq0Q9vMAPefv6IdhqC150TwYgB
X-Gm-Gg: AR+sD13ehG1dJqKT2D8czvE7C515ikDZT2fo2fnngX8e8mxkMklw7IT7JuAEqWfe0iq
	Net49qIfPQ4AafuIcekEQctuEmGfsMifi/zkHkcEtxQ14wPhhzwbT1RjtVMyVCwyyOkyTUr+vl5
	DBYVOFueyyNXAscoh0/NKxu2VH3tKXCx2e3O9cA9KpvGjQ0YCJPRLfbrrFkP2fqF9COC7I/baLS
	WKLB2CyFv847wGqTvvdVPsvmFgJc5TjmdVmObaT+y2rjZ3oPuwcgiNpiR4Wd438DAREymGm5Jgk
	QwFk9Y/xd0HkW2Io/Sohor8pwQI44e2Gd95Z+/UKHNAEWjqonoJH9NtFvqriPfqycY3uS/fC/3p
	VhwC93DMQ/ja7LzZ9Hdd3f4KpCXEPV3TfSbwIeFuorU0osLNwEAFNIE9bhIkC0GEypY2HfQEZfY
	JYG2+RhaONi81BzdUfWUOvJvfvxgf9iIIkxqdYP2Zsi/rI8994/FQLDdFGd7zMsj32p0dB8gpsv
	xJyAED0HaI2IV85K+UlOSJ5H74h6l58R0cHL2iD3J8=
X-Received: by 2002:ac8:5e08:0:b0:527:f0a:ccbc with SMTP id d75a77b69052e-52ce5fa28acmr159831981cf.18.1786027393869;
        Thu, 06 Aug 2026 07:43:13 -0700 (PDT)
From: Yifei Gao <gyf161023@gmail.com>
To: Eric Van Hensbergen <ericvh@kernel.org>,
	Latchesar Ionkov <lucho@ionkov.net>,
	Dominique Martinet <asmadeus@codewreck.org>,
	v9fs@lists.linux.dev
Cc: Christian Schoenebeck <linux_oss@crudebyte.com>,
	Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Yifei Gao <gyf161023@gmail.com>
Subject: [PATCH v2] 9p/xen: fix refcount leak in p9_xen_response() on wrong tag
Date: Thu,  6 Aug 2026 14:42:54 +0000
Message-ID: <20260806144255.4167019-1-gyf161023@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260804213550.3409638-1-gyf161023@gmail.com>
References: <20260804213550.3409638-1-gyf161023@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1786027395-FE27077B-8C9B03B3/0/0
X-purgate-type: clean
X-purgate-size: 1515

p9_xen_response() looks up the request for an incoming reply with
p9_tag_lookup(), which takes a reference on the returned p9_req_t. When
the tag does not resolve to a request in REQ_STATUS_SENT, the function
warns and continues the loop without dropping that reference, permanently
leaking the p9_req_t and its msize buffers. The reply header, including
the tag, is supplied by the backend, so a malicious or buggy 9P backend
can leak kernel memory on every crafted response.

Drop the reference before continuing.

Fixes: 728356dedeff ("9p: Add refcount to p9_req_t")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Yifei Gao <gyf161023@gmail.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
v2:
  - Fix Fixes: tag to reference the correct commit (728356dedeff).
  - Drop the inaccurate trans_fd.c comparison from the changelog.
  - Add Reviewed-by from Stefano.


 net/9p/trans_xen.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/net/9p/trans_xen.c b/net/9p/trans_xen.c
index f9fb2db7a066..8eea0da8797f 100644
--- a/net/9p/trans_xen.c
+++ b/net/9p/trans_xen.c
@@ -203,6 +203,8 @@ static void p9_xen_response(struct work_struct *work)
 		req = p9_tag_lookup(priv->client, h.tag);
 		if (!req || req->status != REQ_STATUS_SENT) {
 			dev_warn(&priv->dev->dev, "Wrong req tag=%x\n", h.tag);
+			if (req)
+				p9_req_put(priv->client, req);
 			cons += h.size;
 			virt_mb();
 			ring->intf->in_cons = cons;
-- 
2.43.0


