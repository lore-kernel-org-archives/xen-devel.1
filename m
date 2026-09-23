Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FF35C9830B
	for <xen-devel@archiver.kernel.org>; Wed, 23 Sep 2026 15:39:13 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1430930.1653341 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9P3l-0002xR-KH; Wed, 23 Sep 2026 15:39:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1430930.1653341; Wed, 23 Sep 2026 15:39:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9P3l-0002xK-HX; Wed, 23 Sep 2026 15:39:01 +0000
Received: by outflank-mailman (input) for mailman id 1430930;
 Wed, 23 Sep 2026 15:39:00 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <benjamin@edera.dev>) id 1x9P3k-0002xE-23
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 15:39:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9P3i-002Jys-K5
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 17:38:58 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <benjamin@edera.dev>)
 id 6ab3f28d-bab6-0a2a0a5309dd-0a2a450add32-14
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 17:38:58 +0200
Received: from [74.125.224.141] (helo=mail-yx2-f13.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <benjamin@edera.dev>)
 id 6ab3f291-f2d2-0a2a450a0019-4a7de08d93b9-3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 17:38:58 +0200
Received: by mail-yx2-f13.google.com with SMTP id
 00721157ae682-85d45ae011cso15005597b3.2
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 08:38:57 -0700 (PDT)
Received: from StolidWingnut ([174.80.170.224])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-8a4658c6fb5sm11286887b3.9.2026.09.23.08.38.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2026 08:38:55 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=edera.io header.i="@edera.io" header.h="Content-Transfer-Encoding:Content-Disposition:Content-Type:MIME-Version:Message-ID:Date:User-Agent:References:In-Reply-To:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=edera.io; s=google; t=1790177936; x=1790782736; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZOLyK+qFZl9rWYm51bMfdAhWNgi1+EugiYkehWERzhU=;
        b=Vx5ZGzJui80+XzcKVWgl89mH6Th6Dw69LxrlKA507nzi/d23MhsDsWNCTULwqv0cBG
         9OlIhNRDc/idauPAITuIMmeMgY9bDdkiwUc64JcXWU1AYW8toIk3gaVuxZLwOs7LEc7d
         XJFNxMLLZAd9Rk9tB5Ov/3g2wsarRrjAYUMkAzL5K8mih2kunrmmVL7QYicgEdhO0HLh
         jyoW3XYc/tSe/gAg2aZVCOYyB5zOmJJLZb/VzxoyH31s6iT/qloMtlTfoLd+XbXJv4ZA
         /vkQBKEIKDSbs/0h24IBWHe2gAy0yevbjx4DooQqlWAlZZAT54MntVni9FnI3yEfxH6i
         N67w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790177936; x=1790782736;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZOLyK+qFZl9rWYm51bMfdAhWNgi1+EugiYkehWERzhU=;
        b=Fv/38WhmQjywDvHgXvty2FVLUc4OaLy3P6hhifbZgrEzLH2Nvj1ZW+1ZjpzEZIFl5X
         uCFHOzy8RfH+GFFFCO9BQA7yCKUpYUWJpyas60ZGTs/uh2smWvn0wrWpOXD5DQ9lfP06
         lUSEQGfkd+i/mHuz3HRQyWwWz9kdEw6wMgcShdIaotwRk3DgrFJb4rhBSceB+sLadbbz
         INvl2rT9Xj/njnNZAyRQAEANpsuP7hPXe4p6OiTywnymk5+D9JsXMwsJq/LZn0MQ3TYE
         PSE8eDuQubgoIto7TMjruWZwb6v71dTwQ5YOQ6OQ0WaOPidUBuvSxMuKB789S3HZS0UH
         2JAw==
X-Forwarded-Encrypted: i=1; AKwUvBzaTiLHm0V/UIGZqPtFWgAFHw3iDGzlkIDPaTEQZ2/+uDWsWgHdu0A3b0K6kwtVSkyoGAihEO8a+oo=@lists.xenproject.org
X-Gm-Message-State: AFuF++nMkaYyJvxABo1xFtbLAD6qwI3ZziFt8WPV3zxOYG8uD4j0XBBy
	akOHQCV8sdypL1brwG2GXvZrocKPXA8fAH1uEXW1ojbrso4evNs+/2mJavnQ9boH+8K0ROsCs4/
	aa54Hg0c=
