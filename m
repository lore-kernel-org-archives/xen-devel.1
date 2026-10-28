Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC3060A2611
	for <xen-devel@archiver.kernel.org>; Wed, 28 Oct 2026 15:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=QTGar9co
Received: from list by lists.xenproject.org with outflank-mailman.1463422.1674309 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xM5hA-000319-3x; Wed, 28 Oct 2026 15:36:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1463422.1674309; Wed, 28 Oct 2026 15:36:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xM5hA-000312-0k; Wed, 28 Oct 2026 15:36:08 +0000
Received: by outflank-mailman (input) for mailman id 1463422;
 Wed, 28 Oct 2026 15:36:06 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <irogers@google.com>) id 1xM5h8-00030w-E8
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 15:36:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xM5h7-006YO9-H2
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 16:36:05 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <irogers@google.com>)
 id 6ae21664-e002-0a2a0a5209dd-0a2a4509c304-4
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 16:36:05 +0100
Received: from [209.85.160.175] (helo=mail-qt1-f175.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <irogers@google.com>)
 id 6ae21664-be1a-0a2a45090019-d155a0af90f2-3
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 16:36:05 +0100
Received: by mail-qt1-f175.google.com with SMTP id
 d75a77b69052e-533202fe429so405231cf.0
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 08:36:05 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=google.com header.i="@google.com" header.h="Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1793201764; cv=none;
        d=google.com; s=arc-20260327;
        b=pHwFfC54MLk0FkwSLIFff7GNwNktvrDXyhH1QbjlN44qqcUEZb93P7CyZ7zPCKnIU6
         XI3DtdjkyOYkOTMFWzhbjRxZkjPyVkctX5IeLbWgUf/AL21iSCyF4MbBque42jjg04m8
         0swtXvzEEhswYdnJqTME8YA7vFKcFbU1nunqWK6S1iKVOijNuqsdQpkdkaPUHxJl0Su/
         56SJuoFaGM9yUeYtJqwF7y2gw2zTiQ7SZSDnL759MBKO++YwIHO6Tr1zXMS46cK1NLd8
         09F2cVgw9JWXNSftb0wB+dLETTm+5UHsoMCDRVt+wzKFsHCuRYQlsi4/keAhbyYaG/YM
         wPfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IMDYK1ZjnbIiPQHcJc7SpOjyQ4Wy/ZaG15fuBEkM+6c=;
        fh=gA55tpGH41ASjpYEidKOLVWzMB3TiUGmX/pFMFevwYM=;
        b=rVjl8D4coHtvfW/uGqPozkJhaQyjBr92beVgDTRnrikB/yKY4SpgJp0ve9ZFDANyUm
         QxrRXu5onfrtcAUipAkseuYRb/msVS+SdouSoIQIs9gP2T8PjJbDVEznZKHlahAGvaCz
         KeLmKs4BykX3a4WtPI/+Hz4kZUQIzYtp5sXsZ8hr98le6GoT3olmB2ifY3a561KtrveQ
         Y0q1mnl8+HTRdwIYytJd8Em+33u1NUzGAo0mB3ZEVlPz/eDk2X0fAftwI2sEilDVRk/9
         OTHURFSOyRDqJkPtS37h9vi0pjC9DoGC8naFvHOinBAYnBa6Kj5chiAcU6H/9QDF+ZKe
         QEHQ==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793201764; x=1793806564; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IMDYK1ZjnbIiPQHcJc7SpOjyQ4Wy/ZaG15fuBEkM+6c=;
        b=QTGar9coGFkNhQ8rsE8dZTc+N0eEIzbTB/kHnR+rLP0ar0vHHxsFT18TiuAhBUa526
         1J4Ny7iQSXYnW7s+1jBhfHRn1+Hj5xKCO39YQXZQhtV9vwq76W7c2jwsgeBylrExX3h8
         7dOHxSgzEs10vcUIAKYVNPpTlmPgk6oq2qu0KooFNzE1NiRq4oajFxybKfTE6PNiZO+/
         PgKhrKSHVy2SCeQwLJAOU36gCfcVxHGf1Ly/pIbm3nVl/bUVXO5QKrZFMHfkWCdZEt4e
         LTVNnXjXiZiWJh1rUzSIEUTpwa2qHe1DhUOJYmZwPXVHjwa617aP3e3dglpyf9hS/Vh6
         LPFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793201764; x=1793806564;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IMDYK1ZjnbIiPQHcJc7SpOjyQ4Wy/ZaG15fuBEkM+6c=;
        b=muzMdkfezcCj8aoi7+3Bw642nSOqt4Edt5SxMSXfCPyHBPmPefHdEguBVKnLQES1bn
         wpI6JasuNHcWzYHsBMQdQrXxX2x/mAqntByLzcauBSB8NzE6o6w2LFhYrKjOZKJcfTO1
         TOqpG+Q1efPvlBBkJHRyT2pwT5Pbjd4rjzg5VKTXLDh2b/b/Nj9r9T2UtQmPzAoKivnw
         VUZZR2LSt7m2V+nj/I0IdTq91J6CM1tjQlu9Daf7e44akJgWUCAY0BfFOJvBMNXeeiM6
         GabIKDisJUMZ3NUCSHB/dbwhi+cQwE7kwXyGBn2uHp+xeYEKAtLljIj0oV/dwR4wSend
         W/Sw==
