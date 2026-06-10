Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EC4ECD98CC
	for <xen-devel@archiver.kernel.org>; Thu, 11 Jun 2026 12:58:28 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1335477.1597692 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXeyx-0002Ta-6h; Thu, 11 Jun 2026 12:58:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1335477.1597692; Thu, 11 Jun 2026 12:58:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXeyx-0002TT-2p; Thu, 11 Jun 2026 12:58:03 +0000
Received: by outflank-mailman (input) for mailman id 1335477;
 Thu, 11 Jun 2026 12:58:01 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <stefanha@redhat.com>) id 1wXeyv-0002TN-MA
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2026 12:58:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXeyv-00Csrf-2a
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2026 14:58:01 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <stefanha@redhat.com>)
 id 6a2ab0a3-e002-0a2a0a5209dd-0a2a450ba044-48
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2026 14:58:00 +0200
Received: from [170.10.129.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <stefanha@redhat.com>)
 id 6a2ab0d7-212f-0a2a450b0019-aa0a817c92a1-3
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2026 14:58:00 +0200
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-359-ljIudu3YMUiI3vj_euAS4A-1; Thu,
 11 Jun 2026 08:57:57 -0400
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 193FA18D65C3; Thu, 11 Jun 2026 12:57:48 +0000 (UTC)
Received: from localhost (unknown [10.2.16.137])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 179B1180057F; Thu, 11 Jun 2026 12:57:43 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=mimecast20190719 header.d=redhat.com header.i="@redhat.com" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781182679;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wutI1NEOrxe0Ga9sQ5pG620uXi0d0C5Aj7NTI3FNepo=;
	b=WJqB3KdnoX2lUVrwIePkjJ6aswOz/mkycQOWECcgTHtIeYR8BmpylujZICSJmcYW+Hqs+v
	64qO1Blz97Z283bcRiQuOBsQYPxtbKRi9rv2eF+/JTDrpBiYjQbmVmn7R357F0CeTDQPIH
	smY+JhvQ7YGnU2FaJPCLNXte730Llwk=
X-MC-Unique: ljIudu3YMUiI3vj_euAS4A-1
X-Mimecast-MFC-AGG-ID: ljIudu3YMUiI3vj_euAS4A_1781182671
Date: Wed, 10 Jun 2026 11:37:47 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Sumit Saxena <sumit.saxena@broadcom.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>,
	Jens Axboe <axboe@kernel.dk>,
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
	linux-scsi@vger.kernel.org, linux-block@vger.kernel.org,
	Adam Radford <aradford@gmail.com>,
	Khalid Aziz <khalid@gonehiking.org>,
	Adaptec OEM Raid Solutions <aacraid@microsemi.com>,
	Matthew Wilcox <willy@infradead.org>,
	Hannes Reinecke <hare@suse.com>,
	"Juergen E . Fischer" <fischer@norbit.de>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	Finn Thain <fthain@linux-m68k.org>,
	Michael Schmitz <schmitzmic@gmail.com>,
	Anil Gurumurthy <anil.gurumurthy@qlogic.com>,
	Sudarsana Kalluru <sudarsana.kalluru@qlogic.com>,
	Oliver Neukum <oliver@neukum.org>, Ali Akcaagac <aliakc@web.de>,
	Jamie Lenehan <lenehan@twibble.org>,
	Ram Vegesna <ram.vegesna@broadcom.com>,
	target-devel@vger.kernel.org,
	Bradley Grove <linuxdrivers@attotech.com>,
	Satish Kharat <satishkh@cisco.com>,
	Sesidhar Baddela <sebaddel@cisco.com>,
	Karan Tilak Kumar <kartilak@cisco.com>,
	Yihang Li <liyihang9@h-partners.com>,
	Don Brace <don.brace@microchip.com>, storagedev@microchip.com,
	HighPoint Linux Team <linux@highpoint-tech.com>,
	Tyrel Datwyler <tyreld@linux.ibm.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	linuxppc-dev@lists.ozlabs.org, Brian King <brking@us.ibm.com>,
	Lee Duncan <lduncan@suse.com>, Chris Leech <cleech@redhat.com>,
	Mike Christie <michael.christie@oracle.com>,
	open-iscsi@googlegroups.com, Justin Tee <justin.tee@broadcom.com>,
	Paul Ely <paul.ely@broadcom.com>,
	Kashyap Desai <kashyap.desai@broadcom.com>,
	Shivasharan S <shivasharan.srikanteshwara@broadcom.com>,
	Chandrakanth Patil <chandrakanth.patil@broadcom.com>,
	megaraidlinux.pdl@broadcom.com,
	Sathya Prakash Veerichetty <sathya.prakash@broadcom.com>,
	Sreekanth Reddy <sreekanth.reddy@broadcom.com>,
	mpi3mr-linuxdrv.pdl@broadcom.com,
	Suganath Prabu Subramani <suganath-prabu.subramani@broadcom.com>,
	Ranjan Kumar <ranjan.kumar@broadcom.com>,
	MPT-FusionLinux.pdl@broadcom.com, Daniel Palmer <daniel@thingy.jp>,
	GOTO Masanori <gotom@debian.or.jp>,
	Jack Wang <jinpu.wang@cloud.ionos.com>,
	Geoff Levand <geoff@infradead.org>, Michael Reed <mdr@sgi.com>,
	Nilesh Javali <njavali@marvell.com>,
	GR-QLogic-Storage-Upstream@marvell.com,
	Narsimhulu Musini <nmusini@cisco.com>,
	"K . Y . Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
	Long Li <longli@microsoft.com>, linux-hyperv@vger.kernel.org,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Eugenio Perez <eperezma@redhat.com>, virtualization@lists.linux.dev,
	Vishal Bhakta <vishal.bhakta@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	xen-devel@lists.xenproject.org,
	John Garry <john.g.garry@oracle.com>
