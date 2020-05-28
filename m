Return-Path: <SRS0=RRgd=7K=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 617DCC433DF
	for <xen-devel@archiver.kernel.org>; Thu, 28 May 2020 09:01:01 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 255BC2088E
	for <xen-devel@archiver.kernel.org>; Thu, 28 May 2020 09:01:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HfMmTVmu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 255BC2088E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jeEP0-0001mH-Rp; Thu, 28 May 2020 09:00:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=blJD=7K=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jeEOz-0001m8-Om
 for xen-devel@lists.xenproject.org; Thu, 28 May 2020 09:00:37 +0000
X-Inumbo-ID: b1f6809c-a0c1-11ea-8993-bc764e2007e4
Received: from mail-wr1-x436.google.com (unknown [2a00:1450:4864:20::436])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b1f6809c-a0c1-11ea-8993-bc764e2007e4;
 Thu, 28 May 2020 09:00:36 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id j16so14592758wrb.7
 for <xen-devel@lists.xenproject.org>; Thu, 28 May 2020 02:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=Ann0i1ys87ZqTaBslW/JT2uNUb3D+tfWBJuPQxro4MM=;
 b=HfMmTVmuFyk/U+MKSxjeypCVY+NHqduA5LikENxzOxgTOKtEEpunayQLjtLeF2WlFs
 xjMAR+nS2oAxR2O+jSO+/F4DSUnL/uwAxi0YEIJCfYdyhBV4Mi3v24KmZdf6g/ORnECV
 azs5k6VHxiu9ZjJyMXqxIeBDq4lEpI1/qocYj765NeuEwLCRoJpQxzlv3wzPH9FeH+G2
 BVxfJRiPGDe0gGlWfSaZp60gcZbmcVjWjlCAbyiWwdsnXEscBepgpXr+c0rYa+jUgjzK
 BJB9IbrQfX8EgnCotonY/ImYe9QZHZbTydPsgFPdW7zc+dJZ4vWJpfcew8grlTRJPfnd
 rH3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=Ann0i1ys87ZqTaBslW/JT2uNUb3D+tfWBJuPQxro4MM=;
 b=Lv70JbgWn4Kco8toDjtAVuRSzzFdFlOMzlsXDdQjldp722pGy+onNzxomGbmvxOG8W
 EnGfv/xakgIuIRGSZlirGN6BWheNk+Nc5Ik10/RNQv/E8pPiE2aJCqVtB/MxJ9gV4Cec
 Vg2xNKWEua0BqDoaMut17Kiuxg/jJT62aCuAnK57ylCwLCaEii9VjCLb9tbEa/ouawZJ
 mYrzrYd2Y/9pjSjNlmQ9Zga57tbVOWwZWgmoFk42B42hB7M0rRKbmr65PA3xyWqRXgkt
 GjRldGvkRiBuAg3Zl3PGGBi2uoa0tbSKe/2USsy0DJRJaaJgIGp4jhMk6T/XYPH/Es5e
 0VhA==
X-Gm-Message-State: AOAM532mcPgNYSEJtI/8lOX3hs0ET03dWfJM0ADCKIbq+ZLaGE52Z1oB
 pfQEtQyK05knoL75aUzHOxY=
X-Google-Smtp-Source: ABdhPJwSb2CiShWybYjkqToTC/yBGfAdj3vNS+H0VuDM4cY0yt/U36EA8jqXZl7N4+7n5n5aS6ChXg==
X-Received: by 2002:a5d:4745:: with SMTP id o5mr2401872wrs.87.1590656435864;
 Thu, 28 May 2020 02:00:35 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.186])
 by smtp.gmail.com with ESMTPSA id q4sm5850317wma.47.2020.05.28.02.00.34
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 28 May 2020 02:00:35 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: =?utf-8?Q?'J=C3=BCrgen_Gro=C3=9F'?= <jgross@suse.com>,
 <xen-devel@lists.xenproject.org>
References: <20200528082217.26057-1-jgross@suse.com>
 <00a001d634cd$7c9afb40$75d0f1c0$@xen.org>
 <ad448884-6705-9473-597c-10388b398972@suse.com>
In-Reply-To: <ad448884-6705-9473-597c-10388b398972@suse.com>
Subject: RE: [PATCH v2] docs: update xenstore-migration.md
Date: Thu, 28 May 2020 10:00:33 +0100
Message-ID: <00a501d634ce$7328cf50$597a6df0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQFP4uuOoU5NbpLVMW9x/VcR2g3NawL+UMOZAfDcPc+pol2EIA==
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
Cc: 'Stefano Stabellini' <sstabellini@kernel.org>,
 'Julien Grall' <julien@xen.org>, 'Wei Liu' <wl@xen.org>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>, 'Jan Beulich' <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: J=C3=BCrgen Gro=C3=9F <jgross@suse.com>