X-Forwarded-Encrypted: i=1; AKwUvBz3itPp2znGB1wl77CJ/D9hbHWjuUgUtZzq7LKDvOVjDLJzB4uPvalyKmHtBNMGjZ6/ZrPnW7yC5YY=@lists.xenproject.org
X-Gm-Message-State: AFq9FYIUmBc6TLzakF/I8eEHwiluA7mxiv3jRL7/5JfLYuYMnVMkpWZo
	xNbrcTW914Zkxomb06FGc2ww4Fm4BFIJdZ7CH4vZoWTyAMGt76PPe7X5L3NJUV4qQTbja8zhae/
	wW9K+ZY7FknxJqZJGo9WDkOx1tECbdSt/z7s2al/f
X-Gm-Gg: AYBFou08vrDuAzTg6TvCkt71rHgYY1mohJwhdbsh+bb9xz2ttJSPgl+MHb6kHWARYlt
	ZwDzuK5cJ14il0luHbI6hjCx5MTWfHEuJw3Z0VM690yQrTG6tTUqeEyP9HG/9MWeH2eXdga5RJ5
	q4boRxakkmfiwiKI6zWb3y3kudGE6ORXhI1OCfR8f5YwqNl+A7w5SNAv0w1I7Q1zoZw2YHua09B
	xcPPbINbmlnmWGbm2/O2N+qC/giMeXZKtUbBwBEEMtH5r3SYaRHkNoMteC6tXUjcfAbDRLyDxKh
	+rjL+D/zfr64hpZhXutmgCZriq+SyPexZtokoPjq7Irst4yK5Lm4PBU43a+Wkv1fUXb9Kj2aGNk
	zpazMeoTcNtH96ZlQgow3HBlln+KveUF9dvx/9R/vyog4STeMzgYwgFCIjcY=
X-Received: by 2002:a05:622a:22a9:b0:536:97c0:dcd0 with SMTP id
 d75a77b69052e-53fc2aa1fa2mr21345071cf.4.1793201763129; Wed, 28 Oct 2026
 08:36:03 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261027223847.652884-1-irogers@google.com> <20261027223847.652884-5-irogers@google.com>
 <CAJZ5v0juvZ2ZVRBkY6FxBM=NhPt9vMA3+yRugXc5u=U1jO9AXg@mail.gmail.com>
