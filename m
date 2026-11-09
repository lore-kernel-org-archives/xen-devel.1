Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A275606A339
	for <xen-devel@archiver.kernel.org>; Mon,  9 Nov 2026 11:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fAMzudZ0
Received: from list by lists.xenproject.org with outflank-mailman.1479915.1683820 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQNhn-0004Eq-2T; Mon, 09 Nov 2026 11:38:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1479915.1683820; Mon, 09 Nov 2026 11:38:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQNhm-0004Ej-Vx; Mon, 09 Nov 2026 11:38:30 +0000
Received: by outflank-mailman (input) for mailman id 1479915;
 Mon, 09 Nov 2026 11:38:29 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xQNhl-0004EQ-Lp
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 11:38:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQNhl-007Cen-2T
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 12:38:29 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6af1b0aa-2eae-0a2a0a5409dd-0a2a4503ed36-44
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 12:38:28 +0100
Received: from [209.85.208.177] (helo=mail-lj1-f177.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6af1b0b4-fae8-0a2a45030019-d155d0b1b0cd-3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 12:38:28 +0100
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-3ace304021eso6469211fa.2
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 03:38:28 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1794224308; cv=none;
        d=google.com; s=arc-20260327;
        b=GbGK+oDRtdJ+1vPG07R3074Um72HE0dZl76r3eDHqxo5mij9LGucbSmYg+K7mJdL80
         5yupvEs6zjRc65iamhwo5np5xwFYgl/RMThoVNqBNp1BGqq0zxEBtEUisDJWqKuGhCNn
         8NSQpZpph/7jBa7ZX1pQP1M343FMLrmJztuJhm/LM0cN4MubHbGZLvh2PdwPImLaaUdS
         Gs2o5+JrAHPM+RNaiHTBXW/S4wZsgFWKDmNl3FoJwxXIlctazFmg0qfYoYYqEgdSmBEw
         4xBwATKnM9dVYBRnYq2J/DtGCm3PmWDti8D66y9XjD23UcZ2LWcsvOckWJSNAMMO4zzP
         2nxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sLJ0xQ2H2oUZAxE0i0Djcbh0RdCztIeWeMhcv3iqtVY=;
        fh=Mv3hG8hx3DTeEik7nXu79ZB59syOS+U84gOHQLKxW4g=;
        b=p1HSY7dD4Is8H8hM4/mmTbWhT7iAKdCbPPUBBIutHiwKjcdHw4MUfRrOvz+idKWNEl
         3A1EZB63EMTg60xi0FVwBFPI3pg9Xm3Ff91GhpWZOs6hpkNyLJBqhnNr3w5lo+y64k6h
         04yRkwM7U+nFo8GJ1ajS8tlXz+aYlgXgl97yErduj0vjZOMWAltRKqapFcz7mWLizGIU
         FKaFw8t03xFP+d/jgm6p+mM9mJs1KpV10/YEBrhaWG/5yRMkQNeBK6i6lCFv9LRhzzjx
         yXbrvcFmMIJDfeLmx5iLwNu+m+wei5gQS5LzfEgEQ3el8sHZhRlOp37ksUFMIfaGk/mZ
         aMrA==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794224308; x=1794829108; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sLJ0xQ2H2oUZAxE0i0Djcbh0RdCztIeWeMhcv3iqtVY=;
        b=fAMzudZ0f3rbE1mESfvnpuPCiE9m5L00A/ZvEPja+9DrMa86dcRODCyDzUS4S5Jikt
         iUGBCHeRrwLpe4edspyYZ0GuL8WrsPjrLRYKHd0d4bO1Bgtvrub4Cz2XVSzxsY25O47s
         i5E1xyoDWUO9gQsB4bYlH4nqB8VahRKq+HpST/E4q7qUjro8/sr+zSX3wL+N74c+kpx7
         DHVG8eFku+vGca83vCH6kB16Nm+03+/6bL1MkaNW06F9zPll7kg1cKCH/zusBBghavv7
         fLstCxAqUlhCT7qVoSKYlMjrjsdi8QPd3e6slRMZzmO3/1ohisKI/AQcxYcQmF3KD2wr
         ppiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794224308; x=1794829108;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sLJ0xQ2H2oUZAxE0i0Djcbh0RdCztIeWeMhcv3iqtVY=;
        b=my2d38P2qjtrw+3+3PNcDga4TNQK9lieAcdJLh/fsrB/el/CFjHk6oEp11gwdgKTv/
         u/uk/+tCAELw/bL/X3zduWvbxrzyvpX0KiY8RMLCY6fcX3VRGUh7hf5IJoyUUXugB0fP
         GEZ2J6DQS2DJ40+RuZ9GwuCJmzJW/QNmGM7MLVaqeE371FRZHVz0LQAqic7veM153vJp
         Uw8rH2NFBJG0atIc2JOLBz2l21Mns0toM5foAsdDmds1on6N/dT5Cw5hCEjlHbMC2Fcu
         5utcD69/NLID1nT7rkpRNFcm5GtzUw6/jt3bo6uVy1pJjEPR649HIu02C/27SCfhBVFC
         dF5Q==
X-Forwarded-Encrypted: i=1; AL+hErG5sstV9VtOuL01a15HfBhNE3UvbdtL5tMFXBnx4gJbqp6WOmHcpY05JCR8Z9oIUpP+RH7BVJ5QKPA=@lists.xenproject.org
X-Gm-Message-State: APuU4Z/wVzuFlCFMug+CypwffSpi9cxnF2kC9GJ76P1O61KQuJR0LmYx
	xH8FZvnJlYM2RBqraVEzWJx8j/ivs1HRzMqtzrpo+VApqxFhd7HFOAVVDtJzpaa8vrJU9EXKkSl
	3T1ZAWuckWDpTZqZGHLqeGSz+eymLWnc=
X-Gm-Gg: AYBFou081jphBhT7ogZ8/sn0K1aKaOG2y15Qx/OVmtmnw5xy9Q6IlD/c4nFE7UfG2a4
	UfVZfSKNgCHtfF1e7nBk4ziktXUtRpvfC/LJ9n0ixOzg9cZwiOcLt5mjP9nYqrpCtrVWBOyO2ob
	+CMzxz+lwG9QX6YVp2+DtWVU7nebIwvgYKgG10tVE3HtLVQW0ENtyBtHNCvHWeRy3bAbSXNK6Y8
	yasT92g7106XPDsn2igMevF4+sBG1EQ9SEz27CLMAU/hJU2Dc0359LGAMyYb3x/k0LzLPTVYM23
	F06tRL3omRSpz5Kmrbx2lUMCJo9yFor7115U1z1nmQJ4PSP3oQsYTgHcncfa1gEhFbnBS16h4Sd
	nELTamkEhatDFTUA+5A3R9w7cpwgEpyG/Ug==
X-Received: by 2002:a05:651c:505:b0:3ad:6e95:50d6 with SMTP id
 38308e7fff4ca-3adfa4567damr6988111fa.15.1794224308146; Mon, 09 Nov 2026
 03:38:28 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <cover.1791384310.git.mykola_kvach@epam.com> <2f41315f-b533-471e-9f88-57f6eae384ec@suse.com>
In-Reply-To: <2f41315f-b533-471e-9f88-57f6eae384ec@suse.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Mon, 9 Nov 2026 13:38:17 +0200
X-Gm-Features: AclHuK9lFtiaFqGFjc3lrlLAqhyOEyxMMEfVRfYP9waKJiTI7yfIGVbLhpOSLfA
Message-ID: <CAGeoDV8g9z0Ys-T_9K4JqpCcwn=tiFZCwFX3X6J6Ry+GpD0kzw@mail.gmail.com>
Subject: Re: [PATCH 0/2] tools/symbols: fix oversized names and token expansion
To: Jan Beulich <jbeulich@suse.com>
Cc: Mykola Kvach <mykola_kvach@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, 
	Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-33051d/1794224308-764FC4E9-E0BB02F4/10/78276251493
X-purgate-type: spam
X-purgate-size: 4413
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Jan,

Thank you for the review.
Sorry for the late reply.

On Thu, Oct 8, 2026 at 10:35=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 07.10.2026 20:11, Mykola Kvach wrote:
> > Patch 1 fixes the first bug. In SYSV input, local symbols are prefixed
> > with the source file name ("filename#symbol"). A long absolute build
> > path can therefore create a name longer than 127 bytes, even when the
> > symbol itself is short. A debug Xen build on an Orange Pi 5 (RK3588S)
> > crashed during the boot self-tests: symbols_lookup_by_name() expanded
> > such a name into its 128-byte buffer and overwrote the saved frame
> > pointer and return address. The patch rejects retained names longer tha=
n
> > KSYM_NAME_LEN during the build and prints the offending name.
> > Readable --xensyms maps are not restricted. Nothing changes for names
> > of at most 127 bytes.
> >
> > A build from a long absolute source path can now fail at link time.
>
> This isn't acceptable imo. Omitting such a symbol is a far less severe
> action (see below for another option).
>
> As a more general remark: We've inherited this tool from Linux. Any
> issues we find want cross checking there. If fixed there, taking their
> change is often preferable over making our own. To cover overly long
> symbols names, they have a check in read_symbol(). As we add the
> filename for static symbols there as well, I don't see why we couldn't
> similarly have the check there.

Agreed. v2 will report the name and skip the symbol, as Linux does,
and the check is in read_symbol().

>
> Furthermore, if the main issue is with long filenames, for static
> symbols an option would be to replace the filename prefix with some
> surrogate (either a shortened form of the path, or something like
> "...#").

I'd prefer to skip the symbol here. A surrogate such as "...#" makes
different static symbols look the same, and --error-dup can then fail
in livepatch builds.

>
> Yet further, the problem of (long or not) absolute path names is to
> be solved differently anyway. Not just for reproducible builds we want
> to omit them altogether. There are two separate proposals [1], [2];
> what's missing is a decision which way to go. (Both are pending a
> resubmission, yet perhaps not just me but also Marek is hesitant to
> do so when the decision which route to go is still pending.)

