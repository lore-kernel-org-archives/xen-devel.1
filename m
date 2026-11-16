Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46D50606A31C
	for <xen-devel@archiver.kernel.org>; Mon, 16 Nov 2026 14:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fd0eCIrG
Received: from list by lists.xenproject.org with outflank-mailman.1491005.1691916 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSxfA-00022i-Qv; Mon, 16 Nov 2026 14:26:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1491005.1691916; Mon, 16 Nov 2026 14:26:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSxfA-00022b-NH; Mon, 16 Nov 2026 14:26:28 +0000
Received: by outflank-mailman (input) for mailman id 1491005;
 Mon, 16 Nov 2026 14:26:27 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3jxL7agYKCf4ykgtpimuumrk.ius3kt-jk1krroyzy.3ktvxupkiz.uxm@flex--seanjc.bounces.google.com>)
 id 1xSxf9-00022V-4f
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 14:26:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xSxf8-00BK1y-H0
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 15:26:26 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3jxL7agYKCf4ykgtpimuumrk.ius3kt-jk1krroyzy.3ktvxupkiz.uxm@flex--seanjc.bounces.google.com>)
 id 6afb1286-8faa-0a2a0a5109dd-0a2a450ae9e0-48
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 15:26:26 +0100
Received: from [209.85.210.200] (helo=mail-pf1-f200.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3jxL7agYKCf4ykgtpimuumrk.ius3kt-jk1krroyzy.3ktvxupkiz.uxm@flex--seanjc.bounces.google.com>)
 id 6afb1290-f2d2-0a2a450a0019-d155d2c8d41f-3
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 15:26:26 +0100
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-8b647bbf8a9so3985417b3a.0
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 06:26:25 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=google.com header.i="@google.com" header.h="Content-Transfer-Encoding:Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794839184; x=1795443984; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Julx96UTlwUpy/yEEb6XKUMDaihQ6nHqBxqUTRWWoDs=;
        b=fd0eCIrGlvKx5FbinuCPwDsneEx0zhJP8dWLJvQs8xcgOu6kc5BWtx06fwk2DYsR4H
         Js3ELi/6XME+jyacdDQhL1U813jY0fZHOUhDtrz4qmIwYa8tqvJOBcasRad/w9AzcxH6
         AnXexstBvrUQ9bG4SJEAii/UDnMNl+4g46i/3nuGTzulY4N2VOOHHMmrfAAu/beD6H7D
         Ps78FabWyoe0/cQCjSx702ib7Eb1OSJH6CP/YSp/oEGAab1CaiF4/DrDopYoESjWmrx7
         CiRm3b4cQ5wyz2KMvjZHPjSVjgQolOZmQcKbh2evhJsNtiqBEve/HwpZiM0N9lApxkng
         Zxsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794839184; x=1795443984;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Julx96UTlwUpy/yEEb6XKUMDaihQ6nHqBxqUTRWWoDs=;
        b=aY8LQ7mLKa1Os2xsDI9s8Bvpw0TSv4SQ6ppjRO/hWddiLIwF9u8QzuIAQ2q/qCsUHJ
         G3mRiT90LYgMp8zCTa+ItY3ffinXzxENRVQMhWXmD/eJGaPsp4w1RAd90jWzPzMADbgm
         FkbJ2VTn2zYFJzqKcPh0mGD0JOyAWdLDpnu6A/86taPRTZhQwxogXUOL5JUkdZnxzhnf
         PIai82XYhPaaQsJkb6yypyrXp+v2cz+H4oagsyj939kRSwLwGPv8IZhTdmDkl65Rp/TO
         6ZKUNn14UBN+8I2g1otdfCuh2BBw47qkeggxBmgU0tn6i28x0qHCQr8LolBWs6xjp5aY
         6Ing==
X-Forwarded-Encrypted: i=1; AL+hErE1FWR3t66awHJSf6oMfQcaTCIzIJJVIhXu6SiVNYg9qd7UE1F5lhdJHkQ1Pgue0JH2Bgv0cCJWV+8=@lists.xenproject.org
X-Gm-Message-State: APuU4Z9KAf8gA44WIab8PnAbChuW5kE8hy0qc4lXVdCLoEDJ42XBLOHt
	QaeyQReB6k2ziztWZZr9Z/vpSoIijRudaxvX6TdbnCLtleeyF+ibDPuAvLMr3eLoUe71z7z1gGt
	zLWKmjg==
X-Received: from pffm4-n2.prod.google.com ([2002:a05:6a00:c304:20b0:8a0:70d8:a2ef])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:4fc3:b0:89f:b166:bde6
 with SMTP id d2e1a72fcca58-8beb8cc8ad6mr9720424b3a.54.1794839183449; Mon, 16
 Nov 2026 06:26:23 -0800 (PST)