> Sent: 28 May 2020 09:59
> To: paul@xen.org; xen-devel@lists.xenproject.org
> Cc: 'Stefano Stabellini' <sstabellini@kernel.org>; 'Julien Grall' =
<julien@xen.org>; 'Wei Liu'
> <wl@xen.org>; 'Andrew Cooper' <andrew.cooper3@citrix.com>; 'Ian =
Jackson' <ian.jackson@eu.citrix.com>;
> 'George Dunlap' <george.dunlap@citrix.com>; 'Jan Beulich' =
<jbeulich@suse.com>
> Subject: Re: [PATCH v2] docs: update xenstore-migration.md
>=20
> On 28.05.20 10:53, Paul Durrant wrote:
> >> -----Original Message-----
> >> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf =
Of Juergen Gross
> >> Sent: 28 May 2020 09:22
> >> To: xen-devel@lists.xenproject.org
> >> Cc: Juergen Gross <jgross@suse.com>; Stefano Stabellini =
<sstabellini@kernel.org>; Julien Grall
> >> <julien@xen.org>; Wei Liu <wl@xen.org>; Andrew Cooper =
<andrew.cooper3@citrix.com>; Ian Jackson
> >> <ian.jackson@eu.citrix.com>; George Dunlap =
<george.dunlap@citrix.com>; Jan Beulich
> <jbeulich@suse.com>
> >> Subject: [PATCH v2] docs: update xenstore-migration.md
> >>
> >> Update connection record details: make flags common for sockets and
> >> domains, and add pending incoming data.
> >>
> >> Signed-off-by: Juergen Gross <jgross@suse.com>
> >> ---
> >> V2:
> >> - added out-resp-len to connection record
> >> ---
> >>   docs/designs/xenstore-migration.md | 71 =
+++++++++++++++++-------------
> >>   1 file changed, 40 insertions(+), 31 deletions(-)
> >>
> >> diff --git a/docs/designs/xenstore-migration.md =
b/docs/designs/xenstore-migration.md
> >> index 34a2afd17e..5736bbad94 100644
> >> --- a/docs/designs/xenstore-migration.md
> >> +++ b/docs/designs/xenstore-migration.md
> >> @@ -147,43 +147,59 @@ the domain being migrated.
> >>   ```
> >>       0       1       2       3       4       5       6       7    =
octet
> >>   +-------+-------+-------+-------+-------+-------+-------+-------+
> >> -| conn-id                       | conn-type     | conn-spec
> >> +| conn-id                       | conn-type     | flags         |
> >> ++-------------------------------+---------------+---------------+
> >> +| conn-spec
> >>   ...
> >> -+-------------------------------+-------------------------------+
> >> -| data-len                      | data
> >> -+-------------------------------+
> >> ++---------------+---------------+-------------------------------+
> >> +| in-data-len   | out-resp-len  | out-data-len                  |
> >> ++---------------+---------------+-------------------------------+
> >> +| data
> >>   ...
> >>   ```
> >>
> >>
> >> -| Field       | Description                                     |
> >> -|-------------|-------------------------------------------------|
> >> -| `conn-id`   | A non-zero number used to identify this         |
> >> -|             | connection in subsequent connection-specific    |
> >> -|             | records                                         |
> >> -|             |                                                 |
> >> -| `conn-type` | 0x0000: shared ring                             |
> >> -|             | 0x0001: socket                                  |
> >> -|             | 0x0002 - 0xFFFF: reserved for future use        |
> >> -|             |                                                 |
> >> -| `conn-spec` | See below                                       |
> >> -|             |                                                 |
> >> -| `data-len`  | The length (in octets) of any pending data not  |
> >> -|             | yet written to the connection                   |
> >> -|             |                                                 |
> >> -| `data`      | Pending data (may be empty)                     |
> >> +| Field          | Description                                  |
> >> +|----------------|----------------------------------------------|
> >> +| `conn-id`      | A non-zero number used to identify this      |
> >> +|                | connection in subsequent connection-specific |
> >> +|                | records                                      |
> >> +|                |                                              |
> >> +| `flags`        | A bit-wise OR of:                            |
> >> +|                | 0001: read-only                              |
> >> +|                |                                              |
> >> +| `conn-type`    | 0x0000: shared ring                          |
> >> +|                | 0x0001: socket                               |
> >> +|                | 0x0002 - 0xFFFF: reserved for future use     |
> >> +|                |                                              |
> >
> > Agreed with Julien... the above two would be better swapped to match =
the order of the fields in the
> record.
>=20
> Yes.
>=20
> >
> >> +| `conn-spec`    | See below                                    |
> >> +|                |                                              |
> >> +| `in-data-len`  | The length (in octets) of any data read      |
> >> +|                | from the connection not yet processed        |
> >> +|                |                                              |
> >> +| `out-resp-len` | The length (in octets) of a partial response |
> >> +|                | not yet written to the connection (included  |
> >> +|                | in the following `out-data-len`)             |
> >> +|                |                                              |
> >> +| `out-data-len` | The length (in octets) of any pending data   |
> >> +|                | not yet written to the connection            |
> >
> > So, IIUC out-data-len is inclusive of out-resp-len?
>=20
> Yes.
>=20
> >
> >> +|                |                                              |
> >> +| `data`         | Pending data, first read data, then written  |
> >> +|                | data (any of both may be empty)              |
> >
> > Perhaps be more explicit here:
> >
> > "Pending data: first in-data-len octets of read data, then =
out-data-len octets of written data"
>=20
> Okay.
>=20
> >
> >>
> >> -The format of `conn-spec` is dependent upon `conn-type`.
> >> +In case of live update the connection record for the connection =
via which
> >> +the live update command was issued will contain the response for =
the live
> >> +update command in the pending write data.
> >
> > s/write/written for consistency I think.
>=20
> I'll use "... in the pending not yet written data".
>=20

Ok.

  Paul

>=20
> Juergen


