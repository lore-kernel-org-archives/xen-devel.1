Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F5A4C44501
	for <xen-devel@archiver.kernel.org>; Thu,  9 Jul 2026 10:10:55 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1357855.1612184 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whliO-0005kL-0x; Thu, 09 Jul 2026 10:10:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1357855.1612184; Thu, 09 Jul 2026 10:10:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whliN-0005kE-UL; Thu, 09 Jul 2026 10:10:43 +0000
Received: by outflank-mailman (input) for mailman id 1357855;
 Thu, 09 Jul 2026 10:10:42 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1whliM-0005k4-HR
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 10:10:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whliL-00ET8e-UY
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 12:10:41 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a4f73a1-5cb7-0a2a0a5109dd-0a2a4506ce22-2
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 12:10:41 +0200
Received: from [74.125.224.43] (helo=mail-yx1-f43.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a4f73a0-08de-0a2a45060019-4a7de02bc0b9-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 12:10:41 +0200
Received: by mail-yx1-f43.google.com with SMTP id
 956f58d0204a3-66628618509so1016727d50.2
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 03:10:41 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1783591840; cv=none;
        d=google.com; s=arc-20260327;
        b=NLb2+Bvqm1uUiQDaQr8na6ZEv6cR3OpCSoQx1PAPWEhK0oZF+SEd7rW/EwMP/0eA96
         RbhQzTqWECdLKyU/eOJWfZJKlBQwN16HIt7D4rperLI2u52E+H2qu8AENUOYUtBGEiQv
         Bn30GySHrBkZeFUxEOoM6PF9fM+mYpxD1h6Bg2RV2eaK2ysRiiX2UxMZIsIFpTjeJm3f
         filAwpsWcsqSnZ2adi29Xqy+Dcx63UrDnKbqyhl/EON+V0A7B9ShmpXZJgzDcCbSNlR0
         Bt9Ho739Ax1DPg2DcjWp9dO96q7F7cYYiGmiXFMn7hzdJUWSYJXsP5HCixrfdLofjjQl
         IP8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xOOevMuPe35Bv8U5POk91gB2d1Rxc6jExsFDjGRND5M=;
        fh=hPm/vFa1sRt5uhzQFrp765rgrhqr4j+AMaChATfJNPw=;
        b=RrVUQNoDWs4nbF8XciOgPl0jbLVeB7G+kB/qZpu+rwBrbOK7a+Q9uOCmxCnwSpl6vx
         BwA3XXDnyNX16sxbOKeG8F9ZAWz3lShkiYXoInmX/TF9cMr+gwOcdLsJj5akQP25fz4l
         NaWtJrREbzyvYRfet+iFdLax0aPjeDnpfzN9Tnx/u0bWGIqyg/7QhNjjtP2eexss5Tu2
         IEXA7zCoNJwSCWQiC7ZUITyJL7a+g6gMS649tSfsinqnWmoWJ+cyoieHWQB8pteD/pt9
         ns+I62+lempJ4TMvXjlIA+GONIHTvUn9QLiLP3t1QW33yuAvP9OyaLNP+Qhtjexle+HI
         X+oA==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783591840; x=1784196640; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xOOevMuPe35Bv8U5POk91gB2d1Rxc6jExsFDjGRND5M=;
        b=sq4IZiUEDhlTEYsmLuw3BgsrHKN1sjyWLDWTMnU5QemppbSyCCK+LNjrPdB7XmGgTi
         igei5XnOtuKj8JwM+uCRgq/M2SLkAxmV8jzGP+9eaM2XD4GQA485nojrtQFC/mGTQwsj
         +o690tbuXi000G2iP7oAJm+klzToOgEc63TnkTYpcDhFhoaWfjWRYICIgewYelLEmpFl
         MxeiT94S137ZWdq9d4LA9h2kWjkdjYZiQ87+SAeb1Q0AqockwozGHlmOB3+1H0GJBRfT
         Bny8sLxHpet/P5qMaY8jzDnLDEEuTtGXLgytFQvRYBLkxirgeibAxLMGDpCK5jytP0Os
         Jr3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783591840; x=1784196640;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xOOevMuPe35Bv8U5POk91gB2d1Rxc6jExsFDjGRND5M=;
        b=F+IdSnw+w3a3dzpajBY1rENrmY+f+UOIrr6H+L9VhLNztoe0cdp5KEyzTphJbSJnHK
         nTIyDYUUUwYcqf8Ac5of8KskwVIYL1YVOtpVpmC+xPVi1fE5bGgHf/ZxYeBG9CfN7+fL
         xho/FngNyx1DSlNDVtJsal3MARb8TbdX9b8OBIB3oJOipvbwvuGduYwsjOxm7aWe6ViG
         Y3jqfq7Ryqu9SYd+JuGf0kuTMPfJW5Vb4VuQfUT/5UtFOYtwc+t0yjZUMZRTxX4blCeC
         S8UOS3/TUjTgX/if6Y7UGoivPSRzWJudArzcudEtFsCtxLK8Vox7iYiVJMnsnwujxDlW
         c+/g==
X-Gm-Message-State: AOJu0Yw+pnwN7LzK6loM+tSiT6O2hJxobEDzHGnS27JcQw3TWseTrMMM
	UA+uV8u5vL+i3xqIo7NNavPo8A+stExIIyARhkXEVWLVoy668nesCr+WlyDzLWsPcz9wz5MrIX1
	XteXqjNgNn7FYntlkfbrB+nW83dmioLbaligXhDAVkw==
X-Gm-Gg: AfdE7clSEePkNCh5bfcY7R3tl4cmjPyOHDIi+tlatfg4PT34YCl0QwxVMsFO9hbvj1Y
	JIIiLsmeghnzgFgRPRCQVVMMI6OUpHaPfN1X1D/K65bDpi+STuoT1S2FRhjgS+DAHn5FezQNLRQ
	HhzLnIEhbKivIqG39kHOoiMDMq+I9m5ux5b/fHQJuDx0phNwzW6sHZWHkRq6NWOe+FsdYA0lR8z
	NdOd3zFQZT4JLQ3tsmynTnFrxtB6G79SWFqD2rwD6o9Wnj84NbrPJjKAWKNQObC87wsrhjfyJez
	In+KayOq4PPBcUCVpUhuU8lQewQ=
X-Received: by 2002:a05:690e:4402:b0:664:ac71:be8f with SMTP id
 956f58d0204a3-6679f0b0e80mr4121332d50.38.1783591839430; Thu, 09 Jul 2026
 03:10:39 -0700 (PDT)
MIME-Version: 1.0
References: <20260709074358.256084-1-frediano.ziglio@citrix.com> <20260709074358.256084-5-frediano.ziglio@citrix.com>
In-Reply-To: <20260709074358.256084-5-frediano.ziglio@citrix.com>
From: Frediano Ziglio <freddy77@gmail.com>
Date: Thu, 9 Jul 2026 11:10:27 +0100
X-Gm-Features: AVVi8CdRJj8y_1yRlr2KNNwPLmFx9viF0Gup3gt-ZtW-HhSduf6SWu8hAeG7xs8
Message-ID: <CAHt6W4cXmaKEJaU=ZR2+uicN3=G3dFzbMK+_eCkMXiSZh7V2XA@mail.gmail.com>
Subject: Re: [PATCH v7 4/6] libs/guest: move batch_pfns into a separate structure
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edwin.torok@citrix.com>, 
	Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Teddy Astie <teddy.astie@vates.tech>, Anthony PERARD <anthony.perard@vates.tech>, 
	Juergen Gross <jgross@suse.com>, Frediano Ziglio <frediano.ziglio@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-16d1c6/1783591841-43D2D68D-FF55E5B9/0/0
X-purgate-type: clean
X-purgate-size: 2722

On Thu, 9 Jul 2026 at 08:44, Frediano Ziglio <freddy77@gmail.com> wrote:
>
> From: Edwin T=C3=B6r=C3=B6k <edwin.torok@citrix.com>
>
> Prepare for following change.
>
> Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
> ---
> Changes since v6:
> - split from "libs/guest: allocate various migration arrays just once".
> ---
>  tools/libs/guest/xg_sr_common.h |  5 ++++-
>  tools/libs/guest/xg_sr_save.c   | 31 +++++++++++++++++--------------
>  2 files changed, 21 insertions(+), 15 deletions(-)
>
> diff --git a/tools/libs/guest/xg_sr_common.h b/tools/libs/guest/xg_sr_com=
mon.h
> index f1573aefcb..7574c9f5b6 100644
> --- a/tools/libs/guest/xg_sr_common.h
> +++ b/tools/libs/guest/xg_sr_common.h
> @@ -239,11 +239,14 @@ struct xc_sr_context
>
>              struct precopy_stats stats;
>
> -            xen_pfn_t *batch_pfns;
>              unsigned int nr_batch_pfns;
>              unsigned long *deferred_pages;
>              unsigned long nr_deferred_pages;
>              xc_hypercall_buffer_t dirty_bitmap_hbuf;
> +            struct xc_sr_context_save_buffers
> +            {
> +                xen_pfn_t batch_pfns[MAX_BATCH_SIZE];
> +            } *buffers;
>          } save;
>
>          struct /* Restore data. */
> diff --git a/tools/libs/guest/xg_sr_save.c b/tools/libs/guest/xg_sr_save.=
c
> index 84fdbe4140..8956f4260d 100644
> --- a/tools/libs/guest/xg_sr_save.c
> +++ b/tools/libs/guest/xg_sr_save.c
> @@ -75,7 +75,7 @@ static int write_checkpoint_record(struct xc_sr_context=
 *ctx)
