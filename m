Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8520FD3EE6B
	for <xen-devel@archiver.kernel.org>; Thu, 22 Jan 2026 14:22:34 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1211167.1522707 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vivZo-0007b0-Q2; Thu, 22 Jan 2026 14:22:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1211167.1522707; Thu, 22 Jan 2026 14:22:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vivZo-0007at-NZ; Thu, 22 Jan 2026 14:22:24 +0000
Received: by outflank-mailman (input) for mailman id 1211167;
 Thu, 22 Jan 2026 14:22:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1ayx=73=alien8.de=bp@srs-se1.protection.inumbo.net>)
 id 1vivZn-0006ZI-W7
 for xen-devel@lists.xenproject.org; Thu, 22 Jan 2026 14:22:23 +0000
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c4c9374d-f79d-11f0-b15e-2bf370ae4941;
 Thu, 22 Jan 2026 15:22:23 +0100 (CET)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 1CB3940E02E6; 
 Thu, 22 Jan 2026 14:22:21 +0000 (UTC)
Received: from mail.alien8.de ([127.0.0.1])
 by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id DMMlNX1pwdPh; Thu, 22 Jan 2026 14:22:18 +0000 (UTC)
Received: from zn.tnic (pd953023b.dip0.t-ipconnect.de [217.83.2.59])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest
 SHA256) (No client certificate requested)
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id
 BCA0B40E027A; Thu, 22 Jan 2026 14:21:57 +0000 (UTC)
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
X-Inumbo-ID: c4c9374d-f79d-11f0-b15e-2bf370ae4941
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1769091737; bh=F8/cDg8dqL5KJe1easlfTdEAUVQhlPJZ3aHQ6mYvBTU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iJ3WBinh+XcE+G/KfxLdDGCXADNRC9ycWVeM2gABf0SdO8V9yXTM1WBn15ikHgJIT
	 M6JboIoIcrDLHxvifc+9Rjllxl4a6WvScepwxfgtT9SOVQ9n4YJnEvd9XdYjn+znje
	 EaCisS7Pw8BsAGasRjcFY8RRw2gcJBAhoMrGalf7k4BF61trK+dCkmYgdF96Flg8nC
	 JTe/8fSuEo8/JOzdLETpMfATpvyI8r1Fj5Iw/WG53f07ifzAmQ4PSJGOlYZmpm1IWn
	 WZe7K7UwZteZZoy+a22HE8oKTqQJ1nZluAsSoMuqV+9w5PSQmtC/FKCxv7v/kFS3L+
	 x0xHzifg7elq9pl7P3ucTvRZp/k1jA9S1cgvrkCkM2KB7cxWNEG6l6wkgFyN01LjTP
	 3j0JsT1CM2nqFyf8qIaZmA53Jrx+LlkrwFh5p+HLAcejQYnaz64KSLayjjKxit9PpU
	 +bd4EqnsjnLmpmORLKHpIZ+z+k1wGtptAEZPLUDByscrKyUO7FIM9MkeYMKGkUBkX9
	 X/sPrZSXo0Xxb2kO8p8uOydIfBzyFMKKo7CggP0pmRMzLD2hP71SOAyZ1aL2jlOOdP
	 /5y1JH2lt/gVIerwgWc9dK0cWdpeONREfMJpOl3jNWUIgjMthftBkryLuix/kVV7Is
	 bO6g82DIs31iXATqIrXJrsx4=
Date: Thu, 22 Jan 2026 15:21:56 +0100
From: Borislav Petkov <bp@alien8.de>
To: Hou Wenlong <houwenlong.hwl@antgroup.com>
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
Message-ID: <20260122142156.GEaXIyhNQeGvOR5yyu@fat_crate.local>
References: <b5e3f1d674af21c1592eab3ce8cc7dc93f9a7dad.1769090885.git.houwenlong.hwl@antgroup.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b5e3f1d674af21c1592eab3ce8cc7dc93f9a7dad.1769090885.git.houwenlong.hwl@antgroup.com>

On Thu, Jan 22, 2026 at 10:15:43PM +0800, Hou Wenlong wrote:
> The commit 1f60230cdc63 ("x86/smp: Use static_call for
> arch_send_call_function_ipi()") changed to use a static call for
> arch_send_call_function_ipi(), which causes two problems:
> 
> First, the KVM guest also changes 'smp_ops.send_call_func_ipi' when the
> PV sched yield feature is available. However, the missing
> static_call_update() breaks the PV sched yield feature.
> 
> Additionally, xen_smp_init() is called before static_call_init() during
> the booting of the XENPV guest, which triggers a warning in
> __static_call_update().
> 
> To simplify, move the static call update for 'smp_ops' into
> smp_prepare_boot_cpu() to address these two problems together.
> 
> Fixes: 1f60230cdc63 ("x86/smp: Use static_call for arch_send_call_function_ipi()")
> Signed-off-by: Hou Wenlong <houwenlong.hwl@antgroup.com>
> ---
> I'm not sure if the XEN part is okay or not. I think there should be no
> IPI before smp_prepare_boot_cpu(), and even if there is, it's okay for
> the KVM guest to use the native version before smp_prepare_boot_cpu().

All three commits zapped from tip:x86/core.

We can try again once this is resolved.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

