Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C806C982E0
	for <xen-devel@archiver.kernel.org>; Fri, 18 Sep 2026 14:50:20 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1425507.1649482 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7Zuj-0007Sf-Kj; Fri, 18 Sep 2026 14:50:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1425507.1649482; Fri, 18 Sep 2026 14:50:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7Zuj-0007S9-G8; Fri, 18 Sep 2026 14:50:09 +0000
Received: by outflank-mailman (input) for mailman id 1425507;
 Fri, 18 Sep 2026 14:50:07 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <josef@toxicpanda.com>) id 1x7Zuh-0006wl-EH
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2026 14:50:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x7Zug-005xCM-Q6
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2026 16:50:06 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6aad4f98-2eae-0a2a0a5409dd-0a2a4506e5f6-22
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 16:50:06 +0200
Received: from [74.125.230.140] (helo=mail-qv2-f12.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6aad4f9d-195a-0a2a45060019-4a7de68c8bbd-3
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 16:50:06 +0200
Received: by mail-qv2-f12.google.com with SMTP id
 6a1803df08f44-9106feddbdfso7373286d6.0
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 07:50:06 -0700 (PDT)
Received: from toxicpanda.com (ec2-34-228-114-98.compute-1.amazonaws.com.
 [34.228.114.98]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91258056195sm14090716d6.29.2026.09.18.07.50.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Sep 2026 07:50:04 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=toxicpanda.com header.i="@toxicpanda.com" header.h="Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1789743005; x=1790347805; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MkP56mJgKixcgLXoBxrfzz0NyJo14L+hjKFrNfKE/2k=;
        b=oitv45/HloBF5CYKR9vhIZtUqRDyE9wkT8jqBe5a6FjD83th4tMWgDXs6ZPuHVzaGo
         s/OUrrts1mGXK82yUnFZHOgcee06h3U+sgGtYSORmIXbbZmsVXCcdjvdG9noDIIizFF7
         aXPutAOcCnvtuIfZcza/8ltnD014/8jO1k+bEOkAQKrjAZ35x2N91zXSdgiwQlysXUi5
         p1Y4PQ6Hb6vbpW4stLn3nFu7NFx1OPAGnGksN2w/ZpKp+C19Loo3owH4bDfy+AylwbTz
         AyJNGOEAKnRZNzFKIeO8jhufYU114pidolQ2b0nHnsMISR4vxjgeMicR3SyI8xqvJ7MZ
         Rw5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789743005; x=1790347805;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MkP56mJgKixcgLXoBxrfzz0NyJo14L+hjKFrNfKE/2k=;
        b=blJmUlnEUnlsGpB4gaepRr0B6pGeW7LPJ30fAHj7fEk/DGExBiZLxYFJtX/2uW6StV
         VpIZSzBpRjQSTn2EvaywuDXS2YhXMC3rrv2oEIrgaGa3IZf+nOSAZ7QweydDGlbIMtWm
         nG26hooxRRxKg6SOUxoPWJMdNsoQuCPXa2EXujpQhJBBnk3vYDOLrVtsE5kij72bIPqB
         R5LVqC1yzN4S9Omps/xv9GRkZ6BqCBB/mJ3FNB6Vfs3o78K3LuwAgHjCCD31PbWvoLUD
         iIJLPGLuBkfnYDgKet77F5dXtzYom1EA/jdkj4WndVXv0p6v9WpM+kPWZpphPGVRgLYi
         SR6w==
X-Forwarded-Encrypted: i=1; AKwUvBxPp3qy9MYE/peqXud2H/WCiiDAE3v3EOZEzOeSE1y3PLNNUlymMsha2Xnk0BWSzq6IuDsb3B1Zwa8=@lists.xenproject.org
X-Gm-Message-State: AFuF++mgWSFL2yaS7auHh5qR8JcjYIl8HNTZn3Se3ai0UNvtpMsOVis7
	ATuC4oVdnazr2Uyy4lufTJRWDrZisg4P060VkO3fPXWg0sYvP3nrwH0h4gd1Tt7WYFM=
X-Gm-Gg: AYBFou0+i9qUED7OOSvGQOANgA1VaRLWpjehkIqc4C6t9knRt1WYKAAScc0sIXoboe+
	K9NdEhaRQOdnmrU8t/Bm9vWc0mo1k6CqujQnq8wbSH3jlC48pzzr8lK3RG1sUF52VJQicFvf150
	j1auIz1L9OHrzwckWmsoJJ5xKCyiMM1D63Nebsaj1rrsk4VZ2ueV64kJUqoW0yBITvopOhogklY
	dYZp7oKGbwWNy6aBYTCMi23M9Q8UXqJaO8UkuCwnn1ad5yjr5QI60T+I+TWPBd00cUX2UCiQwbk
	X48p6UUrmTILG1asERygmU0x/rPi5Jjf5rw7Pa2Z57Yskh3zSX2wiFnI+2RQcE/QjQbkondi/V6
	GjqFE9XEyNd44HHOtWAObhNbRHkXFkkLMY+6lbUBiI+9KbqsAqXe0i5K/fvPOXOr3T0PvlcCadf
	RuWOh4vE+ym8OVhTgjco1lnIvmIwoBbg3O6OxoJCbfJKPSC6R7b1lOejTzOugKiI/FXDDA7MvRq
	DlJGP2wydbDRVtDmtKmMJYV5hA+xiI++pV2ACsK3U4SRidDpelpu8ux
X-Received: by 2002:a05:6214:1307:b0:910:4a86:5969 with SMTP id 6a1803df08f44-91254bd5293mr46077526d6.23.1789743004909;
        Fri, 18 Sep 2026 07:50:04 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Fri, 18 Sep 2026 14:49:30 +0000
Subject: [PATCH RFC v4 11/13] rcutorture: Make Tasks RCU readers Tasks
 Trace readers where required
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-b4-rcu-tasks-preempt-qs-v4-11-63f0e9d69661@toxicpanda.com>
References: <20260918-b4-rcu-tasks-preempt-qs-v4-0-63f0e9d69661@toxicpanda.com>
In-Reply-To: <20260918-b4-rcu-tasks-preempt-qs-v4-0-63f0e9d69661@toxicpanda.com>
To: "Paul E. McKenney" <paulmck@kernel.org>, 
 Frederic Weisbecker <frederic@kernel.org>, 
 Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Boqun Feng <boqun@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Jiri Olsa <jolsa@kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
 x86@kernel.org, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Puranjay Mohan <puranjay@kernel.org>, 
 Xu Kuohai <xukuohai@huaweicloud.com>, 
 "Paul E. McKenney" <paulmck@kernel.org>, 
 Frederic Weisbecker <frederic@kernel.org>, 
 Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Boqun Feng <boqun@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Jiri Olsa <jolsa@kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
 x86@kernel.org, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Puranjay Mohan <puranjay@kernel.org>, 
 Xu Kuohai <xukuohai@huaweicloud.com>
Cc: Andy Lutomirski <luto@kernel.org>, 
 Josh Triplett <josh@joshtriplett.org>, Uladzislau Rezki <urezki@gmail.com>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Lai Jiangshan <jiangshanlai@gmail.com>, Zqiang <qiang.zhang@linux.dev>, 
 Juergen Gross <jgross@suse.com>, Luis Chamberlain <mcgrof@kernel.org>, 
 Ihor Solodrai <ihor.solodrai@linux.dev>, linux-kernel@vger.kernel.org, 
 rcu@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
 bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 xen-devel@lists.xenproject.org, Andy Lutomirski <luto@kernel.org>, 
 Josh Triplett <josh@joshtriplett.org>, Uladzislau Rezki <urezki@gmail.com>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Lai Jiangshan <jiangshanlai@gmail.com>, Zqiang <qiang.zhang@linux.dev>, 
 Juergen Gross <jgross@suse.com>, Luis Chamberlain <mcgrof@kernel.org>, 
 Ihor Solodrai <ihor.solodrai@linux.dev>, linux-kernel@vger.kernel.org, 
 rcu@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
 bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 xen-devel@lists.xenproject.org, Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1789742980; l=1716;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=O8YdW4YSHUYyF3GwEQN16WzJM7UkZZFfh8RzVwv7xJM=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QCK2SKWNSvb8uUIHABRfNQrEJPCWCZeIZnAqX/3f5X/BpUmomCy4y1MVWrdYzX/ihyvEJhShdIA
 kincQ831+1ws=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-purgate-ID: tlsNG-16d1c6/1789743006-FE47377B-DAF0A557/0/0
X-purgate-type: clean
X-purgate-size: 1718

rcutorture's "tasks" flavor has empty readlock/readunlock hooks because
a classic Tasks RCU reader is simply code that does not block.  Under
CONFIG_TASKS_RCU_TRAMPOLINE_READERS a preemption outside trampoline text
is also a quiescent state, and the thing real readers (trampolines) do
to stay protected across their call-outs is take rcu_read_lock_trace(),
so have the torture readers do the same there.  Otherwise a preempted
torture reader would rightly be treated as quiescent and the test would
report false-positive too-short grace periods.

Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 kernel/rcu/rcutorture.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/kernel/rcu/rcutorture.c b/kernel/rcu/rcutorture.c
index 794937e13e7c..ab870ef09af0 100644
--- a/kernel/rcu/rcutorture.c
+++ b/kernel/rcu/rcutorture.c
@@ -1142,13 +1142,23 @@ static struct rcu_torture_ops trivial_preempt_ops = {
  * Definitions for RCU-tasks torture testing.
  */
 
+/*
+ * A classic Tasks RCU reader is any stretch of kernel code that does not
+ * voluntarily block.  With CONFIG_TASKS_RCU_TRAMPOLINE_READERS a preemption
+ * outside trampoline text also ends it, and what a trampoline does to stay
+ * protected across its call-out is take a Tasks Trace reader, so model that.
+ */
 static int tasks_torture_read_lock(void)
 {
+	if (IS_ENABLED(CONFIG_TASKS_RCU_TRAMPOLINE_READERS))
+		rcu_read_lock_trace();
 	return 0;
 }
 
 static void tasks_torture_read_unlock(int idx)
 {
+	if (IS_ENABLED(CONFIG_TASKS_RCU_TRAMPOLINE_READERS))
+		rcu_read_unlock_trace();
 }
 
 static void rcu_tasks_torture_deferred_free(struct rcu_torture *p)

-- 
2.55.0


