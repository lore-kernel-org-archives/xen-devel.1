Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2409C44508
	for <xen-devel@archiver.kernel.org>; Wed, 15 Jul 2026 04:55:11 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1362657.1614422 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjrdr-00060L-IJ; Wed, 15 Jul 2026 04:54:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1362657.1614422; Wed, 15 Jul 2026 04:54:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjrdr-00060E-FI; Wed, 15 Jul 2026 04:54:43 +0000
Received: by outflank-mailman (input) for mailman id 1362657;
 Wed, 15 Jul 2026 04:54:41 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <lukas@wunner.de>) id 1wjrdp-0005zp-H0
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2026 04:54:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wjrdn-00DMfH-Ed
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2026 06:54:39 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <lukas@wunner.de>)
 id 6a57127f-bab6-0a2a0a5309dd-0a2a4504b740-46
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jul 2026 06:54:39 +0200
Received: from [83.223.78.233] (helo=mailout2.hostsharing.net)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <lukas@wunner.de>)
 id 6a57128f-b57f-0a2a45040019-53df4ee9d997-3
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jul 2026 06:54:39 +0200
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature ECDSA (secp384r1) server-digest SHA384
 client-signature ECDSA (secp384r1) client-digest SHA384)
 (Client CN "*.hostsharing.net",
 Issuer "GlobalSign GCC R6 AlphaSSL CA 2025" (verified OK))
 by mailout2.hostsharing.net (Postfix) with ESMTPS id B5F3510630;
 Wed, 15 Jul 2026 06:54:38 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
 id 960BB603411E; Wed, 15 Jul 2026 06:54:38 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; none
Date: Wed, 15 Jul 2026 06:54:38 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Maurice Hieronymus <mhi@mailbox.org>
Cc: Edward Cree <ecree.xilinx@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Justin Tee <justin.tee@broadcom.com>,
	Paul Ely <paul.ely@broadcom.com>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>,
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org,
	netdev@vger.kernel.org, linux-net-drivers@amd.com,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-scsi@vger.kernel.org, xen-devel@lists.xenproject.org,
	linux-edac@vger.kernel.org
Subject: Re: [PATCH v2] PCI: Move pci_dev->is_busmaster into priv_flags
Message-ID: <alcSjoypegNolW48@wunner.de>
References: <20260714-pci-dev-flags-v2-1-a1d7dc441cf3@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714-pci-dev-flags-v2-1-a1d7dc441cf3@mailbox.org>
X-purgate-ID: tlsNG-ebf023/1784091279-C08D9B50-82F6E0CE/0/0
X-purgate-type: clean
X-purgate-size: 1520

On Tue, Jul 14, 2026 at 09:37:07PM +0200, Maurice Hieronymus wrote:
> +++ b/include/linux/pci.h
> @@ -1446,6 +1445,8 @@ void pci_disable_device(struct pci_dev *dev);
>  extern unsigned int pcibios_max_latency;
>  void pci_set_master(struct pci_dev *dev);
>  void pci_clear_master(struct pci_dev *dev);
> +bool pci_dev_is_busmaster(const struct pci_dev *pdev);
> +void pci_dev_assign_busmaster(struct pci_dev *pdev, bool busmaster);

pci_dev_assign_busmaster() should not have public visibility.
Drivers should really use pci_set_master() / pci_clear_master()
and nothing else.

It seems Xen is the only one in the tree which needs this:

> +++ b/drivers/xen/xen-pciback/pciback_ops.c
> @@ -125,14 +125,14 @@ void xen_pcibk_reset_device(struct pci_dev *dev)
>  		if (pci_is_enabled(dev))
>  			pci_disable_device(dev);
>  
> -		dev->is_busmaster = 0;
> +		pci_dev_assign_busmaster(dev, false);
>  	} else {
>  		pci_read_config_word(dev, PCI_COMMAND, &cmd);
>  		if (cmd & (PCI_COMMAND_INVALIDATE)) {
>  			cmd &= ~(PCI_COMMAND_INVALIDATE);
>  			pci_write_config_word(dev, PCI_COMMAND, cmd);
>  
> -			dev->is_busmaster = 0;
> +			pci_dev_assign_busmaster(dev, false);
>  		}
>  	}
>  }

Please change these direct assignments to pci_clear_master(),
preferably in a separate patch to ease bisecting if anything
breaks.

Then you don't need pci_dev_assign_busmaster() and can just inline
setting/clearing the bit in __pci_set_master() and pci_disable_device().

Thanks,

Lukas

