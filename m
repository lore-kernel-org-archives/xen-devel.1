Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6F1DC5DF67
	for <xen-devel@archiver.kernel.org>; Tue, 18 Aug 2026 07:47:29 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1393570.1632387 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwEXP-0000KQ-Lb; Tue, 18 Aug 2026 07:47:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1393570.1632387; Tue, 18 Aug 2026 07:47:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwEXP-0000KJ-Hq; Tue, 18 Aug 2026 07:47:11 +0000
Received: by outflank-mailman (input) for mailman id 1393570;
 Tue, 18 Aug 2026 07:47:10 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <stojkovicdusan555@gmail.com>) id 1wwEXO-0000KD-1V
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 07:47:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwEXN-00COfS-9O
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 09:47:09 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <stojkovicdusan555@gmail.com>)
 id 6a840de6-2eae-0a2a0a5409dd-0a2a450be51e-48
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 09:47:09 +0200
Received: from [209.85.218.48] (helo=mail-ej1-f48.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <stojkovicdusan555@gmail.com>)
 id 6a840dfd-b7e8-0a2a450b0019-d155da30ec0b-3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 09:47:09 +0200
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-c2022323c37so538155766b.0
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 00:47:09 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1787039229; cv=none;
        d=google.com; s=arc-20260327;
        b=Y274OzEm2hJ7N1nLiJ3v5/fewnf4Cuc0ePtTLhsFXs/nA3KMsTNhb+UrAw0d8Cj7Nv
         IKR98+0BYuSkjpqrgrZ4Th/ZF1zoKbigO/Pko3RgxIGWqS6zx6KZ2jc3E7D4VW4W53LZ
         hleg0FnBApVqKzprO5r6ipZB8F9yKjOa04SllSYrAjx0LOxBdVw8F1OQ9QUNYF3k+Hjj
         4F0/PedZXdA3fiMuRem+HdBiqYc86JpU3E5QcEtSIR8ODHIcRCyY1wnQRvtWXt6ElhLL
         XPB3WjNTB7+yGrMb91jDuiFoUq0b4j1f/cwUl8NXOTPamRy1WTJ1grEaKa0UYGdRbCAN
         LLlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=8zpGVmQCF4Ej1R71DGStEiTG8p9UGbCUyASXHvOD9PY=;
        fh=X71NQUKnNgYptC1inX+R4i9FMImhMA36OFztJnavrjY=;
        b=PXdRMKr5wESb0DjKlx3IaEhBB1IZWmJrB32mxE3eMIxPC2LELA9jv/JyCxdMk3raIp
         763bl1nHRa4v5jjf5yKuECzb9wSondw2HyVmRW3hK+otvYP6Hr4Uhf9tlECGYS9LFctV
         YjfJKuXetnq+o6eTnfaXgaokGRdUKRRqiHIqMRFTr1lA0vRQT1+CaNhBSfzG6dj2p5DK
         lPUT0YK2+sIwzFHR3uWwIlEAOXx8sr3UIdKdNZFdkTiELal9rB5w889WkycFHLK8VM/q
         fredsnLmAz9BESYHomJcAc0luXkbLdklBvMrgPNXWB9ldlg2MSxDORsUSy4hIqxVqD9f
         TPbg==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787039229; x=1787644029; darn=lists.xenproject.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8zpGVmQCF4Ej1R71DGStEiTG8p9UGbCUyASXHvOD9PY=;
        b=iUFWHHZpGsDdgnH/pf0Q3yMkIz9zx+aJON1AbzuD0i95l190UqVtT8ztvLpJ0e0cal
         bpJF/LiCqotrhk3I4si8Y//98Y+H6hJzefZZMtv8q+eYKyQbA25mzf2O9fR1y/FooPpn
         2MOx8iHMaYgDhdFJpFHfHQSV2BxWMHBtVAdIWM7WVgIkHvYGQ36QClOUp8HFhsul+yIo
         6jhFFFlNf6qwPmGdgfm0F0u2xlMYRCwtW6JYG8SKnjtX+4wm/fzpi/1qp+/09Y46FbhR
         oOwBzCuZ/of0PZnt9LF+QcNbX0rxlvCzrzu7e91XxasI5P4AkHRMspMpkL7eyifLwEJS
         0ULg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787039229; x=1787644029;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8zpGVmQCF4Ej1R71DGStEiTG8p9UGbCUyASXHvOD9PY=;
        b=V6FPF7CHeImrrh5ClP3M5pb+BuMWebVS6TKvZEFpT7M7lqFDAfD8HPh3KCJ1WBNM9X
         FEL4SmrA7fyIoS9IWd9x5X/FmQuVAh1fficgMf2Dmvshp+EAstTOPwrqZX3Yra7q/t7+
         vcjFQBg4Z1MVK2MeYWyk2p9a03hDng/HRmyVfKhQC256lT8MY9w+qtR9C2JRVs9lNNDn
         VNt64sTSrBDADVgzFl7BOMz+RU3CPcj2ikfQSN4rHaOL93IMRyaVCdC3wrB7MDFyD4fS
         uuGqeiMEMVCQ/rrYUpEeuXRKoqafdOx6wr5dNJjXvy4dIRNmdztJjGpDdN3/OyIpP1Bg
         e+8A==
