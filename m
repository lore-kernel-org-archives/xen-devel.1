Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E83FC61DBD
	for <xen-devel@archiver.kernel.org>; Wed, 26 Aug 2026 13:05:19 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1399929.1635905 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzDJE-00083X-0K; Wed, 26 Aug 2026 13:04:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1399929.1635905; Wed, 26 Aug 2026 13:04:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzDJD-00083Q-TD; Wed, 26 Aug 2026 13:04:51 +0000
Received: by outflank-mailman (input) for mailman id 1399929;
 Wed, 26 Aug 2026 13:04:51 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <mlureau@redhat.com>) id 1wzDJD-000834-0h
 for xen-devel@lists.xenproject.org; Wed, 26 Aug 2026 13:04:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzDJ9-00HLFy-G7
 for xen-devel@lists.xenproject.org; Wed, 26 Aug 2026 15:04:47 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <mlureau@redhat.com>)
 id 6a8ee46c-bab6-0a2a0a5309dd-0a2a4501d188-10
 for <xen-devel@lists.xenproject.org>; Wed, 26 Aug 2026 15:04:47 +0200
Received: from [170.10.133.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <mlureau@redhat.com>)
 id 6a8ee46e-5984-0a2a45010019-aa0a857cb76f-3
 for <xen-devel@lists.xenproject.org>; Wed, 26 Aug 2026 15:04:47 +0200
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-384-qf1VUEI1NT-6Wqszt1hsew-1; Wed, 26 Aug 2026 09:04:44 -0400
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-38f5ac7354dso1432819a91.1
 for <xen-devel@lists.xenproject.org>; Wed, 26 Aug 2026 06:04:44 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=mimecast20190719 header.d=redhat.com header.i="@redhat.com" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787749486;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oYVc9rcGEnzzR41SIfmJfIkt0WWDTdKBFsBRE9m9Ol0=;
	b=i+0qPnV+2ySestF3H3Lwti26st1iDHKX7qDMeQeZ5Z/x2HXCjdvxOP4X0il9Blhe89AIFF
	NUhlyC+rcANqnhXYF8zL9VJevFaaTDva9EdfqaTW66WvAuc9PC2NHqbn9HlD2uhq3u3HUp
	xmMlxDWrOqLAGBEwX6DUi8IduVJTkZ0=
X-MC-Unique: qf1VUEI1NT-6Wqszt1hsew-1
X-Mimecast-MFC-AGG-ID: qf1VUEI1NT-6Wqszt1hsew_1787749484
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787749483; x=1788354283;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oYVc9rcGEnzzR41SIfmJfIkt0WWDTdKBFsBRE9m9Ol0=;
        b=TPiawxz8Nl3aRA2yXaTuJztNdUGAkZGY8i+ztg5PakidLbn1iQ2XHaxkKRU2Ntczut
         +qOyqaxJKSTZxnBiDSlXTvq3kwLi+A+gVjnyyYxUiHtY4JRW42OQbnlnJnIuf8Fzb0Hh
         T87zQrH3bzmnVCm3rG3htYY+8bIRvMEd9KpOVk+gILCX5Sv0zMqcubLxQm4WW8nsYRnu
         /7+E3pYa9Mh+DGZPcppNMZkOnPDkqWhNwYiTBDw/s26hzw4AqOFx9gWe6CcrSJer2rBQ
         Qo/B5eFOvLzLTbW1Z6HfdBOvFOKwiBCJ3TWhYWC96BbqbCT6Avg3eEZay2uqCrDYS/pA
         byPA==
X-Forwarded-Encrypted: i=1; AHgh+RogvD9+1N7exFSF9sK4/Nz3zAxBgjVcP6wegrvItvRpKM/FZQqF/BaqVEimBUfTOyv8QPxTZ1t8nU4=@lists.xenproject.org
X-Gm-Message-State: AFuF++kJ09Cy+pRVuoHmWOErJ1Ehni4qrSwgXRb9ACATeai2k9lwZ3c3
	tEI6NSgI/L5Ro7Rfrm4HlFA9RPLA7k5mvg6owjelVUtSf0rGoCIf9egBtwW+5lHqhe4INM4tH1X
	BVPTRt1CjUs0qB+vRZ9fEYHr+95uBPAqaxUgZizL931dqiT9lOLFv6UDr9ylAXDapaAKXxVxu3a
	KTVmPde/vb1KMK4m3zfzx5yatdN3dNjeX6yTt+2hRmoGI=
