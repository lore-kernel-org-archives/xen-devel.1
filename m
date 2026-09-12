Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18618C88E5C
	for <xen-devel@archiver.kernel.org>; Sat, 12 Sep 2026 21:14:34 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1419279.1646572 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x5V2z-0004YS-C7; Sat, 12 Sep 2026 21:14:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1419279.1646572; Sat, 12 Sep 2026 21:14:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x5V2z-0004YL-8W; Sat, 12 Sep 2026 21:14:05 +0000
Received: by outflank-mailman (input) for mailman id 1419279;
 Sat, 12 Sep 2026 21:14:04 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <david.laight.linux@gmail.com>) id 1x5V2y-0004YF-6b
 for xen-devel@lists.xenproject.org; Sat, 12 Sep 2026 21:14:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x5V2w-00BaTl-UG
 for xen-devel@lists.xenproject.org; Sat, 12 Sep 2026 23:14:02 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <david.laight.linux@gmail.com>)
 id 6aa5c089-e002-0a2a0a5209dd-0a2a4504e6d0-10
 for <xen-devel@lists.xenproject.org>; Sat, 12 Sep 2026 23:14:02 +0200
Received: from [209.85.221.48] (helo=mail-wr1-f48.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <david.laight.linux@gmail.com>)
 id 6aa5c09a-b57f-0a2a45040019-d155dd30f12a-3
 for <xen-devel@lists.xenproject.org>; Sat, 12 Sep 2026 23:14:02 +0200
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-482dd6ee390so1672539f8f.3
 for <xen-devel@lists.xenproject.org>; Sat, 12 Sep 2026 14:14:02 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49d26c39086sm240080175e9.10.2026.09.12.14.14.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Sep 2026 14:14:01 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789247642; x=1789852442; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RN6NlWXNxbscB16yrp/7Xyb7tbAGCIZghMiPDdHQJK4=;
        b=YhRAVcnau0VIrAkRvPmVBBPukmbvJhcHmLOK/XARXc7BY6opjPc4nAZ6dGW98pUdjy
         VK+jh9PCmrbK7MyeIfZpTpMOzQTnoxAtVxH+LCasFrHH4cyLVTHwn3jR39W8sjtYGslQ
         YYQckOKXAaL2x/oXVBGtdpteeIssZ8t64oPlMEh+3NxrsoHtmwYb45QMWcDkO0qUpnAw
         dusXWKb398z+JVk5KNmtwMB326rm7dAj1RXM8fn1qOwGGN6hao7LhY1oi2TXdYLjs7lp
         J3ZgOJutKl0fj09YD3Q+0djUwaExmF7PyiAdEIOneRMo5ThJmQLToY4g7OdtZiWnU1Dd
         +PwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789247642; x=1789852442;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RN6NlWXNxbscB16yrp/7Xyb7tbAGCIZghMiPDdHQJK4=;
        b=djmUSbTMZzuC+pbt5D27z+wao6arox6xE+deP8g92gJ+/CgxVaSit1+/lhOvIY3R9G
         djF74EnWS48KPemCgYkkwSggd4NCwROqa8VZFiMD937U9KriNed3F9R5enwuF8TG/oYM
         YWKlPmfbneMaIPXZVWn3tLXr/B2JN5fbRlb6FBfcrE1e+6nOY9J3DAaJxbpK/wmWF3VH
         fzpuvxC9V+c4qQIbeVzBCiXxO52ikTpNlAsqzAgLDdw9vT8XNYElYHD/ZjjV/Jg0TM8j
         jZwIyieNnyLvBWrWzfqx9Fyddu9d23kY01bc3pcOCuGZVdwep3DdBzGc6Br3iLQV/ydd
         tltg==
X-Forwarded-Encrypted: i=1; AKwUvByTq8dFDOjLYowZmRirFxNvLZZdnVAqsboHwVOR3lvzZP3+NM5YvSsGwM8vQYhVP/OFK80SSjuZHoI=@lists.xenproject.org
X-Gm-Message-State: AFuF++m31E1AqRuco8bKvtw0ZK7QPtckOG6SVXBLlUWb/FjrkN3HxB/u
	BYJoIglAAQ1+pbdAy3gzN4akKtgO2H+8XLeAegx5Rcg/aQ7updevOtz9
