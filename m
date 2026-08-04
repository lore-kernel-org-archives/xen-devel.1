Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 605E2C55172
	for <xen-devel@archiver.kernel.org>; Tue,  4 Aug 2026 09:28:18 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1382061.1625464 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrBRI-0000MA-9c; Tue, 04 Aug 2026 09:28:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1382061.1625464; Tue, 04 Aug 2026 09:28:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrBRI-0000M2-4T; Tue, 04 Aug 2026 09:28:00 +0000
Received: by outflank-mailman (input) for mailman id 1382061;
 Tue, 04 Aug 2026 09:27:58 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wrBRG-0000Lv-K0
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 09:27:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrBRG-00EZdy-0g
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 11:27:58 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a71b08e-5cb7-0a2a0a5109dd-0a2a4508ec64-38
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 11:27:57 +0200
Received: from [74.125.224.47] (helo=mail-yx1-f47.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a71b09c-f659-0a2a45080019-4a7de02fb8ed-3
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 11:27:56 +0200
Received: by mail-yx1-f47.google.com with SMTP id
 956f58d0204a3-66892c81725so5920962d50.2
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 02:27:56 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1785835675; cv=none;
        d=google.com; s=arc-20260327;
        b=gTdAkbaR+cuCBKZz+pwgrlCYUatnChk+MfwON2JuZqM5KIsOGuC6q15YEc2z4VElQy
         xAnwsy+YVmqAlFohDqtzOAWaq4hC1zB+y8hOGXxzYg/xA83Mssap6qD2I0q0neFV/qbY
         WX2EzeTGPD8v78cLhq5e5kgiN2phQGl6uCGb3bn+sJV0Vnzme7yVbDTVCp2hLKvww8Tt
         /frNv0qbLJdhvojVFld1Dm7rhU5ryx9ykQmZcDlsPJ9+qiqR1aCQCmQtyJ1zEGu06bZj
         WRj5zi3kqeXwt6MKBQYr0Ij+1tw1sRMUuzM5M6w/IO1cZE3yzqFG323//3tqOkl3RaLN
         75sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fQwOQ6fPXMYo5N5tkHcaXYRfhVBL6xu1DTd6Y7Q0NLk=;
        fh=xbnCk1fMGZS2xoJIy7HSNqzoA8cI7GtUsg/C2XqwZXc=;
        b=MIP+Gd68Sh39DtvaKeT4HMDX6FG26t23LCc9ZRrfLBJyiXJzsjibkosV0LnFZ9I9ms
         Hmf5B7NNHO1piJ80Md5OLCTvtN2qLbjtL51LiH+WBj4vxbxcTtoauhX+Ualb2+A97dmy
         RBr25WssZwOCvdwel1KuxfKo/ns0B7w1G7wqcChOmF+Jk9JObWvWOzmRab2VU5q99RO/
         tSa6CjqTMT8R5pMWIACLUdYLE34vhkj9zlbkg3/CIfVsdwB4xaYyY3uwFmJyhx6qvKWy
         VPFX7ekhbsZrUNpQ1L206SnGWf0dodFp1PZJ5ZugCQvQCbbskQArcjTTicxnuAS0gnyo
         8drQ==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785835675; x=1786440475; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fQwOQ6fPXMYo5N5tkHcaXYRfhVBL6xu1DTd6Y7Q0NLk=;
        b=DPEi/Kw/47tQGcGPnT9oS8L8/7/ebuWSHR4vS2bv/927yBTY92ltjUSEonyN06e4lJ
         aDNDEbLEv1troLte9ri/HW3Vy6rvSQBNj7VlEx+w10m/YY/y/zqP9rOx9g93ODaBELgk
         mbcLwACyDtdCsRgCIAC3Tgzne6kw6jcv7PUzzC220mxCXnQPivcmCK0cvk4eHJkeHncv
         tytgk5vbg560mjBqmhQZgnxfhetvYwZIAUNhPR9tY7C0YpArlovgLbngKCXRCHdnHgZq
         Ggcz03QLtVLonqKzYLV1GJEaVabyq90Fba1nLIPrqVtY73Uj2YY5rvunCrxSQOupHT7T
         049Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785835675; x=1786440475;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fQwOQ6fPXMYo5N5tkHcaXYRfhVBL6xu1DTd6Y7Q0NLk=;
        b=hePIj4v+OHppFsq/ti80oyXNRX8gAbncwMH0lQ1WIPvuDcAc0f5D/pIYinOH1atPWm
         ewgyjNuGn/3N57+kGo/Z6okBQFHJ0VJaELLq9faUR82lw1EopZ+Vweu678sf6eJTteYx
         v1xOyumfYLc78S0qUB23DBK7wAxlE7XKFCdBzXVVN0follQd+Eu5nCe2FoYBrDlP908m
         XTWDNc5ZZusAq2bemn5VVoG34G6QYv0f99uV7xYPN2CeqHdQkFYp7gHTWbyrfGM1348G
         7/n5EjPnRXyGoGmD9aCdTWJ5eGOvZ3qALEFtk8g7OyqC3WRaXbLenIje0zxAABczQxw5
         98sA==
X-Forwarded-Encrypted: i=1; AHgh+RpWPlOZhsUxa+SZ9lXDlkFLhBOiC/Y79KVU7JY+gKHW1xW5wBwwCVWQaj8l+04Z5zXKa/0E6piCo94=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwS8OhoLTzDCqIhMqeH96VkuqMHm7WjA5+KOyqCeK2P56Mj3zWK
	zXKkqBv61zRbn/ycBmagpzLJXATw7uUEnx9I/cqLwWYyz6gw0xep8/SjGmvKv9poFKcLS1PDFgG
	euR1VgMmq0XFjRLPOQrznAXhWERXi+e8=
X-Gm-Gg: AR+sD11i/EsstZcBcM2WEpIQD6utFlwDOU8HXtjYn9LEJQo6ttJoN2TC31KrvAaCEMM
	pDP3KwaLV79GtMz2y9DWjB60C97y99RAnl5q2UUebm1M3AKjRXCBDz++f5+grQxoKDYNfAdMdO9
	Tax3wbEnuETRpD7zBzLjDIiDssWwp3tQCGjp81n5hDrWB67vKAf3XZ7jlutXsVmDCzv76iJzSc6
	ARIBDpUHLBWLPH9mVaehO2QvMk1IwxUeDVskByW2aJgGHliAjoHyWTxzVz2eTEEQebxwh2LO9Fe
	xRt/gu/QlWktntDUMfsqHLTER6FB31C+ZHz+YvrBBCsxURhipIwXzHJYUWiRhaGHKEU9M5XCHsK
	Q
X-Received: by 2002:a53:c48e:0:b0:668:43ff:265d with SMTP id
 956f58d0204a3-6694f17589cmr12645410d50.33.1785835675350; Tue, 04 Aug 2026
 02:27:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260720154832.1907401-1-marcus.granado@citrix.com>
 <20260720154832.1907401-2-marcus.granado@citrix.com> <1784622046.8631fc262581453bbf619ec5b2062170.19f83c35cd4000edb5@vates.tech>
 <CAHt6W4erBfB+H_0d+2rQ0apz9Jt6ex+WVjEjyPm6EApoHVJgmg@mail.gmail.com>
 <1784755834.8631fc262581453bbf619ec5b2062170.19f8bbccffd000edb5@vates.tech>
 <CAHt6W4cWLfSVoCSgr-YsQb1Mv=VZek0CakTBwK7tx_n9RkeiUg@mail.gmail.com>
 <LV4PR03MB8234F0C54B63FABE4D749FBBEDD52@LV4PR03MB8234.namprd03.prod.outlook.com>
 <1785834903.8631fc262581453bbf619ec5b2062170.19fcc0e18f8000e099@vates.tech>
In-Reply-To: <1785834903.8631fc262581453bbf619ec5b2062170.19fcc0e18f8000e099@vates.tech>
From: Frediano Ziglio <freddy77@gmail.com>
Date: Tue, 4 Aug 2026 10:27:44 +0100
X-Gm-Features: AUfX_myRCQgeCxpioVZftRZlPcB9bBWODlwGQuWLd2QIALmUwjZBZ_LIOFxb_iU
Message-ID: <CAHt6W4dHih5z1LpRpdRiU_CC0dCQTF=324=KM6QJbUHS1xQ1GQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/6] tools/migration: introduce PAGE_DATA_LZ4 stream
 record type
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Marcus Granado <marcus.granado@citrix.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Roger Pau Monne <roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-c1860d/1785835677-CEF5F87B-66FF65BF/0/0
X-purgate-type: clean
X-purgate-size: 8056