In-Reply-To: <CAJZ5v0juvZ2ZVRBkY6FxBM=NhPt9vMA3+yRugXc5u=U1jO9AXg@mail.gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Wed, 28 Oct 2026 08:35:50 -0700
X-Gm-Features: AclHuK8Z1SdNi4k8-UQceLsnqDJD6d9aTo0cl8IQ7vlO1Fmucv2n8goL0VFX4iw
Message-ID: <CAP-5=fWVZ=7-qDRODiEQzRzhpQqribv9Morj=OoAXW_6uaW2dA@mail.gmail.com>
Subject: Re: [PATCH v2 4/9] cpufreq: governor: Initialize kobj_type release
 callback statically
To: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Cc: Kees Cook <kees@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Zhihao Cheng <chengzhihao1@huawei.com>, Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>, 
	Sumanth Korikkar <sumanthk@linux.ibm.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, driver-core@lists.linux.dev, llvm@lists.linux.dev, 
	linux-hardening@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-pm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-sh@vger.kernel.org, linux-s390@vger.kernel.org, gfs2@lists.linux.dev, 
	xen-devel@lists.xenproject.org, linux-mtd@lists.infradead.org, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-bad1c0/1793201765-FD06B034-E68C906D/0/0
X-purgate-type: clean
X-purgate-size: 5277
X-Spam-Status: No, score=-23.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_IN_DEF_DKIM_WL autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Oct 28, 2026 at 4:39=E2=80=AFAM Rafael J. Wysocki (Intel)
<rafael@kernel.org> wrote:
>
> On Tue, Oct 27, 2026 at 11:39=E2=80=AFPM Ian Rogers <irogers@google.com> =
wrote:
> >
> > Export cpufreq_dbs_data_release() and set .kobj_type.release statically
> > in the ondemand and conservative governors so their gov_attr_set
> > kobjects have a valid release callback statically initialized, matching
> > cpufreq_governor_dbs. Remove the redundant runtime assignment in
> > cpufreq_dbs_governor_init().
> >
> > This prepares for annotating struct kobj_type::release with
> > __must_init.
> >
> > Signed-off-by: Ian Rogers <irogers@google.com>
>
> Do you want stuff to be picked up by maintainers, or do you want to
> route it yourself?

Hi Rafael,

Just a quick note: I agree with Zhongqiu's feedback and the commit
message needs a fix.

Regarding merging the patches, the issue with maintainers picking up
fixes is that the series will break the clang/llvm build without them.
So the maintainers need to either merge the patches (and the series be
rebased on top of them) or merge the series as a unit. Perhaps since
the patches align, merge conflicts won't happen, so maintainers
merging and landing the series is okay. I don't have the experience to
know.

Thanks,
Ian