X-Forwarded-Encrypted: i=1; AHgh+RpoVpb9IxysVBeH3+ni/Axk/ko0kj2kOcGkX/+xiNvKEQaj/eM84IFmbmPpIov3Spe8tA1U6TK2puo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyGGICwhPrDh4h4rooCjfagMJzk4CeyTVDRqqhJw6F/qWXFmb7n
	ARpOco0ilTDr6ff2SRUW+jx3yuHNR3wxmY8GYY79lmfFqC0VEA30vnKcq+7nWBpo3Qa2LrXiXNw
	w3wo1lfIlNeVLHwCYeJcUPS+MuxTLUDk=
X-Gm-Gg: AR+sD136JzUrYvI5FsuRtlsKnIJW2yxbNhLZve6ucgGQmFy4YGYC+ohymKY2UbjklYs
	mrg2SYE6GwugZLgrfXBqC64xEDyqaJca6ooDJEfFiun8smco7/E3m8zlecoMIxzB8XQ4tYreE9i
	gJTqyevrBykO8uANicGn3Dfj/k0Lc48qO4Onf8Mav+NICRq/66YCX4JUrFYGpY9wdrEqy02U5me
	BnxjCdDOWiZtN7w5jfWooS1WL1nimyr7L1X2Zr66GxeFxpS7R92n5SztUNsiPZxRWIis/hmxdJY
	Y5BBUGglPOCBp5sgaSjeTbZyQIaKUXbfuNv33NfyyZWhQA==
X-Received: by 2002:a17:907:3e0a:b0:c19:473b:dc8f with SMTP id
 a640c23a62f3a-c2129a9a64bmr1559305066b.3.1787039228250; Tue, 18 Aug 2026
 00:47:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260702-vhost-xen-foreign-mapping-v3-0-2b8ef913382b@rt-rk.com>
In-Reply-To: <20260702-vhost-xen-foreign-mapping-v3-0-2b8ef913382b@rt-rk.com>
From: Dusan Stojkovic <stojkovicdusan555@gmail.com>
Date: Tue, 18 Aug 2026 09:46:55 +0200
X-Gm-Features: AcwNN1W7gU_jJa_iP4WQA_eZBPE7Cr-gPNRXOQzqoF4jm3hepZhRV2OF6Roqhp0
Message-ID: <CALPHYNQOLY1FBRE_=rKHSXRELBpinezpLWUb2cwuKY+ev64j2A@mail.gmail.com>
Subject: Re: [PATCH RFC v3 0/2] vhost-user: support Xen foreign memory mappings
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD <anthony@xenproject.org>, 
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>, xen-devel@lists.xenproject.org, 
	Viresh Kumar <viresh.kumar@linaro.org>, Dusan Stojkovic <Dusan.Stojkovic@rt-rk.com>, 
	Nikola Jelic <Nikola.Jelic@rt-rk.com>