X-Gm-Gg: AR+sD11NTTCZX1XYKIUW+sqySDgkVBQfFTZmh3AUjFqgEEMBS2OpD3pAinrzl+Q0gc9
	i+TjJOnXukpj7zYI7eU8DyL+Ut/PTE8bf/FPGoHwBUKErPtJ0iUBsMeQAfJCayDAhtbIQ95kMJa
	X9u7ShXSDucnKM6icxdIMBoplS08lvZ57kYYNOQJ3k0fIlY9jhfS0z3l/nVAVEWyjMKXyeTnrTP
	qk19B75pUkzzqctI7HUw1oZ5RFQX+uItJmtK55HvKEB/B9muCV1Lm7YC93Us12ydqDkbyzb2uMT
	hA==
X-Received: by 2002:a17:90b:5107:b0:37f:fb1d:63fa with SMTP id 98e67ed59e1d1-3966d9e5ecfmr14607057a91.15.1787749483028;
        Wed, 26 Aug 2026 06:04:43 -0700 (PDT)
X-Received: by 2002:a17:90b:5107:b0:37f:fb1d:63fa with SMTP id
 98e67ed59e1d1-3966d9e5ecfmr14606542a91.15.1787749481523; Wed, 26 Aug 2026
 06:04:41 -0700 (PDT)
MIME-Version: 1.0
References: <20260825-qemu-no-hmp-v4-0-af60857c2fbe@redhat.com>
 <20260825-qemu-no-hmp-v4-36-af60857c2fbe@redhat.com> <ao6pyiBkHZJz_9JR@redhat.com>
 <CAMxuvaz+85Pw=sZG2jXL5jJ_2=kkR5_P69-AZ6bzhVbGTA+5Xg@mail.gmail.com> <ao65_XCKmkpm9s2F@redhat.com>
In-Reply-To: <ao65_XCKmkpm9s2F@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Wed, 26 Aug 2026 17:04:29 +0400
X-Gm-Features: AcwNN1UokCmDa7kHDxB9ZTq3xrLUmyLSJ7h0c4jfatvRCC3sSrStOXkF7y4zowA
Message-ID: <CAMxuvayGzQtu1COC5G1D+CKZuXmhCeDV5fZMvYtiK95eMh+i3A@mail.gmail.com>
Subject: Re: [PATCH v4 36/49] monitor: tighten monitor_printf*()
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, dave@treblig.org, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@mailo.com>, 
	Markus Armbruster <armbru@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
	"Gonglei (Arei)" <arei.gonglei@huawei.com>, zhenwei pi <zhenwei.pi@linux.dev>, 
	Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, Ani Sinha <anisinha@redhat.com>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <lvivier@redhat.com>, Amit Shah <amit@kernel.org>, 
	Brian Cain <brian.cain@oss.qualcomm.com>, David Woodhouse <dwmw2@infradead.org>, 
	Paul Durrant <paul@xen.org>, Richard Henderson <richard.henderson@linaro.org>, 
	Marcelo Tosatti <mtosatti@redhat.com>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
	Jiri Pirko <jiri@resnulli.us>, Jason Wang <jasowangio@gmail.com>, 
	Halil Pasic <pasic@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Jason Herne <jjherne@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>, 
	Matthew Rosato <mjrosato@linux.ibm.com>, Ilya Leoshkevich <iii@linux.ibm.com>, 
	David Hildenbrand <david@kernel.org>, Cornelia Huck <cohuck@redhat.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD <anthony@xenproject.org>, 
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Hyman Huang <infra.ai.cloud@bitdeer.com>, 
	Peter Xu <peterx@redhat.com>, Fabiano Rosas <farosas@suse.de>, 
	Samuel Thibault <samuel.thibault@ens-lyon.org>, Stefan Berger <stefanb@linux.vnet.ibm.com>, 
	Zhao Liu <zhao1.liu@intel.com>, Nicholas Piggin <npiggin@gmail.com>, 
	Chinmay Rath <rathc@linux.ibm.com>, Glenn Miles <milesg@linux.ibm.com>, 
	Harsh Prateek Bora <harshpb@linux.ibm.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Alistair Francis <alistair.francis@wdc.com>, Weiwei Li <liwei1518@gmail.com>, 
	Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
	Chao Liu <chao.liu@processmission.com>, Yoshinori Sato <yoshinori.sato@nifty.com>, 
	Artyom Tarasenko <atar4qemu@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>, 
	Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org, kvm@vger.kernel.org, 
	qemu-ppc@nongnu.org, qemu-s390x@nongnu.org, xen-devel@lists.xenproject.org, 
	qemu-riscv@nongnu.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4ioSzqpDfxOQwyXJqgE-qPf-XPHsu7_fmbSUrqFClkQ_1787749484
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-d62444/1787749487-1FC69757-0FA25AB4/0/0
X-purgate-type: clean
X-purgate-size: 7219

