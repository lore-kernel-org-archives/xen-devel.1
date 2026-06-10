Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67CB3CD8CB9
	for <xen-devel@archiver.kernel.org>; Wed, 10 Jun 2026 06:09:38 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1333955.1597055 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXC7r-0005xI-R5; Wed, 10 Jun 2026 06:09:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1333955.1597055; Wed, 10 Jun 2026 06:09:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXC7r-0005xB-OP; Wed, 10 Jun 2026 06:09:19 +0000
Received: by outflank-mailman (input) for mailman id 1333955;
 Wed, 10 Jun 2026 06:00:05 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hare@suse.com>) id 1wXByv-0004OL-2v
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2026 06:00:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXByr-00FnDB-NC
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2026 08:00:01 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <hare@suse.com>)
 id 6a28fd5c-5cb7-0a2a0a5109dd-0a2a450ce3a2-14
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2026 08:00:01 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <hare@suse.com>)
 id 6a28fd61-62f1-0a2a450c0019-d1558031e103-3
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2026 08:00:01 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-490b211ee6aso48962635e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 23:00:01 -0700 (PDT)
Received: from ?IPV6:2001:a62:1439:d001:a0af:1164:c6fd:8c51?
 ([2001:a62:1439:d001:a0af:1164:c6fd:8c51])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f35eae5sm69552212f8f.33.2026.06.09.22.59.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jun 2026 23:00:00 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1781071201; x=1781676001; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0eeq4qUemue69ATVH9Hc0G+s1EX6SM4VcPKiJpjYoUk=;
        b=Oq6Yi9gYxam7qKXUF86+rujHGMTrb9lHIeFEW3HfYurcNcdAlshBSf5G1N86J6auNb
         ywDj34ftw3rtT+g+RlUgD8j/OzUugwb34V14gbLiu9h5u9FaY3YCxo7P0tHjsT5WN69L
         p/9tRN/9iK8gWyD+L9/G6PtS/14okO/jS0cwzioj2saNEgolTFsuOTxzx7Q+blTgn1IB
         La/zaKivanePNBC/g4/IcUv2Xq/9phZ+g7NtZZ1PnPerIqz/3WjrR1ps3TKzEiC3rinq
         Sk3m3rnYPNIxZsvybstmyoKnjV0mwA239hyEOJ+adN/k+osJZOKYsikhraDGE0hYSIiQ
         YaZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781071201; x=1781676001;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0eeq4qUemue69ATVH9Hc0G+s1EX6SM4VcPKiJpjYoUk=;
        b=NYjl3ZwoGs45Sqtk8P5lJTTiTBL46/ZOCnhfEQKHyPf6xNAqXYLNJ9sQ8/JndWiWNh
         7NF70EAkpHV1/n0mzNwrhIiQQpPPUjdfJlkutEtCybiSOwpTTyE9X5XeU0jF7c84kMOo
         B88jKcdmCDrEY9yKIlt1nNkIpYLamXL3HqUXPuj+dazplIg//sXEc3UDoWyzRhwJiK6f
         APKRtv6T8x9dHXRLBt1X34WuNH//g3eaKHcUAUnwe90Ln0dXr82Un6knDXuWaiyWwv2e
         QerTV7ljJw9Yaw9NDTk7Z7ERZRFhteUayiev3ST2tDTpvc3Mqyl9456hSc3V4qqYZI3P
         cx6w==
X-Forwarded-Encrypted: i=1; AFNElJ8gtM/DR9oQ0yTnZtU4weFNXk9PMXCMtTB49+f96wD8KBBLcI6FejeqI7i4DMdzrhRBtBP+yVndmhw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwyweW5xx/mysOf2GHEgXXp2enYiEx+tBe5r6V65IRr/1j9tZ6y
	6U3B8LTZXWFf/8SHyKDGW+9xsD3dU5Z151heiYYXIMopgrtvjH+fNTCl1mZaMAG2pIM=
X-Gm-Gg: Acq92OG6DepFoAxxNBg6hJWdciaox8RSrKESazb4BYRiH7tKivwCGFXA9INPcqrBk3g
	Md9FuGvMTtwmIg9ounN19BweOx9tScc25Q7EDUDgKGZqabxKK4gF1HhyheK8vZku9J0SHEZqG0N
	bJqSL25NjbKYnQnUraU8uzOqo1w++V4VhqoN3l2UhAf6UrubSKoq4dFFVjWTY1ZRDfTMQK9SNLk
	WRqKYqp0ZL1Bzb2np6u6FANc0Dqotkabhz2Y8DbDd+vMmuUpURJ5MaCZ/GQwIgBkFSTCPvBRAyv
	R+Rh37FnAHWsYlIv4Qi8Wh3qVqoEv/EVCEMRF7WQHxCJmRlusSgl22ISJHp1YD+ovBJfTrpTFw7
	XGU8D87WA1E/twLTLjtWByRJm+asE1E8RtXrWbsRHK6BUQ+yzyka/uU0z215R1oBUBvqJLythM7
	IxAMAp1ixujwOrZtTP+re0sg52dcsCfqpZjYSCMV/s14keKDsoPpe/hd+iGpsiM2H2iU3quS0=
