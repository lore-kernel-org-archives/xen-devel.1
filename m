Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE505C5DF97
	for <xen-devel@archiver.kernel.org>; Wed, 26 Aug 2026 09:42:41 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1399758.1635744 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzA9A-0007WE-Nm; Wed, 26 Aug 2026 09:42:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1399758.1635744; Wed, 26 Aug 2026 09:42:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzA9A-0007W7-Kj; Wed, 26 Aug 2026 09:42:16 +0000
Received: by outflank-mailman (input) for mailman id 1399758;
 Wed, 26 Aug 2026 09:42:15 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <mlureau@redhat.com>) id 1wzA99-0007Vj-8i
 for xen-devel@lists.xenproject.org; Wed, 26 Aug 2026 09:42:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzA97-00BUrd-El
 for xen-devel@lists.xenproject.org; Wed, 26 Aug 2026 11:42:13 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <mlureau@redhat.com>)
 id 6a8eb4f4-e002-0a2a0a5209dd-0a2a450aca08-2
 for <xen-devel@lists.xenproject.org>; Wed, 26 Aug 2026 11:42:13 +0200
Received: from [170.10.133.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <mlureau@redhat.com>)
 id 6a8eb4f4-f2d2-0a2a450a0019-aa0a857cb9f1-3
 for <xen-devel@lists.xenproject.org>; Wed, 26 Aug 2026 11:42:13 +0200
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-172-BYEdn3DRMtaF2x2TrpJcXA-1; Wed, 26 Aug 2026 05:42:09 -0400
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-cc132709c76so1307930a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 26 Aug 2026 02:42:09 -0700 (PDT)
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
	s=mimecast20190719; t=1787737331;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cSRhiRnZLNoz4j1O+xumJH2wghFBy7JpPCbRlPFYp/4=;
	b=BE5lLIv9tN0kJDqudX7h8Of/0pOWavxJFmqxcQ0N+1wmLCfwHlYMD17+CYbxMf/kl4vJre
	LmEx8JqYrw3nBBeuVTkSar+fJHF+U9qF1MYYSFqtn9RwTxgS/vJvsJi9pFEuYRJnIC3Csa
	rt2wC9jilS6ifBEpfcqhlsCFcr72YTs=
X-MC-Unique: BYEdn3DRMtaF2x2TrpJcXA-1
X-Mimecast-MFC-AGG-ID: BYEdn3DRMtaF2x2TrpJcXA_1787737328
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787737328; x=1788342128;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cSRhiRnZLNoz4j1O+xumJH2wghFBy7JpPCbRlPFYp/4=;
        b=iZFcHZaEe0yhXR8NM0UarjiSzRtNS9Xi6MszlYK7EqOs5TzCsHg0ntk50krE9hpAFr
         uYDESj2QUxEXgvWTqz2TVR+vR8jAe81qVsct9CRq2tjdANs4kJcy9WVdgxxKoe70PXxa
         uL4LEWjnV8kJZNsYZcgRSMkKot8AK8x66Z0bi/5FOEL0pYrM+01SzYpLsrI3idovhxef
         +kts6MLRET1E5rGnnqc7WCjQnJOnH7y3wvTolnXgupol036RaUqAaRRWxTWLy2HMKq1B
         tIwwdfthV9Ux3sq/rU+XJ48+MzxjFWYgKsq2V31h9wQmC8qqa7sIkJlpFgDLjLaFefnI
         LBqg==
X-Forwarded-Encrypted: i=1; AHgh+RpP92P1SIfV6OOtdr6yHOpsITKS6f/LZpqQGA3I5ksTG4lx2KnyRDXpUSwup5CdbC/juEki99gmKG4=@lists.xenproject.org
X-Gm-Message-State: AFuF++misSmlUbmKJU+wfihHxnq9YKvT9h+BNR1y0R70nGoGAyc6B/VP
	iGXASOUmnSpy1PlnQYZ86p+xbReih4Sud7w/PWrGOiX33+VJr55QlqR1ihP7JNuNn+wC5hE7MW8
	7xKj71W93opa5boVoRihnQRCa5SvXl1LC19TEsADAsrsG+tjFsB/ZPkpmysKGI/MRWmprwrf+a1
	BiSufkE0/CYYM3HhxfeAtU57TrZ/4FZPkLvHzSU375vM0=
X-Gm-Gg: AR+sD13wy2NYe/q577JlInXZsPihhAPDB5ty8soaZQ1D8317A86MapEEk3wa+b4ef1j
	HnjUex6xjWDiDQvQBuVVF23B5AU9V81/AE3LV5GR1HuUAFTVoYVplXAzJm1XETTR5u4Am1NrhsU
	qrDZ/CsjkBMKojfgDqpy5pt9B3iHy0Dwm6NcapSrKbOxOs++LsMaz8VtVouQguSse1du8x/zg3q
	p86hvXElnqLn76GViATAa2bKENKx8LV2Xat00+sLi+m6AtIbq5qEOlMYBk5CjsvBCdg8a3RWSun
	YQ==
