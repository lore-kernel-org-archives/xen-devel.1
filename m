Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35FDD606A322
	for <xen-devel@archiver.kernel.org>; Mon,  9 Nov 2026 13:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UXmcXJOt
Received: from list by lists.xenproject.org with outflank-mailman.1480018.1683943 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQP5K-0007X3-HX; Mon, 09 Nov 2026 13:06:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1480018.1683943; Mon, 09 Nov 2026 13:06:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQP5K-0007Ww-Ej; Mon, 09 Nov 2026 13:06:54 +0000
Received: by outflank-mailman (input) for mailman id 1480018;
 Mon, 09 Nov 2026 13:06:52 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <mst@redhat.com>) id 1xQP5I-0007Wq-HM
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 13:06:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQP5H-007SdI-QU
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 14:06:51 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <mst@redhat.com>)
 id 6af1c549-2eae-0a2a0a5409dd-0a2a45038c08-38
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 14:06:51 +0100
Received: from [170.10.129.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <mst@redhat.com>)
 id 6af1c56a-fae8-0a2a45030019-aa0a817c7633-3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 14:06:51 +0100
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-131-pBRmjVDgOZa92Wb7SLEkDg-1; Mon, 09 Nov 2026 08:06:48 -0500
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-c4d4d132bbeso91555466b.0
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 05:06:48 -0800 (PST)
Received: from redhat.com ([2a0d:6fc0:1511:2900:ff37:b35c:a97:952d])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c4d69f9384csm168299566b.13.2026.11.09.05.06.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2026 05:06:45 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=mimecast20190719 header.d=redhat.com header.i="@redhat.com" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794229610;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ala+oDARam9VyrCVVd83FiqqzQ26GgOylxTttfV+xTA=;
	b=UXmcXJOtilHFjGvwez6rO6q+AbZFLoTde0Y511FZa8Lb1Ab7Lbiewhz5vCV0eEA7Nz7xDA
	A34uvJHDfl2e8bxZcRRR4hqBGi7MDd+AImCsbElrXtnX9MNkW6wqAu+HeVd0jcVCzvVv/X
	0mIn02WplMqjvTFwaiUbo3BrR6zDdRM=
X-MC-Unique: pBRmjVDgOZa92Wb7SLEkDg-1
X-Mimecast-MFC-AGG-ID: pBRmjVDgOZa92Wb7SLEkDg_1794229608
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794229608; x=1794834408;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ala+oDARam9VyrCVVd83FiqqzQ26GgOylxTttfV+xTA=;
        b=nfT5wFhRyaWlX4XZ9BwNi0Vc7q/0qvCAi2ul1kgzRgaCEP0zSwW/q56/qwV9vjbIjj
         aeBpT7WqntoubCRlUFprwO8t/ZPNu7uahBKGeeHNMxDQd+ig5truaZ51jRlRx2iyFBkr
         ka1yxIU6I0znfAYj1/X0NQY64bNb2mSCdqdtQPw6RjlKppnE73X96SGke7uXIR/0mpGV
         yUV2jESiKozymhdRgPrq8iuw31WFbser14h+q69ASFs0sKvrwMzBFA4PaOmH8tUGt5JI
         2liIGeSmbm+J1zhfpSY6ecCiwY0i85aHoxquJpcTdCB/yliif0fgbQfYIhX34jVzcEhg
         ArSQ==
X-Forwarded-Encrypted: i=1; AL+hErHjbzQ7l5thom3w0ijQ2l4DZD7FPdtMa5Qot3eXcVGeqtict/9MEeWwF8CAcIY3ZuQdzPR+pLLRoro=@lists.xenproject.org
X-Gm-Message-State: APuU4Z+IOp35oiGsq/WHH0bpK4ePJpsj3SnRF0TYapIiv0SfG/SduTat
	fuwJwWxgG6HNZHwKMyrBtFACCDoogE0tuqtPzONwx0hpR3dmAYFkHQKGky4pZoxFuQT7uOyXWFP
	d2Mtj3o2hX9kgF6ZLmuwNzqj2zNPoWLM6B5y+/umlqdpcmAqyCLGC4xU7Pc1uQl4KwY2l
X-Gm-Gg: AYBFou0BldCVR2aWXz8ojAiAxwlYS6x1yx5o0HORgBtbR82OHwW55EGVVW7erAI0GeW
	ohrDJYSqZ46orbA3FjNFW8/WLmdVv3EOwLEZrz0HznRItkylWBgptDdQ1ub48e7I5HLqHAL2uuf
	2ynCiA0KXCSMafDW+bOijyOHyOVQRRAdcXBhP3GHg8tauguEcTAxznVTqVakoyjyfE2XEyfEzDg
	mRHaJT8jZavJmRaMwB4AJ5vi+dVag+JJE2I5fJ5DVaAMxyMlS64xfcezBMQqK8yVKGCGztHBTsn
	Pr+dcjO3WuAXndBP8g5qA8eSIsAnWCUv3KLMqE3ZpCtqhYcr81Rnx4HOKefOS1Xu4Z9x95JuONp
	yKYpZkzRRYU614FtLMUmrlT/C8aZ34GIFXTlFIT7T
X-Received: by 2002:a17:907:18c3:b0:c25:f7db:4bec with SMTP id a640c23a62f3a-c4d6db5760cmr321582666b.18.1794229607392;
        Mon, 09 Nov 2026 05:06:47 -0800 (PST)