On Tue, 4 Aug 2026 at 10:15, Teddy Astie <teddy.astie@vates.tech> wrote:
>
> Le 03/08/2026 =C3=A0 19:23, Marcus Granado a =C3=A9crit :
> > On Wed, 29 Jul 2026 at 10:14, Frediano Ziglio <freddy77@gmail.com> wrot=
e:
> >> About compressing all together and considering also the issue of
> >> memory changing while sending I would vote to copy the memory in a
> >> temporary buffer to avoid this. One advantage is that it simplified
> >> the format. The current LZ4 implementation seems to cope with data
> >> changes but nothing guarantees it in the future, the buffer you are
> >> passing is not supposed to change while you compress it.
> >
> >
> > Agreed. Frediano and I discussed this further, including simplification=
s on
> > the compression record for v2 so that the page data compression:
> > * compresses the whole batch together
> > * and uses a staged copy for it as you and Teddy suggested (so that we =
do
> > not need to worry about mutating buffers affecting LZ4 or other algorit=
hms).
> >
> > Once there's exactly one compressed blob per record, there's no need fo=
r
> > extra fields to describe the compressed data, as the uncompressed batch
> > size is known (and bounded by MAX_BATCH_SIZE * page_size), and its
> > compressed size can be inferred from the size of the emitted compressed
> > record without a need for an explicit field for clen or a field with th=
e
> > number of raw compressed blobs. This means the separate PAGE_DATA_LZ4
> > record type is not needed, and the proposal for v2 compression record c=
ould
> > simplify to reusing PAGE_DATA and spending one octet of its reserved wo=
rd
> > as follows:
> >
> >
> >       0     1     2     3     4     5     6     7 octet
> >      +-----------------------+-----+-------------------+
> >      | count (C)             | comp| (reserved)        |
> >      +-----------------------+-----+-------------------+
> >      | pfn[0]                                          |
> >      +-------------------------------------------------+
> >      ...
> >      +-------------------------------------------------+
> >      | pfn[C-1]                                        |
> >      +-------------------------------------------------+
> >      | page_data[0..N-1] if comp =3D=3D 0                  |
> >      | or page_cdata     if comp !=3D 0                  |
> >      +-------------------------------------------------+
> >
> > with two new entries in the field table:
> >
> > comp        Compression algorithm applied to the page contents. 0
> >              means none, and the record is exactly as it is today. 1
> >              means LZ4 block format. Other values are reserved for
> >              other future formats like ZSTD etc. A comp !=3D 0 can only
> >              be emitted if 0 < len(page_cdata) < N * page_size. An
> >              unknown comp must cause the receiver to fail with a
> >              "Compression algorithm <value> not handled" error.
> >
> > page_cdata  Present instead of page_data when comp is non-zero. A
> >              single compressed object holding the concatenation of the
> >              N page_data entries. The receiver must verify that
> >              0 < count <=3D MAX_BATCH_SIZE.
> >
> >
> > Teddy, I hope this format covers your points: it's no longer LZ4 specif=
ic,
> > the inline clen inconsistency in libxenguest record disappears, it's on=
e
> > block over an immutable copy of the batch instead of one per page, the
> > decompressed size is known up front, and the allocation derived from co=
unt
> > is bounded on the receiver.
> >
>
> Looks good to me.
>
> >
> > This simplification is also forward-compatible in two different ways: y=
our
> > 64KB chunking for cache locality doesn't depend on the format, as the
> > staging copy can be done in chunks while still making a single compress
> > call over the whole batch. And if we find benefits in splitting the pay=
load
> > into several compressed units, that can be implemented as a new comp va=
lue
> > using a self-delimiting format like zstd or lz4f frames, which report t=
he
> > consumed bytes without a need to specify clen or extra framing fields a=
t the
> > record level.
> >
> >
> > On Wed, 22 Jul 2026 at 20:42, Frediano Ziglio <freddy77@gmail.com> wrot=
e:
> >> Don't we need to bump the version number while we add a new mandatory =
record?
> >
> > I believe we may avoid having to do a version bump if we adopt the prop=
erty
> > that 0 < len(page_cdata) < N * page_size when comp !=3D 0, as in this c=
ase
> > the compressed data sent to an old receiver would fail in handle_page_d=
ata()
> > with "PAGE_DATA record wrong size". Bumping the version would make
> > uncompressed migrations fail if they are sent to old receivers that als=
o
> > understand uncompressed migration, so avoiding if possible would be goo=
d.
> > The spec says migration tools "shall always save images using version V=
",
> > so it doesn't seem like we could bump the version only when compression=
 is on.
