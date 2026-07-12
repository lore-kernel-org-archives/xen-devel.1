Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E907C44501
	for <xen-devel@archiver.kernel.org>; Sun, 12 Jul 2026 14:28:43 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1361119.1613595 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wivAN-0005gn-2g; Sun, 12 Jul 2026 14:28:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1361119.1613595; Sun, 12 Jul 2026 14:28:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wivAM-0005gg-WD; Sun, 12 Jul 2026 14:28:23 +0000
Received: by outflank-mailman (input) for mailman id 1361119;
 Sun, 12 Jul 2026 14:28:22 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <lukas@wunner.de>) id 1wivAM-0005ga-21
 for xen-devel@lists.xenproject.org; Sun, 12 Jul 2026 14:28:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wivAJ-005TpH-Ib
 for xen-devel@lists.xenproject.org; Sun, 12 Jul 2026 16:28:19 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <lukas@wunner.de>)
 id 6a53a3fa-e002-0a2a0a5209dd-0a2a4508ab3c-18
 for <xen-devel@lists.xenproject.org>; Sun, 12 Jul 2026 16:28:19 +0200
Received: from [83.223.78.233] (helo=mailout2.hostsharing.net)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <lukas@wunner.de>)
 id 6a53a483-ee29-0a2a45080019-53df4ee99c7d-3
 for <xen-devel@lists.xenproject.org>; Sun, 12 Jul 2026 16:28:19 +0200
Received: from h08.hostsharing.net (h08.hostsharing.net
 [IPv6:2a01:37:1000::53df:5f1c:0])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature ECDSA (secp384r1) server-digest SHA384
 client-signature ECDSA (secp384r1) client-digest SHA384)
 (Client CN "*.hostsharing.net",
 Issuer "GlobalSign GCC R6 AlphaSSL CA 2025" (verified OK))
 by mailout2.hostsharing.net (Postfix) with ESMTPS id DD65710632;
 Sun, 12 Jul 2026 16:28:18 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
 id CA35D60211BE; Sun, 12 Jul 2026 16:28:18 +0200 (CEST)
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
Date: Sun, 12 Jul 2026 16:28:18 +0200
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
Subject: Re: [PATCH 1/2] PCI: Replace pci_dev->is_busmaster with accessors
Message-ID: <alOkgrK7Fm6opB4r@wunner.de>
References: <20260711-pci-dev-flags-v1-0-2fcf2811138c@mailbox.org>
 <20260711-pci-dev-flags-v1-1-2fcf2811138c@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260711-pci-dev-flags-v1-1-2fcf2811138c@mailbox.org>
X-purgate-ID: tlsNG-c1860d/1783866499-1177701C-C8FA5210/0/0
X-purgate-type: clean
X-purgate-size: 1056

On Sat, Jul 11, 2026 at 05:21:06PM +0200, Maurice Hieronymus wrote:
> `is_busmaster` is one bit of a ~60-bit C bitfield in `struct pci_dev`.
> Bits sharing a bitfield word must not be modified concurrently, but its
> writers take no common lock: `pci_set_master()` can run without the
> device lock (e.g. from runtime PM resume paths), `pci_disable_device()`
> clears the bit, and other bits in the same word are written from
> entirely different contexts, e.g. `broken_parity_status` from sysfs.
> Concurrent read-modify-write cycles of the shared word can then lose
> updates.
> 
> Move `is_busmaster` into a new `flags` bitmap modified with atomic
> bitops and accessed through generated accessor functions, following the
> example of commit a7cc262a1135 ("driver core: Replace dev->offline +
> ->offline_disabled with accessors"). More bitfield flags can follow the
> same pattern later.

We already have the priv_flags member in struct pci_dev,
please use that instead of adding another one for the same purpose.

Thanks,

Lukas