X-Received: by 2002:a17:907:18c3:b0:c25:f7db:4bec with SMTP id a640c23a62f3a-c4d6db5760cmr321574566b.18.1794229606674;
        Mon, 09 Nov 2026 05:06:46 -0800 (PST)
Date: Mon, 9 Nov 2026 08:06:38 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
	Jason Wang <jasowangio@gmail.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Jan Kara <jack@suse.com>,
	Paul Moore <paul@paul-moore.com>,
	Stephen Smalley <stephen.smalley.work@gmail.com>,
	Ondrej =?utf-8?B?TW9zbsOhxI1law==?= <omosnacek@gmail.com>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>, Jens Wiklander <jenswi@kernel.org>,
	Sumit Garg <sumit.garg@kernel.org>,
	Scott Branden <scott.branden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Richard Cochran <richardcochran@gmail.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org,
	linux-hyperv@vger.kernel.org, virtualization@lists.linux.dev,
	linux-sgx@vger.kernel.org, selinux@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH 14/14] vhost-vdpa: convert mmap hook to mmap_prepare
Message-ID: <20261109080616-mutt-send-email-mst@kernel.org>
References: <20261105-late-2026-mmap_prepare-v1-0-c56aadfbab8a@kernel.org>
 <20261105-late-2026-mmap_prepare-v1-14-c56aadfbab8a@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261105-late-2026-mmap_prepare-v1-14-c56aadfbab8a@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: JMOyTaCruMAXiUYSerI2Fti_VvvnCws3-nqbcyULA4o_1794229608
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-purgate-ID: tlsNG-33051d/1794229611-6D0D94E9-CF549194/35/111497
X-purgate-type: clean
X-purgate-size: 2780
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 05, 2026 at 09:05:45PM +0000, Lorenzo Stoakes (ARM) wrote:
> Move from the deprecated mmap hook to the new mmap_prepare hook. The hook
> only validates the request and sets the VMA flags, operations and page
> protection.
> 
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>


Acked-by: Michael S. Tsirkin <mst@redhat.com>

Who's merging this, me?
> ---
>  drivers/vhost/vdpa.c | 23 ++++++++++++-----------
>  1 file changed, 12 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/vhost/vdpa.c b/drivers/vhost/vdpa.c
> index ff7d90719171..993b2d7c8927 100644
> --- a/drivers/vhost/vdpa.c
> +++ b/drivers/vhost/vdpa.c
> @@ -1573,19 +1573,19 @@ static const struct vm_operations_struct vhost_vdpa_vm_ops = {
>  	.fault = vhost_vdpa_fault,
>  };
>  
> -static int vhost_vdpa_mmap(struct file *file, struct vm_area_struct *vma)
> +static int vhost_vdpa_mmap_prepare(struct vm_area_desc *desc)
>  {
> -	struct vhost_vdpa *v = vma->vm_file->private_data;
> +	struct vhost_vdpa *v = desc->file->private_data;
>  	struct vdpa_device *vdpa = v->vdpa;
>  	const struct vdpa_config_ops *ops = vdpa->config;
>  	struct vdpa_notification_area notify;
> -	unsigned long index = vma->vm_pgoff;
> +	unsigned long index = desc->pgoff;
>  
> -	if (vma->vm_end - vma->vm_start != PAGE_SIZE)
> +	if (vma_desc_size(desc) != PAGE_SIZE)
>  		return -EINVAL;
> -	if ((vma->vm_flags & VM_SHARED) == 0)
> +	if (!vma_desc_test(desc, VMA_SHARED_BIT))
>  		return -EINVAL;
> -	if (vma->vm_flags & VM_READ)
> +	if (vma_desc_test(desc, VMA_READ_BIT))
>  		return -EINVAL;
>  	if (!ops->get_vq_notification)
>  		return -ENOTSUPP;
> @@ -1598,12 +1598,13 @@ static int vhost_vdpa_mmap(struct file *file, struct vm_area_struct *vma)
>  		return -EINVAL;
>  	if (notify.addr & (PAGE_SIZE - 1))
>  		return -EINVAL;
> -	if (vma->vm_end - vma->vm_start != notify.size)
> +	if (vma_desc_size(desc) != notify.size)
>  		return -ENOTSUPP;
>  
> -	vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
> -	vm_flags_set(vma, VM_IO | VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP);
> -	vma->vm_ops = &vhost_vdpa_vm_ops;
> +	desc->page_prot = pgprot_noncached(desc->page_prot);
> +	vma_desc_set_flags(desc, VMA_IO_BIT, VMA_PFNMAP_BIT, VMA_DONTEXPAND_BIT,
> +			   VMA_DONTDUMP_BIT);
> +	desc->vm_ops = &vhost_vdpa_vm_ops;
>  	return 0;
>  }
>  #endif /* CONFIG_MMU */
> @@ -1615,7 +1616,7 @@ static const struct file_operations vhost_vdpa_fops = {
>  	.write_iter	= vhost_vdpa_chr_write_iter,
>  	.unlocked_ioctl	= vhost_vdpa_unlocked_ioctl,
>  #ifdef CONFIG_MMU
> -	.mmap		= vhost_vdpa_mmap,
> +	.mmap_prepare	= vhost_vdpa_mmap_prepare,
>  #endif /* CONFIG_MMU */
>  	.compat_ioctl	= compat_ptr_ioctl,
>  };
> 
> -- 
> 2.56.0