> >
> >
> >> Is there no kind of dialog about the supported version?
> >
> > There is no in-stream negotiation, and this proposal does not add one.
> > Compression is opt-in at the sender via xl migrate --compress, so an op=
erator
> > who enables it against an old receiver gets a clean failure rather than
> > corruption.
> >
> >> Why not extending the generalization compressing all payload of
> >> uncompressed packets (type+body),
> >
> > A composable wrapper would be a clean generic mechanism, but I think th=
ere
> > are two reasons not to go that way in v2: PAGE_DATA is effectively all =
of the
> > stream bytes, so compressing the other record types would not show up i=
n a
> > measurement. And the no-extra-fields property above depends on PAGE_DAT=
A
> > specifically: a generic wrapper has no pfn array from where we can deri=
ve
> > the uncompressed size, so it would need explicit algorithm, compressed
> > size and uncompressed size fields on every record, which re-adds the fi=
elds
> > that this proposal tries to avoid.
> >
> >
> > Please let me know if the ideas above capture what you had in mind in t=
erms of
> > suggestions to improve v1.
> >
> > In particular, I wonder what the maintainers think of the use of one of=
 the
> > octets of the PAGE_DATA reserved field for the purpose of indicating th=
e data
> > is compressed, or is it preferable to use a new PAGE_DATA_COMPRESSED (0=
x13)
> > type record as a mandatory record so that an old receiver fails more cl=
eanly
> > when it doesn't understand compression "Mandatory record <name> not han=
dled"
> > (caused by the specification of mandatory records) instead of with a ge=
neric
> > error "PAGE_DATA record wrong size" (caused by the current safety
> > implementation that rejects unexpected record sizes)?
> >
>
> The specification says
>
>  > Padding and reserved fields are set to zero on save and must be
> ignored during restore.
>
> Which is not really going to help if we add a new field that matters on
> how the content is organized.
>

Yes, there's no check for "_res1" being 0, however there's this check:

    if ( rec->length !=3D (sizeof(*pages) +
                         (sizeof(uint64_t) * pages->count) +
                         (PAGE_SIZE * pages_of_data)) )
    {
        ERROR("PAGE_DATA record wrong size: length %u, expected "
              "%zu + %zu + %lu", rec->length, sizeof(*pages),
              (sizeof(uint64_t) * pages->count), (PAGE_SIZE * pages_of_data=
));
        goto err;
    }

so, as long as we require that the compressed data is less than the
uncompressed one (we should) it's fine.


> To avoid confusion, it may be desirable to add a new type
> (PAGE_DATA_COMPRESSED), but I'm not fully sold on it.
>

Not strong but if I could vote I would just use part of "_res1" as proposed=
.

> >
> > Marcus
> >
> >
>
> Teddy

Frediano

