Return-Path: <SRS0=eAWX=PP=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DC53C433FE
	for <xen-devel@archiver.kernel.org>; Wed, 27 Oct 2021 17:03:48 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6421D60F6F
	for <xen-devel@archiver.kernel.org>; Wed, 27 Oct 2021 17:03:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6421D60F6F
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.217117.376974 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfmKc-0004Ve-TN; Wed, 27 Oct 2021 17:03:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 217117.376974; Wed, 27 Oct 2021 17:03:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfmKc-0004VX-PQ; Wed, 27 Oct 2021 17:03:18 +0000
Received: by outflank-mailman (input) for mailman id 217117;
 Wed, 27 Oct 2021 17:03:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1mfmKb-0004Tq-DS
 for xen-devel@lists.xenproject.org; Wed, 27 Oct 2021 17:03:17 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1mfmKb-00007H-Ca
 for xen-devel@lists.xenproject.org; Wed, 27 Oct 2021 17:03:17 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1mfmKb-00008b-B5
 for xen-devel@lists.xenproject.org; Wed, 27 Oct 2021 17:03:17 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1mfmKP-0007y4-91; Wed, 27 Oct 2021 18:03:05 +0100
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
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From;
	bh=xjcD9iqokQD26kS+IVg9w8opmcg5O1wcnBjmb/ZBRFM=; b=Pb/AXsoCZLS37kL9o7+DhUsbGk
	FhY163JzEUpeZ829rXe74UdrYbeORDfg03j0kZhrN3zOpueZn9/gWLpJDHRPqOBv8Co3j/yXdrJbO
	O40Y6eQVmWCWNKAq5kHOToGh4bpRcRJGWANEnTOgcVkfi+cLN4z0H6MH/EIKPlN+TNhs=;
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>,
	Juergen Gross <jgross@suse.com>
Subject: [OSSTEST PATCH 0/2] ts-xen-build: explicitly enable/disable configure features
Date: Wed, 27 Oct 2021 18:02:54 +0100
Message-Id: <20211027170256.18223-1-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The existing code depends on precisely whether the non-default option
appearing in the configure script is indeed the opposite of the option
we want to pass.

Right now it seems to be working but this seems fragile.  Do it
differently.

I have verified that with current Xen, on arm64:

   + egrep -q -- '--disable-xend|--enable-xend' tools/configure
   + egrep -q -- '--disable-ovmf|--enable-ovmf' tools/configure
   + enable_opts=' --enable-ovmf'
   + egrep -q -- '--disable-qemu-traditional|--enable-qemu-traditional' tools/configure
   + enable_opts=' --enable-ovmf --disable-qemu-traditional'
   + ./configure --sysconfdir=/etc --enable-ovmf --disable-qemu-traditional

and on amd64:

   + egrep -q -- '--disable-xend|--enable-xend' tools/configure
   + egrep -q -- '--disable-ovmf|--enable-ovmf' tools/configure
   + enable_opts=' --enable-ovmf'
   + egrep -q -- '--disable-qemu-traditional|--enable-qemu-traditional' tools/configure
   + enable_opts=' --enable-ovmf --enable-qemu-traditional'
   + ./configure --sysconfdir=/etc --enable-ovmf --enable-qemu-traditional

Juergen, I would appreciate a review from you.  I think I would like
this in osstest production before changing the qemu trad build default
in Xen.

Ian Jackson (2):
  ts-xen-build: Refactor enable/disable configure options
  ts-xen-build: Pass --enable if --disable found in usage, and v.v.

 ts-xen-build | 38 +++++++++++++++++++++++++-------------
 1 file changed, 25 insertions(+), 13 deletions(-)

-- 
2.20.1


