Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 987DEC982CC
	for <xen-devel@archiver.kernel.org>; Thu, 17 Sep 2026 02:24:56 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1423584.1648583 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x71nb-00070a-6O; Thu, 17 Sep 2026 02:24:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1423584.1648583; Thu, 17 Sep 2026 02:24:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x71nb-00070T-3i; Thu, 17 Sep 2026 02:24:31 +0000
Received: by outflank-mailman (input) for mailman id 1423584;
 Thu, 17 Sep 2026 02:24:29 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <alexei.starovoitov@gmail.com>) id 1x71nZ-000707-7l
 for xen-devel@lists.xenproject.org; Thu, 17 Sep 2026 02:24:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x71nY-009bPy-1y
 for xen-devel@lists.xenproject.org; Thu, 17 Sep 2026 04:24:28 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <alexei.starovoitov@gmail.com>)
 id 6aab4f16-2eae-0a2a0a5409dd-0a2a4507a710-40
 for <xen-devel@lists.xenproject.org>; Thu, 17 Sep 2026 04:24:27 +0200
Received: from [74.125.227.140] (helo=mail-pj2-f12.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <alexei.starovoitov@gmail.com>)
 id 6aab4f5a-b4ea-0a2a45070019-4a7de38cae57-3
 for <xen-devel@lists.xenproject.org>; Thu, 17 Sep 2026 04:24:27 +0200
Received: by mail-pj2-f12.google.com with SMTP id
 d9443c01a7336-2d8fbef5018so3501315ad.0
 for <xen-devel@lists.xenproject.org>; Wed, 16 Sep 2026 19:24:27 -0700 (PDT)