X-Received: by 2002:a05:600c:8285:b0:490:abef:dae6 with SMTP id 5b1f17b1804b1-490c25b09bcmr392960895e9.19.1781071200857;
        Tue, 09 Jun 2026 23:00:00 -0700 (PDT)
Message-ID: <e2a61373-0c27-41c3-b0ca-836a4727a3b5@suse.com>
Date: Wed, 10 Jun 2026 07:59:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] scsi: host: allocate struct Scsi_Host on the NUMA
 node of the host adapter
To: Sumit Saxena <sumit.saxena@broadcom.com>,
 "Martin K . Petersen" <martin.petersen@oracle.com>,
 Jens Axboe <axboe@kernel.dk>
Cc: "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
 linux-scsi@vger.kernel.org, linux-block@vger.kernel.org,
 Adam Radford <aradford@gmail.com>, Khalid Aziz <khalid@gonehiking.org>,
 Adaptec OEM Raid Solutions <aacraid@microsemi.com>,
 Matthew Wilcox <willy@infradead.org>, "Juergen E . Fischer"
 <fischer@norbit.de>, Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org, Finn Thain <fthain@linux-m68k.org>,
 Michael Schmitz <schmitzmic@gmail.com>,
 Anil Gurumurthy <anil.gurumurthy@qlogic.com>,
 Sudarsana Kalluru <sudarsana.kalluru@qlogic.com>,
 Oliver Neukum <oliver@neukum.org>, Ali Akcaagac <aliakc@web.de>,
 Jamie Lenehan <lenehan@twibble.org>, Ram Vegesna <ram.vegesna@broadcom.com>,
 target-devel@vger.kernel.org, Bradley Grove <linuxdrivers@attotech.com>,
 Satish Kharat <satishkh@cisco.com>, Sesidhar Baddela <sebaddel@cisco.com>,
 Karan Tilak Kumar <kartilak@cisco.com>, Yihang Li
 <liyihang9@h-partners.com>, Don Brace <don.brace@microchip.com>,
 storagedev@microchip.com, HighPoint Linux Team <linux@highpoint-tech.com>,
 Tyrel Datwyler <tyreld@linux.ibm.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <chleroy@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 Brian King <brking@us.ibm.com>, Lee Duncan <lduncan@suse.com>,
 Chris Leech <cleech@redhat.com>, Mike Christie
 <michael.christie@oracle.com>, open-iscsi@googlegroups.com,
 Justin Tee <justin.tee@broadcom.com>, Paul Ely <paul.ely@broadcom.com>,
 Kashyap Desai <kashyap.desai@broadcom.com>,
 Shivasharan S <shivasharan.srikanteshwara@broadcom.com>,
 Chandrakanth Patil <chandrakanth.patil@broadcom.com>,
 megaraidlinux.pdl@broadcom.com,
 Sathya Prakash Veerichetty <sathya.prakash@broadcom.com>,
 Sreekanth Reddy <sreekanth.reddy@broadcom.com>,
 mpi3mr-linuxdrv.pdl@broadcom.com,
 Suganath Prabu Subramani <suganath-prabu.subramani@broadcom.com>,
 Ranjan Kumar <ranjan.kumar@broadcom.com>, MPT-FusionLinux.pdl@broadcom.com,
 Daniel Palmer <daniel@thingy.jp>, GOTO Masanori <gotom@debian.or.jp>,
 YOKOTA Hiroshi <yokota@netlab.is.tsukuba.ac.jp>,
 Jack Wang <jinpu.wang@cloud.ionos.com>, Geoff Levand <geoff@infradead.org>,
 Michael Reed <mdr@sgi.com>, Nilesh Javali <njavali@marvell.com>,
 GR-QLogic-Storage-Upstream@marvell.com, Narsimhulu Musini
 <nmusini@cisco.com>, "K . Y . Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>,
 linux-hyperv@vger.kernel.org, "Michael S . Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eugenio Perez <eperezma@redhat.com>,
 virtualization@lists.linux.dev, Vishal Bhakta <vishal.bhakta@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com, Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 xen-devel@lists.xenproject.org, John Garry <john.g.garry@oracle.com>