X-Gm-Gg: AYBFou3tfDkwqYve8+v0FuWa+9DtgOGeQ6IUggCUansF9O6OC+eFMq98Wa4PYXXsaFY
	fT45vTkJwAcwbOXsGb8VghQKOoz4BLZaR83bsC93oF2Qa58zzFmYm9pEpIKs0+pqFriYj3UWRcE
	0+M0YBV17PMDAMAr4yLnG2RWZNBBgldeSJbmkxS/uWcHQt58/GEZYsWeMtsE/KOqb2oUtGNI8ub
	LdJTvzykHtzralrjUJvk+mBYKnRfG8DaauAF9L/NFMFjjPTTr1TCqAIMauyCYxDXZithZjNZ6Rq
	ZdQM+Fzyy1JcJestUz16ZbV8OzeNTqnl/s/vRimXKijT2VMJElMpd2x7aithCABAxCNrrZv87ub
	/GdL8mlPp7/DQ59HGUnUF/BPyUvdJiJYqZZ0oQhkDCetCj4ttyApRTLx9NcsrVsVr/Oew8KHV2l
	NQsY+wI1nIwkurAzK59vFnk+tORwePgGiI0v+oZXBxxRS97j0Ak9IQsAHTme68LaLcXdASIBrTR
	C7j86/yCX5kjpVGZlpI9+u7VUgHhQxkLi+U
X-Received: by 2002:a05:600c:3513:b0:49d:28c4:b304 with SMTP id 5b1f17b1804b1-49e619d479emr105307385e9.29.1789247641902;
        Sat, 12 Sep 2026 14:14:01 -0700 (PDT)
Date: Sat, 12 Sep 2026 22:14:00 +0100
From: David Laight <david.laight.linux@gmail.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Alexei Starovoitov <alexei.starovoitov@gmail.com>, Josef Bacik
 <josef@toxicpanda.com>, Frederic Weisbecker <frederic@kernel.org>, Neeraj
 Upadhyay <neeraj.upadhyay@kernel.org>, Joel Fernandes
 <joelagnelf@nvidia.com>, Boqun Feng <boqun@kernel.org>, Thomas Gleixner
 <tglx@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Steven Rostedt
 <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>, Alexei Starovoitov
 <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko
 <andrii@kernel.org>, x86@kernel.org, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Puranjay Mohan
 <puranjay@kernel.org>, Xu Kuohai <xukuohai@huaweicloud.com>, Andy
 Lutomirski <luto@kernel.org>, Josh Triplett <josh@joshtriplett.org>,
 Uladzislau Rezki <urezki@gmail.com>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Lai Jiangshan <jiangshanlai@gmail.com>,
 Zqiang <qiang.zhang@linux.dev>, Juergen Gross <jgross@suse.com>, Luis
 Chamberlain <mcgrof@kernel.org>, Ihor Solodrai <ihor.solodrai@linux.dev>,
 linux-kernel@vger.kernel.org, rcu@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, bpf@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH RFC v2 08/15] bpf, x86: Maintain Tasks RCU trampoline
 nesting in the BPF trampoline
Message-ID: <20260912221400.4045198b@pumpkin>
In-Reply-To: <8c51a669-eb6b-455b-a829-b537da5209f8@paulmck-laptop>
References: <20260911-b4-rcu-tasks-preempt-qs-v2-0-eaaa61ed2da4@toxicpanda.com>
	<20260911-b4-rcu-tasks-preempt-qs-v2-8-eaaa61ed2da4@toxicpanda.com>
	<DLD0OHX8C4ME.VNR49VC2UYH4@gmail.com>
	<14cb8a91-497d-49f5-aa20-c6cb8b9a27fc@paulmck-laptop>
	<DLDICNLENSRI.2R6EJ0ZFJE45T@gmail.com>
	<8c51a669-eb6b-455b-a829-b537da5209f8@paulmck-laptop>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1789247642-514D3B50-FAC32024/0/0
X-purgate-type: clean
X-purgate-size: 522

On Sat, 12 Sep 2026 11:03:34 -0700
"Paul E. McKenney" <paulmck@kernel.org> wrote:

> In the old kernels, yes, we have current->trc_reader_nesting++.
> In the newer kernels, Tasks Trace RCU is instead implemented in terms
> of SRCU-fast, which instead increments per-CPU counters.  Which among
> other thins is a bit faster and does not need to hook into the scheduler.

Isn't that rather architecture dependant?
It is fine on x86, but on arm incrementing a per-cpu variable is
significantly expensive.

David

