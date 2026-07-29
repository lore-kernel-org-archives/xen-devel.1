Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E3CEC53219
	for <xen-devel@archiver.kernel.org>; Wed, 29 Jul 2026 07:48:03 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1375243.1622462 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woz14-0003P1-6L; Wed, 29 Jul 2026 07:47:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1375243.1622462; Wed, 29 Jul 2026 07:47:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woz14-0003Ou-3H; Wed, 29 Jul 2026 07:47:50 +0000
Received: by outflank-mailman (input) for mailman id 1375243;
 Wed, 29 Jul 2026 07:47:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1woz12-0003Oo-Na
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2026 07:47:48 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <roger.pau@citrix.com>) id 1woz12-00F7et-21;
 Wed, 29 Jul 2026 07:47:48 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <roger.pau@citrix.com>) id 1woz12-000NTp-04;
 Wed, 29 Jul 2026 07:47:48 +0000
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
Date: Wed, 29 Jul 2026 09:47:43 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH v2 3/4] x86/vRTC: the use_timer field is a boolean one
Message-ID: <ammwHx-mfJPLivgz@macbook.local>
References: <79d50725-3892-4643-b854-bfec9c0c0d79@suse.com>
 <f8c7271e-db76-4dd0-af5f-6ed11f9be8aa@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f8c7271e-db76-4dd0-af5f-6ed11f9be8aa@suse.com>

On Thu, Jul 02, 2026 at 11:30:44AM +0200, Jan Beulich wrote:
> ... and hence wants to be of bool type.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger@xenproject.org>

Thanks, Roger.

