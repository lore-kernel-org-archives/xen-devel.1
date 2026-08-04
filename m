Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8CA7C55172
	for <xen-devel@archiver.kernel.org>; Tue,  4 Aug 2026 06:23:10 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1381912.1625352 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wr8Y9-0006fB-A6; Tue, 04 Aug 2026 06:22:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1381912.1625352; Tue, 04 Aug 2026 06:22:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wr8Y9-0006f4-75; Tue, 04 Aug 2026 06:22:53 +0000
Received: by outflank-mailman (input) for mailman id 1381912;
 Tue, 04 Aug 2026 06:12:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1wr8O8-00053K-MO
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 06:12:32 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <gwd@xenproject.org>) id 1wr8O8-004eM8-2Q
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 06:12:32 +0000
Received: from mail-lf1-f44.google.com ([209.85.167.44])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <gwd@xenproject.org>) id 1wr8O8-007Sib-1I
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 06:12:32 +0000
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-5b28c91fba5so796609e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 23:12:32 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:MIME-Version; bh=cKkt4ers6CnESh/Dtqx6JQgb2hU5RYPlj5ywtje48gQ=; b=XW
	Om9dgoOSHjstj0vCbZKxisMZjdrjcjdIJCNfwuqPvWnsUbqXHYMZUgUmJsOY6QMpMDiFQGpJkpWdp
	xleOagT6oy4aGlaatSzN6XsrXiwQcwTAEvpb8h6WeUnJc0DjhGnv6ySyzPPg7UP+1wLhJKefdmvr0
	7sQeT4Xe7OcIRt0=;
X-Gm-Message-State: AOJu0Yy0pKT+rtsymcU7kSDuvD+G1AWNnDaZEskXDZFv/7aezmnY9rjX
	u4ufOyw/voCEBekVFBMGDShDWCFbr6zlnsU+YWOv1Zd7Pqzsop202dNVG115fqy6z3hhlrQglh0
	nZytjer51jGMZ16IuzVD5bzZxtqZPh9o=
X-Received: by 2002:a05:6512:3e23:b0:5b2:aa73:ea6a with SMTP id
 2adb3069b0e04-5b2f281bc1emr276587e87.10.1785823951299; Mon, 03 Aug 2026
 23:12:31 -0700 (PDT)
MIME-Version: 1.0
From: George Dunlap <gwd@xenproject.org>
Date: Tue, 4 Aug 2026 16:12:17 +1000
X-Gmail-Original-Message-ID: <CAFLBxZZLYxk4ZZZ9++B9qRn_J8X6ochbHr4037mbC8sDfsRqDA@mail.gmail.com>
X-Gm-Features: AUfX_mw6ehuTpnm2xYeSM80RlQxvsXMGAHoaDwR3g3EL7lt0OIExqIqZbAwNxk8
Message-ID: <CAFLBxZZLYxk4ZZZ9++B9qRn_J8X6ochbHr4037mbC8sDfsRqDA@mail.gmail.com>
Subject: Linux PV domU with >1 vCPU never resumes after xl save/restore
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Juergen Gross <jgross@suse.com>
Content-Type: multipart/alternative; boundary="0000000000003fa71a0658328abf"

--0000000000003fa71a0658328abf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

Saving and restoring a multi-vcpu PV guest appears to have been broken in
Linux for some time (observed 6.6.56 and 6.12.86).  Report below from
Claude Fable; I've independently verified the behavior on vanilla Linux
6.6.56.  Claude seems to think it's a bug in Linux.

Gitlab CI seems to only run with vcpus=3D1, which is why it didn't notice.

George Dunlap
Freelance Xen consultant
https://www.laleolanguage.com/consulting

8<----

A PV guest with more than one vCPU survives `xl save`, but after
`xl restore` it never comes back: the kernel wedges mid-resume, before
xenbus reconnect, so all frontends stay disconnected (netfront frontend
state remains XenbusStateInitialising, backend InitWait; vif shows
NO-CARRIER in dom0) and the guest is unreachable indefinitely. With
vcpus=3D1 the same guest/image/kernel resumes cleanly, PVH SMP
save/restore is fine, and the suspend-cancel path (a failed `xl save`
resuming the domain in place) is also fine.

Reproduced with:
 - Debian trixie kernel 6.12.86+deb13-amd64
 - the Xen-project CI test-artifacts kernel, vanilla 6.6.56
 (identical signature on both, so not a 6.12 regression; at least the
 6.6..6.12 LTS span is affected)
Host: x86-64, Xen master/staging (4.23-unstable); also reproduced on an
older commit, so the Xen version does not appear relevant. Plain
`xl save` + `xl restore` of an idle 4-vCPU, 2G PV domU, direct kernel
boot, xvda file-backed disk, one vif. 100% reproducible.