Hi

On Wed, Aug 26, 2026 at 2:04=E2=80=AFPM Daniel P. Berrang=C3=A9 <berrange@r=
edhat.com> wrote:
>
> On Wed, Aug 26, 2026 at 01:41:55PM +0400, Marc-Andr=C3=A9 Lureau wrote:
> > Hi
> >
> > On Wed, Aug 26, 2026 at 12:54=E2=80=AFPM Daniel P. Berrang=C3=A9 <berra=
nge@redhat.com> wrote:
> > >
> > > On Tue, Aug 25, 2026 at 11:09:43PM +0400, Marc-Andr=C3=A9 Lureau wrot=
e:
> > > > Rename monitor_printf->monitor_hmp_printf, monitor_vprintf->
> > > > monitor_hmp_vprintf, and monitor_printc->monitor_hmp_printc, changi=
ng
> > > > the first parameter from Monitor * to MonitorHMP * to enforce type
> > > > safety. The implementation is also simplified: monitor_hmp_vprintf =
now
> > > > directly calls g_strdup_vprintf + monitor_puts, removing the virtua=
l
> > > > dispatch via moncls->vprintf.
> > > >
> > > > The dev_print() callbacks are temporarily using the MONITOR_HMP(mon=
)
> > > > cast, they are fixed in the following commits.
> > > >
> > > > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > > > ---
> > > >  audio/audio-hmp-cmds.c                  |   6 +-
> > > >  backends/cryptodev-hmp-cmds.c           |   9 +-
> > > >  block/monitor/block-hmp-cmds.c          | 170 +++++++++---------
> > > >  chardev/char-hmp-cmds.c                 |  12 +-
> > > >  disas/disas-mon.c                       |  10 +-
> > > >  docs/devel/style.rst                    |   2 +-
> > > >  docs/devel/writing-monitor-commands.rst |   8 +-
> > > >  dump/dump-hmp-cmds.c                    |   5 +-
> > > >  hw/char/virtio-serial-bus.c             |  10 +-
> > > >  hw/core/machine-hmp-cmds.c              | 213 +++++++++++---------=
--
> > > >  hw/core/sysbus.c                        |   5 +-
> > > >  hw/hexagon/hexagon_tlb.c                |  44 ++---
> > > >  hw/i386/kvm/xen-stubs.c                 |   6 +-
> > > >  hw/i386/kvm/xen_evtchn.c                |  21 +--
> > > >  hw/i386/sgx-hmp-stub.c                  |   3 +-
> > > >  hw/i386/sgx.c                           |  29 ++-
> > > >  hw/misc/auxbus.c                        |   9 +-
> > > >  hw/misc/mos6522-stub.c                  |   3 +-
> > > >  hw/net/rocker/rocker-hmp-cmds.c         | 146 ++++++++--------
> > > >  hw/pci/pci-hmp-cmds.c                   | 114 ++++++------
> > > >  hw/pci/pci-stub.c                       |   3 +-
> > > >  hw/s390x/s390-skeys.c                   |   9 +-
> > > >  hw/s390x/s390-stattrib.c                |  20 +--
> > > >  hw/uefi/ovmf-log.c                      |   5 +-
> > > >  hw/usb/bus.c                            |  11 +-
> > > >  hw/usb/host-libusb.c                    |  21 ++-
> > > >  hw/virtio/virtio-hmp-cmds.c             | 297 ++++++++++++++++----=
-----------
> > > >  hw/xen/xen-bus.c                        |   5 +-
> > > >  include/disas/disas.h                   |   4 +-
> > > >  include/monitor/hmp.h                   |  12 +-
> > > >  migration/dirtyrate.c                   |  46 +++--
> > > >  migration/migration-hmp-cmds.c          | 301 ++++++++++++++++----=
------------
> > > >  monitor/hmp-cmds.c                      | 141 +++++++--------
> > > >  monitor/hmp.c                           | 143 +++++++--------
> > > >  monitor/monitor-internal.h              |   6 -
> > > >  monitor/monitor.c                       |  33 ++--
> > > >  net/net-hmp-cmds.c                      |  31 ++--
> > > >  net/slirp.c                             |  31 ++--
> > > >  qom/qom-hmp-cmds.c                      |  27 ++-
> > > >  replay/replay-debugging.c               |   5 +-
> > > >  stats/stats-hmp-cmds.c                  |  57 +++---
> > > >  stubs/hmp-cmd-info_sev.c                |   3 +-
> > > >  stubs/monitor-core.c                    |   2 +-
> > > >  system/dirtylimit-hmp-cmds.c            |  10 +-
> > > >  system/qdev-monitor.c                   |  19 +-
> > > >  system/runstate-hmp-cmds.c              |  16 +-
> > > >  system/tpm-hmp-cmds.c                   |  29 ++-
> > > >  target/i386/cpu-apic.c                  |   3 +-
> > > >  target/i386/monitor.c                   | 152 ++++++++--------
> > > >  target/i386/sev.c                       |  35 ++--
> > > >  target/m68k/monitor.c                   |   3 +-
> > > >  target/ppc/monitor.c                    |   3 +-
> > > >  target/riscv/monitor.c                  |  55 +++---
> > > >  target/sh4/monitor.c                    |  29 ++-
> > > >  target/sparc/monitor.c                  |   3 +-
> > > >  target/xtensa/monitor.c                 |   3 +-
> > > >  tests/unit/test-util-sockets.c          |   2 +-
> > > >  tools/qemu-vnc/clipboard.c              |   4 +-
> > > >  tools/qemu-vnc/stubs.c                  |   2 +-
> > > >  trace/trace-hmp-cmds.c                  |  12 +-
> > > >  ui/ui-hmp-cmds.c                        | 115 ++++++------
> > > >  util/error-report.c                     |   2 +-
> > > >  util/qemu-print.c                       |  11 +-
> > > >  63 files changed, 1219 insertions(+), 1327 deletions(-)
> > >
> > >
> > >
> > >
> > > > diff --git a/util/qemu-print.c b/util/qemu-print.c
> > > > index 5d4143d425a1..5938f2b6c338 100644
> > > > --- a/util/qemu-print.c
> > > > +++ b/util/qemu-print.c
> > > > @@ -13,6 +13,7 @@
> > > >  #include "qemu/osdep.h"
> > > >  #include "monitor/monitor.h"
> > > >  #include "monitor/hmp.h"
> > > > +#include "qom/object.h"
> > > >  #include "qemu/qemu-print.h"
> > > >
> > > >  /*
> > > > @@ -23,8 +24,13 @@
> > > >  int qemu_vprintf(const char *fmt, va_list ap)
> > > >  {
> > > >      Monitor *cur_mon =3D monitor_cur();
> > > > +
> > > > +    /* for all monitors: QMP & HMP */
> > > >      if (cur_mon) {
> > > > -        return monitor_vprintf(cur_mon, fmt, ap);
> > > > +        /* don't use monitor_cur_hmp(), to avoid a second lookup *=
/
> > > > +        MonitorHMP *hmp =3D (MonitorHMP *)
> > > > +            object_dynamic_cast(OBJECT(cur_mon), TYPE_MONITOR_HMP)=
;
> > > > +        return monitor_hmp_vprintf(hmp, fmt, ap);
> > >
> > > This isn't the same semantics AFAICT.
> > >
> > > Original code, if monitor_cur() =3D=3D QMP, we call monitor_vprintf()
> > > which will return -1.
> > >
> > > New code, if monitor_cur() =3D=3D QMP, we will get a NULL back from
> > > object_dynamic_cast which we then pass into monitor_hmp_vprintf
> > > which will then crash on monitor_puts() IIUC.
> >
> > monitor_hmp_vprintf() has an early return, if given NULL monitor, it re=
turns -1.
>
> Hmm, I feel like we should be dealing with NULL in this method, as it
> is surprising to be calling a monitor_hmp_XXX method in scenario where
> QMP is a (theoretical) possibility.

"hmp" would be NULL in that case, but I agree it's a bit confusing.

I would go as far and make hmp required for the call, but I can't
review all the code paths to monitor_hmp_(v)printf()
I'll add an early return in qemu-print.c

>
>
> With regards,
> Daniel
> --
> |: https://berrange.com       ~~        https://hachyderm.io/@berrange :|
> |: https://libvirt.org          ~~          https://entangle-photo.org :|
> |: https://pixelfed.art/berrange   ~~    https://fstop138.berrange.com :|
>


