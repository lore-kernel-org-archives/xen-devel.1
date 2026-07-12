Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D06DC43458
	for <xen-devel@archiver.kernel.org>; Sun, 12 Jul 2026 14:55:52 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1361137.1613605 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wivag-00016D-14; Sun, 12 Jul 2026 14:55:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1361137.1613605; Sun, 12 Jul 2026 14:55:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wivaf-000166-UU; Sun, 12 Jul 2026 14:55:33 +0000
Received: by outflank-mailman (input) for mailman id 1361137;
 Sun, 12 Jul 2026 14:55:32 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <lukas@wunner.de>) id 1wivae-000160-8F
 for xen-devel@lists.xenproject.org; Sun, 12 Jul 2026 14:55:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wivad-00B7hG-LW
 for xen-devel@lists.xenproject.org; Sun, 12 Jul 2026 16:55:31 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <lukas@wunner.de>)
 id 6a53aa97-2eae-0a2a0a5409dd-0a2a4508b060-10
 for <xen-devel@lists.xenproject.org>; Sun, 12 Jul 2026 16:55:31 +0200
Received: from [83.223.78.233] (helo=mailout2.hostsharing.net)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <lukas@wunner.de>)
 id 6a53aae3-ee29-0a2a45080019-53df4ee98ccb-3
 for <xen-devel@lists.xenproject.org>; Sun, 12 Jul 2026 16:55:31 +0200
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature ECDSA (secp384r1) server-digest SHA384
 client-signature ECDSA (secp384r1) client-digest SHA384)
 (Client CN "*.hostsharing.net",
 Issuer "GlobalSign GCC R6 AlphaSSL CA 2025" (verified OK))
 by mailout2.hostsharing.net (Postfix) with ESMTPS id 26AD310632;
 Sun, 12 Jul 2026 16:55:31 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
 id 032786022F08; Sun, 12 Jul 2026 16:55:30 +0200 (CEST)
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
Date: Sun, 12 Jul 2026 16:55:30 +0200
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
Subject: Re: [PATCH 2/2] PCI: Replace pci_dev->broken_parity_status with
 accessors
Message-ID: <alOq4rsjATipBjY9@wunner.de>
References: <20260711-pci-dev-flags-v1-0-2fcf2811138c@mailbox.org>
 <20260711-pci-dev-flags-v1-2-2fcf2811138c@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260711-pci-dev-flags-v1-2-2fcf2811138c@mailbox.org>
X-purgate-ID: tlsNG-c1860d/1783868131-7963301C-0AF12E1D/0/0
X-purgate-type: clean
X-purgate-size: 1898

On Sat, Jul 11, 2026 at 05:21:07PM +0200, Maurice Hieronymus wrote:
> `broken_parity_status` shares a C bitfield word in `struct pci_dev`
> with many other bits. `broken_parity_status_store()` writes it from
> sysfs at any time without taking any lock, so userspace can make it
> race with every other writer of the same word, e.g. `pci_set_master()`
> from a runtime PM resume path, and updates of neighboring bits can be
> lost.

For static bits in struct pci_dev, i.e. ones that are mostly read
and almost never written, and in particular ones that are only
written on device enumeration, it's perfectly fine and more convenient
to keep them as bitfields.  broken_parity_status seems to fit that bill.

For other bits which are modified more frequently, move them to the existing
priv_flags member if you believe they can be updated concurrently.
I'm not sure is_busmaster fits that bill, it isn't updated that often.

Quite honestly I'm wondering if there is anything to fix here.
Yes I get it, userspace may interfere with adjacent bits.
But broken_parity_status is only used for certain broken devices
on EDAC-capable platforms.  That's a fringe use case.
Is it really worth refactoring this?

Perhaps a better approach is to enclose dev_attr_broken_parity_status.attr
in "#ifdef CONFIG_EDAC" so that the attribute isn't shown unless it's used.

We shouldn't have used a sysfs attribute for this in the first place
but rather a quirk.  Unfortunately 6b09ff9d7879 does not betray for which
device this was needed, so it's difficult to convert it to a quirk now.

Bjorn introduced a pci_disable_parity() API in 2021 which is used in a
quirk for certain Mellanox products:

https://lore.kernel.org/all/20210330174318.1289680-1-helgaas@kernel.org/

Perhaps we can deprecate the sysfs attribute in favor of using quirks
for broken devices?

Thanks,

Lukas

