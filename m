Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A7AEC53200
	for <xen-devel@archiver.kernel.org>; Wed, 29 Jul 2026 09:14:28 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1375381.1622538 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wp0Mm-0004SO-87; Wed, 29 Jul 2026 09:14:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1375381.1622538; Wed, 29 Jul 2026 09:14:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wp0Mm-0004SG-4X; Wed, 29 Jul 2026 09:14:20 +0000
Received: by outflank-mailman (input) for mailman id 1375381;
 Wed, 29 Jul 2026 09:14:18 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wp0Mk-0004Qs-ON
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2026 09:14:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wp0Mj-00Dkna-UG
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2026 11:14:17 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a69c457-2eae-0a2a0a5409dd-0a2a4504ecac-36
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 11:14:17 +0200
Received: from [74.125.224.51] (helo=mail-yx1-f51.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a69c468-b57f-0a2a45040019-4a7de033c0e5-3
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 11:14:17 +0200
Received: by mail-yx1-f51.google.com with SMTP id
 956f58d0204a3-66843304cbaso1023184d50.2
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 02:14:17 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1785316456; cv=none;
        d=google.com; s=arc-20260327;
        b=mihjp0hro/0l9lY4vLFiBPVS5xA4jZn09iOmAX8umdq5VQHFX3Il9Nr3oJ+FMI2iNo
         p7MSng1/PazPsmFxMgRhz/dcQjuE6Zrx6dbzvotK8cP2e4NvDTgLYq0qO+gUiHtRjaeE
         BmEa9Q2q6iy0jQ72h5TgNICkTgyHx5A08Jm3fFMdsx3MwOEGQwps4CKCIxx+L8mv1PQq
         GytML98XFiGNZualAQ54hWtqR27i3vtm6SB9M1tEfgmaltK3d54rkx4ozaZkPsTH7YyA
         nia4molkjVK3OkVkeG5f89f81OiahqfSMgrwkaikh9m7MdIit4R0C+oguten4+QVOOaU
         Aaww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iBuRtLlMSvtMm7GNZ+TiOU37HeLzRf42lL6VMzRrMkg=;
        fh=dy33UISnQlZ41cwkZmYx4Up4n1BvH0o3W8MGpJVGBiM=;
        b=qrfAb/C07sWq5wVtFOZhwHwWjbw5+3IheAcXRkyB812OtxQmJsGWJKJf+gkZy8ramx
         Gjf9qFzE8cZnPJiWB424u3jyPTuIT0uiptiBMe1WproW+ofILSeID0WRitbsi+ewfBeF
         D1PKgppNhKz3gS6RY3PDFo7SVhJxzD9QOt9llUruKDjhIMPCyye6N2TYoiZfubb8iBYv
         kvrr5wJvnP81tE/+XhUaoZ6FQ59+LiKf4dle51CG04MKdZPfpC2oWiD0USEUx3EvNhnl
         At8LypIoXaErnjpR5PNysaheNE4LfogTEcbuITAwiVOT+ObQLvPXIYO/WIcJHxeLwze1
         Z0BA==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785316456; x=1785921256; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iBuRtLlMSvtMm7GNZ+TiOU37HeLzRf42lL6VMzRrMkg=;
        b=q98OdPzX2ncLxt+vnIr92qyWs/FX6yi/tiUii7ll5Oh64V3E2CVElPIBB5wnUkhFSH
         hnWm6p8Q3MZ77u55WCr9SnfrxWLpo1CBLaOts6LenYfqoVSd9czXyxtYH+93y7lgwCM+
         z1YKTc3f5O1tozVCgUaBJIj6fWqJ/fJlSjpQ86OvGL209QxFADAxKFtwtJbhXs/8pgCk
         8VrdW4O1HWQLVGtLB4tywh4+RXNvEnlwZGtKh7P5Wx8dtnOIg/fisxVX9Td91XeT6Kp4
         eNbUaVGKgVrJz+daC9SfzjgCywQzeJd8QVO4u9IoTRY8U6AjFZXlXz4T0yD5oEOVh+0n
         mJBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785316456; x=1785921256;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iBuRtLlMSvtMm7GNZ+TiOU37HeLzRf42lL6VMzRrMkg=;
        b=aFIbVNVocaohCp1jlKL+P/rkeMir0qpHnPmHcYzTXdol8AzXm6sBIFWHwFeRmg8+/N
         I1hTMKgnwY+poQU24tI3U7SQcYJuseTZ4P8kw3vR2pF85Wgw3en0LQeAzJjsMkyZrZKP
         XZKEF9sYWvxWLFbkccwx8gz6UHJU/VPvDoMm7Bjx13vB4wchfM6Y4DZGCfMgkJ4l2Nv1
         g1PWw7CziejiAYbsj4tqnXEg22ryrLXZMwCoSK7nqnkFVeR7YOxFYMk0M6wq+150dQRx
         afZll84VZx+1GKoYAYNN2Ft54Kzt1cKoA2Zj1rsM1EvV2TjGr8DRLLW9QsZOqnoxAp/t
         YNgA==
X-Forwarded-Encrypted: i=1; AHgh+RpBxArfukfgPsSbOnDwIyp1RaN1gf1M9ujNvRXwkPHHy7hW/ELSsQYjtVRLwyB+qye7atSaGjl3Sz8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyOPfxRrwOuMbs0HF5IDM44FiWx/rXvAghnA4U2Bb4RyCTVHMcI
	xc3qHNTDiEC15zz0mA9pW8qblAka1pA+XeVuIby5R1VRpkufewykVPGUCQfC4Vam/qEOv59xAWi
	MtfAgTiXsgPqJ5Vpq4dRlNorcAa4sOwM=
X-Gm-Gg: AR+sD13qs5ljYbJxm5R5ViqyQObdGQI/SlfFsWNkwTVWJnW3BH0RPRuL51Sk2ViEhLf
	sxGQurwJrOhT/6uE4h6/vSh/ExO/vWV//jTILiKA7x2n824AIoDxqNtZRUoQ3rNKVYW6ms9S/Gg
	d8KXW2t1UyvZ0/L8BqfSSBkIcmXHhhAYaC2FzNzqEfCm3G7IAkwohuRm+HWIV1v9/z2TX1eCXjw
	4VJR081UySDmlclnvoHnVRXWjcHi5m2J+AlAZ8OIzgpGM4eIeWzxkZBunrYx5urWPREWMbE6mlx
	nMUzv2wLmC+yIeHsBHuomQy/yM0Tf9SrGGQFJpLwGeW4yAOD4IJ9LFUMmkn0ZIKRP6VnXn4bERK
	v
X-Received: by 2002:a53:c044:0:10b0:667:e172:afb9 with SMTP id
 956f58d0204a3-6690582c993mr1926931d50.86.1785316456198; Wed, 29 Jul 2026
 02:14:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260720154832.1907401-1-marcus.granado@citrix.com>
 <20260720154832.1907401-2-marcus.granado@citrix.com> <1784622046.8631fc262581453bbf619ec5b2062170.19f83c35cd4000edb5@vates.tech>
 <CAHt6W4erBfB+H_0d+2rQ0apz9Jt6ex+WVjEjyPm6EApoHVJgmg@mail.gmail.com> <1784755834.8631fc262581453bbf619ec5b2062170.19f8bbccffd000edb5@vates.tech>
In-Reply-To: <1784755834.8631fc262581453bbf619ec5b2062170.19f8bbccffd000edb5@vates.tech>
From: Frediano Ziglio <freddy77@gmail.com>
Date: Wed, 29 Jul 2026 10:14:05 +0100
X-Gm-Features: AUfX_myKi9qC50Afna584PNlFoINWnVnEXggA0iQW-gMYQFeXByKFGR8FA_gPt8
Message-ID: <CAHt6W4cWLfSVoCSgr-YsQb1Mv=VZek0CakTBwK7tx_n9RkeiUg@mail.gmail.com>
Subject: Re: [PATCH v1 1/6] tools/migration: introduce PAGE_DATA_LZ4 stream
 record type
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Marcus Granado <marcus.granado@citrix.com>, xen-devel@lists.xenproject.org, 
	Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-ebf023/1785316457-508D9B50-91B1C056/0/0
X-purgate-type: clean
X-purgate-size: 9987

On Wed, 22 Jul 2026 at 22:30, Teddy Astie <teddy.astie@vates.tech> wrote:
>
> Le 22/07/2026 =C3=A0 21:46, Frediano Ziglio a =C3=A9crit :
> > On Tue, 21 Jul 2026 at 09:20, Teddy Astie <teddy.astie@vates.tech> wrot=
e:
> >>
> >> Le 20/07/2026 =C3=A0 17:51, Marcus Granado a =C3=A9crit :
> >>> Allocate a new migration stream record type REC_TYPE_PAGE_DATA_LZ4
> >>> (0x00000013) to transmit PAGE_DATA when payload is LZ4-compressed. Th=
e
> >>> record use the same xc_sr_rec_page_data_header as REC_TYPE_PAGE_DATA
> >>> but the page data section type changes from page_data to data_lz4.
> >>>
> >>> Signed-off-by: Marcus Granado <marcus.granado@citrix.com>
> >>> ---
> >>>    docs/specs/libxc-migration-stream.pandoc | 71 ++++++++++++++++-
> >>>    tools/libs/guest/xg_sr_common.c          |  4 +
> >>>    tools/libs/guest/xg_sr_stream_format.h   | 13 ++++
> >>>    tools/python/xen/migration/libxc.py      | 90 ++++++++++++++++++++=
-
> >>>    tools/python/xen/migration/tests.py      | 99 ++++++++++++++++++++=
+++-
> >>>    5 files changed, 271 insertions(+), 6 deletions(-)
> >>>
> >>> diff --git a/docs/specs/libxc-migration-stream.pandoc b/docs/specs/li=
bxc-migration-stream.pandoc
> >>> index 1319ce1f1e..7469c95139 100644
> >>> --- a/docs/specs/libxc-migration-stream.pandoc
> >>> +++ b/docs/specs/libxc-migration-stream.pandoc
> >>
> >> ...
> >
> > Don't we need to bump the version number while we add a new mandatory r=
ecord?
> > Is there no kind of dialog about the supported version?
> >
> >>
> >>> +PAGE_DATA_LZ4
> >>> +-------------
> >>> +
> >>> +A PAGE_DATA_LZ4 record carries exactly the same information as a
> >>> +PAGE_DATA record, but with the page contents LZ4-compressed.  The sa=
ver
> >>> +may emit it in place of a PAGE_DATA record when LZ4 compression has =
been
> >>> +requested.
> >>> +
> >>
> >> Would it be preferable to make this structure more generic, i.e
> >> PAGE_DATA_COMPRESSED, as I'm not sure it's wise to restrict to only LZ=
4
> >> (someone may want to add support for e.g zstd or another algorithm
> >> without having to change the format) ?
> >>
> >
> > Why not extending the generalization compressing all payload of
> > uncompressed packets (type+body), so to have something like
> >
> > - LZ4 compressed type (uint32)
> > - compressed length (uint32)
> > - compressed data (array of bytes, length field above)
> >    Uncompressed data will contain
> >    - type (uint32, like PAGE_DATA)
> >    - body (array of bytes, not padded)
> > - padding to 8 bytes with zeroes
> >
> > So we could compress any packet, not only PAGE_DATA.
> > Yes, to support more compression types an additional
> > "compression_type" or similar field could help. But what about
> > additional possible options?
> >
>
> (you should probably also add uncompressed size, so that decompressors
> can guard against decompression bomb blocks)
>

Yes, apparently that field disappeared between thinking and writing the rep=
ly.
It's also useful for different purposes like preallocating.

> In principle, it's preferable as it decouple the compression aspect to
> the data itself. But it needs a quite significant refactoring to add a
> middle layer that "transparently" compress/decompress data to the lower
> layer that perform live migration logic and parse/generate the page_data
> object.
>

A similar change was done (not by me) in another project I worked on previo=
usly.
I thought it was more complicated too but it turned out the change was
pretty clean, not requiring much.
More or less during the process of the package you decompress the
package and call the process again on the decompressed package.
Similar for the sending side.

> >>> +     0     1     2     3     4     5     6     7 octet
> >>> +    +-----------------------+-------------------------+
> >>> +    | count (C)             | (reserved)              |
> >>> +    +-----------------------+-------------------------+
> >>> +    | pfn[0]                                          |
> >>> +    +-------------------------------------------------+
> >>> +    ...
> >>> +    +-------------------------------------------------+
> >>> +    | pfn[C-1]                                        |
> >>> +    +-----------+-------------------------------------+
> >>> +    | clen[0]   | page_data_lz4[0]...                 |
> >>> +    +-----------+-------------------------------------+
> >>> +    ...
> >>> +    +-----------+-------------------------------------+
> >>> +    | clen[N-1] | page_data_lz4[N-1]...               |
> >>> +    ...
> >>> +    +-------------------------------------------------+
> >>> +
> >>> +--------------------------------------------------------------------
> >>> +Field       Description
> >>> +----------- --------------------------------------------------------
> >>> +count       Number of pages described in this record.
> >>> +
> >>> +pfn         An array of count PFNs and their types, with the same
> >>> +            layout and page types as in a PAGE_DATA record.
> >>> +
> >>> +data_lz4    The compressed page contents, as one sub-block per page
> >>> +            set as present in the pfn array, in pfn-array order (i.e=
.
> >>> +            N sub-blocks, with N as in a PAGE_DATA record: N <=3D C)=
.
> >>> +            Each sub-block is a `uint16` little-endian length `clen`
> >>> +            followed by either an LZ4 block or a raw page.  When
> >>> +            `clen > 0`, page_data_lz4 is `clen` octets of a raw LZ4
> >>> +            block (per the LZ4 block format) whose decompressed outp=
ut
> >>> +            is one page_size page.  When `clen =3D=3D 0`, page_data_=
lz4 is
> >>> +            page_size octets of a raw, uncompressed page.
> >>> +            A compressed `clen` is at most page_size - 1, occupying
> >>> +            only the low 12 bits; the top 4 bits are reserved for
> >>> +            future use and must be 0.
> >>> +--------------------------------------------------------------------
> >>> +
> >>> +The `count` (C) and `pfn` fields are identical in meaning and
> >>> +constraints to those of a PAGE_DATA record, and N (the number of
> >>> +present pages, N <=3D C) is as defined there.  Unlike PAGE_DATA, a
> >>> +PAGE_DATA_LZ4 record always has N >=3D 1 (at least one sub-block):
> >>> +the saver emits the LZ4 variant only when there is page data to
> >>> +compress, and a restoring side rejects a PAGE_DATA_LZ4 record with
> >>> +N =3D=3D 0.  When a batch has no present pages (all pfns of invalid
> >>> +types) the saver emits a plain PAGE_DATA record instead.
> >>> +
> >>> +PAGE_DATA_LZ4 is a _mandatory_ record: a restoring side that does no=
t
> >>> +support it must fail the migration.
> >>> +
> >>
> >> The inline clen at the beginning of page_data_lz4 feels a bit odd to m=
e,
> >> or at least, a bit inconsistent with how pfns are arranged. I think
> >> something like i.e
> >>
> >> 1. count and (reserved)
> >> 2. pfn[0] ... pfn[C-1]
> >> 3. clen[0] ... clen[N-1]
> >> 4. page_data_lz4[0] ... page_data_lz4[N-1]
> >>
> >> would be better.
> >>
> >> Though, aside that, I'm not sure having separate compressed block for
> >> each page is a good idea. Compression is more efficient when processin=
g
> >> larger blocks, LZ4 documents a 64 KB deduplication window (of the past
> >> bytes) [1].
> >>
> >> In my opinion, it may be preferable to have one large block with all t=
he
> >> page datas (covering up to MAX_BATCH_SIZE=3D1024 pages) rather than ha=
ving
> >> to uncompress individual blocks. Which in the end would remove the nee=
d
> >> to have individual clen[n].
> >>
> >
> > I was thinking the same. Talking with the author today one reason is
> > that bytes could change while compressing them (because they are
> > shared with the guest which is running) but on following updates
> > (dirty pages map is used) they get updated and fixed (otherwise VM
> > will crash).
>
> Oh, well, that's (unfortunately) actually worse; while running
> compression logic to live pages can cause data corruption of the end
> result, this also causes undefined behavior through the compiler (data
> race as compiler doesn't expect the pointer content to be modified from
> elsewhere concurrently).
>
> We probably need to copy the memory here to stay safe.
> Something that could be addressed with xg_foreignmemory_copy_* proposal.
>
> > However we could copy the memory to avoid this. Considering the
> > algorithm (in this case) has a window of 64 K we could compress and
> > copy in 64 K chunks to reduce memory usage and increase cache (as
> > processor one) usage (if that's an issue).
> >
> That could be considered, but it would make things a bit more
> complicated to define. I found that along LZ4, there is also LZ4F [1]
> which can be useful to make it streamable or chunkable in a quite
> standardized way. Otherwise, we would have to add some arbitrary framing
> each 32 KB blocks, so it will no longer be simply a LZ4 block.
>
> But that may be too much for just chunking a 4 MB (maximum) block so I'm
> not really certain of what's best actually.
>
> [1] https://github.com/lz4/lz4/blob/dev/doc/lz4_Frame_format.md
>

About compressing all together and considering also the issue of
memory changing while sending I would vote to copy the memory in a
temporary buffer to avoid this. One advantage is that it simplified
the format. The current LZ4 implementation seems to cope with data
changes but nothing guarantees it in the future, the buffer you are
passing is not supposed to change while you compress it.

> >> What do you think ?
> >>
> >> [1]
> >> https://github.com/lz4/lz4/blob/dev/doc/lz4_Block_format.md#compressio=
n-techniques
> >> ...
> >>
> >>>
> >>> base-commit: a7fd7d4cbd5e793d31d61c25e08526b330edd7f8
> >>
> >> Teddy
> >
> > Frediano
> >
>
> Teddy