What the resume looks like (full logs available):

 - Capturing the console across a paused restore (`xl restore -p`,
   attach console, unpause) shows all secondary vCPUs immediately
   splatting:

     WARNING: CPU: 1 PID: 0 at kernel/time/timekeeping.c:747
ktime_get+0xa9/0xd0
     ...
      tick_nohz_idle_enter
      do_idle
      cpu_startup_entry
      cpu_bringup_and_idle
      asm_cpu_bringup_and_idle

   i.e. the idle task entering nohz while timekeeping is still
   suspended =E2=80=94 with printk timestamps taken from the *uncorrected*
   clock (pre-suspend time + the save/restore wall-clock gap), while
   CPU0's own subsequent resume messages ("Grant tables using version 1
   layout", from gnttab_resume() inside xen_suspend()) carry the
   *corrected*, earlier timestamp. The secondaries therefore left the
   stop_machine corral before CPU0's post-suspend work inside
   xen_suspend() had run, which the multi_cpu_stop state machine is
   supposed to make impossible.

 - xenctx on the restored-but-still-paused domain shows the vCPU
   contexts are restored faithfully (RIP-for-RIP identical to a probe
   taken at the suspend point: vCPU0 inside the suspend hypercall stub,
   the secondaries inside the multi_cpu_stop corral loop). The
   toolstack is delivering exactly what was saved; the wedge develops
   after unpause, guest-side.

 - End state, stable forever after: vCPU0 spins at 100% inside the
   multi_cpu_stop corral code (per xenctx; `xl vcpu-list` shows r--
   accumulating time), while the secondary vCPUs sit blocked in
   SCHED_block on their idle-task stacks. Because stop_machine() never
   completes, do_suspend() never reaches xen_arch_resume() (so the
   secondaries' local ticks, suspended by xen_arch_suspend() before the
   corral, are never resumed =E2=80=94 nothing will ever wake them) nor
   xs_resume()/dpm_resume_*() (so xenbus frontends never reconnect).

A speculative note on the trigger, from reading the 6.12 code =E2=80=94 tre=
at
as unverified: xen_vcpu_restore() (called from xen_pv_post_suspend()
while the secondaries are mid-corral with virtual interrupts masked)
does VCPUOP_down, re-registers vcpu_info via xen_vcpu_setup_restore(),
then VCPUOP_up on each secondary. If the re-registration ends up with
evtchn_upcall_mask clear in the newly registered vcpu_info, the vCPU
comes back up with an unexpected upcall window mid-corral; stray
exc_xen_hypervisor_callback frames in the secondaries' backtraces are
consistent with that. I stopped root-causing at this point.

Happy to provide the full console logs, xenctx dumps at
suspend/restored-paused/wedged, and the reproduction scripts, or to
test patches.

--0000000000003fa71a0658328abf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<div><br></div><div>Saving and restoring a multi-vcp=
u PV guest appears to have been broken in Linux for some time (observed 6.6=
.56 and 6.12.86).=C2=A0 Report below from Claude Fable; I&#39;ve independen=
tly verified the behavior on vanilla Linux 6.6.56.=C2=A0 Claude seems to th=
ink it&#39;s a bug in Linux.</div><div><br></div><div>Gitlab CI seems to on=
ly run with vcpus=3D1, which is why it didn&#39;t notice.</div><div><br></d=
iv><div>George Dunlap</div><div>Freelance Xen consultant</div><div><a href=
=3D"https://www.laleolanguage.com/consulting">https://www.laleolanguage.com=
/consulting</a></div><div><br></div><div>8&lt;----</div><div><br></div><div=
>A PV guest with more than one vCPU survives `xl save`, but after<br>`xl re=
store` it never comes back: the kernel wedges mid-resume, before<br>xenbus =
reconnect, so all frontends stay disconnected (netfront frontend<br>state r=
emains XenbusStateInitialising, backend InitWait; vif shows<br>NO-CARRIER i=
n dom0) and the guest is unreachable indefinitely. With<br>vcpus=3D1 the sa=
me guest/image/kernel resumes cleanly, PVH SMP<br>save/restore is fine, and=
 the suspend-cancel path (a failed `xl save`<br>resuming the domain in plac=
e) is also fine.<br><br>Reproduced with:<br>=C2=A0- Debian trixie kernel 6.=
12.86+deb13-amd64<br>=C2=A0- the Xen-project CI test-artifacts kernel, vani=
lla 6.6.56<br>=C2=A0(identical signature on both, so not a 6.12 regression;=
 at least the<br>=C2=A06.6..6.12 LTS span is affected)<br>Host: x86-64, Xen=
 master/staging (4.23-unstable); also reproduced on an<br>older commit, so =
