Return-Path: <SRS0=URyG=6M=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08DA4C83009
	for <xen-devel@archiver.kernel.org>; Tue, 28 Apr 2020 12:47:52 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D18B1206D6
	for <xen-devel@archiver.kernel.org>; Tue, 28 Apr 2020 12:47:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aFDLNzyH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D18B1206D6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTPeF-0004q9-C9; Tue, 28 Apr 2020 12:47:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xCBN=6M=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jTPeE-0004q3-W9
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2020 12:47:39 +0000
X-Inumbo-ID: 7085517c-894e-11ea-9887-bc764e2007e4
Received: from mail-wr1-x42c.google.com (unknown [2a00:1450:4864:20::42c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7085517c-894e-11ea-9887-bc764e2007e4;
 Tue, 28 Apr 2020 12:47:38 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id t14so24464179wrw.12
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2020 05:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=ErEIyyQ3V6iE5U/AwpRS3bONjYKSX3eqDWb2d89ylxw=;
 b=aFDLNzyHZomn8Opz5BPVWSnjkaJlxp+Jyu/sfIQVpAkGWPYIMBAig+lyl68dlOzb72
 1nS1wMayIESUT4CIoh0YdRi7wlpi9yG6sezRAeSeRWahjLNs3rC/Ki42UCXzIPWLJUNs
 j3p+ULk5n6m1O3dNtif4Rsw/zEC+hM1qemKCFU1f9FWDpWx4sCPakUKwI0iWaoSdfmUK
 mu7NgrYvancBJ0lkAGFNfB1vOfoa3FiWgGHDhucuNdkQJWlcztQSKh6Ual2Q33ZQ1mYt
 /crfBjKybFJZPIHcJRl/lfWrc1UzV6ENnWacYY/S6ibCiPQ7ZS51bX8hYNI76jBJ/Xhx
 zl+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=ErEIyyQ3V6iE5U/AwpRS3bONjYKSX3eqDWb2d89ylxw=;
 b=c6sl59PL3eNZfIhuyX15y6dpCaF5dk3AFAB1bxb7tbzd2wPKb6eGbUGwU2G0EcBE6/
 qQbm1vkTRfBX9quvg5pqUxWzsunzl6SOYkTidbDV05dkNjYUkDUjZdddRzATTeQzwKOU
 h3ADVrclzodNmIGiZ0KWdv660Kaq6rs/rCCls7pkYDuCtEvoW1mqILwyl18/MVtCr4F2
 5FAGaqfLupMDlln8C6Q0rBHnsuMjJFOJG6VrMwHZcUU97eH5Pr2oJMzED8UxwcCM+z+u
 ivjwUVXH2c0Ex767npaC2JNeqvKlXuaTQXkSR7GkhkMBYfrBngB0kcSvNeBanDyxX5B4
 Zn1g==
X-Gm-Message-State: AGi0PuYsxNzWRk/g19xvwVzg0qCgH3mis2WxVDZO7dEDHtcv7KRFwjK7
 JILgTRtohOenA+e+41U4KuC7tuF5qkQ=
X-Google-Smtp-Source: APiQypJwaDPzJSwNiojSVsXMNm1mIEx5K60/rDf4rOOVASKHNckbaXYfreQdnSiGIrVEUa7lzBKiMg==
X-Received: by 2002:adf:cd12:: with SMTP id w18mr33524978wrm.177.1588078057315; 
 Tue, 28 Apr 2020 05:47:37 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.186])
 by smtp.gmail.com with ESMTPSA id a10sm14694519wrg.32.2020.04.28.05.47.35
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 28 Apr 2020 05:47:36 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Julien Grall'" <julien@xen.org>,
	<xen-devel@lists.xenproject.org>
References: <20200427155035.668-1-paul@xen.org>
 <7ab25832-66e6-020f-b343-059f21771054@xen.org>
In-Reply-To: <7ab25832-66e6-020f-b343-059f21771054@xen.org>
Subject: RE: [PATCH v4] docs/designs: re-work the xenstore migration
 document...
Date: Tue, 28 Apr 2020 13:47:35 +0100
Message-ID: <000d01d61d5b$31b6c7a0$952456e0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQHlntLxHS5TXNWYohOpoPk3VAlj7gIKOtGYqF8j1wA=
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
Cc: 'Juergen Gross' <jgross@suse.com>,
 'Stefano Stabellini' <sstabellini@kernel.org>, 'Wei Liu' <wl@xen.org>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Paul Durrant' <pdurrant@amazon.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>, 'Jan Beulich' <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Julien Grall <julien@xen.org>