Content-Type: multipart/alternative; boundary="000000000000664b2706594d7e05"
X-purgate-ID: tlsNG-42698a/1787039229-1AEDE9EA-44D70C0B/0/0
X-purgate-type: clean
X-purgate-size: 18889

--000000000000664b2706594d7e05
Content-Type: text/plain; charset="UTF-8"

Ping for feedback.

On Thu, Jul 2, 2026, 11:47 AM Dusan Stojkovic <stojkovicdusan555@gmail.com>
wrote:

> This series lets QEMU, when running as a Xen device model, drive
> vhost-user backends that map guest memory through the Xen foreign
> mapping interface, implementing the front-end side of
> VHOST_USER_PROTOCOL_F_XEN_MMAP. The protocol extension itself is
> already documented in docs/interop/vhost-user.rst (feature bit 17,
> extended memory region description) and implemented by rust-vmm's
> vhost / vm-memory crates and the vhost-device backends built on them.
>
> The problem this solves: under Xen the guest's RAM is not allocated by
> QEMU and is not backed by a file descriptor. memory_region_get_fd()
> returns -1, so vhost_section() filters out every RAM section, the vhost
> memory listener registers no regions, and starting any vhost-user
> device fails with "Failed initializing vhost-user memory map". With
> F_XEN_MMAP the backend maps guest memory itself.
>
> The protocol requires one file descriptor per region in SET_MEM_TABLE.
> Guest RAM under Xen has no backing fd, so the front-end opens
> /dev/xen/privcmd per region purely to satisfy that requirement; the
> backend derives the mapping from guest_phys_addr + domid and never
> reads the fd. Each fd is closed once the message has been sent.
>
> This patchset was rebased onto the new vhost_phys_vring_addr
> infrastructure
> and extends vhost_user_gpa_addresses() so that negotiated
> F_XEN_MMAP (bit 17), not F_GPA_ADDRESSES (bit 21, which the backend
> doesn't
> advertise), drives GPA addressing for both rings and userspace_addr.
>
> The two patches:
>   1/2  accept the Xen RAM section in vhost_section()
>   2/2  negotiate F_XEN_MMAP and build SET_MEM_TABLE from the extended
>        region layout.
> Testing:
> Tested on Xen/ARM64 with a DomU using virtio-mmio transports created
> by the xenpvh machine, running vhost-device-sound (rust-vmm, built
> with the "xen" feature) as the backend in dom0. The device negotiates,
> receives the memory table and ring addresses, and the guest's
> virtio-snd driver probes and operates.
>
> Non-Xen / x86 KVM: vhost-user-snd backed by
> vhost-device-sound (null backend) on a q35/KVM guest. The device
> negotiates, the guest virtio-snd driver probes and runs the control and
> PCM paths, and the SET_MEM_TABLE and vring-address traffic is identical
> to a build without this series confirming the
> non-Xen path is unchanged.
>
> The control message exchange between the frontend and backend was
> tracked using sockdump as was described in:
> Making VirtIO sing - implementing virtio-sound in rust-vmm project
> |-> at FOSDEM 2024
>
> Setup:
> The main part of the xl config this enables:
> virtio = [
>  'backend=0,type=virtio,device,transport=mmio,grant_usage=false'
> ]
>
> device_model_args = [
>  ...
>  '-chardev', 'socket,id=snd_chardev,path=/tmp/snd.sock',
>  '-device',
> 'vhost-user-snd,chardev=snd_chardev,id=snd,iommu_platform=true',
>  ...
> ]
>
> Xen 4.22-unstable was used with:
>  -enable-IOREQ_SERVER
>  -enable-EXPERT
>
> An extra patch was added to xen-tools.
> Namely, xen tools will request a pv device drive type for ARM64 but
> qemu expects pvh. This is a known issue:
> github.com/Xilinx/xen/commit/5f669949c9ffdb1947cb47038956b5fb8eeb072a
>
> Qemu master was used configured with the following flags:
>     --target-list=aarch64-softmmu \
>     --cross-prefix=aarch64-linux-gnu- \
>     --enable-xen \
>     --enable-vhost-user \
>     --extra-cflags="-I$XEN-TOOLS/usr/local/include" \
>     --extra-ldflags="-L$XEN-TOOLS/usr/local/lib -Wl,
>         -rpath-link,$XEN-TOOLS/usr/local/lib" \
>
> Likewise for x86:
>     --target-list=aarch64-softmmu \
>     --enable-slirp \
>     --enable-xen \
>     --enable-vhost-user \
>     --enable-virtfs \
>
> Linux version 6.11.7 was used with extra configuration flags:
> * For enabling Xen Dom0/DomU support
> * For enabling virtio (mmio, snd, etc.)
> * For enabling sockdump features (BPF, IKHEADERS, KPROBE, etc.)
> * Extra debug flags (DEBUG_FS, etc.)
>
> vhost-device commit-id:
>     c3bb658ef4fe20a2f264dbbbbc6fa19f1c08c0c5
>
>     Was used built with:
>     --features alsa-backend,xen
>
> Importantly in vhost-device-scmi/src/vhu_scmi.rs:
>
> // QUEUE_SIZE must be apparently at least 1024 for MMIO.
> // There is probably a maximum size per descriptor defined in the kernel.
> const QUEUE_SIZE: usize = 1024;
>
> A similar change was made to make mmio work in vhost-user-sound device,
> bumping QUEUE_SIZE to 1024.
>
> Without this frontend and backend will fail to negotiate queue size.
>
> Scope and known limitations:
> * Foreign mappings only. Grant mappings are not supported: vhost's
>   section tracking derives a host pointer for each region, which is
>   invalid for the grant pseudo-region, and per-access grant mapping
>   needs a different region description (GRANT | no-advance-map). Patch
>   1 rejects the xen.grants region explicitly. Setting grant_usage=true
>   does not change the qemu<->backend vhost-user exchange.
>
> * VHOST_USER_PROTOCOL_F_CONFIGURE_MEM_SLOTS is suppressed under Xen:
>   the ADD/REM_MEM_REG path has not been converted to the extended
>   region format, and Xen guests currently expose a single RAM region,
>   so SET_MEM_TABLE is sufficient. Multiple RAM regions are not yet
>   exercised. Postcopy is refused.
>
> * Spec vs reference implementation: docs/interop/vhost-user.rst
>   describes the "can not be mapped in advance" xen-mmap flag as Bit 8
>   (value 0x100), whereas rust-vmm's vm-memory uses 0x8 (bit 3,
>   MmapXenFlags::NO_ADVANCE_MAP). This series uses neither, but the
>   discrepancy probably wants resolving in the spec. Viresh, which is
>   intended -- bit position 8 or value 0x8?
>
> * userspace_addr is carried unchanged in the region descriptor; under
>   Xen it does not correspond to a mapping and backends do not
>   interpret it. An alternative would be to define it (e.g. mirror
>   guest_phys_addr).
>
> Open questions:
> - userspace_addr semantics under Xen: leave it unchanged, or define it?
> - Multi-region support: convert ADD/REM_MEM_REG to the extended layout
>   rather than suppressing CONFIGURE_MEM_SLOTS?
> - Grant-mapping support: worth pursuing, and what region-description
>   shape do backends expect?
> - Updating vhost-device-sound to reflect the mmio support.
>
> References:
> - vhost-user spec, F_XEN_MMAP / extended memory region / xen mmap flags:
>   docs/interop/vhost-user.rst
> - rust-vmm vm-memory MmapXenFlags (FOREIGN=0x1, GRANT=0x2,
>   NO_ADVANCE_MAP=0x8): src/mmap/xen.rs
> - Making VirtIO sing - implementing virtio-sound in rust-vmm project
> |-> at FOSDEM 2024
>
> Signed-off-by: Dusan Stojkovic <Dusan.Stojkovic@rt-rk.com>
> Signed-off-by: Nikola Jelic <Nikola.Jelic@rt-rk.com>
> ---
> Changes in v3:
> - Rebased onto current master
> - Fixed semantic error in vhost_section comment
> - Link to v2:
> https://lore.kernel.org/qemu-devel/20260629-vhost-xen-foreign-mapping-v2-0-19e4685e7575@rt-rk.com
>
> Changes in v2:
> - Rebased onto current master
> - Cover letter: removed a rust-vmm hunk which made the git am
>   on Patchview fail. The reference is now mentioned in a sentance.
> - Link to v1:
>
> https://lore.kernel.org/qemu-devel/20260618-vhost-xen-foreign-mapping-v1-0-7f60a6241971@rt-rk.com
>
> ---
> Dusan Stojkovic (2):
>       vhost: accept Xen guest RAM sections for vhost-user
>       vhost-user: implement VHOST_USER_PROTOCOL_F_XEN_MMAP
>
>  hw/virtio/trace-events         |   2 +
>  hw/virtio/vhost-user.c         | 120
> +++++++++++++++++++++++++++++++++++++++--
>  hw/virtio/vhost.c              |  18 +++++++
>  hw/xen/xen_stubs.c             |   5 ++
>  include/hw/virtio/vhost-user.h |   2 +-
>  5 files changed, 143 insertions(+), 4 deletions(-)
> ---
> base-commit: 30e8a06b64aa58a3990ba39cb5d09531e7d265e0
> change-id: 20260618-vhost-xen-foreign-mapping-d023c85bb706
>
> Best regards,
> --
> Dusan Stojkovic <Dusan.Stojkovic@rt-rk.com>
>
>

