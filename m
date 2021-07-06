Return-Path: <SRS0=FDQh=L6=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E5B4C07E96
	for <xen-devel@archiver.kernel.org>; Tue,  6 Jul 2021 07:11:56 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2BF056195D
	for <xen-devel@archiver.kernel.org>; Tue,  6 Jul 2021 07:11:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2BF056195D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=aepfle.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.150798.278779 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0fF8-0001lP-Nk; Tue, 06 Jul 2021 07:11:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 150798.278779; Tue, 06 Jul 2021 07:11:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0fF8-0001lI-Kp; Tue, 06 Jul 2021 07:11:42 +0000
Received: by outflank-mailman (input) for mailman id 150798;
 Tue, 06 Jul 2021 07:11:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8sr3=L6=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1m0fF6-0001l7-Ma
 for xen-devel@lists.xenproject.org; Tue, 06 Jul 2021 07:11:41 +0000
Received: from mo4-p01-ob.smtp.rzone.de (unknown [81.169.146.167])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 686c26d8-de29-11eb-8476-12813bfff9fa;
 Tue, 06 Jul 2021 07:11:39 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id 30791cx667BTOyh
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 6 Jul 2021 09:11:29 +0200 (CEST)
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
X-Inumbo-ID: 686c26d8-de29-11eb-8476-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1625555490;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=stepMfQWD9Hy8MTmzI5cX04JZXnAjFIunFCNo8JfTPA=;
    b=ePn5VOLPBAd4Es5HqV3wrY3nhhZW0pW5px5VrlY9YScq1YAkEKXRpE0KS7b70qdLiu
    ZrlcLavJU9bTP+qrNraIUZRMR8vwzmXr0XjB+kA546/M3ZUx2c91hX9/XObONk66fsmb
    0qIMEQxQ7rGl57920IAJJ+mRMrOUIHsqSOMCOq+QMDRP1QI5Hh3xo8hdkZX4GXqQCzIC
    PmVO4NUV4dNqHMX/7Ey/rrDIOkIo1V0gIlw06vjwh3D/YqpGXdv72egZjttIvRtVtDbZ
    K4z7167fw8vJXyqy+rwhOEH6M92FGXOip4vwzBcDlzj3TetAO/kwrLAjRg+LWr0vVkPR
    hQBw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisF+Ax6FOE3sSy9BcWAcR/hQoAs9MGk67vg1baqX"
X-RZG-CLASS-ID: mo00
Date: Tue, 6 Jul 2021 09:11:29 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Marek =?UTF-8?B?TWFyY3p5?=
 =?UTF-8?B?a293c2tpLUfDs3JlY2tp?= <marmarek@invisiblethingslab.com>,
 "Juergen Gross" <jgross@suse.com>, Ian Jackson <iwj@xenproject.org>, Wei
 Liu <wl@xen.org>
Subject: Re: [PATCH 0/5] tools/migration: Py3 fixes, and page type helpers
Message-ID: <20210706091129.45451433.olaf@aepfle.de>
In-Reply-To: <20210705191027.15107-1-andrew.cooper3@citrix.com>
References: <20210705191027.15107-1-andrew.cooper3@citrix.com>
X-Mailer: Claws Mail 2021.07.03 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Am Mon, 5 Jul 2021 20:10:22 +0100
schrieb Andrew Cooper <andrew.cooper3@citrix.com>:

>   tools/python: handle libxl__physmap_info.name properly in convert-legacy-stream
>   tools/python: fix Python3.4 TypeError in format string
>   tools/migration: unify known page type checking
>   tools/migration: unify type checking for data pfns in the VM
>   tools/migration: unify type checking for data pfns in migration stream

Tested-by: Olaf Hering <olaf@aepfle.de>


Olaf

