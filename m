Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1568EC531CA
	for <xen-devel@archiver.kernel.org>; Thu, 23 Jul 2026 13:31:49 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1369130.1618048 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wmtWX-0002N5-8I; Thu, 23 Jul 2026 13:31:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1369130.1618048; Thu, 23 Jul 2026 13:31:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wmtWX-0002Mw-5O; Thu, 23 Jul 2026 13:31:41 +0000
Received: by outflank-mailman (input) for mailman id 1369130;
 Thu, 23 Jul 2026 13:09:31 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <tomitamoeko@gmail.com>) id 1wmtB5-0006NY-IK
 for xen-devel@lists.xenproject.org; Thu, 23 Jul 2026 13:09:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wmtB4-00GMLd-VD
 for xen-devel@lists.xenproject.org; Thu, 23 Jul 2026 15:09:30 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <tomitamoeko@gmail.com>)
 id 6a62128a-e002-0a2a0a5209dd-0a2a4505a566-4
 for <xen-devel@lists.xenproject.org>; Thu, 23 Jul 2026 15:09:30 +0200
Received: from [74.125.227.129] (helo=mail-pj2-f1.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <tomitamoeko@gmail.com>)
 id 6a621289-4cb1-0a2a45050019-4a7de3818ac1-3
 for <xen-devel@lists.xenproject.org>; Thu, 23 Jul 2026 15:09:30 +0200
Received: by mail-pj2-f1.google.com with SMTP id
 98e67ed59e1d1-3810f0aba07so344339a91.1
 for <xen-devel@lists.xenproject.org>; Thu, 23 Jul 2026 06:09:30 -0700 (PDT)
Received: from ?IPV6:2408:820c:8ffa:c0f0:e439:d3f2:d7e2:d97a?
 ([2408:820c:8ffa:c0f0:e439:d3f2:d7e2:d97a])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-3147e1ca3efsm24631825eec.30.2026.07.23.06.09.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jul 2026 06:09:28 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784812169; x=1785416969; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=P53LU1z00TsQ0rdICiDq5utAVkvnHaR3/n8SoYgZC9s=;
        b=ipIWsoyGxq06b7DSS+FOCZDBMR9yFztkxosdgTFYeHVsnKYVWGOQN1tNgW2wqN7zBu
         pHYVl6MK6ZZVq2I8CHKgnF7xRtycz6vUqVbC/0BdWoMPhHKSpIAh0HllnX3mYS1KjytV
         oYWa1IrGH0gytV6hg1Ze/vszKhM6CnxjHSc7q8ASzxyn1AFixzG6TEIjexu4MtrRHKeC
         8FZsXshcsFCwG0/c/qH57NKNWZkONqP1x8TWRf//WtIkdXPUYY+5yd2V4GqllfdrAC0U
         M8zQw8ET8ovYxIzi8cG6jSgHzbPnryDR8JQJQbr+NcjcCYVR/16ohTVJxTBGjZKG6Mwn
         RHVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784812169; x=1785416969;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P53LU1z00TsQ0rdICiDq5utAVkvnHaR3/n8SoYgZC9s=;
        b=AxPbiSHKwSnnPX0IHyJambxap43Fu68t+uRaisAtozba5D4pTtZzKB8YsPovUjXzus
         ljB9CkJuSbFVQfc5URGcv6mn9ihUjE2yc/pg8eZZOyP/rCUZNhxFrsC3DWDCuo1LZgTU
         knunTnDmsk5xD3H2i0DYd8vG7ZRj1x6ogtBhh/nO5TjLXViewGzX4xR9v1CcZLhJj2Tj
         hPZlD7axsyPmiGQrhwJEtrP3X8SLwcWy/hwwAhrEhZ5yx/gWBctdpsrbFH358yaape/1
         BaVwtxoMddc5bu2csxnlrC3VReEUY+sepM+x8TruTach+8aIxioKDZR0SZ2d3+tQ0ihu
         I25w==
X-Forwarded-Encrypted: i=1; AHgh+Rq2QkldQcloIzNIotVLE+XASFtne+oxBNWRBTSAZWgMUg8dMMEZNfAB8hv+bt0t1TamLUCd8qyJkFE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzQ6dSMRlAj/Nzy7od6Qv7hDjJFFdqmvoxij1NHADBkEUC1fRlC
	MzRBBsOVw2LveZwibw40l25p3BsJ9pdFW5tynYp7kS/QB6zurNehl5c=