--000000000000664b2706594d7e05
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Ping for feedback.</div><br><div class=3D"gmail_quote gma=
il_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jul 2, 20=
26, 11:47 AM Dusan Stojkovic &lt;<a href=3D"mailto:stojkovicdusan555@gmail.=
com">stojkovicdusan555@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">This series lets QEMU, when running as a Xen device model, dr=
ive<br>
vhost-user backends that map guest memory through the Xen foreign<br>
mapping interface, implementing the front-end side of<br>
VHOST_USER_PROTOCOL_F_XEN_MMAP. The protocol extension itself is<br>
already documented in docs/interop/vhost-user.rst (feature bit 17,<br>
extended memory region description) and implemented by rust-vmm&#39;s<br>
vhost / vm-memory crates and the vhost-device backends built on them.<br>
<br>
The problem this solves: under Xen the guest&#39;s RAM is not allocated by<=
br>
QEMU and is not backed by a file descriptor. memory_region_get_fd()<br>
returns -1, so vhost_section() filters out every RAM section, the vhost<br>
memory listener registers no regions, and starting any vhost-user<br>
device fails with &quot;Failed initializing vhost-user memory map&quot;. Wi=
th<br>
F_XEN_MMAP the backend maps guest memory itself.<br>
<br>
The protocol requires one file descriptor per region in SET_MEM_TABLE.<br>
Guest RAM under Xen has no backing fd, so the front-end opens<br>
/dev/xen/privcmd per region purely to satisfy that requirement; the<br>
backend derives the mapping from guest_phys_addr + domid and never<br>
reads the fd. Each fd is closed once the message has been sent.<br>
<br>
This patchset was rebased onto the new vhost_phys_vring_addr infrastructure=
 <br>
