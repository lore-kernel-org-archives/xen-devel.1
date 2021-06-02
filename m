Return-Path: <SRS0=/WvL=K4=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BBEEC4708F
	for <xen-devel@archiver.kernel.org>; Wed,  2 Jun 2021 12:33:03 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB24761396
	for <xen-devel@archiver.kernel.org>; Wed,  2 Jun 2021 12:33:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AB24761396
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=aepfle.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.136030.252407 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loQ3F-0008BO-0S; Wed, 02 Jun 2021 12:32:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 136030.252407; Wed, 02 Jun 2021 12:32:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loQ3E-0008BH-Sz; Wed, 02 Jun 2021 12:32:48 +0000
Received: by outflank-mailman (input) for mailman id 136030;
 Wed, 02 Jun 2021 12:32:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NSCb=K4=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1loQ3C-0008BB-Qp
 for xen-devel@lists.xenproject.org; Wed, 02 Jun 2021 12:32:47 +0000
Received: from mo4-p01-ob.smtp.rzone.de (unknown [81.169.146.164])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5d11ce78-ac99-496d-8ff1-e18014dd2db0;
 Wed, 02 Jun 2021 12:32:45 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.27.2 AUTH)
 with ESMTPSA id j0415bx52CWb4ww
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 2 Jun 2021 14:32:37 +0200 (CEST)
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
X-Inumbo-ID: 5d11ce78-ac99-496d-8ff1-e18014dd2db0
ARC-Seal: i=1; a=rsa-sha256; t=1622637157; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=ISWKGepvFv99Q9VNMOvqDUhkJliYEJDAJyAdjWpfxRi1ao6v27utIfPEpQyaMJzg5S
    k3IzuZrxTKBoLZMHkTcnCGrM0VlVu943Rtv4MpU5RrSMercfrY085NnGWhftcQ911AIm
    VeIr0vFSDKgmiTS9yeFa89do9TkfFSgL5SfrIeKwSvK0BqkPt6Udj+ku9xCVsZVcH4W/
    itaAjgcDSZL3es7yJsnMRSKDPLhDarh4w9V37SEDP0NMf6aaM+UbLDkzACbGi/v5hpuC
    aUA52mbIyWXLsSA+FjR20CcDRcPC0JXG5urd2PZs/P783mhBH6Jw+zon6kApY6n1/qfz
    hxMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1622637157;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=JWdlTkXOkgDN7Clt1j9YLt2cHeC41eQucSJbB7W4054=;
    b=licgU8qa2ZoQswWGYaLxd7Y7KK25vSBFTcAt/L+IzClHxFbTHUNceyBPLiesKlwm15
    PF8ZIQax02sPq8HHMxMGRyOt3xmVwBeepL6TNl2QnRwcEqrfSIASDHkI3kNo5ryWd4Qp
    CRoodtCAOVtR+wQpZZyfnh3al1r60tIFpI2xgrA9Vl7E9hramkEjbdor95zGz8zJ0otb
    yRWq0/JzdygFsZijffbh60OvbCQIJBx5vgVHtFFHxkfzIjC9GuiBYqibWYrNhE9Y5jWk
    Hou4l5wmBecSiQKbQ2yzieqxmpx8Iunl1QDIDwTwWFbOiJp4Y6U1JWWkWjA9DhRaeRLv
    6pKA==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1622637157;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=JWdlTkXOkgDN7Clt1j9YLt2cHeC41eQucSJbB7W4054=;
    b=CV3xHSSoGQG6Vl29O/yp3BMzE0AhXJJrjMWncWJPVhK6ndh03HrjS3VvyLln8vSewn
    smL8OtXjl9OIv/v+TemXQnDh3vbnHb7Nn0ejnVoQ3CA46Zxc2aF/tR/obU4wjs87pGDq
    /VlxUDZEDeq//YOrKayLYHHOrYcc/07/FjaJGhyBVFEpwVEUo8rfMRmHGomftPTuu1V1
    TOR+SfvXMeD9pOSh3gGJ0k7+8ScTgxC18ekSRh1Z/ctsneD17Tj3kIgjK+uRGfV2kWai
    IZFXwdOsljzZWMBTM0KID7HB+52jnrWl0DXQ5kcNpbOrMXKEyusVenGXFXakTZRPTAwx
    2WAA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisF9Wx7WbE3s+BU2kLCYUBd7t4vRd/ulzKn4R+Wk"
X-RZG-CLASS-ID: mo00
Date: Wed, 2 Jun 2021 14:32:36 +0200
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Anthony PERARD
 <anthony.perard@citrix.com>
Subject: [PATCH v20210602 02/38] xl: fix description of migrate --debug
Message-ID: <20210602143215.3a0cb971.olaf@aepfle.de>
In-Reply-To: <20210601161118.18986-3-olaf@aepfle.de>
References: <20210601161118.18986-1-olaf@aepfle.de>
	<20210601161118.18986-3-olaf@aepfle.de>
X-Mailer: Claws Mail 2021.05.24 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

xl migrate --debug used to track every pfn in every batch of pages.
But these times are gone. The code in xc_domain_save is the consumer
of this knob, but it considers it only for the remus and colo case.

Adjust the help text to tell what --debug does today: Nothing.

Signed-off-by: Olaf Hering <olaf@aepfle.de>

v02:
- the option has no effect anymore
---
 docs/man/xl.1.pod.in   | 2 +-
 tools/xl/xl_cmdtable.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/man/xl.1.pod.in b/docs/man/xl.1.pod.in
index e2176bd696..70a6ebf438 100644
--- a/docs/man/xl.1.pod.in
+++ b/docs/man/xl.1.pod.in
@@ -481,7 +481,7 @@ domain.
 
 =item B<--debug>
 
-Display huge (!) amount of debug information during the migration process.
+This option has no effect. It is preserved for compatibility reasons.
 
 =item B<-p>
 
diff --git a/tools/xl/xl_cmdtable.c b/tools/xl/xl_cmdtable.c
index 661323d488..ca1dfa3525 100644
--- a/tools/xl/xl_cmdtable.c
+++ b/tools/xl/xl_cmdtable.c
@@ -172,7 +172,7 @@ const struct cmd_spec cmd_table[] = {
       "                migrate-receive [-d -e]\n"
       "-e              Do not wait in the background (on <host>) for the death\n"
       "                of the domain.\n"
-      "--debug         Print huge (!) amount of debug during the migration process.\n"
+      "--debug         Ignored.\n"
       "-p              Do not unpause domain after migrating it.\n"
       "-D              Preserve the domain id"
     },

