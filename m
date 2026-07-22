Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FA40C4453A
	for <xen-devel@archiver.kernel.org>; Wed, 22 Jul 2026 19:42:38 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1368787.1617954 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wmcpg-00046f-W8; Wed, 22 Jul 2026 19:42:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1368787.1617954; Wed, 22 Jul 2026 19:42:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wmcpg-00046Y-Sj; Wed, 22 Jul 2026 19:42:20 +0000
Received: by outflank-mailman (input) for mailman id 1368787;
 Wed, 22 Jul 2026 19:42:19 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wmcpf-00046S-Ev
 for xen-devel@lists.xenproject.org; Wed, 22 Jul 2026 19:42:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wmcpd-001Y3z-2q
 for xen-devel@lists.xenproject.org; Wed, 22 Jul 2026 21:42:17 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a611d04-e002-0a2a0a5209dd-0a2a4508aa36-30
 for <xen-devel@lists.xenproject.org>; Wed, 22 Jul 2026 21:42:17 +0200
Received: from [209.85.128.180] (helo=mail-yw1-f180.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a611d17-f659-0a2a45080019-d15580b4dc01-3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Jul 2026 21:42:16 +0200
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-80e2cfe6918so76791037b3.0
 for <xen-devel@lists.xenproject.org>; Wed, 22 Jul 2026 12:42:16 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1784749335; cv=none;
        d=google.com; s=arc-20260327;
        b=W3XWJP9pHWYXFojlDTpNWGWiJpnQjM+vbsrlI2dUqCWmFR4/hLB0P6BFWG8fnPLHNB
         XasDT970sypQwVwiQoCPvvBemV985CgO378I1Hara1F7DQ1yjBPTL+23tBh+z1cJey6m
         33iUGZ2o5ExYmPe8xC/eESdOX1/wqyh+joxsXgfYmSx7q5pdhaJKGesK8i5HqNwms1De
         ZQyM54xfqWo2W1TTiNl5LcjO84Kol01QhBxV4PosjfsVEf2bUfN4tRxTtnzKH8MRgDQN
         svj/apvBno2t+BZpX9pVvZknw8Wror2E9t+0VF8vwPImaQeEJKU7u0/gK77d7S7ByAUE
         7ZSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7lE17GbwPKNIBMkfynrGK2sKsBVJoK8+6Y3ta3/lhcg=;
        fh=KJOng+3934We9fYiYveuJ+kUpTjfECQ6FV4TBZrUhG8=;
        b=U7QjYAEMYxQVJDVRNl1i4u4ZMdwkQmACiDdZJEF5/hwsen33kMEEd1mLQFEqa+zWAa
         G3ef0cOpu04uyzwkxMUzUU3LpNveaUuGSagF+pCBCEewc4e1Tq6ep32940TGoSGFFVqS
         YnghEjhdZGO8cRgnt373s95Gd36lvm0qp7o8frL4uRP6uB11oCOdN0QwOamwJgDtvKwa
         henhlY5N1V2moiF/FXv/TKrOtgGJQWVWqcx0NH16qq29r8WJ1mzrlyxxnyzhD7c0hktx
         J3WsErCmP/gtRwl7gx2e+1CCx15QH8uTFCQOpiAwdhk+S3oGVC33lNAiOzwZnqyF7wGx
         fPww==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784749335; x=1785354135; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7lE17GbwPKNIBMkfynrGK2sKsBVJoK8+6Y3ta3/lhcg=;
        b=HpEap0HuAmPoG8N74JkQNapZQ2d4LP8+b03bvP9nZBSTZwpg0PNm7XOwIDIhRcXxeC
         nEyAeeBcR7j7UlaST4BsvWThLWIbnyAGGawv6hAwGLpGg9aMTi/+Kp4cxkJr72RUiwmh
         Cf2QwpCfvd4RT0QYehU6rPfM1LzMuKu3zL49t1BfDL8ZC8jDPKdS9EQFsjDetRlBexiY
         9WE7Z7+yQ805Z41Hg7JT2cNHckSj9q2GJCWYYGFckuVuAIGOoyKzVMwfgRrf/c77GF/z
         ls9+apWbrRAE7TOxW9Nx72zIZQJ34S9FvSLBIFBxnah5txnLJv84BmJUiUBVXkMZwSva
         5Ltg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784749335; x=1785354135;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7lE17GbwPKNIBMkfynrGK2sKsBVJoK8+6Y3ta3/lhcg=;
        b=PeO5EDkhE1Pcb14bfgIElHHNM8nlrSXPvcQO0lAE2O/ZbAV9tYW5RYL1xVUm6F8I/y
         Qqv03iEPJmo1Y1XDMb/Dd1nNKm2oZLFokkZh/A2YymAinsjZgSPdE3PqndEL7W56rC+c
         WpeBAx6CEgpbDxGzTcl+8IETCDcpRiNc6cPRE2WcaxH7ofbhfuLXV8zAycz7piQt++3+
         j4in++5WBcY32PAm84idh0OCwZytjALGSpnDbsTKKBw3GsnHzu9Z8OWHri6TUzsPeeIz
         O53LUVy/R/F6KXix8KGYUAD4cN71L1SdW5bFWT2jI2RI/3RTSU2d9Fy9WJD8rGGEXtvm
         0RuA==
X-Forwarded-Encrypted: i=1; AHgh+RoxWCexjMlqsb+P2OaValu24lAB2cSeAJQUG5OQBA3v+Y/cQQ9qk1e0zlAl75YFhB8EOU2n+b6mrJs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YziutedxZwVVdEQkXkQdFJnEP5fg+aAIV3KJb6VEVHxn+d5+4Ob
	td2oWwOsQe0lPfhz2LZEgTLeQ6muqezp8pI9+Eqx+CUlv5iFSrfQVdNH23nHs01hwfWd+tqWTsK
	0x76m7dv4StuD7NOiXbYa0EeCphoQCz4=
X-Gm-Gg: AR+sD12idcV0VQu+jJU5kHcrg2dgAgXa4m/VFZ58kr3VneQYHSP6HeHyAairDZM9H1U
	/mgqP8QkKSVTt/5W9JmR2IhRlSZLleI9NcB9c9kU9IeJDxeyKFAC2oftmwBjJ42crdjZfuH5FAT
	N2fa4TwycusjbOzh6m2J0N6vYlTaQXsKjBM1syBgfCQVyhUH7+zweFsQhyzGvwv/oZZVyrXaB8c
	220LntZGNYae5n68KGn6ioyEw6If3mYydUqiFJlNtdE5kyGvCvtwAZZnUzIU37XfPVz8cvkZC6d
	4K/BQItfCoyDBZ5udA==
X-Received: by 2002:a05:690c:c4cd:b0:81e:a4ea:d8b8 with SMTP id
 00721157ae682-81f4c22f5fdmr12967b3.13.1784749335414; Wed, 22 Jul 2026
 12:42:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260720154832.1907401-1-marcus.granado@citrix.com>
 <20260720154832.1907401-2-marcus.granado@citrix.com> <1784622046.8631fc262581453bbf619ec5b2062170.19f83c35cd4000edb5@vates.tech>
In-Reply-To: <1784622046.8631fc262581453bbf619ec5b2062170.19f83c35cd4000edb5@vates.tech>
From: Frediano Ziglio <freddy77@gmail.com>
Date: Wed, 22 Jul 2026 20:42:04 +0100
X-Gm-Features: AUfX_mzHnRRUBsuF-LR5GrKkq7pdqRgX_-rf8k7yPWy3jPZKrBKZfFKggS7c_wY
Message-ID: <CAHt6W4erBfB+H_0d+2rQ0apz9Jt6ex+WVjEjyPm6EApoHVJgmg@mail.gmail.com>
Subject: Re: [PATCH v1 1/6] tools/migration: introduce PAGE_DATA_LZ4 stream
 record type
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Marcus Granado <marcus.granado@citrix.com>, xen-devel@lists.xenproject.org, 
	Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-c1860d/1784749337-CE14687B-C437140C/0/0
X-purgate-type: clean
X-purgate-size: 7015

On Tue, 21 Jul 2026 at 09:20, Teddy Astie <teddy.astie@vates.tech> wrote:
>
> Le 20/07/2026 =C3=A0 17:51, Marcus Granado a =C3=A9crit :
> > Allocate a new migration stream record type REC_TYPE_PAGE_DATA_LZ4
> > (0x00000013) to transmit PAGE_DATA when payload is LZ4-compressed. The
> > record use the same xc_sr_rec_page_data_header as REC_TYPE_PAGE_DATA
> > but the page data section type changes from page_data to data_lz4.
> >
> > Signed-off-by: Marcus Granado <marcus.granado@citrix.com>
> > ---
> >   docs/specs/libxc-migration-stream.pandoc | 71 ++++++++++++++++-
> >   tools/libs/guest/xg_sr_common.c          |  4 +
> >   tools/libs/guest/xg_sr_stream_format.h   | 13 ++++
> >   tools/python/xen/migration/libxc.py      | 90 ++++++++++++++++++++-
> >   tools/python/xen/migration/tests.py      | 99 +++++++++++++++++++++++=
-
> >   5 files changed, 271 insertions(+), 6 deletions(-)
> >
> > diff --git a/docs/specs/libxc-migration-stream.pandoc b/docs/specs/libx=
c-migration-stream.pandoc
> > index 1319ce1f1e..7469c95139 100644
> > --- a/docs/specs/libxc-migration-stream.pandoc
> > +++ b/docs/specs/libxc-migration-stream.pandoc
>
> ...

Don't we need to bump the version number while we add a new mandatory recor=
d?
Is there no kind of dialog about the supported version?

>
> > +PAGE_DATA_LZ4
> > +-------------
> > +
> > +A PAGE_DATA_LZ4 record carries exactly the same information as a
> > +PAGE_DATA record, but with the page contents LZ4-compressed.  The save=
r
> > +may emit it in place of a PAGE_DATA record when LZ4 compression has be=
en
> > +requested.
> > +
>
> Would it be preferable to make this structure more generic, i.e
> PAGE_DATA_COMPRESSED, as I'm not sure it's wise to restrict to only LZ4
> (someone may want to add support for e.g zstd or another algorithm
> without having to change the format) ?
>

Why not extending the generalization compressing all payload of
uncompressed packets (type+body), so to have something like

- LZ4 compressed type (uint32)
- compressed length (uint32)
- compressed data (array of bytes, length field above)
  Uncompressed data will contain
  - type (uint32, like PAGE_DATA)
  - body (array of bytes, not padded)
- padding to 8 bytes with zeroes

So we could compress any packet, not only PAGE_DATA.
Yes, to support more compression types an additional
"compression_type" or similar field could help. But what about
additional possible options?

> > +     0     1     2     3     4     5     6     7 octet
> > +    +-----------------------+-------------------------+
> > +    | count (C)             | (reserved)              |
> > +    +-----------------------+-------------------------+
> > +    | pfn[0]                                          |
> > +    +-------------------------------------------------+
> > +    ...
> > +    +-------------------------------------------------+
> > +    | pfn[C-1]                                        |
> > +    +-----------+-------------------------------------+
> > +    | clen[0]   | page_data_lz4[0]...                 |
> > +    +-----------+-------------------------------------+
> > +    ...
> > +    +-----------+-------------------------------------+
> > +    | clen[N-1] | page_data_lz4[N-1]...               |
> > +    ...
> > +    +-------------------------------------------------+
> > +
> > +--------------------------------------------------------------------
> > +Field       Description
> > +----------- --------------------------------------------------------
> > +count       Number of pages described in this record.
> > +
> > +pfn         An array of count PFNs and their types, with the same
> > +            layout and page types as in a PAGE_DATA record.
> > +
> > +data_lz4    The compressed page contents, as one sub-block per page
> > +            set as present in the pfn array, in pfn-array order (i.e.
> > +            N sub-blocks, with N as in a PAGE_DATA record: N <=3D C).
> > +            Each sub-block is a `uint16` little-endian length `clen`
> > +            followed by either an LZ4 block or a raw page.  When
> > +            `clen > 0`, page_data_lz4 is `clen` octets of a raw LZ4
> > +            block (per the LZ4 block format) whose decompressed output
> > +            is one page_size page.  When `clen =3D=3D 0`, page_data_lz=
4 is
> > +            page_size octets of a raw, uncompressed page.
> > +            A compressed `clen` is at most page_size - 1, occupying
> > +            only the low 12 bits; the top 4 bits are reserved for
> > +            future use and must be 0.
> > +--------------------------------------------------------------------
> > +
> > +The `count` (C) and `pfn` fields are identical in meaning and
> > +constraints to those of a PAGE_DATA record, and N (the number of
> > +present pages, N <=3D C) is as defined there.  Unlike PAGE_DATA, a
> > +PAGE_DATA_LZ4 record always has N >=3D 1 (at least one sub-block):
> > +the saver emits the LZ4 variant only when there is page data to
> > +compress, and a restoring side rejects a PAGE_DATA_LZ4 record with
> > +N =3D=3D 0.  When a batch has no present pages (all pfns of invalid
> > +types) the saver emits a plain PAGE_DATA record instead.
> > +
> > +PAGE_DATA_LZ4 is a _mandatory_ record: a restoring side that does not
> > +support it must fail the migration.
> > +
>
> The inline clen at the beginning of page_data_lz4 feels a bit odd to me,
> or at least, a bit inconsistent with how pfns are arranged. I think
> something like i.e
>
> 1. count and (reserved)
> 2. pfn[0] ... pfn[C-1]
> 3. clen[0] ... clen[N-1]
> 4. page_data_lz4[0] ... page_data_lz4[N-1]
>
> would be better.
>
> Though, aside that, I'm not sure having separate compressed block for
> each page is a good idea. Compression is more efficient when processing
> larger blocks, LZ4 documents a 64 KB deduplication window (of the past
> bytes) [1].
>
> In my opinion, it may be preferable to have one large block with all the
> page datas (covering up to MAX_BATCH_SIZE=3D1024 pages) rather than havin=
g
> to uncompress individual blocks. Which in the end would remove the need
> to have individual clen[n].
>

I was thinking the same. Talking with the author today one reason is
that bytes could change while compressing them (because they are
shared with the guest which is running) but on following updates
(dirty pages map is used) they get updated and fixed (otherwise VM
will crash).
However we could copy the memory to avoid this. Considering the
algorithm (in this case) has a window of 64 K we could compress and
copy in 64 K chunks to reduce memory usage and increase cache (as
processor one) usage (if that's an issue).

> What do you think ?
>
> [1]
> https://github.com/lz4/lz4/blob/dev/doc/lz4_Block_format.md#compression-t=
echniques
> ...
>
> >
> > base-commit: a7fd7d4cbd5e793d31d61c25e08526b330edd7f8
>
> Teddy

Frediano