and extends vhost_user_gpa_addresses() so that negotiated<br>
F_XEN_MMAP (bit 17), not F_GPA_ADDRESSES (bit 21, which the backend doesn&#=
39;t <br>
advertise), drives GPA addressing for both rings and userspace_addr.<br>
<br>
The two patches:<br>
=C2=A0 1/2=C2=A0 accept the Xen RAM section in vhost_section()<br>
=C2=A0 2/2=C2=A0 negotiate F_XEN_MMAP and build SET_MEM_TABLE from the exte=
nded<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0region layout. <br>
Testing:<br>
Tested on Xen/ARM64 with a DomU using virtio-mmio transports created<br>
by the xenpvh machine, running vhost-device-sound (rust-vmm, built<br>
with the &quot;xen&quot; feature) as the backend in dom0. The device negoti=
ates,<br>
receives the memory table and ring addresses, and the guest&#39;s<br>
virtio-snd driver probes and operates.<br>
<br>
Non-Xen / x86 KVM: vhost-user-snd backed by<br>
vhost-device-sound (null backend) on a q35/KVM guest. The device<br>
negotiates, the guest virtio-snd driver probes and runs the control and<br>
PCM paths, and the SET_MEM_TABLE and vring-address traffic is identical<br>
to a build without this series confirming the<br>
non-Xen path is unchanged.<br>
<br>
The control message exchange between the frontend and backend was<br>
tracked using sockdump as was described in:<br>
Making VirtIO sing - implementing virtio-sound in rust-vmm project<br>
|-&gt; at FOSDEM 2024<br>
<br>
Setup:<br>
The main part of the xl config this enables:<br>
virtio =3D [<br>
=C2=A0&#39;backend=3D0,type=3Dvirtio,device,transport=3Dmmio,grant_usage=3D=
false&#39;<br>
]<br>
<br>
device_model_args =3D [<br>
=C2=A0...<br>
=C2=A0&#39;-chardev&#39;, &#39;socket,id=3Dsnd_chardev,path=3D/tmp/snd.sock=
&#39;,<br>
=C2=A0&#39;-device&#39;, &#39;vhost-user-snd,chardev=3Dsnd_chardev,id=3Dsnd=
,iommu_platform=3Dtrue&#39;,<br>
=C2=A0...<br>
]<br>
<br>
Xen 4.22-unstable was used with:<br>
=C2=A0-enable-IOREQ_SERVER <br>
=C2=A0-enable-EXPERT<br>
<br>
An extra patch was added to xen-tools.<br>
Namely, xen tools will request a pv device drive type for ARM64 but <br>
qemu expects pvh. This is a known issue:<br>
<a href=3D"http://github.com/Xilinx/xen/commit/5f669949c9ffdb1947cb47038956=
b5fb8eeb072a" rel=3D"noreferrer noreferrer" target=3D"_blank">github.com/Xi=
linx/xen/commit/5f669949c9ffdb1947cb47038956b5fb8eeb072a</a><br>
<br>
Qemu master was used configured with the following flags:<br>
=C2=A0 =C2=A0 --target-list=3Daarch64-softmmu \<br>
=C2=A0 =C2=A0 --cross-prefix=3Daarch64-linux-gnu- \<br>
=C2=A0 =C2=A0 --enable-xen \<br>
=C2=A0 =C2=A0 --enable-vhost-user \<br>
=C2=A0 =C2=A0 --extra-cflags=3D&quot;-I$XEN-TOOLS/usr/local/include&quot; \=
<br>
=C2=A0 =C2=A0 --extra-ldflags=3D&quot;-L$XEN-TOOLS/usr/local/lib -Wl,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -rpath-link,$XEN-TOOLS/usr/local/lib&quot; \<br=
>
<br>
Likewise for x86:<br>
=C2=A0 =C2=A0 --target-list=3Daarch64-softmmu \<br>
=C2=A0 =C2=A0 --enable-slirp \<br>
=C2=A0 =C2=A0 --enable-xen \<br>
=C2=A0 =C2=A0 --enable-vhost-user \<br>
=C2=A0 =C2=A0 --enable-virtfs \<br>
<br>
Linux version 6.11.7 was used with extra configuration flags:<br>
* For enabling Xen Dom0/DomU support<br>
* For enabling virtio (mmio, snd, etc.)<br>
* For enabling sockdump features (BPF, IKHEADERS, KPROBE, etc.)<br>
* Extra debug flags (DEBUG_FS, etc.)<br>
<br>
vhost-device commit-id:<br>
=C2=A0 =C2=A0 c3bb658ef4fe20a2f264dbbbbc6fa19f1c08c0c5<br>
<br>
=C2=A0 =C2=A0 Was used built with:<br>
=C2=A0 =C2=A0 --features alsa-backend,xen<br>
<br>
Importantly in vhost-device-scmi/src/vhu_scmi.rs:<br>
<br>
// QUEUE_SIZE must be apparently at least 1024 for MMIO.<br>
// There is probably a maximum size per descriptor defined in the kernel.<b=
r>
const QUEUE_SIZE: usize =3D 1024;<br>
<br>
A similar change was made to make mmio work in vhost-user-sound device,<br>
bumping QUEUE_SIZE to 1024.<br>
<br>
Without this frontend and backend will fail to negotiate queue size.<br>
<br>
Scope and known limitations:<br>
* Foreign mappings only. Grant mappings are not supported: vhost&#39;s<br>
=C2=A0 section tracking derives a host pointer for each region, which is<br=
>
=C2=A0 invalid for the grant pseudo-region, and per-access grant mapping<br=
>
=C2=A0 needs a different region description (GRANT | no-advance-map). Patch=
<br>
=C2=A0 1 rejects the xen.grants region explicitly. Setting grant_usage=3Dtr=
ue<br>
=C2=A0 does not change the qemu&lt;-&gt;backend vhost-user exchange.<br>
<br>
* VHOST_USER_PROTOCOL_F_CONFIGURE_MEM_SLOTS is suppressed under Xen:<br>
=C2=A0 the ADD/REM_MEM_REG path has not been converted to the extended<br>
=C2=A0 region format, and Xen guests currently expose a single RAM region,<=
br>
=C2=A0 so SET_MEM_TABLE is sufficient. Multiple RAM regions are not yet<br>
=C2=A0 exercised. Postcopy is refused.<br>
<br>
* Spec vs reference implementation: docs/interop/vhost-user.rst<br>
=C2=A0 describes the &quot;can not be mapped in advance&quot; xen-mmap flag=
 as Bit 8<br>
