Return-Path: <SRS0=uD1c=GV=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA9D8C433E0
	for <xen-devel@archiver.kernel.org>; Mon, 18 Jan 2021 10:34:58 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7ED4622227
	for <xen-devel@archiver.kernel.org>; Mon, 18 Jan 2021 10:34:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7ED4622227
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.69556.124570 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1Rro-00059y-Ks; Mon, 18 Jan 2021 10:34:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 69556.124570; Mon, 18 Jan 2021 10:34:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1Rro-00059r-HU; Mon, 18 Jan 2021 10:34:36 +0000
Received: by outflank-mailman (input) for mailman id 69556;
 Mon, 18 Jan 2021 10:34:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c1WU=GV=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1l1Rrn-00059l-LM
 for xen-devel@lists.xenproject.org; Mon, 18 Jan 2021 10:34:35 +0000
Received: from mail-wr1-x433.google.com (unknown [2a00:1450:4864:20::433])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9c5fca7c-ec91-484f-9ab1-0f95dc308d82;
 Mon, 18 Jan 2021 10:34:34 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id l12so10702708wry.2
 for <xen-devel@lists.xenproject.org>; Mon, 18 Jan 2021 02:34:34 -0800 (PST)
Received: from CBGR90WXYV0 (host86-183-162-242.range86-183.btcentralplus.com.
 [86.183.162.242])
 by smtp.gmail.com with ESMTPSA id d2sm28852498wre.39.2021.01.18.02.34.32
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 18 Jan 2021 02:34:33 -0800 (PST)
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
X-Inumbo-ID: 9c5fca7c-ec91-484f-9ab1-0f95dc308d82
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:thread-index
         :content-language;
        bh=c6l1QsDF36NxbVC9A/SpeAkTgQoAMbGOnhVlN9ZQ05g=;
        b=e8wYRbALClD7XTkWajPAzviKfuSeBTi06Jg6ROf/Lbk+iWa7pOWWEbyDx7NKkqWtAA
         e1HZm7axlAOAedNBXLqHxiXtL491CxLNaovBURDxg57pkgBuM+CenEw73a/X/vFOsA2I
         8KVVRU4zlC2Owh002B0bIQPPpDq7S8yS9zEBAGiFqwlNgFY5pBkk2xHxzFS9aIq+lf1F
         oJUfm1Ag1LwkMPxS8ygqcN18NXUBkfvnaP4Y5jrJZThoa25nD+0mQp79prbdHsMr2cO9
         KFqxBMLtTa1Vdj8IaACIt8rUrF4ixRLwdNBZl0MiLXn1A18MDjlsGZXPA4eYKM8+tWiC
         woZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :thread-index:content-language;
        bh=c6l1QsDF36NxbVC9A/SpeAkTgQoAMbGOnhVlN9ZQ05g=;
        b=UUcHbwBr9HnEipeKxXk+FzYd/1xwmAHbvv7YVHFFOjCRLy/Z//EwGWU5FKttJL/VZ+
         XFAzy8YgQuX2MzMiBcaYH78vmq5M1Ba4hHf2HjZmslyfB9zcE4QQUfNUztiRLiJvkxnx
         AGwKl0XLLsixQmwCv7kSrfcv2biyz5Zf5PhAnZ90mhtC+Nk9V9Pw7SrR169NVmLbi/RK
         PdWOI7M0mRSAfEBKr24yj1hasPD0uHvgOoI0u/nIhIo767Da1uqzONkeAJEcP6GM7qC4
         SciTNNxtymNp+XqCQB4NdeLjeT5BNhQhzGYzfHHaScvWxWcl42R41VCfUOtkQ3dnpBb+
         JeNQ==
X-Gm-Message-State: AOAM532QS70z0SlIWzpMfvkW7HUDmsw6c2EAIwKBbhILrUg+nV+/alxP
	CoEeQiuM47VSf6vNnD2ucSg=
X-Google-Smtp-Source: ABdhPJwogFQEOmidwjrHPItxsUd0LKUyxsYCm96cMpNMMdjtvJ7Gtd31EQ1qWSbMX9QfAPOjZ/+dRw==
X-Received: by 2002:adf:80d0:: with SMTP id 74mr25587276wrl.110.1610966074025;
        Mon, 18 Jan 2021 02:34:34 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: "'Oleksandr'" <olekstysh@gmail.com>
Cc: <xen-devel@lists.xenproject.org>,
	"'Julien Grall'" <julien.grall@arm.com>,
	"'Jan Beulich'" <jbeulich@suse.com>,
	"'Andrew Cooper'" <andrew.cooper3@citrix.com>,
	=?utf-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>,
	"'Wei Liu'" <wl@xen.org>,
	"'George Dunlap'" <george.dunlap@citrix.com>,
	"'Ian Jackson'" <iwj@xenproject.org>,
	"'Julien Grall'" <julien@xen.org>,
	"'Stefano Stabellini'" <sstabellini@kernel.org>,
	"'Daniel De Graaf'" <dgdegra@tycho.nsa.gov>,
	"'Oleksandr Tyshchenko'" <oleksandr_tyshchenko@epam.com>
References: <1610488352-18494-1-git-send-email-olekstysh@gmail.com> <1610488352-18494-10-git-send-email-olekstysh@gmail.com> <00c301d6ed7a$aeeb5660$0cc20320$@xen.org> <415a6457-546c-3c58-31ae-da368fcea1e4@gmail.com>
In-Reply-To: <415a6457-546c-3c58-31ae-da368fcea1e4@gmail.com>
Subject: RE: [PATCH V4 09/24] xen/ioreq: Make x86's IOREQ related dm-op handling common
Date: Mon, 18 Jan 2021 10:34:32 -0000
Message-ID: <00d501d6ed85$82c944b0$885bce10$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJtR7ihpnpDvKGK8VeC26+r2ffFKQIOlNpDASJxKBYCcNBCo6jTbB9w
Content-Language: en-gb

> -----Original Message-----
[snip]
> >> diff --git a/xen/common/ioreq.c b/xen/common/ioreq.c
> >> index a319c88..72b5da0 100644
> >> --- a/xen/common/ioreq.c
> >> +++ b/xen/common/ioreq.c
> >> @@ -591,8 +591,8 @@ static void hvm_ioreq_server_deinit(struct ioreq_server *s)
> >>       put_domain(s->emulator);
> >>   }
> >>
> >> -int hvm_create_ioreq_server(struct domain *d, int bufioreq_handling,
> >> -                            ioservid_t *id)
> >> +static int hvm_create_ioreq_server(struct domain *d, int bufioreq_handling,
> >> +                                   ioservid_t *id)
> > Would this not be a good opportunity to drop the 'hvm_' prefix (here and elsewhere)?
> 
> It would be, I will drop.
> 
> 
> May I ask, are you ok with that alternative approach proposed by Jan and
> already implemented in current version (top level dm-op handling
> arch-specific
> and call into ioreq_server_dm_op() for otherwise unhandled ops)?
> 

Yes, I think per-arch hypercall handlers is the tidiest way to go.

  Paul

> Initial discussion here:
> https://lore.kernel.org/xen-devel/1606732298-22107-10-git-send-email-olekstysh@gmail.com/
> 
> --
> Regards,
> 
> Oleksandr Tyshchenko