Subject: Re: [PATCH v3 2/4] scsi: host: allocate struct Scsi_Host on the NUMA
 node of the host adapter
Message-ID: <20260610153747.GA121666@fedora>
References: <20260609121806.2121755-1-sumit.saxena@broadcom.com>
 <20260609121806.2121755-3-sumit.saxena@broadcom.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="57Se20/pMUpk+P8R"
Content-Disposition: inline
In-Reply-To: <20260609121806.2121755-3-sumit.saxena@broadcom.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-purgate-ID: tlsNG-42698a/1781182680-1B77AF3B-E51D8BD2/0/0
X-purgate-type: clean
X-purgate-size: 1636


--57Se20/pMUpk+P8R
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 09, 2026 at 05:48:01PM +0530, Sumit Saxena wrote:
> diff --git a/drivers/scsi/virtio_scsi.c b/drivers/scsi/virtio_scsi.c
> index 5fdaa71f0652..88375574cb18 100644
> --- a/drivers/scsi/virtio_scsi.c
> +++ b/drivers/scsi/virtio_scsi.c
> @@ -929,7 +929,7 @@ static int virtscsi_probe(struct virtio_device *vdev)
>  	num_targets =3D virtscsi_config_get(vdev, max_target) + 1;
> =20
>  	shost =3D scsi_host_alloc(&virtscsi_host_template,
> -				struct_size(vscsi, req_vqs, num_queues));
> +				struct_size(vscsi, req_vqs, num_queues), NULL);

A virtio_device has a parent (this is the virtio transport, like
virtio_pci) and that may have NUMA node.

drivers/virtio/virtio.c:register_virtio_device() could call
set_dev_node(dev, dev_to_node(dev->parent)) to propagate the NUMA node
to the virtio_device if it is not already automatically propagated.

Stefan

--57Se20/pMUpk+P8R
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmophMsACgkQnKSrs4Gr
c8h+7Af/Yl5xc4DOlpzwRNKEPqqogmtmADQbRI91eNljCoArG1qdxcTTSKksIgWC
5g0jjNOCwbOatljS+FxPkDgpPYoZbsIv+K4p/D6UyHLP+Dff2FQhwPaAKkOvJi6k
9BoNOORgp8ZKrf0RrCTr2M5clKgG0GT+5WxgezSZtTh6wSoN0ksL5kwqx+8B4sWw
irnTFz4hZhKlUsYHWWYvNhiq0ChdmzYMdxw6GFwIWrRpNcElfSmOAMBE12bJeqIi
u2/3ah3cSSanhmuITCC+dXImHUlYtxtFRBowqsxCEtdiRFs5srPStR/WW8yyZoXe
mhXbMPjGmQXNdAT61yT9lw+ZVx2y1w==
=kfg0
-----END PGP SIGNATURE-----

--57Se20/pMUpk+P8R--