> > ---
> >  drivers/cpufreq/cpufreq_conservative.c | 5 ++++-
> >  drivers/cpufreq/cpufreq_governor.c     | 4 ++--
> >  drivers/cpufreq/cpufreq_governor.h     | 1 +
> >  drivers/cpufreq/cpufreq_ondemand.c     | 5 ++++-
> >  4 files changed, 11 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/cpufreq/cpufreq_conservative.c b/drivers/cpufreq/c=
pufreq_conservative.c
> > index 02bfd46543e9..146a2353b1a2 100644
> > --- a/drivers/cpufreq/cpufreq_conservative.c
> > +++ b/drivers/cpufreq/cpufreq_conservative.c
> > @@ -318,7 +318,10 @@ static void cs_limits(struct cpufreq_policy *polic=
y)
> >
> >  static struct dbs_governor cs_governor =3D {
> >         .gov =3D CPUFREQ_DBS_GOVERNOR_INITIALIZER("conservative"),
> > -       .kobj_type =3D { .default_groups =3D cs_groups },
> > +       .kobj_type =3D {
> > +               .release =3D cpufreq_dbs_data_release,
> > +               .default_groups =3D cs_groups,
> > +       },
> >         .gov_dbs_update =3D cs_dbs_update,
> >         .alloc =3D cs_alloc,
> >         .free =3D cs_free,
> > diff --git a/drivers/cpufreq/cpufreq_governor.c b/drivers/cpufreq/cpufr=
eq_governor.c
> > index f3bd3dbe7c41..f8b5aca09b6b 100644
> > --- a/drivers/cpufreq/cpufreq_governor.c
> > +++ b/drivers/cpufreq/cpufreq_governor.c
> > @@ -419,7 +419,7 @@ static void free_policy_dbs_info(struct policy_dbs_=
info *policy_dbs,
> >         gov->free(policy_dbs);
> >  }
> >
> > -static void cpufreq_dbs_data_release(struct kobject *kobj)
> > +void cpufreq_dbs_data_release(struct kobject *kobj)
> >  {
> >         struct dbs_data *dbs_data =3D to_dbs_data(to_gov_attr_set(kobj)=
);
> >         struct dbs_governor *gov =3D dbs_data->gov;
> > @@ -427,6 +427,7 @@ static void cpufreq_dbs_data_release(struct kobject=
 *kobj)
> >         gov->exit(dbs_data);
> >         kfree(dbs_data);
> >  }
> > +EXPORT_SYMBOL_GPL(cpufreq_dbs_data_release);
> >
> >  int cpufreq_dbs_governor_init(struct cpufreq_policy *policy)
> >  {
> > @@ -488,7 +489,6 @@ int cpufreq_dbs_governor_init(struct cpufreq_policy=
 *policy)
> >         policy->governor_data =3D policy_dbs;
> >
> >         gov->kobj_type.sysfs_ops =3D &governor_sysfs_ops;
> > -       gov->kobj_type.release =3D cpufreq_dbs_data_release;
> >         ret =3D kobject_init_and_add(&dbs_data->attr_set.kobj, &gov->ko=
bj_type,
> >                                    get_governor_parent_kobj(policy),
> >                                    "%s", gov->gov.name);
> > diff --git a/drivers/cpufreq/cpufreq_governor.h b/drivers/cpufreq/cpufr=
eq_governor.h
> > index 806d8fb4dff1..1026712bb79b 100644
> > --- a/drivers/cpufreq/cpufreq_governor.h
> > +++ b/drivers/cpufreq/cpufreq_governor.h
> > @@ -150,6 +150,7 @@ static inline struct dbs_governor *dbs_governor_of(=
struct cpufreq_policy *policy
> >  }
> >
> >  /* Governor callback routines */
> > +void cpufreq_dbs_data_release(struct kobject *kobj);
> >  int cpufreq_dbs_governor_init(struct cpufreq_policy *policy);
> >  void cpufreq_dbs_governor_exit(struct cpufreq_policy *policy);
> >  int cpufreq_dbs_governor_start(struct cpufreq_policy *policy);
> > diff --git a/drivers/cpufreq/cpufreq_ondemand.c b/drivers/cpufreq/cpufr=
eq_ondemand.c
> > index 9942dbb38dae..7386d043c665 100644
> > --- a/drivers/cpufreq/cpufreq_ondemand.c
> > +++ b/drivers/cpufreq/cpufreq_ondemand.c
> > @@ -374,7 +374,10 @@ static struct od_ops od_ops =3D {
> >
> >  static struct dbs_governor od_dbs_gov =3D {
> >         .gov =3D CPUFREQ_DBS_GOVERNOR_INITIALIZER("ondemand"),
> > -       .kobj_type =3D { .default_groups =3D od_groups },
> > +       .kobj_type =3D {
> > +               .release =3D cpufreq_dbs_data_release,
> > +               .default_groups =3D od_groups,
> > +       },
> >         .gov_dbs_update =3D od_dbs_update,
> >         .alloc =3D od_alloc,
> >         .free =3D od_free,
> > --
> > 2.56.0.313.g2479322e68-goog
> >
> >