Agreed, both proposals address the absolute-path problem.
In my arm64 assembly test, both remove the absolute path from
the file symbol. With -fdebug-prefix-map alone, the path stays.

>
> > On x86, in-tree builds use relative paths and are not affected. An
> > out-of-tree build with the default config fails if the absolute path of
> > xen/ is longer than 78 bytes; the longest such name is
> > kexec_reloc.S#compatibility_mode.
> >
> > Patch 2 fixes the second bug. In the compressed stream, each symbol is
> > stored as [type][name]. A compression token can therefore expand to
> > the type byte plus a full 127-byte name (128 bytes), and write_src()
> > adds a terminating NUL. Its local buffer was 128 bytes, one byte too
> > small. The patch allocates KSYM_NAME_LEN + 2 bytes (type + name +
> > NUL). This bug can trigger with fully valid names, but only with a very
> > small symbol table; real symbol tables do not hit it. The new size
> > relies on the name limit from patch 1.
>
> Linux'es write_src() doesn't even add 1 to KSYM_NAME_LEN. The +1 there
> went away in 2.6.23, commit 9281acea6a36 ("kallsyms: make KSYM_NAME_LEN
> include space for trailing '\0'"). (Later KSYM_NAME_LEN was bumped to
> 512, btw.) Might we not want to follow that approach? (There then still
> looks to be an off-by-one due to the type that's being prefixed to all
> symbols. If that's indeed the case, a patch may want sending also for
> Linux.)

Yes. v2 will make KSYM_NAME_LEN include the trailing NUL.
Names are still limited to 127 bytes. The token buffer has
one extra byte for the type.

I also reproduced the overflow in Linux 7.4-rc2 with ASan.
Expanding the type, a 511-byte name and the NUL needs 513 bytes,
but the buffer has 512. I have not prepared a Linux patch.

Best regards,
Mykola



>
> Jan
>
> [1] https://lists.xen.org/archives/html/xen-devel/2025-09/msg00311.html
> [2] https://lists.xen.org/archives/html/xen-devel/2025-09/msg00362.html
>