Received: from localhost ([153.61.198.242]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2dd89ee3557sm18694235ad.52.2026.09.16.19.24.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Sep 2026 19:24:24 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="In-Reply-To:References:From:Subject:Cc:To:Message-Id:Date:Content-Type:Content-Transfer-Encoding:Mime-Version"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789611865; x=1790216665; darn=lists.xenproject.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6EKmqByiGxzJPh+0Mll6vjXYdVK/vy8pIRVPNPfe0KQ=;
        b=Qbs97lxuRnHpH/1qrNb6G5MqmINkr1NB28fcEfYBl76byCnkR+lk/or2KCjMXAPwmN
         FnZZy1WVRVoc6YDQrYkuEc6tXLUaBmA+eUNuibFKeeV8SUxvysprfSxR7UTdjdcN5WOa
         cgchJXLeNfazT7gOiCYml/oY8kPWHtgw7huQRF9+bOf7P4D0SAjUBqtMmB9rutnQifP9
         91h5kLF5Rs6U9uCBgAxlOOneAP9rdMeWMeBeyxpCInSVkgo/593W+m6C97q7ZWc1Zomd
         kTdNH4mIRiMiHSxajimgMWUk0KzXas9JroULXrd/64N2fSGdUuFG/5kDs1NgUyt84bcH
         h/Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789611865; x=1790216665;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6EKmqByiGxzJPh+0Mll6vjXYdVK/vy8pIRVPNPfe0KQ=;
        b=pgS8eGwPYM+whD/Uqwt7TwTyX2IkaVjmWykuXPZKngt5h3x5uz1kxZ/I5lE/e9RNfX
         sovOEEp+xa8q/kNo7xUJBqqgTpgiVF9jIIsNsMTikgsTURenRn1dVa+rEQeXVG3qhHcc
         gGxWvkS+LlTWu1KwjW85X2q//B4LpYoLPDYdhI/U49mszbKw0vNFMsBSd7hANfnIPNvi
         BdULE6+v6qlmp5Plq/wgXczNXMkzeabyKsFrl3hObYC7rfDpQiHy0r+22nWBFjuy0F16
         x5mtI3HAG/8YdMMma3Dm6IUGmbL1Ck+IeBiIFd7LWMu8zc8yPr2eXVJium+WixY4G3eT
         pjAQ==
X-Forwarded-Encrypted: i=1; AKwUvBzAqb/+uebX8uSxnzCjgVZDZFa5F8I4MKKJ9npgGN9gD3aXpQPdrB/Pv0LDd0Ll7bO0w5DXyNfsAFE=@lists.xenproject.org
X-Gm-Message-State: AFuF++mB6+rb57cuxd+uxihxWQ0egG/gLcM7KCSCPKFv/U8rhPhDg/aC
	CvVonR+3GJByNK1nNPdTMAjDES7aRqBuE2ch/XqrEvZjB8DuRfP55Q78
X-Gm-Gg: AYBFou1/qJRFFF7rr1WCwKW6Qy0NQlF6jP9NsCGQBR99GlS2KIIfKHK4wtV8zR+8wfH
	ub68/sdU4aO6O+aBNV7cYWPmzV+ofNxIzlMV9JJAJO/Uc8IasG97DT8PltmOCJMjxfPyI1DPXa/
	wJtrnaRKi258zEvi4P8YkxY1QTCj79YIo4nlPYP7zCfGZHDf2v+hFJtqhy2Vc/CVRJk+200o9uU
	0+YuNhyhNtKCm/ekGUJYGSE9fdSNnEds46BRVfBMgksTLcuGf4+MS1PP6NLX3QUN9DNJNt4EEN5
	GhGJtf4E6Hxf61NQYnx4gpOORa8q/PoeAnw1uBDLKxms2ALidp8svsIL7STwGs4yoezzEXgf/QF
	4/RhJuKQX2D3WJiF/XYMHw1tMhyHGTRozG0kOT3kQqnFANlD48KEv+2uJMmYkfMuNfVlvZxkjIO
	8scPaXeuNhDU3pPfxoAAm6JW07G3QlTg1FDjXchdVzk1B5yAyaTWQWQaztjH+sVRQyyyc9y3UvE
	JN8+hbxg56oSkR1r1tZd1126MAHoYdDEPhDUsVYYZ8WDV9kHDWx2mAFZWvAgy1K4hUAotjyXgTO
	hCYn
X-Received: by 2002:a17:903:1ac7:b0:2dd:60d:8b7c with SMTP id d9443c01a7336-2dd8e3f57f8mr114351815ad.13.1789611865419;
        Wed, 16 Sep 2026 19:24:25 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 17 Sep 2026 02:24:24 +0000
Message-Id: <DLH8GKM4B06Y.3HTSEM5YGFR5D@gmail.com>
To: "Josef Bacik" <josef@toxicpanda.com>
Cc: "Paul E. McKenney" <paulmck@kernel.org>, "Frederic Weisbecker"
 <frederic@kernel.org>, "Neeraj Upadhyay" <neeraj.upadhyay@kernel.org>,
 "Joel Fernandes" <joelagnelf@nvidia.com>, "Boqun Feng" <boqun@kernel.org>,
 "Thomas Gleixner" <tglx@kernel.org>, "Peter Zijlstra"
 <peterz@infradead.org>, "Steven Rostedt" <rostedt@goodmis.org>, "Masami
 Hiramatsu" <mhiramat@kernel.org>, "Mark Rutland" <mark.rutland@arm.com>,
 "Jiri Olsa" <jolsa@kernel.org>, "Alexei Starovoitov" <ast@kernel.org>,
 "Daniel Borkmann" <daniel@iogearbox.net>, "Andrii Nakryiko"
 <andrii@kernel.org>, <x86@kernel.org>, "Catalin Marinas"
 <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>, "Puranjay
 Mohan" <puranjay@kernel.org>, "Xu Kuohai" <xukuohai@huaweicloud.com>, "Andy
 Lutomirski" <luto@kernel.org>, "Josh Triplett" <josh@joshtriplett.org>,
 "Uladzislau Rezki" <urezki@gmail.com>, "Mathieu Desnoyers"
 <mathieu.desnoyers@efficios.com>, "Lai Jiangshan" <jiangshanlai@gmail.com>,
 "Zqiang" <qiang.zhang@linux.dev>, "Juergen Gross" <jgross@suse.com>, "Luis
 Chamberlain" <mcgrof@kernel.org>, "Ihor Solodrai"
 <ihor.solodrai@linux.dev>, <linux-kernel@vger.kernel.org>,
 <rcu@vger.kernel.org>, <linux-trace-kernel@vger.kernel.org>,
 <bpf@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH RFC v3 06/13] bpf: Take a Tasks Trace reader in the
 trampoline glue
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
X-Mailer: aerc 0.17.0
References: <20260915-b4-rcu-tasks-preempt-qs-v3-0-0ad30c4c5ee7@toxicpanda.com> <20260915-b4-rcu-tasks-preempt-qs-v3-6-0ad30c4c5ee7@toxicpanda.com> <DLGFJY2ZSY5M.11K7HK2CLM6I9@gmail.com> <a51c15af0d61414aa780e7646b8e74cd.josef@toxicpanda.com>
In-Reply-To: <a51c15af0d61414aa780e7646b8e74cd.josef@toxicpanda.com>
X-purgate-ID: tlsNG-ef75cf/1789611867-A48C9AE4-C3958146/0/0
X-purgate-type: clean
X-purgate-size: 1284

On Thu Sep 17, 2026 at 1:16 AM UTC, Josef Bacik wrote:
> On Wed, 16 Sep 2026 03:45:16 +0000, Alexei Starovoitov wrote:
> > On Tue Sep 15, 2026 at 1:17 PM UTC, Josef Bacik wrote:
> > >  	__acquires(RCU)
> > >  {
> > > +	bpf_tramp_read_lock_trace();
> > >  	rcu_read_lock_dont_migrate();
> >
> > This is double increment. rcu_read_lock_dont_migrate() includes
> > rcu_read_lock_trace().
>
> Unless I'm looking at the wrong tree it doesn't, on Linus' master and on
> bpf-next it is
>
> 	static __always_inline void rcu_read_lock_dont_migrate(void)
> 	{
> 		if (IS_ENABLED(CONFIG_PREEMPT_RCU))
> 			migrate_disable();
> 		rcu_read_lock();
> 	}
>
> so plain RCU plus migrate_disable(), no Tasks Trace reader. That is why
> the non-sleepable glue needs one added here: on these architectures the
> trampoline image the glue returns into is only kept alive by Tasks RCU
> while the task is a rcu_read_lock_trace() reader, and rcu_read_lock()
> does not give us that.

Right. I got confused. Since rcu_read_lock_trace() CS will cover
both sleepable and non-sleepable prog types let's do it once
per fentry+fmod_ret region and 2nd time for fexit region.

We probably don't want to hold it for the whole trampoline,
since orig_call will delay freeing of progs.

