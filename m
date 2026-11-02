Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFADF606A333
	for <xen-devel@archiver.kernel.org>; Mon,  2 Nov 2026 14:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fW1j8LrE
Received: from list by lists.xenproject.org with outflank-mailman.1468281.1677403 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNshf-0008Jk-84; Mon, 02 Nov 2026 14:08:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1468281.1677403; Mon, 02 Nov 2026 14:08:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNshf-0008Jd-4T; Mon, 02 Nov 2026 14:08:03 +0000
Received: by outflank-mailman (input) for mailman id 1468281;
 Mon, 02 Nov 2026 14:08:01 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marcandre.lureau@redhat.com>) id 1xNshd-0008Cp-Se
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 14:08:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xNshd-007YCR-9O
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 15:08:01 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marcandre.lureau@redhat.com>)
 id 6ae89939-8faa-0a2a0a5109dd-0a2a4506e672-22
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 15:08:01 +0100
Received: from [170.10.129.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <marcandre.lureau@redhat.com>)
 id 6ae8993f-195a-0a2a45060019-aa0a817ca8a7-3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 15:08:00 +0100
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-581-utjxyXUMPkCZ29kxY1estw-1; Mon,
 02 Nov 2026 09:07:58 -0500
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 5E3861955BC1; Mon,  2 Nov 2026 14:07:55 +0000 (UTC)
Received: from localhost (headnet04.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.116])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 046AD1956087; Mon,  2 Nov 2026 14:07:53 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=mimecast20190719 header.d=redhat.com header.i="@redhat.com" header.h="From:Subject:Date:Message-Id:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793628479;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ERGcnspRdMZgREuK6ajaeWJ8EJgrkzIX+zoK92LO4lY=;
	b=fW1j8LrEDwrsQXdsJ3UEwBSw3V240aqz44J6MjspI3GSs94MP2xsR7BqfEGzHpYi+kFFv0
	VISnu3GkvQz5GFtjWsiZCVStcGYMZuHoXKxXcqtv5Rm1z2vAOn1MOBl+sLGFbQ0Vw/sxAz
	14Bl1LYVukLBcklr7JIPuKGpvzNZGlQ=
X-MC-Unique: utjxyXUMPkCZ29kxY1estw-1
X-Mimecast-MFC-AGG-ID: utjxyXUMPkCZ29kxY1estw_1793628475
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v8 05/18] hw/usb/hcd-ohci: Add an auto-hub property and
 leave it off
From: marcandre.lureau@redhat.com
To: Jamin Lin <jamin_lin@aspeedtech.com>
Cc: kraxel@redhat.com, marcandre.lureau@redhat.com, junjie.cao@intel.com, 
 junjie.cao@linux.dev, clg@kaod.org, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Kane Chen <kane_chen@aspeedtech.com>, 
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Tyrone Ting <kfting@nuvoton.com>, Hao Wu <wuhaotsh@google.com>, 
 Zhao Liu <zhao1.liu@intel.com>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Helge Deller <deller@gmx.de>, Stefano Stabellini <sstabellini@kernel.org>, 
 Anthony PERARD <anthony@xenproject.org>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 "open list:All patches CC here" <qemu-devel@nongnu.org>, 
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, 
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>, 
 Troy Lee <troy_lee@aspeedtech.com>
In-Reply-To: <20261102092201.1729245-6-jamin_lin@aspeedtech.com>
References: <20261102092201.1729245-1-jamin_lin@aspeedtech.com>
 <20261102092201.1729245-6-jamin_lin@aspeedtech.com>
