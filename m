Return-Path: <SRS0=+ST8=CG=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCA9EC433E6
	for <xen-devel@archiver.kernel.org>; Fri, 28 Aug 2020 11:09:01 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C41A207DF
	for <xen-devel@archiver.kernel.org>; Fri, 28 Aug 2020 11:09:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bawoz8YN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C41A207DF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBcFV-0007kL-LW; Fri, 28 Aug 2020 11:08:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v2Rs=CG=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kBcFU-0007kG-9u
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2020 11:08:48 +0000
X-Inumbo-ID: 55d92e4c-be68-41a9-8a30-74f43c02593a
Received: from mail-wm1-x330.google.com (unknown [2a00:1450:4864:20::330])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 55d92e4c-be68-41a9-8a30-74f43c02593a;
 Fri, 28 Aug 2020 11:08:47 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id u18so555832wmc.3
 for <xen-devel@lists.xenproject.org>; Fri, 28 Aug 2020 04:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=PTT0e/4SUbUs7Gw1742rMl3btt84EynYaC88jLgtr+c=;
 b=bawoz8YN/+rZzBVbNIXbXSjWNAzzmgomBScEybnNL34zThLCsvhCkNTVUhi483kXOI
 p44Fz/YNJ1gkHAlPjtupN8JbhJNt9vKE5L4SJ6o4AJOE4gxxbnBl9CxLG2hYRFOjAlNb
 VrRky3zei0n2ZAI2QmXNM5HjrIjkWPbRFR0NcJ8xXdkjwdb5XXwHEON/bxG6Em8+V2q4
 nRlfoPMjV3rzJzJLyKzJ0Ut+lcg6PtS01eZOastMwwghS/SLo0fqREQh5XSAoCCluxBi
 wSU6UdDDb4jRDVi6tf8Ngr6qVq1pHCiGDxTTEWmXJz/pCJ7lub6QOZ4ZNa0JlcZBBvkr
 sHig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=PTT0e/4SUbUs7Gw1742rMl3btt84EynYaC88jLgtr+c=;
 b=XcROVbXKnpNb1F373d2wTxbJPqD7SUJaMJt78KUbRBjQ2+pmGjevxUFuyG7nv7ZJ65
 DlktTO2vjihhEm/zY4BFZW6brzWQwI5gcKAYwohK2vH3wafLMq+kXKK7pR+/x2+Er5t7
 yASoMbHSpqI2ru+gld7zlxAc+Abehg8CgiWyMY/P3QEWRJlwLhQ7QG5XM6ZDL/VSN0C0
 kuzCr1WGFfRX+hCW3yjSBp6nhaZRX1rcqMjRYtmTeO04IEQ69MAPbTW74IqqR0o4sBLU
 GVkAUuP/7harBc3YFY809vB85wdhH7H8fhGbvZIgr2BEjWJBcUAwWMaiJEo6aDB1GUjj
 DaZw==
X-Gm-Message-State: AOAM530lM6PM5GmjPzN54r3LJJO2myVdLesSowufG3WHRhV7q/7f+/uI
 9Akbe00CUJ1DYneKyqG4FJY=
X-Google-Smtp-Source: ABdhPJxCaLz7qnFsJPKqXbKs7+ds2/nxkWHIHNqL2Xht26avASgEWrXU2x2rrGzi/Nm8qwq4tNYa3Q==
X-Received: by 2002:a1c:2b04:: with SMTP id r4mr1061940wmr.76.1598612926586;
 Fri, 28 Aug 2020 04:08:46 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-224.amazon.com. [54.240.197.224])
 by smtp.gmail.com with ESMTPSA id d66sm1797461wmc.16.2020.08.28.04.08.45
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 28 Aug 2020 04:08:46 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>,
	"'Paul Durrant'" <paul@xen.org>
Cc: <xen-devel@lists.xenproject.org>,
 "'Ian Jackson'" <ian.jackson@eu.citrix.com>, "'Wei Liu'" <wl@xen.org>,
 "'Andrew Cooper'" <andrew.cooper3@citrix.com>,
 "'George Dunlap'" <george.dunlap@citrix.com>,
 "'Julien Grall'" <julien@xen.org>,
 "'Stefano Stabellini'" <sstabellini@kernel.org>,
 =?UTF-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>
References: <20200818103032.3050-1-paul@xen.org>
 <20200818103032.3050-9-paul@xen.org>
 <153634db-bd1a-62d8-f53f-2c4019ffda4c@suse.com>
In-Reply-To: <153634db-bd1a-62d8-f53f-2c4019ffda4c@suse.com>
Subject: RE: [EXTERNAL] [PATCH v7 8/9] x86/time: add a domain context record
 for tsc_info...
Date: Fri, 28 Aug 2020 12:08:44 +0100
Message-ID: <006401d67d2b$991e3dd0$cb5ab970$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQI3t7iXj66qvRdG8GCx2a1a4xz7XAJdPdyxAnABMAioZHzIIA==
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Jan Beulich <jbeulich@suse.com>
> Sent: 26 August 2020 15:03
> To: Paul Durrant <paul@xen.org>
> Cc: xen-devel@lists.xenproject.org; Durrant, Paul =
<pdurrant@amazon.co.uk>; Ian Jackson
> <ian.jackson@eu.citrix.com>; Wei Liu <wl@xen.org>; Andrew Cooper =
<andrew.cooper3@citrix.com>; George
> Dunlap <george.dunlap@citrix.com>; Julien Grall <julien@xen.org>; =
Stefano Stabellini
> <sstabellini@kernel.org>; Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> Subject: RE: [EXTERNAL] [PATCH v7 8/9] x86/time: add a domain context =
record for tsc_info...
>=20
> CAUTION: This email originated from outside of the organization. Do =
not click links or open
> attachments unless you can confirm the sender and know the content is =
safe.
>=20
>=20
>=20
> On 18.08.2020 12:30, Paul Durrant wrote:
> > --- a/xen/include/public/save.h
> > +++ b/xen/include/public/save.h
> > @@ -93,7 +93,18 @@ struct domain_shared_info_context {
> >
> >  DECLARE_DOMAIN_SAVE_TYPE(SHARED_INFO, 2, struct =
domain_shared_info_context);
> >
> > -#define DOMAIN_SAVE_CODE_MAX 2
> > +#if defined(__i386__) || defined(__x86_64__)
> > +struct domain_tsc_info_context {
> > +    uint32_t mode;
> > +    uint32_t incarnation;
> > +    uint64_t elapsed_nsec;
> > +    uint32_t khz;
> > +};
>=20
> sizeof() for this struct varies between 32-bit and 64-bit - is
> this not a problem? (alignof() varies too, but there I think
> it's indeed not a problem, albeit it could still be taken care
> of by using uint64_aligned_t, alongside the addition of an
> explicit padding field).

I don't think it should matter because domain context records have =
implicit padding to align up to the next 64-bit boundary, so as long as =
fields within the struct don't move (which I think is true in this case) =
then we should be ok.

  Paul

>=20
> Jan