Date: Mon, 16 Nov 2026 06:26:22 -0800
In-Reply-To: <20261114202653.3113381-10-rdunlap@infradead.org>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261114202653.3113381-1-rdunlap@infradead.org> <20261114202653.3113381-10-rdunlap@infradead.org>
Message-ID: <avsSjioXqbCOn834@seanjc-mac.roam.internal>
Subject: Re: [PATCH 09/12] docs: ioctl-number: update virtualization entries
From: Sean Christopherson <seanjc@google.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org, 
	David Hildenbrand <david@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Jason Gunthorpe <jgg@nvidia.com>, Leon Romanovsky <leonro@nvidia.com>, linux-mm@kvack.org, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org, 
	Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	linux-bluetooth@vger.kernel.org, 
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>, Jason Wang <jasowangio@gmail.com>, 
	David Heidelberg <david@ixit.cz>, oe-linux-nfc@lists.linux.dev, 
	Chas Williams <3chas3@gmail.com>, linux-atm-general@lists.sourceforge.net, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org, 
	Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, MPT-FusionLinux.pdl@broadcom.com, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <mkp@kernel.org>, linux-scsi@vger.kernel.org, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Zhihao Cheng <chengzhihao1@huawei.com>, linux-mtd@lists.infradead.org, 
	Neill Kapron <nkapron@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, 
	Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org, 
	Hans de Goede <hansg@kernel.org>, Arnd Bergmann <arnd@arndb.de>, "Michael S. Tsirkin" <mst@redhat.com>, 
	"Eugenio =?utf-8?B?UMOpcmV6?=" <eperezma@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, 
	virtualization@lists.linux.dev, Jan Kara <jack@suse.cz>, 
	linux-fsdevel@vger.kernel.org, "Theodore Ts'o" <tytso@mit.edu>, linux-ext4@vger.kernel.org, 
	Mike Marshall <hubcap@omnibond.com>, devel@lists.orangefs.org, 
	Paulo Alcantara <pc@manguebit.org>, Namjae Jeon <linkinjeon@kernel.org>, linux-cifs@vger.kernel.org, 
	Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>, 
	linux-f2fs-devel@lists.sourceforge.net, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	Tzung-Bi Shih <tzungbi@kernel.org>, Benson Leung <bleung@chromium.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Alex Deucher <alexander.deucher@amd.com>, 
	"Christian =?utf-8?B?S8O2bmln?=" <christian.koenig@amd.com>, amd-gfx@lists.freedesktop.org, 
	Jani Nikula <jani.nikula@linux.intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, intel-gfx@lists.freedesktop.org, 
	Matthew Brost <matthew.brost@intel.com>, 
	"Thomas =?utf-8?Q?Hellstr=C3=B6m?=" <thomas.hellstrom@linux.intel.com>, intel-xe@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-4011c0/1794839186-506CECFC-8D5C8B51/0/0
X-purgate-type: clean
X-purgate-size: 6274
X-Spam-Status: No, score=-23.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_IN_DEF_DKIM_WL autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, Nov 14, 2026, Randy Dunlap wrote:
> Update the list of files where virtualization ioctls are defined.
>=20
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---
> [Since having multiple maintainers trying to merge these would
> cause some conflicts, it would be more manageable for Jon to
> take all of these through the docs-next tree.]
>=20
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Shuah Khan <skhan@linuxfoundation.org>
> Cc: linux-doc@vger.kernel.org
> Cc: Juergen Gross <jgross@suse.com>
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> Cc: xen-devel@lists.xenproject.org
> Cc: Hans de Goede <hansg@kernel.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Jason Wang <jasowangio@gmail.com>
> Cc: Eugenio P=C3=A9rez <eperezma@redhat.com>
> Cc: Sean Christopherson <seanjc@google.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: kvm@vger.kernel.org
> Cc: virtualization@lists.linux.dev
>=20
>  Documentation/userspace-api/ioctl/ioctl-number.rst |    6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> --- linux-next-20261113.orig/Documentation/userspace-api/ioctl/ioctl-numb=
er.rst
> +++ linux-next-20261113/Documentation/userspace-api/ioctl/ioctl-number.rs=
t
> @@ -200,6 +200,7 @@ Code  Seq#    Include File
>  'M'   01-03  drivers/scsi/megaraid/megaraid_sas.h
>  'M'   00-03  drivers/video/fbdev/mb862xx/mb862xxfb.h
>  'M'   00-0F  drivers/video/fsl-diu-fb.h                                c=
onflict!
> +'M'   01-03  xen/interface/xen-mca.h                                   c=
onflict!
>  'N'   00-1F  drivers/usb/scanner.h
>  'N'   40-7F  uapi/linux/nvme_ioctl.h
>  'N'   80-83  uapi/linux/ntsync.h and uapi/linux/nvme_ioctl.h           c=
onflict!
> @@ -239,6 +240,7 @@ Code  Seq#    Include File
>  'U'   64     drivers/usb/misc/usbtest.c                                c=
onflict!
>  'V'   all    linux/vt.h                                                c=
onflict!
>  'V'   all    linux/videodev2.h                                         c=
onflict!
> +'V'   00-1F  linux/vboxguest.h                                         c=
onflict!
>  'V'   C0     linux/ivtvfb.h                                            c=
onflict!
>  'V'   C0     linux/ivtv.h                                              c=
onflict!
>  'V'   C0     media/si4713.h                                            c=
onflict!
> @@ -357,6 +359,7 @@ Code  Seq#    Include File
>  '|'   80-9F  samples/                                                  A=
ny sample and example drivers
>  0x80  00-1F  linux/fb.h
>  0x81  00-1F  linux/vduse.h
> +             drivers/vdpa/vdpa_user/vduse_dev.c
>  0x89  00-07  asm-generic/sockios.h
>  0x89  06-07  linux/sockios.h
>  0x89  0B-DF  linux/sockios.h
> @@ -398,8 +401,11 @@ Code  Seq#    Include File
>                                                                         <=
mailto:kvm@vger.kernel.org>
>  0xAE  40-FF  linux/kvm.h                                               K=
ernel-based Virtual Machine
>                                                                         <=
mailto:kvm@vger.kernel.org>
> +0xAE  C6     arch/x86/kvm/x86.c                                        X=
86 KVM

