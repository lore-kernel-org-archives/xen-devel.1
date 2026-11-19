Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD3C606A320
	for <xen-devel@archiver.kernel.org>; Thu, 19 Nov 2026 09:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=trPf9+9S
Received: from list by lists.xenproject.org with outflank-mailman.1495969.1694658 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTyq4-0004uC-Qa; Thu, 19 Nov 2026 09:53:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1495969.1694658; Thu, 19 Nov 2026 09:53:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTyq4-0004u4-Nd; Thu, 19 Nov 2026 09:53:56 +0000
Received: by outflank-mailman (input) for mailman id 1495969;
 Thu, 19 Nov 2026 09:35:11 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <miquel.raynal@bootlin.com>) id 1xTyXv-0000is-AQ
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 09:35:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTyXt-00B6Qb-J7
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 10:35:09 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <miquel.raynal@bootlin.com>)
 id 6afec2c7-e002-0a2a0a5209dd-0a2a45079982-20
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 10:35:09 +0100
Received: from [185.171.202.116] (helo=smtpout-04.galae.net)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <miquel.raynal@bootlin.com>)
 id 6afec2cd-b4ea-0a2a45070019-b9abca74e284-3
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 10:35:09 +0100
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 9242AC4CBEF;
 Thu, 19 Nov 2026 09:35:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 3D3E660237;
 Thu, 19 Nov 2026 09:35:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 145C311BC315F; Thu, 19 Nov 2026 10:34:37 +0100 (CET)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=dkim header.d=bootlin.com header.i="@bootlin.com" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795080902; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=CQyK9hhzQUtdCIaKwh8qFL6kiw3hBK7e02jXrxk3Q5M=;
	b=trPf9+9SmvXq7f3i06Ocu8PXp2wkKO6ORNKTA4/AjOKcQKVFePqcO/1BhMn+K4JKXgVetW
	9Yr+85a0u4rw/+pGQPZDRSMsRMDGawEXfnQ9jCtNv2zr3C8ZQd4iUe048cU50ECPRyFurf
	rsmMLyDo3rueQxG7RuwY+EBebjyTZuhqh1PyoyvCDfGRSYoPSTyfx/hwy85QgTWFsAil0Q
	X6TU5TJA2EpRSA3/3QyU7eQBfCRlHqNmOlSA+ByZVazhopQuZSLgxPNhpRVe5QgDh43L/T
	HBMPjxwGs9avJmS68J25IgXRGZqvRkZ+RC3EyDq//xlN7GCwXICCDykv7Bhitw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org,  Jonathan Corbet <corbet@lwn.net>,  Shuah
 Khan <skhan@linuxfoundation.org>,  linux-doc@vger.kernel.org,  David
 Hildenbrand <david@kernel.org>,  Andrew Morton
 <akpm@linux-foundation.org>,  Jason Gunthorpe <jgg@nvidia.com>,  Leon
 Romanovsky <leonro@nvidia.com>,  linux-mm@kvack.org,  Jaroslav Kysela
 <perex@perex.cz>,  Takashi Iwai <tiwai@suse.com>,
  linux-sound@vger.kernel.org,  Jens Axboe <axboe@kernel.dk>,
  linux-block@vger.kernel.org,  Marcel Holtmann <marcel@holtmann.org>,
  Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
  linux-bluetooth@vger.kernel.org,  Willem de Bruijn
 <willemdebruijn.kernel@gmail.com>,  Jason Wang <jasowangio@gmail.com>,
  David Heidelberg <david@ixit.cz>,  oe-linux-nfc@lists.linux.dev,  Chas
 Williams <3chas3@gmail.com>,  "David S. Miller" <davem@davemloft.net>,
  Eric Dumazet <edumazet@kernel.org>,  Jakub Kicinski <kuba@kernel.org>,
  Paolo Abeni <pabeni@redhat.com>,  netdev@vger.kernel.org,  Helge Deller
 <deller@gmx.de>,  linux-fbdev@vger.kernel.org,
  dri-devel@lists.freedesktop.org,  MPT-FusionLinux.pdl@broadcom.com,
  "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,  "Martin
 K. Petersen" <mkp@kernel.org>,  linux-scsi@vger.kernel.org,  Richard
 Weinberger <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,
  Zhihao Cheng <chengzhihao1@huawei.com>,  linux-mtd@lists.infradead.org,
  Neill Kapron <nkapron@google.com>,  Andrey Konovalov
 <andreyknvl@gmail.com>,  Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
  linux-usb@vger.kernel.org,  Juergen Gross <jgross@suse.com>,  Stefano
 Stabellini <sstabellini@kernel.org>,  xen-devel@lists.xenproject.org,
  Hans de Goede <hansg@kernel.org>,  Arnd Bergmann <arnd@arndb.de>,
  "Michael S. Tsirkin" <mst@redhat.com>,  Eugenio =?utf-8?Q?P=C3=A9rez?=
 <eperezma@redhat.com>,  Sean Christopherson <seanjc@google.com>,  Paolo
 Bonzini <pbonzini@redhat.com>,  kvm@vger.kernel.org,
  virtualization@lists.linux.dev,  Jan Kara <jack@suse.cz>,
  linux-fsdevel@vger.kernel.org,  "Theodore Ts'o" <tytso@mit.edu>,
  linux-ext4@vger.kernel.org,  Mike Marshall <hubcap@omnibond.com>,
  devel@lists.orangefs.org,  Paulo Alcantara <pc@manguebit.org>,  Namjae
 Jeon <linkinjeon@kernel.org>,  linux-cifs@vger.kernel.org,  Jaegeuk Kim
 <jaegeuk@kernel.org>,  Chao Yu <chao@kernel.org>,
  linux-f2fs-devel@lists.sourceforge.net,  Florian Fainelli
 <florian.fainelli@broadcom.com>,  Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,  Tzung-Bi Shih
 <tzungbi@kernel.org>,  Benson Leung <bleung@chromium.org>,  David Airlie
 <airlied@gmail.com>,  Simona Vetter <simona@ffwll.ch>,  Alex Deucher
 <alexander.deucher@amd.com>,  Christian =?utf-8?Q?K=C3=B6nig?=
 <christian.koenig@amd.com>,
  amd-gfx@lists.freedesktop.org,  Jani Nikula
 <jani.nikula@linux.intel.com>,  Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>,  Rodrigo Vivi <rodrigo.vivi@intel.com>,
  Tvrtko Ursulin <tursulin@ursulin.net>,  intel-gfx@lists.freedesktop.org,
  Matthew Brost <matthew.brost@intel.com>,  Thomas =?utf-8?Q?Hellstr=C3=B6?=
 =?utf-8?Q?m?=
 <thomas.hellstrom@linux.intel.com>,  intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v2 07/12] docs: ioctl-number: update MTD entries
In-Reply-To: <20261119053514.255348-8-rdunlap@infradead.org> (Randy Dunlap's
	message of "Wed, 18 Nov 2026 21:35:08 -0800")
References: <20261119053514.255348-1-rdunlap@infradead.org>
	<20261119053514.255348-8-rdunlap@infradead.org>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Thu, 19 Nov 2026 10:34:37 +0100
Message-ID: <87bj7lf9le.fsf@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-purgate-ID: tlsNG-ef75cf/1795080909-A66DAAE4-33C21E90/0/0
X-purgate-type: clean
X-purgate-size: 538
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Randy,

On 18/11/2026 at 21:35:08 -08, Randy Dunlap <rdunlap@infradead.org> wrote:

> Update the list of files where MTD ioctls are defined and update
> the ranges of function numbers that are used.
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>

Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>

> [Since having multiple maintainers trying to merge these would
> cause some conflicts, it would be more manageable for Jon to
> take all of these through the docs-next tree.]

Agreed.

Thanks,
Miqu=C3=A8l

