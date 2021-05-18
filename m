Return-Path: <SRS0=1gSS=KN=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B656C43461
	for <xen-devel@archiver.kernel.org>; Tue, 18 May 2021 16:42:55 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 13B2F611BD
	for <xen-devel@archiver.kernel.org>; Tue, 18 May 2021 16:42:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 13B2F611BD
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.129458.243000 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lj2nw-0005ip-Fv; Tue, 18 May 2021 16:42:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 129458.243000; Tue, 18 May 2021 16:42:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lj2nw-0005ig-CY; Tue, 18 May 2021 16:42:48 +0000
Received: by outflank-mailman (input) for mailman id 129458;
 Tue, 18 May 2021 16:42:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h4/q=KN=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1lj2nv-0005hb-AW
 for xen-devel@lists.xenproject.org; Tue, 18 May 2021 16:42:47 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f6c45aca-585c-4d7f-aa04-754eed64d00e;
 Tue, 18 May 2021 16:42:46 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E9097AEA8;
 Tue, 18 May 2021 16:42:45 +0000 (UTC)
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
X-Inumbo-ID: f6c45aca-585c-4d7f-aa04-754eed64d00e
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1621356166; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jrX1NYllNsPfXSj7P+2XpQsI01YhtHcN3zywj7DDQY0=;
	b=XOQWxcqny7KFdAde0u7OR5RQmOGNifs9GFRadBftJy1ZgbBL5mfceh+reqZ2XnqG9jX57b
	8eM/7EyZWI8pNKJGQqrLsPVUcrjlupUl1lkNEH/ExZVUyZYnsuHEN4eGM9mVVSiXe24gpM
	+aIVEOzyxQLjEBen45A0E/0jSWFAK1E=
Subject: [PATCH v2 2/2] automation: fix dependencies on openSUSE Tumbleweed
 containers
From: Dario Faggioli <dfaggioli@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Roger Pau Monne <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Date: Tue, 18 May 2021 18:42:45 +0200
Message-ID: <162135616513.20014.6303562342690753615.stgit@Wayrath>
In-Reply-To: <162135593827.20014.14959979363028895972.stgit@Wayrath>
References: <162135593827.20014.14959979363028895972.stgit@Wayrath>
User-Agent: StGit/0.23
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Fix the build inside our openSUSE Tumbleweed container by using
adding libzstd headers. While there, remove the explicit dependency
for python and python3 as the respective -devel packages will pull
them in anyway.

Signed-off-by: Dario Faggioli <dfaggioli@suse.com>
---
Cc: Doug Goldstein <cardoe@cardoe.com>
Cc: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
---
Changes from v1:
- fix my email address in From:
- don't request python38-devel explicitly, python3-devel
  is just fine and is more generic (and hence better!)
---
 .../build/suse/opensuse-tumbleweed.dockerfile      |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/automation/build/suse/opensuse-tumbleweed.dockerfile b/automation/build/suse/opensuse-tumbleweed.dockerfile
index 8ff7b9b5ce..a33ab0d870 100644
--- a/automation/build/suse/opensuse-tumbleweed.dockerfile
+++ b/automation/build/suse/opensuse-tumbleweed.dockerfile
@@ -45,6 +45,7 @@ RUN zypper install -y --no-recommends \
         libtasn1-devel \
         libuuid-devel \
         libyajl-devel \
+        libzstd-devel \
         lzo-devel \
         make \
         nasm \
@@ -56,9 +57,7 @@ RUN zypper install -y --no-recommends \
         pandoc \
         patch \
         pkg-config \
-        python \
         python-devel \
-        python3 \
         python3-devel \
         systemd-devel \
         tar \



