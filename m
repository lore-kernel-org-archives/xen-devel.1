Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85B20CD6E78
	for <xen-devel@archiver.kernel.org>; Thu,  4 Jun 2026 15:08:39 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1328021.1592696 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wV9gB-00055O-3O; Thu, 04 Jun 2026 15:08:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1328021.1592696; Thu, 04 Jun 2026 15:08:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wV9gA-00053p-Qw; Thu, 04 Jun 2026 15:08:18 +0000
Received: by outflank-mailman (input) for mailman id 1328021;
 Thu, 04 Jun 2026 15:02:04 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dimitri.daskalakis1@gmail.com>) id 1wV9a8-00044O-DL
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 15:02:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wV9a7-001rSt-Nd
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 17:02:03 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dimitri.daskalakis1@gmail.com>)
 id 6a219360-2eae-0a2a0a5409dd-0a2a4507c166-44
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 17:02:03 +0200
Received: from [209.85.210.173] (helo=mail-pf1-f173.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dimitri.daskalakis1@gmail.com>)
 id 6a21936a-229c-0a2a45070019-d155d2ada9e9-3
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 17:02:03 +0200
Received: by mail-pf1-f173.google.com with SMTP id
 d2e1a72fcca58-84275887a3fso1160425b3a.1
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 08:02:03 -0700 (PDT)
Received: from localhost ([2a03:2880:7ff:8::])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-84282882156sm6223764b3a.33.2026.06.04.08.01.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jun 2026 08:01:58 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780585321; x=1781190121; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xxHR67fZ2aTWHsPIWuXVLfBkGwXwQ/JLm/nLvvGQPDw=;
        b=rzK/aNZwPdwwPB6KVEaZmrrxFUanV95qRJzDxeHQ1l1Am8D9a7t/weorJE5zTTsaSi
         2Bso3wVBcK4ytRWSg1mGd/HzNLdvx3JdV1KtlvG73V7pD6E0kxmvRhhW/ZkqzNJL5NVQ
         zKpddnfKhfrWoQw4vQ9RcRfFFoQi8tuw9RwBegUclR1AyNqFwjQWIJZXfhIm8idlgZo0
         2VVFT2rJ+SKLIHPUIGDtp+wpGOeGKiSXtzsAY8iV3EwXDu5EuD5mHibKR/jyT0DDqW1g
         7vr+OMohh+YkwMN6Er6MWkCL8KYDTrpWjcg2y0w/ak015jLbNn4YTgO552xl6c2Ck7/9
         CrFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780585321; x=1781190121;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xxHR67fZ2aTWHsPIWuXVLfBkGwXwQ/JLm/nLvvGQPDw=;
        b=LBEOaLVTeLZX9y69/QiwiuN6tUsUBvStFeqOHe1cGfCipGcmlJDfVT3846VhNgMy2j
         LSRrGMAUu61GZFGGQ84v4oai+Q7AYulLm5KIJE01mx5ARxVqmnBoX7Vai7Gb4EkRR5a1
         XsHQeQZzwXBbuuBQcFujeYG/ASC3GCwOGlhVhjsahUFHvgEG03cvkWq/cVssa6T3EhMm
         +PzlUknSm5CDLj8tPHSW7dNzs5vS3ms8Hsuh3D/dfekTq9A9wPANvKdVdpfMmldKE7mx
         HvCssKy3HQ30ybblLyckBlghR72FUaHLK2u7lwyjbvuA1NwGyBtgfBWrJ1DTVOGgrq5S
         vJ5Q==
X-Forwarded-Encrypted: i=1; AFNElJ+e2wN6OcB8aNQ4lEc1qqLn8a0IH5FmSWtYXvzk7tt0ZitCkb/FMS61j2QZEduvVm/mxwM14YL1mVg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxT68UiI4jxAy6VWw5bkFY/gdF8tHyqWzEV4MdIVBdRIAwqbjwT
	Y6818jPO6LgbrPKRFIAEhMcfFtNxb86SLtd+PdiJQck+nIusb/6A6Y+R
X-Gm-Gg: Acq92OFFDF5pkXrvGsrrWpdy+qeYvqQmwdaxpJwg+ILmWQEwJ+M2CjdxXecEB9N4Rjm
	2co6hZ0zLJGUMVORfF+I7jWJbnFbLVXTAqm6VnkFqMrOE42R1JiWDaDKzi1+zwKuBTe2zUe6iOL
	+Q7cO2RAKpBknkaqJmGux7EG1DCY/AsOq++7t/W4DPw2O7pHV5+iVBp6etuwhk/P9fYjpmKKF/G
	2DA02yzYbDzt/JUgZH1XBKJerYHmLAjheO6SKGzHuB0bNDmSMkWLXDGiNjcDK6E5q3XNxklPwEj
	nSFD9QwF0oBZ+B8ZBbCEfn21oPLZFdH0AxIIA9jzShEptjlbf3k3v5NErH/HwINDIObJMhnWfKD
	7CJsP4FhClXAlOlgrAEqImgoFXRqpQJ+0lOEw3ovKXtXRjXfHP0HhfjlpSrBie/tJ9Ik+TXQ/qB
	c1LPnmT4mFnQL/QEDRJlyvpPpD57LesV3s0w1bfg==
X-Received: by 2002:a05:6a00:6c8d:b0:842:47f7:5f1 with SMTP id d2e1a72fcca58-8429b73c68cmr3210028b3a.28.1780585319505;
        Thu, 04 Jun 2026 08:01:59 -0700 (PDT)
From: Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>,
	Niklas Schnelle <schnelle@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Alex Williamson <alex@shazbot.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Kevin Tian <kevin.tian@intel.com>,
	Ankit Agrawal <ankita@nvidia.com>,
	Leon Romanovsky <leon@kernel.org>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Keith Busch <kbusch@kernel.org>,
	Alexander Duyck <alexanderduyck@fb.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Dimitri Daskalakis <daskald@meta.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	kvm@vger.kernel.org,
	xen-devel@lists.xenproject.org
Subject: [RFC 03/12] PCI: Convert pci.h to pci_is_sriov_* helpers
Date: Thu,  4 Jun 2026 08:01:44 -0700
Message-ID: <20260604150153.3619662-4-dimitri.daskalakis1@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260604150153.3619662-1-dimitri.daskalakis1@gmail.com>
References: <20260604150153.3619662-1-dimitri.daskalakis1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1780585323-23979C48-32A9187A/0/0
X-purgate-type: clean
X-purgate-size: 740

From: Dimitri Daskalakis <daskald@meta.com>

No functional changes.

Assisted-by: Claude:claude-opus-4.7
Signed-off-by: Dimitri Daskalakis <daskald@meta.com>
---
 drivers/pci/pci.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 4a14f88e543a..73b913bcb87a 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -954,7 +954,7 @@ void pci_iov_resource_set_size(struct pci_dev *dev, int resno, int size);
 bool pci_iov_is_memory_decoding_enabled(struct pci_dev *dev);
 static inline u16 pci_iov_vf_rebar_cap(struct pci_dev *dev)
 {
-	if (!dev->is_physfn)
+	if (!pci_is_sriov_physfn(dev))
 		return 0;
 
 	return dev->sriov->vf_rebar_cap;
-- 
2.52.0