the Xen version does not appear relevant. Plain<br>`xl save` + `xl restore`=
 of an idle 4-vCPU, 2G PV domU, direct kernel<br>boot, xvda file-backed dis=
k, one vif. 100% reproducible.<br><br>What the resume looks like (full logs=
 available):<br><br>=C2=A0- Capturing the console across a paused restore (=
`xl restore -p`,<br>=C2=A0 =C2=A0attach console, unpause) shows all seconda=
ry vCPUs immediately<br>=C2=A0 =C2=A0splatting:<br><br>=C2=A0 =C2=A0 =C2=A0=
WARNING: CPU: 1 PID: 0 at kernel/time/timekeeping.c:747 ktime_get+0xa9/0xd0=
<br>=C2=A0 =C2=A0 =C2=A0...<br>=C2=A0 =C2=A0 =C2=A0 tick_nohz_idle_enter<br=
>=C2=A0 =C2=A0 =C2=A0 do_idle<br>=C2=A0 =C2=A0 =C2=A0 cpu_startup_entry<br>=
=C2=A0 =C2=A0 =C2=A0 cpu_bringup_and_idle<br>=C2=A0 =C2=A0 =C2=A0 asm_cpu_b=
ringup_and_idle<br><br>=C2=A0 =C2=A0i.e. the idle task entering nohz while =
timekeeping is still<br>=C2=A0 =C2=A0suspended =E2=80=94 with printk timest=
amps taken from the *uncorrected*<br>=C2=A0 =C2=A0clock (pre-suspend time +=
 the save/restore wall-clock gap), while<br>=C2=A0 =C2=A0CPU0&#39;s own sub=
sequent resume messages (&quot;Grant tables using version 1<br>=C2=A0 =C2=
=A0layout&quot;, from gnttab_resume() inside xen_suspend()) carry the<br>=
=C2=A0 =C2=A0*corrected*, earlier timestamp. The secondaries therefore left=
 the<br>=C2=A0 =C2=A0stop_machine corral before CPU0&#39;s post-suspend wor=
k inside<br>=C2=A0 =C2=A0xen_suspend() had run, which the multi_cpu_stop st=
ate machine is<br>=C2=A0 =C2=A0supposed to make impossible.<br><br>=C2=A0- =
xenctx on the restored-but-still-paused domain shows the vCPU<br>=C2=A0 =C2=
=A0contexts are restored faithfully (RIP-for-RIP identical to a probe<br>=
=C2=A0 =C2=A0taken at the suspend point: vCPU0 inside the suspend hypercall=
 stub,<br>=C2=A0 =C2=A0the secondaries inside the multi_cpu_stop corral loo=
p). The<br>=C2=A0 =C2=A0toolstack is delivering exactly what was saved; the=
 wedge develops<br>=C2=A0 =C2=A0after unpause, guest-side.<br><br>=C2=A0- E=
nd state, stable forever after: vCPU0 spins at 100% inside the<br>=C2=A0 =
=C2=A0multi_cpu_stop corral code (per xenctx; `xl vcpu-list` shows r--<br>=
=C2=A0 =C2=A0accumulating time), while the secondary vCPUs sit blocked in<b=
r>=C2=A0 =C2=A0SCHED_block on their idle-task stacks. Because stop_machine(=
) never<br>=C2=A0 =C2=A0completes, do_suspend() never reaches xen_arch_resu=
me() (so the<br>=C2=A0 =C2=A0secondaries&#39; local ticks, suspended by xen=
_arch_suspend() before the<br>=C2=A0 =C2=A0corral, are never resumed =E2=80=
=94 nothing will ever wake them) nor<br>=C2=A0 =C2=A0xs_resume()/dpm_resume=
_*() (so xenbus frontends never reconnect).<br><br>A speculative note on th=
e trigger, from reading the 6.12 code =E2=80=94 treat<br>as unverified: xen=
_vcpu_restore() (called from xen_pv_post_suspend()<br>while the secondaries=
 are mid-corral with virtual interrupts masked)<br>does VCPUOP_down, re-reg=
isters vcpu_info via xen_vcpu_setup_restore(),<br>then VCPUOP_up on each se=
condary. If the re-registration ends up with<br>evtchn_upcall_mask clear in=
 the newly registered vcpu_info, the vCPU<br>comes back up with an unexpect=
ed upcall window mid-corral; stray<br>exc_xen_hypervisor_callback frames in=
 the secondaries&#39; backtraces are<br>consistent with that. I stopped roo=
t-causing at this point.<br><br>Happy to provide the full console logs, xen=
ctx dumps at<br>suspend/restored-paused/wedged, and the reproduction script=
s, or to<br>test patches.<br></div></div>

--0000000000003fa71a0658328abf--