=C2=A0 (value 0x100), whereas rust-vmm&#39;s vm-memory uses 0x8 (bit 3,<br>
=C2=A0 MmapXenFlags::NO_ADVANCE_MAP). This series uses neither, but the<br>
=C2=A0 discrepancy probably wants resolving in the spec. Viresh, which is<b=
r>
=C2=A0 intended -- bit position 8 or value 0x8?<br>
<br>
* userspace_addr is carried unchanged in the region descriptor; under<br>
=C2=A0 Xen it does not correspond to a mapping and backends do not<br>
=C2=A0 interpret it. An alternative would be to define it (e.g. mirror<br>
=C2=A0 guest_phys_addr).<br>
<br>
Open questions:<br>
- userspace_addr semantics under Xen: leave it unchanged, or define it?<br>
- Multi-region support: convert ADD/REM_MEM_REG to the extended layout<br>
=C2=A0 rather than suppressing CONFIGURE_MEM_SLOTS?<br>
- Grant-mapping support: worth pursuing, and what region-description<br>
=C2=A0 shape do backends expect?<br>
- Updating vhost-device-sound to reflect the mmio support.<br>
<br>
References:<br>
- vhost-user spec, F_XEN_MMAP / extended memory region / xen mmap flags:<br=
>
=C2=A0 docs/interop/vhost-user.rst<br>
- rust-vmm vm-memory MmapXenFlags (FOREIGN=3D0x1, GRANT=3D0x2,<br>
=C2=A0 NO_ADVANCE_MAP=3D0x8): src/mmap/xen.rs<br>
- Making VirtIO sing - implementing virtio-sound in rust-vmm project<br>
|-&gt; at FOSDEM 2024<br>
<br>
Signed-off-by: Dusan Stojkovic &lt;<a href=3D"mailto:Dusan.Stojkovic@rt-rk.=
com" target=3D"_blank" rel=3D"noreferrer">Dusan.Stojkovic@rt-rk.com</a>&gt;=
<br>
Signed-off-by: Nikola Jelic &lt;<a href=3D"mailto:Nikola.Jelic@rt-rk.com" t=
arget=3D"_blank" rel=3D"noreferrer">Nikola.Jelic@rt-rk.com</a>&gt;<br>
---<br>
Changes in v3:<br>
- Rebased onto current master<br>
- Fixed semantic error in vhost_section comment<br>
- Link to v2: <a href=3D"https://lore.kernel.org/qemu-devel/20260629-vhost-=
xen-foreign-mapping-v2-0-19e4685e7575@rt-rk.com" rel=3D"noreferrer noreferr=
er" target=3D"_blank">https://lore.kernel.org/qemu-devel/20260629-vhost-xen=
-foreign-mapping-v2-0-19e4685e7575@rt-rk.com</a><br>
<br>
Changes in v2:<br>
- Rebased onto current master<br>
- Cover letter: removed a rust-vmm hunk which made the git am<br>
=C2=A0 on Patchview fail. The reference is now mentioned in a sentance.<br>
- Link to v1:<br>
=C2=A0 <a href=3D"https://lore.kernel.org/qemu-devel/20260618-vhost-xen-for=
eign-mapping-v1-0-7f60a6241971@rt-rk.com" rel=3D"noreferrer noreferrer" tar=
get=3D"_blank">https://lore.kernel.org/qemu-devel/20260618-vhost-xen-foreig=
n-mapping-v1-0-7f60a6241971@rt-rk.com</a><br>
<br>
---<br>
Dusan Stojkovic (2):<br>
=C2=A0 =C2=A0 =C2=A0 vhost: accept Xen guest RAM sections for vhost-user<br=
>
=C2=A0 =C2=A0 =C2=A0 vhost-user: implement VHOST_USER_PROTOCOL_F_XEN_MMAP<b=
r>
<br>
=C2=A0hw/virtio/trace-events=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=
=A02 +<br>
=C2=A0hw/virtio/vhost-user.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 120 +++++++=
++++++++++++++++++++++++++++++++--<br>
=C2=A0hw/virtio/vhost.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 18 +++++++<br>
=C2=A0hw/xen/xen_stubs.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A05 ++<br>
=C2=A0include/hw/virtio/vhost-user.h |=C2=A0 =C2=A02 +-<br>
=C2=A05 files changed, 143 insertions(+), 4 deletions(-)<br>
---<br>
base-commit: 30e8a06b64aa58a3990ba39cb5d09531e7d265e0<br>
change-id: 20260618-vhost-xen-foreign-mapping-d023c85bb706<br>
<br>
Best regards,<br>
-- <br>
Dusan Stojkovic &lt;<a href=3D"mailto:Dusan.Stojkovic@rt-rk.com" target=3D"=
_blank" rel=3D"noreferrer">Dusan.Stojkovic@rt-rk.com</a>&gt;<br>
<br>
</blockquote></div>

--000000000000664b2706594d7e05--

