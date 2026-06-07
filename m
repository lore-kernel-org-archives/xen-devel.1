Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EE1CCD8C8E
	for <xen-devel@archiver.kernel.org>; Sun,  7 Jun 2026 15:10:53 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1331172.1593937 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWF8j-0003ez-WB; Sun, 07 Jun 2026 15:10:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1331172.1593937; Sun, 07 Jun 2026 15:10:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWF8j-0003er-RJ; Sun, 07 Jun 2026 15:10:17 +0000
Received: by outflank-mailman (input) for mailman id 1331172;
 Sun, 07 Jun 2026 13:55:49 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hadyazzam@protonmail.com>) id 1wWDyf-0000Uk-Dz
 for xen-devel@lists.xenproject.org; Sun, 07 Jun 2026 13:55:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wWDye-00BnEx-R4
 for xen-devel@lists.xenproject.org; Sun, 07 Jun 2026 15:55:48 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <hadyazzam@protonmail.com>)
 id 6a257834-bab6-0a2a0a5309dd-0a2a4504a950-30
 for <xen-devel@lists.xenproject.org>; Sun, 07 Jun 2026 15:55:48 +0200
Received: from [185.70.43.25] (helo=mail-4325.protonmail.ch)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <hadyazzam@protonmail.com>)
 id 6a257864-1dec-0a2a45040019-b9462b19422b-3
 for <xen-devel@lists.xenproject.org>; Sun, 07 Jun 2026 15:55:48 +0200
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=protonmail3 header.d=protonmail.com header.i="@protonmail.com" header.h="Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1780840547; x=1781099747;
	bh=UPIyQ8IH94iSyDkaYG7f3JXf4+wK/TuMBsoPkpscB1Q=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Ka4wvcA3vJz9tuaVn0ztXpcbJ2Z4SsRU1SAyQRu51z4vn2k9ABnIE2MRbmdB131As
	 Ub5ZrrubY1+sBOZvLhKsSoNe1T2LJ+DjzZyreGlzxlYjmRpnXSfExBe1OQs7Ze9JcV
	 Fu1WiELv28x6EFPFDZopPvdBNAXKd/9Ab5mrmbvRuIDZdCJKIow2HuL/6P1XQ9MFcA
	 0HjsQ/MjWdVLylWqcdhD6BwHEF5oFxIUxEtlAjgCNl+OtSDyGOHiD07MaUHmclNtil
	 8Fx/uoCwNS6MiPhVaPZtZGm2AaMgKkZZPsUCqqMmfcFbkiGcTcv0fGlJ7/5hYdbwCB
	 +5savUyx8Gzfw==
Date: Sun, 07 Jun 2026 13:55:42 +0000
To: Jason Andryuk <jason.andryuk@amd.com>
From: Hady <hadyazzam@protonmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Teddy Astie <teddy.astie@vates.tech>, Tamas K Lengyel <tamas@tklengyel.com>, Penny Zheng <Penny.Zheng@amd.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH for-4.22] x86/hvm: Partially revert ("xen/mem_access: wrap memory access when VM_EVENT=n")
Message-ID: <bCSTKqH-4KCc_vTLQ3_v6uoGozik8YS3qncdJLURVRlcQIRer_dPiNjEs70H0tq1FiTfl_8NeDtpsxK9FI38TC3HuttN235sSteXigGE26w=@protonmail.com>
In-Reply-To: <8dc5f6be-0276-4b12-ba1d-22682c4350cf@amd.com>
References: <20260605194157.2762581-1-andrew.cooper3@citrix.com> <8dc5f6be-0276-4b12-ba1d-22682c4350cf@amd.com>
Feedback-ID: 21433940:user:proton
X-Pm-Message-ID: 5d8aab2ddcea2b850b30d1b574d329aba12508b9
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-ebf023/1780840548-2A17E3FF-1485C1C4/0/0
X-purgate-type: clean
X-purgate-size: 724

On Saturday, June 6th, 2026 at 4:13 AM, Jason Andryuk jason.andryuk@amd.com=
 wrote:

> On 2026-06-05 15:41, Andrew Cooper wrote:
>=20
> > It is erroneous to check current like this. e.g. Dom0 does not have VM_=
EVENT
> > active when it's introspecting domUs.
> >=20
> > The use of vm_event_is_enabled() is only for the IS_ENABLED(CONFIG_VM_E=
VENT)
> > short circut, so just use that directly.
> >=20
> > Reported-by: Hady Azzam hadyazzam@protonmail.com
> > Fixes: b18e38e42da6 ("xen/mem_access: wrap memory access when VM_EVENT=
=3Dn")
> > Signed-off-by: Andrew Cooper andrew.cooper3@citrix.com
>=20
> Reviewed-by: Jason Andryuk jason.andryuk@amd.com

Tested-by: Hady Azzam <hadyazzam@protonmail.com>