X-Received: by 2002:a05:6a20:2584:b0:3cc:8344:1213 with SMTP id adf61e73a8af0-3cf83531791mr9386642637.8.1787737328152;
        Wed, 26 Aug 2026 02:42:08 -0700 (PDT)
X-Received: by 2002:a05:6a20:2584:b0:3cc:8344:1213 with SMTP id
 adf61e73a8af0-3cf83531791mr9386473637.8.1787737327525; Wed, 26 Aug 2026
 02:42:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260825-qemu-no-hmp-v4-0-af60857c2fbe@redhat.com>
 <20260825-qemu-no-hmp-v4-36-af60857c2fbe@redhat.com> <ao6pyiBkHZJz_9JR@redhat.com>
In-Reply-To: <ao6pyiBkHZJz_9JR@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Wed, 26 Aug 2026 13:41:55 +0400
X-Gm-Features: AcwNN1UW47qL6Xcco1r65R6n9lM9Iv0EQgjkA8oE2IKKhKY4fAQjALpMF87caYU
Message-ID: <CAMxuvaz+85Pw=sZG2jXL5jJ_2=kkR5_P69-AZ6bzhVbGTA+5Xg@mail.gmail.com>
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
X-Mimecast-MFC-PROC-ID: _-_nXBBwZ-BAl_PppTmh1o0BoGqsliRyHMfRoiQGWqU_1787737328
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-4011c0/1787737333-59DDFCFC-4E84E677/0/0
X-purgate-type: clean
X-purgate-size: 6660

Hi

