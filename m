Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72D52C98318
	for <xen-devel@archiver.kernel.org>; Thu, 24 Sep 2026 18:39:52 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1432856.1653813 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9oLu-0000Zy-QY; Thu, 24 Sep 2026 18:39:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1432856.1653813; Thu, 24 Sep 2026 18:39:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9oLu-0000Zr-MD; Thu, 24 Sep 2026 18:39:26 +0000
Received: by outflank-mailman (input) for mailman id 1432856;
 Thu, 24 Sep 2026 18:39:24 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1x9oLs-0000Zj-Gz
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2026 18:39:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9oLr-00C7q7-UN
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2026 20:39:23 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6ab56e50-8faa-0a2a0a5109dd-0a2a4509bdd0-12
 for <xen-devel@lists.xenproject.org>; Thu, 24 Sep 2026 20:39:23 +0200
Received: from [74.125.229.205] (helo=mail-lf2-f13.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6ab56e5b-be1a-0a2a45090019-4a7de5cdea89-3
 for <xen-devel@lists.xenproject.org>; Thu, 24 Sep 2026 20:39:23 +0200
Received: by mail-lf2-f13.google.com with SMTP id
 2adb3069b0e04-5b8c9954ccbso127786e87.1
 for <xen-devel@lists.xenproject.org>; Thu, 24 Sep 2026 11:39:23 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1790275163; cv=none;
        d=google.com; s=arc-20260327;
        b=g+YGtkU7eUDG2f86KEJHwTha/mzZVmQZeqVvOl+Eu4LNMwwqsORFWyRrHxZDRBp3Xm
         XU3ytyo90USNsDuqFffaHXpsUhBROgAwFDHQbLhI0hFdhTvJGkQ1CF5K99S1Pdgs1F0K
         gcpcX9s06I/Bq9xhi9yZkzkCp9Bai+7U+sXysxvbfwky1YjMB66MX5/SfWcmBeEjYoHk
         YONkyW/ZAb3/hJ+K19qArf+gTl/dsHlTitaCDDhsi4B87uD8wm2CWvjM6Lu81uJ+nI93
         174dcBIFXxrJI3XOHaEuxAYYIlzFOEwgdouLXVQcfguGsydgOFgqkQdvtCYpxTGlZJT3
         qraA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=I3tgwS5wyBwBpBV19eTdSTSNQN0siP1GJboYFHResf4=;
        fh=RwOOD8FwKHtBBkobGpKkroeNqvZU5mMoUlw2sGgs4aY=;
        b=oQaRFRrDFQt1KrnM9XefVM5DZ/YFBM1FBOvSY0KpHwbBWXFR46B09uVcwJdTlIaYJY
         PmXuzumBS9TKRDfwB1jOsFUaJgp99CuarhVmZO5IP6+Y7TNNk3eydTIqO2mo/CeYy1lW
         6LOEWAMo5Yxgl4orBLXxgctBCW/kFb+inCzz6S77RfEwCMdLWD8OwLJSBxQTSBlPtvD1
         2kni9ayJF7y1AWIupLQv0/vyG678JRI6wSRUe8qMSeqPiR4d6H1ZrmROy687haN/msLQ
         MgTXhM/6g3Rm/uC4pnRrnJooJpLd9hUvHNPhat8XYos/WlTFHpypOeTEjKESPpHkaLRF
         Qnvw==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790275163; x=1790879963; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=I3tgwS5wyBwBpBV19eTdSTSNQN0siP1GJboYFHResf4=;
        b=QqEColEjy/n2Eysh9z9SNGVHPAOaVdXtHSu+oD7utvjf4gwRfO8fEKsckNl2GoEwCS
         t4/wH3ugJx3WYxjtqBHHNS6DBaxhKpqJnCk7icHSHlu8vq5a8P67z0LVB3SKkyUqNkWg
         bn4wQh0iiCeudG+AD36/QXtpy9FtYe6lW4o54DzO64YBWKSNgMyssTp8c7UT5VB2wtaD
         Hlz2Vh19QnM86PoHecAwtJFg5ngrkQGy5JQ9Uut/VowRXUDLp6GKDI14wGmgz6Kw9dFA
         c7fh++5GvDbLKvJEf16wXamYO1yS6wlGSP1CfUyLSRM30KGmlcK8JmuscUfYdSJ+KJyL
         DOXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790275163; x=1790879963;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I3tgwS5wyBwBpBV19eTdSTSNQN0siP1GJboYFHResf4=;
        b=wo7wdGXEykIkSTu/oi9yW1aQCi9zx2tjFl5uBKIgkkm/A5z3ILICxJULzL11n3oxEU
         puvle4SQhKfpU8CVD0uQbmfz6MhW2JZNv7J4uKMC0cxOc5Uzs/PzhiAaNpJTL9BdWhq4
         j1OEu4Qmi5wvdw0Y/DRHgFjwO9ZnQ4hJyKbVos7aegryJOIe2irN7co2ntFEQ7XtsUBY
         4d0QKoLXjG2qWujzEaWL5GVi91XZyIJy/acgO93gV8ki9ogfTZo+qiUPZ52xl7VybO+T
         cjlM9RfDF3JdJHMizKAwRnjX4aePRjSnuOg6aELuz/q//6qaCgD1OQTDKUDLb5lnd5i1
         fV6A==
X-Gm-Message-State: AFuF++mAZVbR0jr3jh60YBoZ/O/8Bt1H5CwAJP0xjeQGh1Mnz7qaHUVr
	8aC/VCj02BEpLgYVWkFKcpbfom9NruNKUvnKlg7NNCsBDpSiuIyXYDo3U34EpU6E+fM8e4JDxXv
	Pbkw+6HtLURC3y28P78CFTF9B5ZmFVIw=
X-Gm-Gg: AYBFou2sHJkmBKiWN32EOjTzvl/UuMLjbVNvDda7rmJCkUqcST/pZQtWDwcNV4VVVxF
	HhR22QshGQqWuiBI4eZSTUJa9Vd4fYMhHjzNfzVv5lsdA+LpwkRLlkdyg2LheU+n7MHmJpNt0vq
	8IRCWYLcA0/KOzrRuy48Hz5VSVLC3i8zFmz/xPqGmIh1ozUWcerzFvBMv93rcxxw2cLBY1O6aLt
	I0xPnzGBf/imG/lxYC+2rwmydH3fZIzIAdcGsWEhw9+qj1CZOCiwI3TPD8zXIjShKbj2p0X6GoG
	FIDRmhHKVeUa8I/h/vVBP2xtI1rPGv9wT8QQpFEOspJlCHPSFQWjag==
X-Received: by 2002:a05:6512:79:b0:5b8:98fb:e181 with SMTP id
 2adb3069b0e04-5b8df0a5097mr897230e87.20.1790275162793; Thu, 24 Sep 2026
 11:39:22 -0700 (PDT)
MIME-Version: 1.0
References: <38850629-8bfa-4737-99ff-0fd3f489e56e@suse.com> <436c0688-8b9a-4e56-9d4c-c81dcfbea56e@suse.com>
In-Reply-To: <436c0688-8b9a-4e56-9d4c-c81dcfbea56e@suse.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Thu, 24 Sep 2026 21:39:11 +0300
X-Gm-Features: AclHuK8NLeN81eO9h380fwq7TKT58gsAnrdNcuzQeq_w2xSzXXNCkuD1aHuuwQQ
Message-ID: <CAGeoDV9=UkLwMcuO5kwye2EODaWzZ5VYpBqAW8Pjo44fL76nJw@mail.gmail.com>
Subject: Re: [PATCH 7/7] gnttab: unreachable code when GNTTAB_MAX_VERSION < 2
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD <anthony.perard@vates.tech>, 
	Michal Orzel <michal.orzel@amd.com>, Nicola Vetrini <nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-bad1c0/1790275163-BD0CD034-462F8F19/0/0
X-purgate-type: clean
X-purgate-size: 19593

Hi,

On Tue, Jul 28, 2026 at 4:53=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> I'm surprised Eclair doesn't spot the large chunks of unreachable code on
> Arm, i.e. violations of Misra C:2012 rule 2.1.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> This pretty certainly isn't dealing with everything. For example, with
> another helper the gt_version field could likely also become conditional.
> With some more effort the nr_status_frames field similarly could become
> conditional.

Could we also skip the gt->status allocation and cleanup on Arm?
grant_table_init() still allocates this pointer array, although status
pages are only used by v2. This could be done in a follow-up patch,
together with the fields you mentioned.

>
> --- a/xen/common/grant_table.c
> +++ b/xen/common/grant_table.c
> @@ -72,8 +72,10 @@ struct grant_table {
>      /* Number of grant status frames shared with guest (for version 2) *=
/
>      unsigned int          nr_status_frames;
>
> +#if GNTTAB_MAX_VERSION >=3D 2
>      /* Number of version 2 operations in progress. */
>      atomic_t              nr_v2_ops;
> +#endif /* GNTTAB_MAX_VERSION >=3D 2 */
>
>      /*
>       * Number of available maptrack entries.  For cleanup purposes it is
> @@ -182,12 +184,10 @@ static int cf_check parse_gnttab_max_map
>                                opt_max_maptrack_frames_val);
>  }
>
> -#ifndef GNTTAB_MAX_VERSION
> -#define GNTTAB_MAX_VERSION 2
> -#endif
> -
> +#if GNTTAB_MAX_VERSION >=3D 2
>  unsigned int __read_mostly opt_gnttab_max_version =3D GNTTAB_MAX_VERSION=
;
>  static bool __read_mostly opt_transitive_grants =3D true;
> +#endif
>  #ifdef CONFIG_PV
>  static bool __ro_after_init opt_grant_transfer =3D true;
>  #else
> @@ -196,17 +196,24 @@ static bool __ro_after_init opt_grant_tr
>
>  static int __init cf_check parse_gnttab(const char *s)
>  {
> -    const char *ss, *e;
> -    int val, rc =3D 0;
> +    const char *ss;
> +    int rc =3D 0;
>
>      do {
> +        int val;
> +
>          ss =3D strchr(s, ',');
>          if ( !ss )
>              ss =3D strchr(s, '\0');
>
> -        if ( !strncmp(s, "max-ver:", 8) ||
> -             !strncmp(s, "max_ver:", 8) ) /* Alias for original XSA-226 =
patch */
> +        if ( false )
> +            (void)val; /* Nothing. */
> +#ifndef opt_gnttab_max_version
> +        else if ( !strncmp(s, "max-ver:", 8) ||
> +                  /* Alias for original XSA-226 patch */
> +                  !strncmp(s, "max_ver:", 8) )
>          {
> +            const char *e;
>              long ver =3D simple_strtol(s + 8, &e, 10);
>
>              if ( e =3D=3D ss && ver >=3D 1 && ver <=3D 2 )
> @@ -216,6 +223,7 @@ static int __init cf_check parse_gnttab(
>          }
>          else if ( (val =3D parse_boolean("transitive", s, ss)) >=3D 0 )
>              opt_transitive_grants =3D val;
> +#endif
>  #ifndef opt_grant_transfer
>          else if ( (val =3D parse_boolean("transfer", s, ss)) >=3D 0 )
>              opt_grant_transfer =3D val;
> @@ -330,10 +338,12 @@ shared_entry_header(struct grant_table *
>          block_speculation();
>          return (grant_entry_header_t*)&shared_entry_v1(t, ref);
>
> +#if GNTTAB_MAX_VERSION >=3D 2
>      case 2:
>          /* Returned values should be independent of speculative executio=
n */
>          block_speculation();
>          return &shared_entry_v2(t, ref).hdr;
> +#endif
>      }
>
>      ASSERT_UNREACHABLE();
> @@ -378,6 +388,9 @@ struct active_grant_entry {
>  })
>
>      domid_t       domid;  /* Domain being granted access.             */
> +
> +#if GNTTAB_MAX_VERSION >=3D 2
> +
>      domid_t       src_domid; /* Original domain granting access.      */
>      unsigned int  start:15; /* For sub-page grants, the start offset
>                                 in the page.                           */
> @@ -385,6 +398,9 @@ struct active_grant_entry {
>      unsigned int  length:16; /* For sub-page grants, the length of the
>                                  grant.                                */
>      grant_ref_t   trans_gref;
> +
> +#endif /* GNTTAB_MAX_VERSION < 2 */
> +
>      mfn_t         mfn;    /* Machine frame being granted.             */
>  #ifndef NDEBUG
>      gfn_t         gfn;    /* Guest's idea of the frame being granted. */
> @@ -405,6 +421,15 @@ static inline void act_set_gfn(struct ac
>  #endif
>  }
>
> +static bool act_is_sub_page(const struct active_grant_entry *act)
> +{
> +#if GNTTAB_MAX_VERSION >=3D 2
> +    return act->is_sub_page;
> +#else
> +    return false;
> +#endif
> +}
> +
>  static DEFINE_PERCPU_RWLOCK_GLOBAL(grant_rwlock);
>
>  static always_inline void grant_read_lock(struct grant_table *gt)
> @@ -724,6 +749,7 @@ static unsigned int nr_grant_entries(str
>          block_speculation();
>          return f2e(nr_grant_frames(gt), 1);
>
> +#if GNTTAB_MAX_VERSION >=3D 2
>      case 2:
>          BUILD_BUG_ON(f2e(INITIAL_NR_GRANT_FRAMES, 2) <
>                       GNTTAB_NR_RESERVED_ENTRIES);
> @@ -731,6 +757,7 @@ static unsigned int nr_grant_entries(str
>          /* Make sure we return a value independently of speculative exec=
ution */
>          block_speculation();
>          return f2e(nr_grant_frames(gt), 2);
> +#endif /* GNTTAB_MAX_VERSION >=3D 2 */
>  #undef f2e
>      }
>
> @@ -919,7 +946,7 @@ static int _set_status(const grant_entry
>                         domid_t ldomid)
>  {
>
> -    if ( evaluate_nospec(rgt_version =3D=3D 1) )
> +    if ( GNTTAB_MAX_VERSION < 2 || evaluate_nospec(rgt_version =3D=3D 1)=
 )
>          return _set_status_v1(shah, rd, act, readonly, mapflag, ldomid);
>      else
>          return _set_status_v2(shah, status, rd, act, readonly, mapflag, =
ldomid);
> @@ -1089,17 +1116,18 @@ map_grant_ref(
>      if ( act->pin &&
>           ((act->domid !=3D ld->domain_id) ||
>            (act->pin & GNTPIN_incr2oflow_mask(pin_incr)) ||
> -          (act->is_sub_page)) )
> +          act_is_sub_page(act)) )
>      {
>          gdprintk(XENLOG_WARNING,
>                   "Bad domain (%d !=3D %d), or risk of counter overflow %=
08x, or subpage %d\n",
> -                 act->domid, ld->domain_id, act->pin, act->is_sub_page);
> +                 act->domid, ld->domain_id, act->pin, act_is_sub_page(ac=
t));
>          rc =3D GNTST_general_error;
>          goto act_release_out;
>      }
>
>      /* Make sure we do not access memory speculatively */
> -    status =3D evaluate_nospec(rgt->gt_version =3D=3D 1) ? &shah->flags
> +    status =3D GNTTAB_MAX_VERSION < 2 ||
> +             evaluate_nospec(rgt->gt_version =3D=3D 1) ? &shah->flags
>                                                     : &status_entry(rgt, =
ref);
>
>      if ( !act->pin ||
> @@ -1113,9 +1141,10 @@ map_grant_ref(
>
>          if ( !act->pin )
>          {
> -            unsigned long gfn =3D evaluate_nospec(rgt->gt_version =3D=3D=
 1) ?
> -                                shared_entry_v1(rgt, ref).frame :
> -                                shared_entry_v2(rgt, ref).full_page.fram=
e;
> +            unsigned long gfn =3D GNTTAB_MAX_VERSION < 2 ||
> +                                evaluate_nospec(rgt->gt_version =3D=3D 1=
)
> +                                ? shared_entry_v1(rgt, ref).frame
> +                                : shared_entry_v2(rgt, ref).full_page.fr=
ame;
>
>              rc =3D get_paged_frame(gfn, &mfn, &pg,
>                                   op->flags & GNTMAP_readonly, rd);
> @@ -1124,11 +1153,13 @@ map_grant_ref(
>              act_set_gfn(act, _gfn(gfn));
>              act->domid =3D ld->domain_id;
>              act->mfn =3D mfn;
> +#if GNTTAB_MAX_VERSION >=3D 2
>              act->start =3D 0;
>              act->length =3D PAGE_SIZE;
>              act->is_sub_page =3D false;
>              act->src_domid =3D rd->domain_id;
>              act->trans_gref =3D ref;
> +#endif /* GNTTAB_MAX_VERSION >=3D 2 */
>          }
>      }
>
> @@ -1350,7 +1381,8 @@ map_grant_ref(
>
>      grant_read_lock(rgt);
>
> -    if ( unlikely(evaluate_nospec((rgt->gt_version =3D=3D 1) !=3D
> +    if ( GNTTAB_MAX_VERSION >=3D 2 &&
> +         unlikely(evaluate_nospec((rgt->gt_version =3D=3D 1) !=3D
>                                    (status =3D=3D &shah->flags))) )
>      {
>          /*
> @@ -1625,7 +1657,7 @@ unmap_common_complete(struct gnttab_unma
>
>      act =3D active_entry_acquire(rgt, op->ref);
>
> -    if ( evaluate_nospec(rgt->gt_version =3D=3D 1) )
> +    if ( GNTTAB_MAX_VERSION < 2 || evaluate_nospec(rgt->gt_version =3D=
=3D 1) )
>          status =3D &shared_entry_v1(rgt, op->ref).flags;
>      else if ( evaluate_nospec(op->ref < nr_grant_entries(rgt)) )
>          status =3D &status_entry(rgt, op->ref);
> @@ -1947,7 +1979,7 @@ gnttab_grow_table(struct domain *d, unsi
>      }
>
>      /* Status pages - version 2 */
> -    if ( evaluate_nospec(gt->gt_version > 1) )
> +    if ( GNTTAB_MAX_VERSION >=3D 2 && evaluate_nospec(gt->gt_version > 1=
) )
>      {
>          if ( gnttab_populate_status_frames(d, gt, req_nr_frames) )
>              goto shared_alloc_failed;
> @@ -2122,7 +2154,7 @@ gnttab_setup_table(
>      }
>
>      if ( (op.nr_frames > nr_grant_frames(gt) ||
> -          ((gt->gt_version > 1) &&
> +          ((GNTTAB_MAX_VERSION >=3D 2) && (gt->gt_version > 1) &&
>             (grant_to_status_frames(op.nr_frames) > nr_status_frames(gt))=
)) &&
>           gnttab_grow_table(d, op.nr_frames) )
>      {
> @@ -2472,7 +2504,8 @@ gnttab_transfer(
>          grant_read_lock(e->grant_table);
>          act =3D active_entry_acquire(e->grant_table, gop.ref);
>
> -        if ( unlikely(evaluate_nospec(e->grant_table->gt_version !=3D ve=
r)) )
> +        if ( GNTTAB_MAX_VERSION >=3D 2 &&
> +             unlikely(evaluate_nospec(e->grant_table->gt_version !=3D ve=
r)) )
>          {
>              rc =3D -EILSEQ;
>              goto release;
> @@ -2538,12 +2571,13 @@ release_grant_for_copy(
>      act =3D active_entry_acquire(rgt, gref);
>      mfn =3D act->mfn;
>
> -    if ( evaluate_nospec(rgt->gt_version =3D=3D 1) )
> +    if ( GNTTAB_MAX_VERSION < 2 || evaluate_nospec(rgt->gt_version =3D=
=3D 1) )
>      {
>          status =3D &shared_entry_v1(rgt, gref).flags;
>          td =3D rd;
>          trans_gref =3D gref;
>      }
> +#if GNTTAB_MAX_VERSION >=3D 2
>      else
>      {
>          if ( evaluate_nospec(gref < nr_grant_entries(rgt)) )
> @@ -2552,6 +2586,7 @@ release_grant_for_copy(
>               ? rd : knownalive_domain_from_domid(act->src_domid);
>          trans_gref =3D act->trans_gref;
>      }
> +#endif /* GNTTAB_MAX_VERSION >=3D 2 */
>
>      if ( readonly )
>      {
> @@ -2566,13 +2601,15 @@ release_grant_for_copy(
>
>      reduce_status_for_pin(rd, act, status, readonly);
>
> +#if GNTTAB_MAX_VERSION >=3D 2
>      if ( !act->pin && act->is_sub_page )
>          atomic_dec(&rgt->nr_v2_ops);
> +#endif
>
>      active_entry_release(act);
>      grant_read_unlock(rgt);
>
> -    if ( td !=3D rd )
> +    if ( GNTTAB_MAX_VERSION >=3D 2 && td !=3D rd )
>      {
>          /*
>           * Recursive call, but it is bounded (acquire permits only a sin=
gle
> @@ -2593,8 +2630,11 @@ release_grant_for_copy(
>  static int
>  acquire_grant_for_copy(
>      struct domain *rd, grant_ref_t gref, domid_t ldom, bool readonly,
> -    mfn_t *mfn, struct page_info **page, uint16_t *page_off,
> -    uint16_t *length, bool allow_transitive)
> +    mfn_t *mfn, struct page_info **page
> +#if GNTTAB_MAX_VERSION >=3D 2
> +    , uint16_t *page_off, uint16_t *length, bool allow_transitive
> +#endif
> +    )
>  {
>      struct grant_table *rgt =3D rd->grant_table;
>      grant_entry_v2_t *sha2;
> @@ -2637,7 +2677,7 @@ acquire_grant_for_copy(
>          goto unlock_out;
>      }
>
> -    if ( evaluate_nospec(rgt->gt_version =3D=3D 1) )
> +    if ( GNTTAB_MAX_VERSION < 2 || evaluate_nospec(rgt->gt_version =3D=
=3D 1) )
>      {
>          sha2 =3D NULL;
>          status =3D &shah->flags;
> @@ -2652,6 +2692,7 @@ acquire_grant_for_copy(
>      barrier();
>
>      old_pin =3D act->pin;
> +#if GNTTAB_MAX_VERSION >=3D 2
>      if ( sha2 && (shflags & GTF_type_mask) =3D=3D GTF_transitive )
>      {
>          domid_t trans_domid;
> @@ -2786,8 +2827,10 @@ acquire_grant_for_copy(
>          else
>              atomic_dec(&rgt->nr_v2_ops);
>      }
> -    else if ( !old_pin ||
> -              (!readonly && !(old_pin & (GNTPIN_devw_mask|GNTPIN_hstw_ma=
sk))) )
> +    else
> +#endif /* GNTTAB_MAX_VERSION >=3D 2 */
> +    if ( !old_pin ||
> +         (!readonly && !(old_pin & (GNTPIN_devw_mask|GNTPIN_hstw_mask)))=
 )
>      {
>          unsigned long gfn;
>
> @@ -2828,23 +2871,29 @@ acquire_grant_for_copy(
>          if ( !act->pin )
>          {
>              act->domid =3D ldom;
> +            act->mfn =3D grant_mfn;
> +
> +#if GNTTAB_MAX_VERSION >=3D 2
>              act->is_sub_page =3D is_sub_page;
>              act->start =3D trans_page_off;
>              act->length =3D trans_length;
>              act->src_domid =3D rd->domain_id;
>              act->trans_gref =3D gref;
> -            act->mfn =3D grant_mfn;
>
>              if ( is_sub_page )
>                  atomic_inc(&rgt->nr_v2_ops);
> +#endif /* GNTTAB_MAX_VERSION >=3D 2 */
>          }
>          else if ( !mfn_eq(act->mfn, grant_mfn) ||
> +#if GNTTAB_MAX_VERSION >=3D 2
>                    act->src_domid !=3D rd->domain_id ||
>                    act->trans_gref !=3D gref ||
>                    (act->is_sub_page &&
>                     (!is_sub_page ||
>                      act->start !=3D trans_page_off ||
> -                    act->length !=3D trans_length)) )
> +                    act->length !=3D trans_length)) ||
> +#endif /* GNTTAB_MAX_VERSION >=3D 2 */
> +                  false )
>          {
>              put_page(*page);
>              *page =3D NULL;
> @@ -2881,8 +2930,10 @@ acquire_grant_for_copy(
>
>      act->pin +=3D pin_incr;
>
> +#if GNTTAB_MAX_VERSION >=3D 2
>      *page_off =3D act->start;
>      *length =3D act->length;
> +#endif
>      *mfn =3D act->mfn;
>
>      active_entry_release(act);
> @@ -3014,13 +3065,20 @@ static int gnttab_copy_claim_buf(const s
>          rc =3D acquire_grant_for_copy(buf->domain, ptr->u.ref,
>                                      current->domain->domain_id,
>                                      buf->read_only,
> -                                    &buf->mfn, &buf->page,
> -                                    &buf->ptr.offset, &buf->len,
> -                                    opt_transitive_grants);
> +                                    &buf->mfn, &buf->page
> +#if GNTTAB_MAX_VERSION >=3D 2
> +                                    , &buf->ptr.offset, &buf->len,
> +                                    opt_transitive_grants
> +#endif
> +                                    );
>          if ( rc !=3D GNTST_okay )
>              goto out;
>          buf->ptr.u.ref =3D ptr->u.ref;
>          buf->have_grant =3D 1;
> +#if GNTTAB_MAX_VERSION < 2
> +        buf->ptr.offset =3D 0;
> +        buf->len =3D PAGE_SIZE;
> +#endif
>      }
>      else
>      {
> @@ -3241,6 +3299,12 @@ gnttab_set_version(XEN_GUEST_HANDLE_PARA
>      if ( gt->gt_version =3D=3D op.version )
>          goto out_unlock;
>
> +    if ( GNTTAB_MAX_VERSION < 2 )
> +    {
> +        res =3D -EOPNOTSUPP;
> +        goto out_unlock;
> +    }
> +
>      /*
>       * Make sure that the grant table isn't currently in use when we
>       * change the version number, except for the first 8 entries which
> @@ -3270,6 +3334,7 @@ gnttab_set_version(XEN_GUEST_HANDLE_PARA
>          break;
>
>      case 2:
> +#if GNTTAB_MAX_VERSION >=3D 2
>          if ( atomic_read(&gt->nr_v2_ops) )
>          {
>              gdprintk(XENLOG_WARNING,
> @@ -3278,6 +3343,7 @@ gnttab_set_version(XEN_GUEST_HANDLE_PARA
>              res =3D -EAGAIN;
>              goto out_unlock;
>          }
> +#endif /* GNTTAB_MAX_VERSION >=3D 2 */
>
>          for ( i =3D 0; i < GNTTAB_NR_RESERVED_ENTRIES; i++ )
>          {
> @@ -3527,7 +3593,7 @@ swap_grant_ref(grant_ref_t ref_a, grant_
>          goto out;
>      }
>
> -    if ( evaluate_nospec(gt->gt_version =3D=3D 1) )
> +    if ( GNTTAB_MAX_VERSION < 2 || evaluate_nospec(gt->gt_version =3D=3D=
 1) )
>      {
>          grant_entry_v1_t shared;
>
> @@ -3945,7 +4011,7 @@ int gnttab_release_mappings(struct domai
>
>          act =3D active_entry_acquire(rgt, ref);
>          sha =3D shared_entry_header(rgt, ref);
> -        if ( rgt->gt_version =3D=3D 1 )
> +        if ( GNTTAB_MAX_VERSION < 2 || rgt->gt_version =3D=3D 1 )
>              status =3D &sha->flags;
>          else
>              status =3D &status_entry(rgt, ref);
> @@ -4120,7 +4186,7 @@ int mem_sharing_gref_to_gfn(struct grant
>          rc =3D -EINVAL;
>      else if ( ref >=3D nr_grant_entries(gt) )
>          rc =3D -ENOENT;
> -    else if ( evaluate_nospec(gt->gt_version =3D=3D 1) )
> +    else if ( GNTTAB_MAX_VERSION < 2 || evaluate_nospec(gt->gt_version =
=3D=3D 1) )
>      {
>          const grant_entry_v1_t *sha1 =3D &shared_entry_v1(gt, ref);
>
> @@ -4144,7 +4210,7 @@ int mem_sharing_gref_to_gfn(struct grant
>          rc =3D -ENXIO;
>      else if ( !rc && status )
>      {
> -        if ( evaluate_nospec(gt->gt_version =3D=3D 1) )
> +        if ( GNTTAB_MAX_VERSION < 2 || evaluate_nospec(gt->gt_version =
=3D=3D 1) )
>              *status =3D flags;
>          else
>              *status =3D status_entry(gt, ref);
> @@ -4275,7 +4341,7 @@ int gnttab_acquire_resource(
>          break;
>
>      case XENMEM_resource_grant_table_id_status:
> -        if ( gt->gt_version !=3D 2 )
> +        if ( GNTTAB_MAX_VERSION < 2 || gt->gt_version !=3D 2 )
>              break;
>
>          /* Check that void ** is a suitable representation for gt->statu=
s. */
> @@ -4327,7 +4393,8 @@ int gnttab_map_frame_begin(
>
>      grant_write_lock(gt);
>
> -    if ( evaluate_nospec(gt->gt_version =3D=3D 2) && (idx & XENMAPIDX_gr=
ant_table_status) )
> +    if ( GNTTAB_MAX_VERSION >=3D 2 && evaluate_nospec(gt->gt_version =3D=
=3D 2) &&
> +         (idx & XENMAPIDX_grant_table_status) )
>      {
>          idx &=3D ~XENMAPIDX_grant_table_status;
>          rc =3D gnttab_get_status_frame_mfn(d, idx, mfn);
> @@ -4395,7 +4462,7 @@ static void gnttab_usage_print(struct do
>
>          sha =3D shared_entry_header(gt, ref);
>
> -        if ( gt->gt_version =3D=3D 1 )
> +        if ( GNTTAB_MAX_VERSION < 2 || gt->gt_version =3D=3D 1 )
>          {
>              status =3D sha->flags;
>              frame =3D shared_entry_v1(gt, ref).frame;
> --- a/xen/include/xen/grant_table.h
> +++ b/xen/include/xen/grant_table.h
> @@ -39,7 +39,16 @@ void gnttab_seed_entry(const struct doma
>
>  #ifdef CONFIG_GRANT_TABLE
>
> +#ifndef GNTTAB_MAX_VERSION
> +#define GNTTAB_MAX_VERSION 2
> +#endif
> +
> +#if GNTTAB_MAX_VERSION >=3D 2
>  extern unsigned int opt_gnttab_max_version;
> +#else
> +# define opt_gnttab_max_version GNTTAB_MAX_VERSION
> +#endif
> +
>  extern unsigned int opt_max_grant_frames;
>
>  /* Create/destroy per-domain grant table context. */
>
>

Best regards,
Mykola