I'd rather omit this entry.  0xAE C6 is covered by the entry above, and the=
 horror
in arch/x86/kvm/x86.c is purely a 32-bit compatibility alias for an ioctl t=
hat is
defined in kvm.h (the structure payload defines an pointer instead of a __u=
64).

If it's a sticking point, e.g. this will trip automated tooling over and ov=
er, then
I vote to move the relevant definitions to uapi headers, e.g.

diff --git a/arch/x86/include/uapi/asm/kvm.h b/arch/x86/include/uapi/asm/kv=
m.h
index 00ce265391e1..e02ef7a39f7c 100644
--- a/arch/x86/include/uapi/asm/kvm.h
+++ b/arch/x86/include/uapi/asm/kvm.h
@@ -230,6 +230,18 @@ struct kvm_msr_filter {
 	struct kvm_msr_filter_range ranges[KVM_MSR_FILTER_MAX_RANGES];
 };

+struct kvm_msr_filter_range_compat {
+	__u32 flags;
+	__u32 nmsrs;
+	__u32 base;
+	__u32 bitmap;
+};
+
+struct kvm_msr_filter_compat {
+	__u32 flags;
+	struct kvm_msr_filter_range_compat ranges[KVM_MSR_FILTER_MAX_RANGES];
+};
+
 struct kvm_cpuid_entry {
 	__u32 function;
 	__u32 eax;
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 0771efaf94c8..ef9f92cba589 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -4260,21 +4260,6 @@ int kvm_vm_ioctl_enable_cap(struct kvm *kvm,
 }

 #ifdef CONFIG_KVM_COMPAT
-/* for KVM_X86_SET_MSR_FILTER */
-struct kvm_msr_filter_range_compat {
-	__u32 flags;
-	__u32 nmsrs;
-	__u32 base;
-	__u32 bitmap;
-};
-
-struct kvm_msr_filter_compat {
-	__u32 flags;
-	struct kvm_msr_filter_range_compat ranges[KVM_MSR_FILTER_MAX_RANGES];
-};
-
-#define KVM_X86_SET_MSR_FILTER_COMPAT _IOW(KVMIO, 0xc6, struct kvm_msr_fil=
ter_compat)
-
 long kvm_arch_vm_compat_ioctl(struct file *filp, unsigned int ioctl,
 			      unsigned long arg)
 {
diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index 8dff2fc1972e..54dbdabd0e9b 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -1477,6 +1477,7 @@ struct kvm_enc_region {

 /* Available with KVM_CAP_X86_MSR_FILTER */
 #define KVM_X86_SET_MSR_FILTER	_IOW(KVMIO,  0xc6, struct kvm_msr_filter)
+#define KVM_X86_SET_MSR_FILTER_COMPAT _IOW(KVMIO, 0xc6, struct kvm_msr_fil=
ter_compat)

 /* Available with KVM_CAP_DIRTY_LOG_RING */
 #define KVM_RESET_DIRTY_RINGS		_IO(KVMIO, 0xc7)

>  0xAE  20-3F  linux/nitro_enclaves.h                                    N=
itro Enclaves
>  0xAF  00-1F  linux/fsl_hypervisor.h                                    F=
reescale hypervisor
> +0xAF  00-8F  linux/vhost.h                                             c=
onflict!
> +0xAF  31-32  drivers/vhost/test.h                                      c=
onflict!
>  0xB0  all                                                              R=
ATIO devices in development:
>                                                                         <=
mailto:vgo@ratio.de>
>  0xB1  00-1F                                                            P=
PPoX

