Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F431D6CFB3
	for <xen-devel@archiver.kernel.org>; Fri, 23 Jan 2026 03:05:13 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1212028.1523374 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vj7Tc-0008AI-AS; Fri, 23 Jan 2026 03:04:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1212028.1523374; Fri, 23 Jan 2026 03:04:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vj7Tc-0008AB-7O; Fri, 23 Jan 2026 03:04:48 +0000
Received: by outflank-mailman (input) for mailman id 1212028;
 Fri, 23 Jan 2026 03:04:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qkWT=74=antgroup.com=houwenlong.hwl@srs-se1.protection.inumbo.net>)
 id 1vj7TZ-0008A5-UT
 for xen-devel@lists.xenproject.org; Fri, 23 Jan 2026 03:04:46 +0000
Received: from out28-145.mail.aliyun.com (out28-145.mail.aliyun.com
 [115.124.28.145]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3eeeabe4-f808-11f0-b15e-2bf370ae4941;
 Fri, 23 Jan 2026 04:04:41 +0100 (CET)
Received: from localhost(mailfrom:houwenlong.hwl@antgroup.com
 fp:SMTPD_---.gDSnk6b_1769137470 cluster:ay29) by smtp.aliyun-inc.com;
 Fri, 23 Jan 2026 11:04:30 +0800
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
X-Inumbo-ID: 3eeeabe4-f808-11f0-b15e-2bf370ae4941
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=antgroup.com; s=default;
	t=1769137474; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	bh=z7QKQEit5IiI9wEnKzSXeZlrU6DLi2VCu28yIrU4sWs=;
	b=iX7hzYSA93ykBxdaR2ZcKhMIMZbgTe9InBDBMrAojhu0FYPgcR4qGytnB22U2Njown7AM5yx+jAFNHv+bBb4SeRZIVD5UUJc8u6KwofagH6zVbzh2Jn9LlvDuQUOhAYyBilwJXs6GisFeZclz5Uyjwzyb/+rD82rrBGjzkzGuxw=
Date: Fri, 23 Jan 2026 11:04:30 +0800
From: Hou Wenlong <houwenlong.hwl@antgroup.com>
To: Borislav Petkov <bp@alien8.de>
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Peter Zijlstra <peterz@infradead.org>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Li Chen <chenl311@chinatelecom.cn>, Brian Gerst <brgerst@gmail.com>,
	Sohil Mehta <sohil.mehta@intel.com>,
	Tim Chen <tim.c.chen@linux.intel.com>,
	Patryk Wlazlyn <patryk.wlazlyn@linux.intel.com>,
	Eric Dumazet <edumazet@google.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 1/2] x86/smp: Move the static call update for 'smp_ops'
 into smp_prepare_boot_cpu()
Message-ID: <20260123030430.GA75451@k08j02272.eu95sqa>
References: <b5e3f1d674af21c1592eab3ce8cc7dc93f9a7dad.1769090885.git.houwenlong.hwl@antgroup.com>
 <20260122142156.GEaXIyhNQeGvOR5yyu@fat_crate.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260122142156.GEaXIyhNQeGvOR5yyu@fat_crate.local>
User-Agent: Mutt/1.5.21 (2010-09-15)

On Thu, Jan 22, 2026 at 03:21:56PM +0100, Borislav Petkov wrote:
> On Thu, Jan 22, 2026 at 10:15:43PM +0800, Hou Wenlong wrote:
> > The commit 1f60230cdc63 ("x86/smp: Use static_call for
> > arch_send_call_function_ipi()") changed to use a static call for
> > arch_send_call_function_ipi(), which causes two problems:
> > 
> > First, the KVM guest also changes 'smp_ops.send_call_func_ipi' when the
> > PV sched yield feature is available. However, the missing
> > static_call_update() breaks the PV sched yield feature.
> > 
> > Additionally, xen_smp_init() is called before static_call_init() during
> > the booting of the XENPV guest, which triggers a warning in
> > __static_call_update().
> > 
> > To simplify, move the static call update for 'smp_ops' into
> > smp_prepare_boot_cpu() to address these two problems together.
> > 
> > Fixes: 1f60230cdc63 ("x86/smp: Use static_call for arch_send_call_function_ipi()")
> > Signed-off-by: Hou Wenlong <houwenlong.hwl@antgroup.com>
> > ---
> > I'm not sure if the XEN part is okay or not. I think there should be no
> > IPI before smp_prepare_boot_cpu(), and even if there is, it's okay for
> > the KVM guest to use the native version before smp_prepare_boot_cpu().
> 
> All three commits zapped from tip:x86/core.
> 
> We can try again once this is resolved.
>

Get it, thanks!

> Thx.
> 
> -- 
> Regards/Gruss,
>     Boris.
> 
> https://people.kernel.org/tglx/notes-about-netiquette

