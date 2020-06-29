Return-Path: <SRS0=/qc5=AK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68CCAC433DF
	for <xen-devel@archiver.kernel.org>; Mon, 29 Jun 2020 14:00:30 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 37E5F23D51
	for <xen-devel@archiver.kernel.org>; Mon, 29 Jun 2020 14:00:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RM81d4eG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 37E5F23D51
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jpuKS-0000uY-Lf; Mon, 29 Jun 2020 14:00:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xxse=AK=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jpuKS-0000uT-31
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2020 14:00:12 +0000
X-Inumbo-ID: d8cf4bc8-ba10-11ea-b7bb-bc764e2007e4
Received: from mail-wr1-x436.google.com (unknown [2a00:1450:4864:20::436])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d8cf4bc8-ba10-11ea-b7bb-bc764e2007e4;
 Mon, 29 Jun 2020 14:00:11 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id q5so16650418wru.6
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2020 07:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=5SxzAMmNmjXpTpTWYdx1hWVU4CseMcqm45bhhP+oHL0=;
 b=RM81d4eGGi788tNTSZLdjcBQo81xmtLprOQu2IKDg8kwovZq7wDV1J2FcFfKOwHBRk
 6rcu7fUjibAa9mNHEkYU9kN6DfFiRXtu9xAXkVETzvaYbhFjvuGPEYtwR1jto288XtNx
 i2XD/n7egnwov00fAMLIxAF99AUr8DUHi/IbOwpOEEIIVDXo8UoBmtlkaM3mA4LCmO/Y
 U4XwYvllJczXDdjTQVxG0zwntVR1vWLqKK8oGyod13NniI08g0Rppo6OujJAspngG7SC
 95sMu+kfIplkv0kPKQM1Cq1PzkXj+OPnc74a+86Ka8HMjzjoyL9uCfKyfZI3TuODEvZz
 jXuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=5SxzAMmNmjXpTpTWYdx1hWVU4CseMcqm45bhhP+oHL0=;
 b=Xvewq8uMARmYbz6SdMvLjEZUTRVKuHkrCglOy6gG53UUz2sl0/Xa3kx2WbItqXWbHc
 sbCGX3N+UiKaI+eQEL6re+IJfN3HdxQ/OSY0f4S+QYmYTL5tmyJOQZ4R246lGMLQCfzL
 hpQSiyAVqG5F4aZCrwN4qe8mOXTZye5wAy/0syJAPL+M7Kak/9Ul2pMtbQ6csogCWLTP
 v9ABNCfxM22RpB6QCyUPa6F+EdAL3I+BF35rk+x80h4Mh93sgLPAP510Hm/F5vgcjyQ/
 1y0FkEz6z3ZZ7dg4x9SiUhJQ3GcYKEDBaxNVeLb9E+xb0iiFBFUevOqXAywiHelVlCiQ
 f5dg==
X-Gm-Message-State: AOAM532tMWBcM/206t/weOiFhdDEuNcbZXZgPdSSAoRMiiv2YVAJYafx
 ir0PR2FnfNssAxPNNizB2MM=
X-Google-Smtp-Source: ABdhPJztl9nRde4lzAuYtu4CX141s6gX54JV5/6kEyyfZdeJ0MdEX75/PJ2HNz+J2n72tKd5aQ+Q+g==
X-Received: by 2002:adf:c44d:: with SMTP id a13mr17606294wrg.205.1593439210482; 
 Mon, 29 Jun 2020 07:00:10 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-233.amazon.com. [54.240.197.233])
 by smtp.gmail.com with ESMTPSA id m10sm28542727wru.4.2020.06.29.07.00.09
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 29 Jun 2020 07:00:10 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Andrew Cooper'" <andrew.cooper3@citrix.com>,
 "'Ian Jackson'" <ian.jackson@citrix.com>
References: <20200626170038.27650-1-andrew.cooper3@citrix.com>
 <24313.60895.220354.223207@mariner.uk.xensource.com>
 <9838e494-6372-a456-9ff6-95b2b8f7381f@citrix.com>
In-Reply-To: <9838e494-6372-a456-9ff6-95b2b8f7381f@citrix.com>
Subject: RE: [PATCH] tools/configure: drop BASH configure variable
Date: Mon, 29 Jun 2020 15:00:09 +0100
Message-ID: <000001d64e1d$9a0d4f70$ce27ee50$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQG/+PmFeHEa0PFXsi/qRsJidKaVMgG5Jh8tATM+KJ6pBOWfIA==
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: paul@xen.org
Cc: 'Xen-devel' <xen-devel@lists.xenproject.org>,
 'Daniel De Graaf' <dgdegra@tycho.nsa.gov>, 'Wei Liu' <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Andrew Cooper <andrew.cooper3@citrix.com>
> Sent: 29 June 2020 14:51
> To: Ian Jackson <ian.jackson@citrix.com>
> Cc: Xen-devel <xen-devel@lists.xenproject.org>; Wei Liu <wl@xen.org>; =
Daniel De Graaf
> <dgdegra@tycho.nsa.gov>; Paul Durrant <paul@xen.org>
> Subject: Re: [PATCH] tools/configure: drop BASH configure variable
>=20
> On 29/06/2020 14:34, Ian Jackson wrote:
> > Andrew Cooper writes ("[PATCH] tools/configure: drop BASH configure =
variable"):
> >> This is a weird variable to have in the first place.  The only user =
of it is
> >> XSM's CONFIG_SHELL, which opencodes a fallback to sh, and the only =
two scripts
> >> run with this are shebang sh anyway, so don't need bash in the =
first place.
> > Thanks for this cleanup.  I agree with the basic idea.
> >
> > However, did you run these scripts with dash, or review them, to =
check
> > for bashisms ?
>=20
> Yes, to all of the above.
>=20
> They are both very thin wrappers (doing some argument shuffling) =
around
> large AWK scripts.
>=20
> >> Make the mkflask.sh and mkaccess_vector.sh scripts executable, drop =
the
> >> CONFIG_SHELL, and drop the $BASH variable to prevent further use.
> > Since the build currently uses bash for these, a more neutral change
> > would be to change to #!/bin/bash at the same time.
>=20
> That will break FreeBSD, which has no `bash` in sight.
>=20
> >> RFC for 4.14.  This is a cleanup to the build system.
> > I see this already has a release-ack.  However, I would not have
> > recommended granting one at least on the basis of the description
> > above.
> >
> > I agree that this is cleanup.  But the current situation is not =
buggy.
> > I'm not sure exactly what the release criteria are but ISTM that =
this
> > patch adds risk to the release rather than removing it.
>=20
> I agree that the current state of play isn't a major issue, but having
> ./configure check for bash is buggy for both uses.
>=20

Even if it is not buggy, it is pointless complexity since FreeBSD would =
clearly have been broken all this time had there been bash-isms in the =
scripts.

  Paul

> ~Andrew