>
>  /*
>   * Writes a batch of memory as a PAGE_DATA record into the stream.  The =
batch
> - * is constructed in ctx->save.batch_pfns.
> + * is constructed in ctx->save.buffers->batch_pfns.
>   *
>   * This function:
>   * - gets the types for each pfn in the batch.
> @@ -95,6 +95,7 @@ static int write_batch(struct xc_sr_context *ctx)
>      void *page, *orig_page;
>      uint64_t *rec_pfns =3D NULL;
>      struct iovec *iov =3D NULL; int iovcnt =3D 0;
> +    xen_pfn_t *batch_pfns;

What about a direct

    xen_pfn_t *const batch_pfns =3D ctx->save.buffers->batch_pfns;

here ?

>      struct {
>          struct xc_sr_rhdr rec;
>          struct xc_sr_rec_page_data_header page_data;
> @@ -110,6 +111,10 @@ static int write_batch(struct xc_sr_context *ctx)
>      };
>
>      assert(nr_pfns !=3D 0);
> +    assert(nr_pfns <=3D MAX_BATCH_SIZE);
> +    assert(ctx->save.buffers);
> +
> +    batch_pfns =3D ctx->save.buffers->batch_pfns;
>
>      /* Mfns of the batch pfns. */
>      mfns =3D malloc(nr_pfns * sizeof(*mfns));
> @@ -141,13 +146,12 @@ static int write_batch(struct xc_sr_context *ctx)

...

Frediano