X-Gm-Gg: AR+sD13743sXpsd4WRZBOy1AbOc/b9NwaiHwaTVB1c2kvy8PFPUXiqEuuztPtwVfP6F
	mowW9TtO6E8YsWUGIezu/MqyPFkZJ7yFhWgVjy2bjLULsk1CuIjxu9l6avHKC2OWGgK12mqlmEC
	GXNLVjgUclvGD7mf/pinrxPzx8PUVzGSTLWkiFHffv/lEBhY/uDAonVqlqoHqX8qz+3/a4i3nAx
	9pDdrw/VOU7sxlsO6kUnovkjvxxYEh/QSQzSzsHYc+jVBIRt9sZLyxEnSenkJYjbmYJcEBzVLjE
	MOEiOel36Ixd0t9MRzI5D6/1SgEbBVFwg0kLI85qvrA4jYMgbi4lcnMj/DeD6xmrIYSkTLO/8fO
	tij86W4YOvIjxpP+PnwPtATYTJJPofwPvkg8fqrryycnZ2bKnfsBJFAqiFA9IYhl0pmgqdQHc6Z
	cP4wuN40bAhhzTCm4uZkGhDyGK3jI+NgjikMU5Hlp4hdWp26ez4h8V5vwIiA==
X-Received: by 2002:a05:6300:614e:b0:3c3:8651:b317 with SMTP id adf61e73a8af0-3c44afaac10mr3303939637.10.1784812168685;
        Thu, 23 Jul 2026 06:09:28 -0700 (PDT)
Message-ID: <5cb8d286-f013-4400-aef4-baddaa775995@gmail.com>
Date: Thu, 23 Jul 2026 21:09:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] xen/igd: get PCH info from host sysfs
To: Chuck Zmudzinski <brchuckz@aol.com>, qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>
References: <20260709183517.25866-1-brchuckz@aol.com>
 <20260709183517.25866-2-brchuckz@aol.com>
From: Tomita Moeko <tomitamoeko@gmail.com>
In-Reply-To: <20260709183517.25866-2-brchuckz@aol.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1784812170-24F1F2A1-2FC17A21/0/0
X-purgate-type: clean
X-purgate-size: 6756

Sorry I am not the maintainer/reviewer of Xen IGD passthrough, just out
of my personal interest

On 2026-07-10 02:35, Chuck Zmudzinski wrote:
> The igd_combo_id_infos[] data is more than 10 years
> out of date with many Intel IGD devices missing from
> igd_combo_id_infos[]. This means that many devices
> that could be supported will not work with the
> current implementation.
> 
> For newer devices not listed in igd_combo_id_infos[],
> get infos from the host sysfs to enable support for the
> newer devices not listed in igd_combo_id_infos[].
> 
> Introduce the helper function xen_pt_get_host_pch_info
> to facilitate getting the necessary information from
> sysfs.
> 
> Also, use errp in xen_igd_passthrough_isa_bridge_create
> to set errors from xen_pt_get_host_pch_info.
> 
> Signed-off-by: Chuck Zmudzinski <brchuckz@aol.com>
> ---
> Changes in v2:
>   - call error_setg* after closing files instead of before closing
>     files
>   - in last line of commit message change "to propagate errors" to
>     "to set errors"
>   - add stable to Cc list
> 
> Changes in v3:
>   - whitespace fix at line 380 of xen_pt_graphics.c
>   - fix Cc address for qemu-stable
> 
>  hw/xen/xen_pt.c          |  2 +-
>  hw/xen/xen_pt_graphics.c | 82 ++++++++++++++++++++++++++++++++++++++--
>  include/hw/xen/xen_igd.h |  3 +-
>  3 files changed, 82 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/xen/xen_pt.c b/hw/xen/xen_pt.c
> index 0fe9c0a..474606e 100644
> --- a/hw/xen/xen_pt.c
> +++ b/hw/xen/xen_pt.c
> @@ -867,7 +867,7 @@ static void xen_pt_realize(PCIDevice *d, Error **errp)
>          }
>  
>          /* Register ISA bridge for passthrough GFX. */
> -        xen_igd_passthrough_isa_bridge_create(s, &s->real_device);
> +        xen_igd_passthrough_isa_bridge_create(s, &s->real_device, errp);

The `errp` need to be handled here if any error occurs.

