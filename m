Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64023C982D6
	for <xen-devel@archiver.kernel.org>; Thu, 17 Sep 2026 16:36:00 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1424291.1648864 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7F5A-0007gK-TM; Thu, 17 Sep 2026 16:35:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1424291.1648864; Thu, 17 Sep 2026 16:35:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7F5A-0007gD-QC; Thu, 17 Sep 2026 16:35:32 +0000
Received: by outflank-mailman (input) for mailman id 1424291;
 Thu, 17 Sep 2026 16:35:31 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <josef@toxicpanda.com>) id 1x7F59-0007g7-Do
 for xen-devel@lists.xenproject.org; Thu, 17 Sep 2026 16:35:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x7F58-00EGwx-Qr
 for xen-devel@lists.xenproject.org; Thu, 17 Sep 2026 18:35:30 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6aac16ac-2eae-0a2a0a5409dd-0a2a4508ecd2-20
 for <xen-devel@lists.xenproject.org>; Thu, 17 Sep 2026 18:35:30 +0200
Received: from [74.125.230.205] (helo=mail-qk2-f13.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6aac16d1-f659-0a2a45080019-4a7de6cd8479-3
 for <xen-devel@lists.xenproject.org>; Thu, 17 Sep 2026 18:35:30 +0200
Received: by mail-qk2-f13.google.com with SMTP id
 d75a77b69052e-530e2f50d01so11301601cf.0
 for <xen-devel@lists.xenproject.org>; Thu, 17 Sep 2026 09:35:30 -0700 (PDT)
Received: from toxicpanda.com (ec2-34-228-114-98.compute-1.amazonaws.com.
 [34.228.114.98]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-5326208ea78sm56756741cf.24.2026.09.17.09.35.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Sep 2026 09:35:27 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=toxicpanda.com header.i="@toxicpanda.com" header.h="Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:From:Message-ID:Date"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1789662929; x=1790267729; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BF23L7IjgM1pfHyM3ghg4jPhGbV/DtVtyTw2lo+n/XU=;
        b=K7n1gBHRIRkHaxBSPi3oarOq3WgVPhj/Snsh3mNCAutc5DWdbn6l7mF8uMkc0Qwmg0
         y7h+aR4d3IkZnvgBUPRPjAAetjUuaEyrwSbFoaPQWe4ivL7EUAnF56B13iH+6HgEEHaC
         mR5nbV8TMbVbxlcy0BNruFUe+kpFFfIiu10V562t21HG+UNsrfwUATU6WienZJUzDwQC
         6QEJRx2H7BUXiWl4BKPCF9I17p69Kxj27IMa7Pnm8S1DlQVs9hnJ8r9AlvU7sz+Anauc
         Dow7fKlN/98ZBb5c/Ieb4I2SEHCPFh154F5P2MozrFOptbn6ndNTTP+eyOgBHTylDx1n
         nDLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789662929; x=1790267729;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BF23L7IjgM1pfHyM3ghg4jPhGbV/DtVtyTw2lo+n/XU=;
        b=OZ7BEuSY1lUhtVHw1pVvJ/LBRP65DKUUVqGBEzsh6BUqhT1ueVEXhvS352RSrFT/JH
         GKOcFoZJa3h6gn67fb3fy+oVPkeD5e4UnxcWxlSZXRHoNd0r0w0PtcLnMKs7yMtQQmKu
         0rwioDDT17DOUVj9DPktkL4h5kEzm5qIlbug7nttcagOAEzW8x06jtjGStO9GeJBnNMx
         uJt/of66xIOIZe2pU5sqNVxEGpFkhIfG8d3jBz2ndG/9ECy10fOt8zT2VKNxqysjg+hj
         Q/d+wsUa8u+0166E23/TpbdOJLjcrA4T+jWVRfP3R8Vx/2GY6ZjuI944T8CeVmNRFulC
         XkHA==
X-Forwarded-Encrypted: i=1; AKwUvBwv8k+09Q5VzZsuwMLU4uvvi+whhhKONkjkOzNhLVSJote87/LtaFp5JyVmSvuBY6/l+C6qyUJEhAo=@lists.xenproject.org
X-Gm-Message-State: AFuF++kj7c8LtWMWGz20vmFpDJK53u0t1CJ1JOBZjkn7fdEn4StPXqPR
	0CnjqIDUBG3FhwUWlFHelzJxfvIKfRvFZMJnA1bC+YdCMnbR3gbjR0w5Jz+YcNRZN7g=
X-Gm-Gg: AYBFou1Bdp8szR1epHriFW8J9NDHIRwIiDejSVm4cFQ+0mWaS6viwTIpi0I8mU4rfJP
	lYZuj/Im45P77DtmTd9erXZ+aS3jceztE6HujKrb0XJzc+oJluhSZ+Ob6q1qD8J633DqMHMf32c
	Tk6N+YSziF3R05cm5fgHadgJbaHpIUgs5dYM9Uaka5vPuO6Kpc8BCx1BlyPdVwhmMynJm582yA6
	9m6Dl2g+gxvgDP8qvv/gmER5D0IXgdC9KX3QLz9HKl3q55Atm+NQGrjj1ddEOwPR7LGvttuwWAr
	qLGqI3jH47+5laR9gfqRoxIW79OEHrEikQMn+1gcmdsp6OgBy4j8yvIYzvy/lxLB1f5Q43SoFJN
	K09LP9FeAMgCOvcPDrua361errnUsOjiNjGBRrc0ZeAF9wSSct3yBq/lRloWgv+ZY5kQsDyAYrd
	+fwQUACIBbvwDkfuP4s1giLIUgF6Hrq7qkPZxTVlOUPn4z2CUWXn+Z30k7CWQCEolNlMqPXt22b
	QM21cYaDAtnyyFLJzEubi7U4Kk2t+h9YaPITECoW6VdKmFJab6fP6mc
X-Received: by 2002:a05:622a:1ba0:b0:530:b2e1:2f3b with SMTP id d75a77b69052e-5329b61d526mr11929121cf.50.1789662928648;
        Thu, 17 Sep 2026 09:35:28 -0700 (PDT)
Date: Thu, 17 Sep 2026 16:35:19 +0000
Message-ID: <c51591e0e96c837bcd762c207e5e1869.josef@toxicpanda.com>
From: Josef Bacik <josef@toxicpanda.com>
To: "Paul E. McKenney" <paulmck@kernel.org>, Frederic Weisbecker <frederic@kernel.org>
Cc: Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Boqun Feng <boqun@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, x86@kernel.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Puranjay Mohan <puranjay@kernel.org>, Xu Kuohai <xukuohai@huaweicloud.com>, 
	Andy Lutomirski <luto@kernel.org>, Josh Triplett <josh@joshtriplett.org>, 
	Uladzislau Rezki <urezki@gmail.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Lai Jiangshan <jiangshanlai@gmail.com>, Zqiang <qiang.zhang@linux.dev>, 
	Juergen Gross <jgross@suse.com>, Luis Chamberlain <mcgrof@kernel.org>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, linux-kernel@vger.kernel.org, rcu@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, bpf@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH RFC v3 03/13] rcu-tasks: Add a Tasks RCU implementation for reader-marked trampolines
In-Reply-To: <8fea176a-0ca0-4a70-8cf9-8240a22359e4@paulmck-laptop>
References: <20260915-b4-rcu-tasks-preempt-qs-v3-0-0ad30c4c5ee7@toxicpanda.com> <20260915-b4-rcu-tasks-preempt-qs-v3-3-0ad30c4c5ee7@toxicpanda.com> <aqlgxKGk_AEKls_1@localhost.localdomain> <edc7cca2-a5c5-455c-8969-ea05dbdb08f7@paulmck-laptop> <aqqONH8flTIpOUqT@localhost.localdomain> <91687748-0781-4133-baed-43cf82f35ff5@paulmck-laptop> <aqqpRoTfywUuTgoC@localhost.localdomain> <aqqsAUVV8a1yrQzX@localhost.localdomain> <6afb0afe-e7b8-46b4-9fea-2c7cf4791044@paulmck-laptop> <aqq0cwvRDsorGwgc@localhost.localdomain> <8b73e1b3-0580-4ba9-b2e0-6363e429808d@paulmck-laptop> <aqvZwfUVsiEI7q7y@localhost.localdomain> <8fea176a-0ca0-4a70-8cf9-8240a22359e4@paulmck-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1789662930-CC37587B-4F69848E/0/0
X-purgate-type: clean
X-purgate-size: 1270

On Thu, 17 Sep 2026 08:40:10 -0700, Paul E. McKenney wrote:
> On Thu, Sep 17, 2026 at 02:14:57PM +0200, Frederic Weisbecker wrote:
> > You're right. So we'll indeed need to reuse the deferred qs points here.
>
> Except this is getting a bit involved.
>
> Don't get me wrong, if Josef is happy to take this on, far be it from me
> to stand in his way.  But if not, we should be willing to treat this
> optimization as a follow-on effort, whether by Josef or someone else.

Follow-on works for me. For what it's worth 03/13 is already fairly
close to what Frederic describes, just outside the core flavor: no
task-list scan (the GP waits per CPU for a pass through __schedule() or
an EQS), the irq-exit preemption path checks the interrupted IP and
queues the task as a holdout before the switch, and the holdout is keyed
on where the task was interrupted so nothing is needed from the
trampoline tail. Moving that IP check into the tick / rcu_exp_handler() /
deferred-QS paths and reusing the blocked-tasks list is something I'm
happy to look at once this has settled.

v4 will pick up Alexei's ask (reader emitted by the BPF JIT around the
fentry and fexit regions rather than in the glue) and the idle-CPU hole
Sashiko found.

Thanks,

Josef