X-Gm-Gg: AYBFou0UQw4SMxazxyDePN7vK7E1xhMBtX8+LiqQaujPpxuloN9WMuEHk1oy90jPrfu
	TxbYHg5zslyjS+G7lXOzzQnwD0pKnpbCktraycbssFIgXJe2rOvVINxI6mLI/tgZ61OqtDmqMsN
	UdxTqpmVsTswaDNIlaTEW4LnroRJ/Hn/UlE8uWOqfMPkQgiGb4R1Zf6pq8BnFLuUrAfz/a/rv1l
	idcApB+UxZO6MdS5+/dTOb71+1lHswronIFTIyxb43YBMg731fkBkXcFimz2sMpVmW1NGBGoKgy
	FPuH+uDZE/drQuRucsWc3k9AyCOyUyf9cZNMFLWDkVA+ujIVklI/RsGjxEaSI9aaVxNb1fc5CFH
	wyH36FObXXYMivBpm579Pib9klfIGFCgwJqiPW88lvnEeZhRxt4h9LH9RtACIGdKEUEi7HeWJbJ
	2LtzuJ6lA/5I/huXPr8uEKoArsmbihH4Ii71cpuQJDTrMziH4ElFHjMqDJLsBv3Po4uD5TbWRhD
	d5gvryFC1w5HppoCtoahc8DMwYswG1npQcxtSkn+ZG1rns+CCOO2xc=
X-Received: by 2002:a05:690c:e205:10b0:873:3f2:c16d with SMTP id 00721157ae682-8a458c26438mr11471797b3.21.1790177936474;
        Wed, 23 Sep 2026 08:38:56 -0700 (PDT)
From: Benjamin Leggett <benjamin@edera.io>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,  Anthony PERARD
 <anthony.perard@vates.tech>,  Michal Orzel <michal.orzel@amd.com>,  Julien
 Grall <julien@xen.org>,  Roger Pau =?utf-8?Q?Monn=C3=A9?=
 <roger@xenproject.org>,  Stefano
 Stabellini <sstabellini@kernel.org>,  xen-devel@lists.xenproject.org
Subject: Re: [PATCH] ns16550: find the console UART on PCI when there is no
 legacy one
In-Reply-To: <1f2eb0d2-5208-40e4-bcd1-55df6ebfc2e3@suse.com>
References: <20260922184316.324817-1-benjamin@edera.io>
	<1f2eb0d2-5208-40e4-bcd1-55df6ebfc2e3@suse.com>
User-Agent: mu4e 1.12.12; emacs 32.0.50
Date: Wed, 23 Sep 2026 11:38:54 -0400
Message-ID: <87zex8j7u9.fsf@edera.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-4011c0/1790177938-512C8CFC-D6C95F3D/0/0
X-purgate-type: clean
X-purgate-size: 1144

Jan Beulich <jbeulich@suse.com> writes:

> Is there a spec that you could point to here?

Unfortunately not really, just an upstream Linux commit from 2017 (<https:/=
/git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=3D3b=
fd1300abfe3adb18e84a89d97a0e82a22124bb>
), and the fact that I=E2=80=99ve tested it on EC2 bare metal boxes. The ba=
re metal
boxes are being phased out, but people still use them.

> This needs to be split to a separate patch, and not only because right
> now you=E2=80=99re doing two entirely unrelated things in a single change=
. The
> addition of the Amazon device is likely uncontroversial, so presumably
> can go in quickly.

Yes, agreed. I will split and separately submit them.

> Doing a scan when none was asked for, otoh, is
> potentially problematic: What if there=E2=80=99s an issue during scanning=
? With
> not having any output set up yet, we couldn=E2=80=99t even indicate the p=
roblem,
> and a possible crash would also go entirely silently.

Yep, thanks. I will see if I can address these with a different version of
the autoscan patch as a followup.