>      }
>  
>      /* Handle real device's MMIO/PIO BARs */
> diff --git a/hw/xen/xen_pt_graphics.c b/hw/xen/xen_pt_graphics.c
> index 7df9344..2ef941e 100644
> --- a/hw/xen/xen_pt_graphics.c
> +++ b/hw/xen/xen_pt_graphics.c
> @@ -376,8 +376,75 @@ static void pt_graphics_register_types(void)
>  }
>  type_init(pt_graphics_register_types)
>  
> +static void xen_pt_get_host_pch_info(PCIDevice *dev, uint16_t *pch_dev_id,
> +                                     uint8_t *pch_rev_id, Error **errp)
> +{
> +    FILE *fp1, *fp2;
> +    char *endptr;
> +    char device_id[7], rev[5];
> +    size_t len;
> +    const char *device = "/sys/bus/pci/devices/0000:00:1f.0/device";
> +    const char *revision = "/sys/bus/pci/devices/0000:00:1f.0/revision";
> +    unsigned long val;
> +
> +    fp1 = fopen(device, "r");
> +    if (fp1 == NULL) {
> +        error_setg_errno(errp, errno, "Cannot open %s", device);
> +        return;
> +    }
> +    fp2 = fopen(revision, "r");
> +    if (fp2 == NULL) {
> +        fclose(fp1);
> +        error_setg_errno(errp, errno, "Cannot open %s", revision);
> +        return;
> +    }
> +
> +    len = fread(device_id, 1, 7, fp1);
> +    if (!len) {
> +        fclose(fp1);
> +        fclose(fp2);
> +        error_setg(errp, "Cannot read %s", device);
> +        return;
> +    }
> +    len = fread(rev, 1, 5, fp2);
> +    if (!len) {
> +        fclose(fp1);
> +        fclose(fp2);
> +        error_setg(errp, "Cannot read %s", revision);
> +        return;
> +    }
> +    fclose(fp1);
> +    fclose(fp2);
> +
> +    val = strtoul(device_id, &endptr, 16);
> +    if (val > 0xffff) {
> +        error_setg(errp, "PCH device id is out of range: 0x%lx", val);
> +        return;
> +    }
> +    if ((endptr > device_id) && (errno != ERANGE) &&
> +        (errno != EINVAL)) {
> +        *pch_dev_id = (uint16_t)val;
> +    } else {
> +        error_setg_errno(errp, errno, "device id strtoul "
> +                                      "conversion failed");
> +        return;
> +    }
> +    val = strtoul(rev, &endptr, 16);
> +    if (val > 0xff) {
> +        error_setg(errp, "PCH revision is out of range: 0x%lx", val);
> +        return;
> +    }
> +    if ((endptr > rev) && (errno != ERANGE) && (errno != EINVAL)) {
> +        *pch_rev_id = (uint8_t)val;
> +    } else {
> +        error_setg_errno(errp, errno, "revision strtoul "
> +                                      "conversion failed");
> +    }
> +}
> +

It would be better to reuse existing xen_host_pci_device_get() to read host
LPC bridge ids instead of parsing it on our own here.

>  void xen_igd_passthrough_isa_bridge_create(XenPCIPassthroughState *s,
> -                                           XenHostPCIDevice *dev)
> +                                           XenHostPCIDevice *dev,
> +                                           Error **errp)
>  {
>      PCIBus *bus = pci_get_bus(&s->dev);
>      struct PCIDevice *bridge_dev;
> @@ -394,7 +461,16 @@ void xen_igd_passthrough_isa_bridge_create(XenPCIPassthroughState *s,
>          }
>      }
>  
> -    if (pch_dev_id == 0xffff) {
> +    /* Newer devices get PCH infos from host sysfs */
> +    if ((pch_dev_id == 0xffff) || !pch_rev_id) {
> +        xen_pt_get_host_pch_info(&s->dev, &pch_dev_id, &pch_rev_id, errp);
> +    }
> +
> +    XEN_PT_LOG(&s->dev, "PCH device id: 0x%x\n", pch_dev_id);
> +    XEN_PT_LOG(&s->dev, "PCH revision: 0x%x\n", pch_rev_id);
> +
> +    if ((pch_dev_id == 0xffff) || !pch_rev_id) {
> +        error_setg(errp, "failed to get PCH device id or revision");
>          return;
>      }
>  
> @@ -406,7 +482,7 @@ void xen_igd_passthrough_isa_bridge_create(XenPCIPassthroughState *s,
>       * Note that vendor id is always PCI_VENDOR_ID_INTEL.
>       */
>      if (!bridge_dev) {
> -        fprintf(stderr, "set igd-passthrough-isa-bridge failed!\n");
> +        error_setg(errp, "set igd-passthrough-isa-bridge failed!");
>          return;
>      }
>      pci_config_set_device_id(bridge_dev->config, pch_dev_id);
> diff --git a/include/hw/xen/xen_igd.h b/include/hw/xen/xen_igd.h
> index 7ffca06..da51f09 100644
> --- a/include/hw/xen/xen_igd.h
> +++ b/include/hw/xen/xen_igd.h
> @@ -22,7 +22,8 @@ uint32_t igd_read_opregion(XenPCIPassthroughState *s);
>  void xen_igd_reserve_slot(PCIBus *pci_bus);
>  void igd_write_opregion(XenPCIPassthroughState *s, uint32_t val);
>  void xen_igd_passthrough_isa_bridge_create(XenPCIPassthroughState *s,
> -                                           XenHostPCIDevice *dev);
> +                                           XenHostPCIDevice *dev,
> +                                           Error **errp);
>  
>  static inline bool is_igd_vga_passthrough(XenHostPCIDevice *dev)
>  {