> Sent: 28 April 2020 10:06
> To: Paul Durrant <paul@xen.org>; xen-devel@lists.xenproject.org
> Cc: Paul Durrant <pdurrant@amazon.com>; Juergen Gross <jgross@suse.com>; Andrew Cooper
> <andrew.cooper3@citrix.com>; George Dunlap <george.dunlap@citrix.com>; Ian Jackson
> <ian.jackson@eu.citrix.com>; Jan Beulich <jbeulich@suse.com>; Stefano Stabellini
> <sstabellini@kernel.org>; Wei Liu <wl@xen.org>
> Subject: Re: [PATCH v4] docs/designs: re-work the xenstore migration document...
> 
> Hi Paul,
> 
> On 27/04/2020 16:50, Paul Durrant wrote:
> > diff --git a/docs/designs/xenstore-migration.md b/docs/designs/xenstore-migration.md
> > index 6ab351e8fe..51d8b85171 100644
> > --- a/docs/designs/xenstore-migration.md
> > +++ b/docs/designs/xenstore-migration.md
> > @@ -3,254 +3,400 @@
> >   ## Background
> >
> >   The design for *Non-Cooperative Migration of Guests*[1] explains that extra
> > -save records are required in the migrations stream to allow a guest running
> > -PV drivers to be migrated without its co-operation. Moreover the save
> > -records must include details of registered xenstore watches as well as
> > -content; information that cannot currently be recovered from `xenstored`,
> > -and hence some extension to the xenstore protocol[2] will also be required.
> > -
> > -The *libxenlight Domain Image Format* specification[3] already defines a
> > -record type `EMULATOR_XENSTORE_DATA` but this is not suitable for
> > -transferring xenstore data pertaining to the domain directly as it is
> > -specified such that keys are relative to the path
> > -`/local/domain/$dm_domid/device-model/$domid`. Thus it is necessary to
> > -define at least one new save record type.
> > +save records are required in the migrations stream to allow a guest running PV
> > +drivers to be migrated without its co-operation. Moreover the save records must
> > +include details of registered xenstore watches as well ascontent; information
> 
> s/ascontent/as content/
> 

Oh yes.

> [...]
> 
> > +### END
> > +
> > +The end record marks the end of the image, and is the final record
> > +in the stream.
> >
> >   ```
> > -    0       1       2       3     octet
> > -+-------+-------+-------+-------+
> > -| NODE_DATA                     |
> > -+-------------------------------+
> > -| path length                   |
> > -+-------------------------------+
> > -| path data                     |
> > -...
> > -| pad (0 to 3 octets)           |
> > -+-------------------------------+
> > -| perm count (N)                |
> > -+-------------------------------+
> > -| perm0                         |
> > -+-------------------------------+
> > -...
> > -+-------------------------------+
> > -| permN                         |
> > -+-------------------------------+
> > -| value length                  |
> > -+-------------------------------+
> > -| value data                    |
> > -...
> > -| pad (0 to 3 octets)           |
> > -+-------------------------------+
> > +    0       1       2       3       4       5       6       7    octet
> > ++-------+-------+-------+-------+-------+-------+-------+-------+
> >   ```
> >
> > -where perm0..N are formatted as follows:
> >
> > +The end record contains no fields; its body length is 0.
> > +
> > +\pagebreak
> > +
> > +### GLOBAL_DATA
> > +
> > +This record is only relevant for live update. It contains details of global
> > +xenstored state that needs to be restored.
> 
> Reading this paragraph, it sounds like GLOBAL_DATA should always be
> present in the liveupdate stream. However ...
> 
> [...]
> 
> > -path length and value length are specified in octets (excluding the NUL
> > -terminator of the path). perm should be one of the ASCII values `w`, `r`,
> > -`b` or `n` as described in [2]. All pad values should be 0.
> > -All paths should be absolute (i.e. start with `/`) and as described in
> > -[2].
> > +| Field          | Description                                  |
> > +|----------------|----------------------------------------------|
> > +| `rw-socket-fd` | The file descriptor of the socket accepting  |
> > +|                | read-write connections                       |
> > +|                |                                              |
> > +| `ro-socket-fd` | The file descriptor of the socket accepting  |
> > +|                | read-only connections                        |
> >
> > +xenstored will resume in the original process context. Hence `rw-socket-fd` and
> > +`ro-socket-fd` simply specify the file descriptors of the sockets.
> 
> ... sockets may not always be available in XenStored. So should we
> reserve a value for "not in-use socket"?
> 

Ok.

> [...]
> 
> > -wpath length and token length are specified in octets (excluding the NUL
> > -terminator). The wpath should be as described for the `WATCH` operation in
> > -[2]. The token is an arbitrary string of octets not containing any NUL
> > -values.
> >
> > +| Field       | Description                                     |
> > +|-------------|-------------------------------------------------|
> > +| `conn-id`   | A non-zero number used to identify this         |
> > +|             | connection in subsequent connection-specific    |
> > +|             | records                                         |
> > +|             |                                                 |
> > +| `conn-type` | 0x0000: shared ring                             |
> > +|             | 0x0001: socket                                  |
> 
> I would write "0x0002 - 0xFFFF: reserved for future use" to match the
> rest of the specification.
> 

Ok.

  Paul



