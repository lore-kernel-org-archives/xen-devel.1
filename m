Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E86BEFB81B
	for <xen-devel@archiver.kernel.org>; Tue, 24 Feb 2026 09:10:45 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1239566.1540963 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuoR3-0005Ky-Nq; Tue, 24 Feb 2026 09:10:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1239566.1540963; Tue, 24 Feb 2026 09:10:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuoR3-0005Kr-Km; Tue, 24 Feb 2026 09:10:29 +0000
Received: by outflank-mailman (input) for mailman id 1239566;
 Tue, 24 Feb 2026 09:10:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+kWt=A4=linux-mail.net=dt@srs-se1.protection.inumbo.net>)
 id 1vuoR1-0005Kh-OF
 for xen-devel@lists.xenproject.org; Tue, 24 Feb 2026 09:10:28 +0000
Received: from mail-10627.protonmail.ch (mail-10627.protonmail.ch
 [79.135.106.27]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a7c1dbb0-1160-11f1-b164-2bf370ae4941;
 Tue, 24 Feb 2026 10:10:25 +0100 (CET)
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
X-Inumbo-ID: a7c1dbb0-1160-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux-mail.net;
	s=protonmail; t=1771924224; x=1772183424;
	bh=hmCCodP6ILfYzHeYMGfQMZKpk8QNNXkJ2el02ynxmoM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=AJpR02z1d2PZ4TCePIIGRi2UT49zeAl64Y2dAKhdPdj8pSy0gJY/TT1JJ6f2257w8
	 0/D2A/DrT3VC3FRG1KGIvckWP3766Ar92vEzfNJVhDx47itBAvkxqQEf7JQ8sYwP6N
	 2H8BbxR9cSHPkxE2bEE4uEGswusGJwsDUK0wCiWbs4cMaPxMJZFHCRKEvyMPm4UCGs
	 EDjA5VNj/wQXyxCvt+YiazdjUZ/22a/4nQ7XdPnzt+LXaBWMArajIa/FFVGqaHo+LR
	 mSxtgvbtsO9FPcBg3VqVlRwllfMI97Uoapo7Vygdg71zWDyx11zmwwFhoe3TpMAzvb
	 BUHP72VsVrd/w==
Date: Tue, 24 Feb 2026 09:10:19 +0000
To: Jan Beulich <jbeulich@suse.com>
From: "David Thomson (dt@linux.com)" <dt@linux-mail.net>
Cc: boris.ostrovsky@oracle.com, sstabellini@kernel.org, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, jgross@suse.com
Subject: Re: [PATCH] xen/acpi-processor: fix _CST detection using undersized evaluation buffer
Message-ID: <FvW05oEjY785ua6lBtiEat0hzzY8RM9BeRC-RTwpIQ8QYO7lMvYmJ78U8C0S0vT_TRg4YX4-TzoGEsDvqwUVeX9w89FR47MYWR1oxpFJCBo=@linux-mail.net>
In-Reply-To: <e983d7a2-2c8a-46d4-8112-0d2f2045c93f@suse.com>
References: <20260223195602.17122-1-dt@linux-mail.net> <e983d7a2-2c8a-46d4-8112-0d2f2045c93f@suse.com>
Feedback-ID: 176297775:user:proton
X-Pm-Message-ID: 87b72af72c34525a5deec4dee2366d398fa1be24
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

> I understand you reflect original behavior in this regard, but why involv=
e any
> ACPI function here at all when pblk is non-zero? I.e. why not swap the op=
erands
> of && ? Object evaluation could have wanted side effects (in which case,
> however, some different change would be needed here), but checking for me=
thod
> presence surely hasn't.
>=20
> Jan
>=20
You're right on both counts. The original evaluate_object() call at least h=
ad the appearance of wanting the result (even though buf was undersized and=
 the result was never used). A pure presence check has no such pretense. Sw=
apping the operands is the obvious improvement. I think dropping the _CST c=
heck entirely is also defensible since C-state support is confirmed when pb=
lk is set. But I'm not certain there's no edge case where pblk is non-zero =
and _CST is also not present, so I'd defer to your judgement.

Would you prefer:
a) if (pblk && acpi_has_method(handle, "_CST"))
b) just if (pblk)

Happy to send a v2 either way.

DT