On Wed, Aug 26, 2026 at 12:54=E2=80=AFPM Daniel P. Berrang=C3=A9 <berrange@=
redhat.com> wrote:
>
> On Tue, Aug 25, 2026 at 11:09:43PM +0400, Marc-Andr=C3=A9 Lureau wrote:
> > Rename monitor_printf->monitor_hmp_printf, monitor_vprintf->
> > monitor_hmp_vprintf, and monitor_printc->monitor_hmp_printc, changing
> > the first parameter from Monitor * to MonitorHMP * to enforce type
> > safety. The implementation is also simplified: monitor_hmp_vprintf now
> > directly calls g_strdup_vprintf + monitor_puts, removing the virtual
> > dispatch via moncls->vprintf.
> >
> > The dev_print() callbacks are temporarily using the MONITOR_HMP(mon)
> > cast, they are fixed in the following commits.
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >  audio/audio-hmp-cmds.c                  |   6 +-
> >  backends/cryptodev-hmp-cmds.c           |   9 +-
> >  block/monitor/block-hmp-cmds.c          | 170 +++++++++---------
> >  chardev/char-hmp-cmds.c                 |  12 +-
> >  disas/disas-mon.c                       |  10 +-
> >  docs/devel/style.rst                    |   2 +-
> >  docs/devel/writing-monitor-commands.rst |   8 +-
> >  dump/dump-hmp-cmds.c                    |   5 +-
> >  hw/char/virtio-serial-bus.c             |  10 +-
> >  hw/core/machine-hmp-cmds.c              | 213 +++++++++++-----------
> >  hw/core/sysbus.c                        |   5 +-
> >  hw/hexagon/hexagon_tlb.c                |  44 ++---
> >  hw/i386/kvm/xen-stubs.c                 |   6 +-
> >  hw/i386/kvm/xen_evtchn.c                |  21 +--
> >  hw/i386/sgx-hmp-stub.c                  |   3 +-
> >  hw/i386/sgx.c                           |  29 ++-
> >  hw/misc/auxbus.c                        |   9 +-
> >  hw/misc/mos6522-stub.c                  |   3 +-
> >  hw/net/rocker/rocker-hmp-cmds.c         | 146 ++++++++--------
> >  hw/pci/pci-hmp-cmds.c                   | 114 ++++++------
> >  hw/pci/pci-stub.c                       |   3 +-
> >  hw/s390x/s390-skeys.c                   |   9 +-
> >  hw/s390x/s390-stattrib.c                |  20 +--
> >  hw/uefi/ovmf-log.c                      |   5 +-
> >  hw/usb/bus.c                            |  11 +-
> >  hw/usb/host-libusb.c                    |  21 ++-
> >  hw/virtio/virtio-hmp-cmds.c             | 297 ++++++++++++++++--------=
-------
> >  hw/xen/xen-bus.c                        |   5 +-
> >  include/disas/disas.h                   |   4 +-
> >  include/monitor/hmp.h                   |  12 +-
> >  migration/dirtyrate.c                   |  46 +++--
> >  migration/migration-hmp-cmds.c          | 301 ++++++++++++++++--------=
--------
> >  monitor/hmp-cmds.c                      | 141 +++++++--------
> >  monitor/hmp.c                           | 143 +++++++--------
> >  monitor/monitor-internal.h              |   6 -
> >  monitor/monitor.c                       |  33 ++--
> >  net/net-hmp-cmds.c                      |  31 ++--
> >  net/slirp.c                             |  31 ++--
> >  qom/qom-hmp-cmds.c                      |  27 ++-
> >  replay/replay-debugging.c               |   5 +-
> >  stats/stats-hmp-cmds.c                  |  57 +++---
> >  stubs/hmp-cmd-info_sev.c                |   3 +-
> >  stubs/monitor-core.c                    |   2 +-
> >  system/dirtylimit-hmp-cmds.c            |  10 +-
> >  system/qdev-monitor.c                   |  19 +-
> >  system/runstate-hmp-cmds.c              |  16 +-
> >  system/tpm-hmp-cmds.c                   |  29 ++-
> >  target/i386/cpu-apic.c                  |   3 +-
> >  target/i386/monitor.c                   | 152 ++++++++--------
> >  target/i386/sev.c                       |  35 ++--
> >  target/m68k/monitor.c                   |   3 +-
> >  target/ppc/monitor.c                    |   3 +-
> >  target/riscv/monitor.c                  |  55 +++---
> >  target/sh4/monitor.c                    |  29 ++-
> >  target/sparc/monitor.c                  |   3 +-
> >  target/xtensa/monitor.c                 |   3 +-
> >  tests/unit/test-util-sockets.c          |   2 +-
> >  tools/qemu-vnc/clipboard.c              |   4 +-
> >  tools/qemu-vnc/stubs.c                  |   2 +-
> >  trace/trace-hmp-cmds.c                  |  12 +-
> >  ui/ui-hmp-cmds.c                        | 115 ++++++------
> >  util/error-report.c                     |   2 +-
> >  util/qemu-print.c                       |  11 +-
> >  63 files changed, 1219 insertions(+), 1327 deletions(-)
>
>
>
>
> > diff --git a/util/qemu-print.c b/util/qemu-print.c
> > index 5d4143d425a1..5938f2b6c338 100644
> > --- a/util/qemu-print.c
> > +++ b/util/qemu-print.c
> > @@ -13,6 +13,7 @@
> >  #include "qemu/osdep.h"
> >  #include "monitor/monitor.h"
> >  #include "monitor/hmp.h"
> > +#include "qom/object.h"
> >  #include "qemu/qemu-print.h"
> >
> >  /*
> > @@ -23,8 +24,13 @@
> >  int qemu_vprintf(const char *fmt, va_list ap)
> >  {
> >      Monitor *cur_mon =3D monitor_cur();
> > +
> > +    /* for all monitors: QMP & HMP */
> >      if (cur_mon) {
> > -        return monitor_vprintf(cur_mon, fmt, ap);
> > +        /* don't use monitor_cur_hmp(), to avoid a second lookup */
> > +        MonitorHMP *hmp =3D (MonitorHMP *)
> > +            object_dynamic_cast(OBJECT(cur_mon), TYPE_MONITOR_HMP);
> > +        return monitor_hmp_vprintf(hmp, fmt, ap);
>
> This isn't the same semantics AFAICT.
>
> Original code, if monitor_cur() =3D=3D QMP, we call monitor_vprintf()
> which will return -1.
>
> New code, if monitor_cur() =3D=3D QMP, we will get a NULL back from
> object_dynamic_cast which we then pass into monitor_hmp_vprintf
> which will then crash on monitor_puts() IIUC.

monitor_hmp_vprintf() has an early return, if given NULL monitor, it return=
s -1.

>
> >      }
> >      return vprintf(fmt, ap);
> >  }
> > @@ -55,7 +61,8 @@ int qemu_printf(const char *fmt, ...)
> >  int qemu_vfprintf(FILE *stream, const char *fmt, va_list ap)
> >  {
> >      if (!stream) {
> > -        return monitor_vprintf(monitor_cur(), fmt, ap);
> > +        MonitorHMP *hmp =3D monitor_cur_hmp();
> > +        return monitor_hmp_vprintf(hmp, fmt, ap);
>
> Same, this should crash on QMP now IIUC.
>
> >      }
> >      return vfprintf(stream, fmt, ap);
> >  }
> >
> > --
> > 2.55.0.543.g5ebe2ebe4ea8
> >
>
> With regards,
> Daniel
> --
> |: https://berrange.com       ~~        https://hachyderm.io/@berrange :|
> |: https://libvirt.org          ~~          https://entangle-photo.org :|
> |: https://pixelfed.art/berrange   ~~    https://fstop138.berrange.com :|
>


