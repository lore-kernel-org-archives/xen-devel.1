Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47569CA9ED1
	for <xen-devel@archiver.kernel.org>; Mon, 12 Oct 2026 10:16:47 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1446065.1662030 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGD56-0002N3-LV; Mon, 12 Oct 2026 10:16:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1446065.1662030; Mon, 12 Oct 2026 10:16:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGD56-0002Mw-HF; Mon, 12 Oct 2026 10:16:32 +0000
Received: by outflank-mailman (input) for mailman id 1446065;
 Mon, 12 Oct 2026 10:16:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xGD55-0002Mq-QM
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 10:16:31 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xGD55-00000001hEx-49De
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 10:16:31 +0000
Received: from mail-lf1-f45.google.com ([209.85.167.45])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xGD55-00000008BuY-1BYk
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 10:16:31 +0000
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-5bccb867d6fso1102661e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 03:16:31 -0700 (PDT)
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
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:Content-Type:Cc
	:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version;
	bh=2zy3hX2JjExXiK0ClK0TkZ335pbMgwsETmx+Gyqc998=; b=M+3yCfjbXtFy4Xh5/d2uK0InM7
	fbrCtoenTERfUxUtdwLHrqbHnCFKrD1AlN0cPcJbOBzMBcfKD9EuVZD1IUnRA852LHYgXlgP7XGTE
	L00rudC/vGjcmndlEYqpg5sXG6Jg/4fNv/ZGpxXh8JmkYL+1fxmHpv7PhUSFCJK1OQKc=;
X-Gm-Message-State: AFq9FYJvmolin2RLpcPwbiPTDTyLlQaaD8EhW/HI8cUaLgj1q2ZlpbK5
	ZVbxKn8ypvVtR1n5Xo3Le4rc7K5udewSQwOfGgNFYZCsXxOi2FIdnJdERPbCMe74TZkZDQeg9dk
	8Q/6ylkdVlH8BlWHccikX1X2E6oqW3EM=
X-Received: by 2002:a05:6512:3989:b0:5ba:37c8:a485 with SMTP id
 2adb3069b0e04-5bcde6bdfd9mr2743422e87.22.1791800190667; Mon, 12 Oct 2026
 03:16:30 -0700 (PDT)
MIME-Version: 1.0
References: <1b4c2bb4-118d-497c-8d7d-f3824fd61a73@suse.com> <0c6f1d50-9eb2-44c1-aea5-c366204316e3@suse.com>
In-Reply-To: <0c6f1d50-9eb2-44c1-aea5-c366204316e3@suse.com>
From: George Dunlap <gwd@xenproject.org>
Date: Mon, 12 Oct 2026 11:16:18 +0100
X-Gmail-Original-Message-ID: <CAFLBxZbNPhvbX6eO5Bz8VedoRF5TbFfFyvyKVtCHkUYyU0cPCg@mail.gmail.com>
X-Gm-Features: AclHuK9wbiHsAx04MRBamcM2AykAW5BSspYgTBoMIOgI29WLWeKG0m0OW06s_n8
Message-ID: <CAFLBxZbNPhvbX6eO5Bz8VedoRF5TbFfFyvyKVtCHkUYyU0cPCg@mail.gmail.com>
Subject: Re: [PATCH 02/15] x86/PV: make better use of assign_pages()
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Teddy Astie <teddy.astie@vates.tech>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 9:19=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> As of the referenced commit there's no reason to open-code the loop
> anymore. With that replaced by a single call, there's then also no point
> in using the local "mfn" in this code.
>
> Amends: 5260e8fb93f0 ("xen: re-define assign_pages and introduce a new fu=
nction assign_page")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: George Dunlap <gwd@xenproject.org>