References: <20260609121806.2121755-1-sumit.saxena@broadcom.com>
 <20260609121806.2121755-3-sumit.saxena@broadcom.com>
Content-Language: en-US
From: Hannes Reinecke <hare@suse.com>
In-Reply-To: <20260609121806.2121755-3-sumit.saxena@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1781071201-E2577CF5-CC3E1A74/0/0
X-purgate-type: clean
X-purgate-size: 7035

On 6/9/26 14:18, Sumit Saxena wrote:
> scsi_host_alloc() used kzalloc(), which always picks an arbitrary node.
> Extend the function to accept a 'struct device *dev' parameter and use
> kzalloc_node() with dev_to_node(dev) so the Scsi_Host struct lands on
> the same NUMA node as the HBA, mirroring the treatment already applied
> to struct scsi_device, struct scsi_target, and shost_data.
> 
> When dev is NULL (legacy ISA/platform drivers without a dma_dev) the
> allocation falls back to NUMA_NO_NODE, preserving existing behaviour.
> 
> Update all in-tree callers:
>    - PCI-based HBA drivers pass &pdev->dev (or the equivalent struct
>      member such as &phba->pcidev->dev, &h->pdev->dev, &ha->pdev->dev)
>      so their host struct is placed on the adapter's node.
>    - Non-PCI drivers (ISA, Amiga, ARM PCMCIA, virtio, Hyper-V, PS3, …)
>      pass NULL.
>    - libfc's libfc_host_alloc() inline helper passes NULL; FC drivers
>      that want NUMA awareness can open-code the call with their pdev.
> 
> Suggested-by: John Garry <john.g.garry@oracle.com>
> Signed-off-by: Sumit Saxena <sumit.saxena@broadcom.com>
> ---
>   drivers/scsi/3w-9xxx.c                    | 2 +-
>   drivers/scsi/3w-sas.c                     | 2 +-
>   drivers/scsi/3w-xxxx.c                    | 2 +-
>   drivers/scsi/53c700.c                     | 2 +-
>   drivers/scsi/BusLogic.c                   | 2 +-
>   drivers/scsi/a100u2w.c                    | 2 +-
>   drivers/scsi/a2091.c                      | 2 +-
>   drivers/scsi/a3000.c                      | 2 +-
>   drivers/scsi/aacraid/linit.c              | 2 +-
>   drivers/scsi/advansys.c                   | 6 +++---
>   drivers/scsi/aha152x.c                    | 2 +-
>   drivers/scsi/aha1542.c                    | 2 +-
>   drivers/scsi/aha1740.c                    | 2 +-
>   drivers/scsi/aic7xxx/aic79xx_osm.c        | 2 +-
>   drivers/scsi/aic7xxx/aic7xxx_osm.c        | 2 +-
>   drivers/scsi/aic94xx/aic94xx_init.c       | 2 +-
>   drivers/scsi/am53c974.c                   | 2 +-
>   drivers/scsi/arcmsr/arcmsr_hba.c          | 3 ++-
>   drivers/scsi/arm/acornscsi.c              | 2 +-
>   drivers/scsi/arm/arxescsi.c               | 2 +-
>   drivers/scsi/arm/cumana_1.c               | 2 +-
>   drivers/scsi/arm/cumana_2.c               | 2 +-
>   drivers/scsi/arm/eesox.c                  | 2 +-
>   drivers/scsi/arm/oak.c                    | 2 +-
>   drivers/scsi/arm/powertec.c               | 2 +-
>   drivers/scsi/atari_scsi.c                 | 2 +-
>   drivers/scsi/atp870u.c                    | 2 +-
>   drivers/scsi/bfa/bfad_im.c                | 2 +-
>   drivers/scsi/csiostor/csio_init.c         | 4 ++--
>   drivers/scsi/dc395x.c                     | 2 +-
>   drivers/scsi/dmx3191d.c                   | 2 +-
>   drivers/scsi/elx/efct/efct_xport.c        | 4 ++--
>   drivers/scsi/esas2r/esas2r_main.c         | 2 +-
>   drivers/scsi/fdomain.c                    | 2 +-
>   drivers/scsi/fnic/fnic_main.c             | 2 +-
>   drivers/scsi/g_NCR5380.c                  | 2 +-
>   drivers/scsi/gvp11.c                      | 2 +-
>   drivers/scsi/hisi_sas/hisi_sas_main.c     | 2 +-
>   drivers/scsi/hisi_sas/hisi_sas_v3_hw.c    | 2 +-
>   drivers/scsi/hosts.c                      | 6 ++++--
>   drivers/scsi/hpsa.c                       | 2 +-
>   drivers/scsi/hptiop.c                     | 2 +-
>   drivers/scsi/ibmvscsi/ibmvfc.c            | 2 +-
>   drivers/scsi/ibmvscsi/ibmvscsi.c          | 2 +-
>   drivers/scsi/imm.c                        | 2 +-
>   drivers/scsi/initio.c                     | 2 +-
>   drivers/scsi/ipr.c                        | 2 +-
>   drivers/scsi/ips.c                        | 2 +-
>   drivers/scsi/isci/init.c                  | 2 +-
>   drivers/scsi/jazz_esp.c                   | 2 +-
>   drivers/scsi/libiscsi.c                   | 2 +-
>   drivers/scsi/lpfc/lpfc_init.c             | 2 +-
>   drivers/scsi/mac53c94.c                   | 2 +-
>   drivers/scsi/mac_esp.c                    | 2 +-
>   drivers/scsi/mac_scsi.c                   | 2 +-
>   drivers/scsi/megaraid.c                   | 2 +-
>   drivers/scsi/megaraid/megaraid_mbox.c     | 2 +-
>   drivers/scsi/megaraid/megaraid_sas_base.c | 2 +-
>   drivers/scsi/mesh.c                       | 2 +-
>   drivers/scsi/mpi3mr/mpi3mr_os.c           | 2 +-
>   drivers/scsi/mpt3sas/mpt3sas_scsih.c      | 4 ++--
>   drivers/scsi/mvme147.c                    | 2 +-
>   drivers/scsi/mvsas/mv_init.c              | 2 +-
>   drivers/scsi/mvumi.c                      | 2 +-
>   drivers/scsi/myrb.c                       | 2 +-
>   drivers/scsi/myrs.c                       | 2 +-
>   drivers/scsi/ncr53c8xx.c                  | 2 +-
>   drivers/scsi/nsp32.c                      | 2 +-
>   drivers/scsi/pcmcia/nsp_cs.c              | 2 +-
>   drivers/scsi/pcmcia/qlogic_stub.c         | 2 +-
>   drivers/scsi/pcmcia/sym53c500_cs.c        | 2 +-
>   drivers/scsi/pm8001/pm8001_init.c         | 2 +-
>   drivers/scsi/pmcraid.c                    | 2 +-
>   drivers/scsi/ppa.c                        | 2 +-
>   drivers/scsi/ps3rom.c                     | 2 +-
>   drivers/scsi/qla1280.c                    | 2 +-
>   drivers/scsi/qla2xxx/qla_mid.c            | 2 +-
>   drivers/scsi/qla2xxx/qla_os.c             | 2 +-
>   drivers/scsi/qlogicfas.c                  | 2 +-
>   drivers/scsi/qlogicpti.c                  | 2 +-
>   drivers/scsi/scsi_debug.c                 | 2 +-
>   drivers/scsi/sgiwd93.c                    | 2 +-
>   drivers/scsi/smartpqi/smartpqi_init.c     | 2 +-
>   drivers/scsi/snic/snic_main.c             | 2 +-
>   drivers/scsi/stex.c                       | 2 +-
>   drivers/scsi/storvsc_drv.c                | 2 +-
>   drivers/scsi/sun3_scsi.c                  | 2 +-
>   drivers/scsi/sun3x_esp.c                  | 2 +-
>   drivers/scsi/sun_esp.c                    | 2 +-
>   drivers/scsi/sym53c8xx_2/sym_glue.c       | 2 +-
>   drivers/scsi/virtio_scsi.c                | 2 +-
>   drivers/scsi/vmw_pvscsi.c                 | 2 +-
>   drivers/scsi/wd719x.c                     | 2 +-
>   drivers/scsi/xen-scsifront.c              | 2 +-
>   drivers/scsi/zorro_esp.c                  | 2 +-
>   include/scsi/libfc.h                      | 2 +-
>   include/scsi/scsi_host.h                  | 3 ++-
>   97 files changed, 107 insertions(+), 103 deletions(-)
> 
Quite a lot of churn for such a (relatively) simple change.

I think it might be better to introduce a new function
(scsi_host_alloc_node() ?) with the additional parameter,
and make scsi_host_alloc() a wrapper around that.

That will reduce the size of this patch immensely.

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                  Kernel Storage Architect
hare@suse.com                               +49 911 74053 688
SUSE Software Solutions GmbH, Frankenstr. 146, 90461 Nürnberg
HRB 36809 (AG Nürnberg), GF: I. Totev, A. McDonald, W. Knoblich

