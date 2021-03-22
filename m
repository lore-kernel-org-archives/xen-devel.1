Return-Path: <SRS0=cl0r=IU=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02553C433E0
	for <xen-devel@archiver.kernel.org>; Mon, 22 Mar 2021 15:47:30 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB99C6198D
	for <xen-devel@archiver.kernel.org>; Mon, 22 Mar 2021 15:47:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AB99C6198D
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.100291.191028 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOMlq-0006s7-V3; Mon, 22 Mar 2021 15:47:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 100291.191028; Mon, 22 Mar 2021 15:47:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOMlq-0006s0-Rn; Mon, 22 Mar 2021 15:47:10 +0000
Received: by outflank-mailman (input) for mailman id 100291;
 Mon, 22 Mar 2021 15:47:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lOMlp-0006ro-NE
 for xen-devel@lists.xenproject.org; Mon, 22 Mar 2021 15:47:09 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lOMlp-0006VL-Lb
 for xen-devel@lists.xenproject.org; Mon, 22 Mar 2021 15:47:09 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lOMlp-0007Zm-Ko
 for xen-devel@lists.xenproject.org; Mon, 22 Mar 2021 15:47:09 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lOMlm-0000SU-Dc; Mon, 22 Mar 2021 15:47:06 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Subject:CC:To:Date:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=QFVieVe62zkpf8DxrvcbVuPF/MGQ0CiXLe0qGXhW0ek=; b=cmcsQ6bt3tOplT+Csjxg7G1pyC
	5P3MJsfZ994ErY6rHPvs6aqofl2nHmvUdbNtWkf/ExhLzjsa335NN7/KaiUumNC1XRPjsjkiwyItC
	Nr5AnXsngo4Gjt0GBPmT3WsYLwc0+IkwYk9UQK+eTTKNpYnslgZ7fsmgXoT/mEh20SUU=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24664.48122.241503.647432@mariner.uk.xensource.com>
Date: Mon, 22 Mar 2021 15:47:06 +0000
To: xen-announce@lists.xenproject.org
CC: xen-devel@lists.xenproject.org,
    xen-users@lists.xenproject.org
Subject: Xen 4.15 RC4

From: Ian Jackson <iwj@xenproject.org>
Date: Mon, 15 Mar 2021 12:14:51 +0000

Xen 4.15 RC4 is now available.

It is available from git:
  git clone https://xenbits.xenproject.org/git-http/xen.git -b 4.15.0-rc4

For your convenience a tarball is available:
  https://downloads.xenproject.org/release/xen/4.15.0-rc4/xen-4.15.0-rc4.tar.gz
  https://downloads.xenproject.org/release/xen/4.15.0-rc4/xen-4.15.0-rc4.tar.gz.sig

Please send bug reports and test reports to
xen-devel@lists.xenproject.org.  When sending bug reports, please CC
relevant maintainers and me (iwj@xenproject.org).

I will send an update on the state of the release fairly soon.

Ian.