Date: Mon, 02 Nov 2026 18:07:30 +0400
Message-Id: <179362845010.3960472.4266154712960924675.b4-review@b4>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1374;
 i=marcandre.lureau@redhat.com; h=from:subject:message-id;
 bh=F+Y/7oWbL8SBL0XFLzDglAlN+n7OEfdEp2LujSibKlA=;
 b=owEBbQKS/ZANAwAKAdro4Ql1lpzlAcsmYgBq6JkkvWPU+1uMT6MiAhZUb7waFsniXeuOw3woh
 sr/yLxvwfGJAjMEAAEKAB0WIQSHqb2TP4fGBtJ29i3a6OEJdZac5QUCauiZJAAKCRDa6OEJdZac
 5XaQEACAAe4ccYhh8K8bFsPg+Wt7NK/vwPZYr8TK2vfzGAaiDl3S3aB4O/fQq7VxEoukWb1KjEz
 k+fiipFdAb6NneVOHgIHlW1m8w9paiOXPFpoRYDl1CyGx1FV5jtg3pvo5S/iUuhZC8s+1v2rgkl
 DdVoYFlQ4VVKt2SILbwtAeWAeDoI73AiEYN1SvPrhMlUYtmTjd11Jv/JEgmTLp6oTBqXb9S0LoV
 /Z/zS9g18j2lZt6nlfDBCToUOUA+vkoVBQabDieg77grSq5Av62YrkycnGUSA2+DZozKcpaPRNS
 cFC/nvb5s2seg1eWR5LBjpsaOuwofYU49UrYV9LIS/0DUHohTh1RgwSKllhenUl4lD/UXCZ0Dbp
 q9JoCIkLUQx6kIs/wVH44is7/1LzwZoZrGgSLZzaJNd5k6olqhH4rkDLNtkPAd2mt5AopP+H7w3
 A8oJg+V88NWWJ9OaBV0ULs8qES0os1cf59LemQUokJmvkS9q2jPMyDFrARTBPalF6eyPBGP7Arr
 vPSAZEldqvJcjt0RlzVU9V02xjVPY+KtQG8ow5lsF1NRD5LFyMgaRm7EGIaO6GFgc5S3OontUou
 PbWSfwqHh8QFsWAsfeOnrExuO7AVQvWPAQ6+W1SGabVX9HTEZIT3PMiCEtXVrQnNpTHWYNrR2bf
 +Oc4DzNpXsxR73g==
X-Developer-Key: i=marcandre.lureau@redhat.com; a=openpgp;
 fpr=87A9BD933F87C606D276F62DDAE8E10975969CE5
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: J6Ui_wRd_-XZEUJBE9xT8qLLFLzaBWGpwLNtJMUwWjY_1793628475
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1793628481-FD80D77B-35DE1FB4/0/0
X-purgate-type: clean
X-purgate-size: 1376
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> Add auto-hub and leave it off. hw_compat_11_1 turns it on for
> pci-ohci and sysbus-ohci, so an older machine type keeps the hub it
> has today and a guest saved by an older QEMU still loads.
> 
> pc87560-ohci is its own PCI front end, not a pci-ohci, so it defines
> the property itself.
> 
> A companion OHCI adds its ports to the EHCI bus instead of making one,
> so there the EHCI property decides.
> 
> Suggested-by: Gerd Hoffmann <kraxel@redhat.com>
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> Message-ID: <20261102092201.1729245-6-jamin_lin@aspeedtech.com>
> ---
>  hw/usb/hcd-ohci.h        | 1 +
>  hw/core/machine.c        | 2 ++
>  hw/usb/hcd-ohci-pci.c    | 1 +
>  hw/usb/hcd-ohci-sysbus.c | 1 +
>  hw/usb/hcd-ohci.c        | 1 +
>  hw/usb/pc87560-ohci.c    | 1 +
>  6 files changed, 7 insertions(+)
>
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index f79337e7d774..22d2b834595a 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -47,6 +47,8 @@ GlobalProperty hw_compat_11_1[] = {
>      { "pci-ehci-usb", "auto-hub", "on" },
>      { "base-xhci", "auto-hub", "on" },
>      { "pci-uhci-usb", "auto-hub", "on" },
> +    { "sysbus-ohci", "auto-hub", "on" },
> +    { "pci-ohci", "auto-hub", "on" },

So it also needs pc87560-ohci, no?

-- 
Marc-André Lureau <marcandre.lureau@redhat.com>


