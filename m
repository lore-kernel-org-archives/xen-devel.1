Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DCADC531F8
	for <xen-devel@archiver.kernel.org>; Thu, 23 Jul 2026 16:17:09 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1369376.1618174 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wmw6O-0004v3-JC; Thu, 23 Jul 2026 16:16:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1369376.1618174; Thu, 23 Jul 2026 16:16:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wmw6O-0004uw-FY; Thu, 23 Jul 2026 16:16:52 +0000
Received: by outflank-mailman (input) for mailman id 1369376;
 Thu, 23 Jul 2026 16:16:50 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <mhi@mailbox.org>) id 1wmw6M-0004uq-I0
 for xen-devel@lists.xenproject.org; Thu, 23 Jul 2026 16:16:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wmw6L-009RZD-Uy
 for xen-devel@lists.xenproject.org; Thu, 23 Jul 2026 18:16:49 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <mhi@mailbox.org>)
 id 6a623e4e-2eae-0a2a0a5409dd-0a2a4504bde2-40
 for <xen-devel@lists.xenproject.org>; Thu, 23 Jul 2026 18:16:49 +0200
Received: from [80.241.56.171] (helo=mout-p-201.mailbox.org)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <mhi@mailbox.org>)
 id 6a623e71-b57f-0a2a45040019-50f138aba4ba-3
 for <xen-devel@lists.xenproject.org>; Thu, 23 Jul 2026 18:16:49 +0200
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4h5bq51Zz1zMlHw;
 Thu, 23 Jul 2026 18:16:49 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=mail20150812 header.d=mailbox.org header.i="@mailbox.org" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Transfer-Encoding"; dkim=pass header.s=mail20150812 header.d=mailbox.org header.i="@mailbox.org" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Transfer-Encoding"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1784823409;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Hpw7/UiaEy7PeKqIr+HqArMRpKTyyhCU3DTRMYChspM=;
	b=enrvpsoHV2fwfi8PAeSlnyPI2M4zF5L1oArbDBB3ev/thZA2ejiQOLxBzqINvPcpuLA/1T
	P6+O5MsfXZngLbEODCp0+Ya1+i0TwzPth8lVJqYTqjzUJ2BsGWpHG4mM5YJmBJvcbX48Rn
	zDkEKz5jvQVUu+UyTKUqrE++gfKyEoHsv9VioVo0B6VV1AkKjEPB2ljKpVw46F+D3/L+Yv
	+UP4qA1orGY5fS3lrsW7Sd8Dhobiz89r1meXVyYz0BfsiJtY9coI5rrhz31+xvwtbsD63w
	SnhiLdLAefduPmV4/1BAqKCPdVOKVWLaiPB5+gRPE7vMOQLfL2QN4zj9GFvz2g==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=fLXL69Jv;
	spf=pass (outgoing_mbo_mout: domain of mhi@mailbox.org designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=mhi@mailbox.org
From: Maurice Hieronymus <mhi@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1784823407;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Hpw7/UiaEy7PeKqIr+HqArMRpKTyyhCU3DTRMYChspM=;
	b=fLXL69JvAtvKZf89tnUW6yFDTqb/PzyhhI/z7epsJ2iEkUoUqJCZ+MYHldgQnUy/LlpkV+
	PQtpzC1PdJdJtP9iOCtOasbbRpjrF03GwJxrPBMf5Q5pIk3drTcEgWE8Lw+g3GvFx5TKod
	NuFfzft9i+tWFCcoIelJjosmqR79my0jWl/WIypMKNxqYtwcp/a/aAdV2jUqbFS+Tz7f9L
	T7+MN35LQZyTcYYksRtv/hXQquISleqq7fQ+fl3caWOCiszPMPwLBFb0MkGGVmJBJlfypB
	cz1b83sNJaEZGStZJy0UQ0qv70QlIA9tW1HaJH59pZBjWQUdAYwhVhl/nKoucg==
To: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	xen-devel@lists.xenproject.org
Cc: Maurice Hieronymus <mhi@mailbox.org>,
	Lukas Wunner <lukas@wunner.de>,
	Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: xen-pciback: would using pci_clear_master() in xen_pcibk_reset_device() break anything?
Date: Thu, 23 Jul 2026 18:16:33 +0200
Message-ID: <20260723161638.9838-1-mhi@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: fq69reqpoifnzd9qh68e46ix5sr3j1bp
X-MBO-RS-ID: 06c168c9acfd683c511
X-Rspamd-Queue-Id: 4h5bq51Zz1zMlHw
X-purgate-ID: tlsNG-ebf023/1784823409-C10DDB50-80CA668D/0/0
X-purgate-type: clean
X-purgate-size: 1767

Hi,

I am moving `is_busmaster` out of the C bitfield in `struct pci_dev` [1],
because the bits sharing that word are written without a common lock.
xen-pciback is the only code outside drivers/pci that writes the flag,
in `xen_pcibk_reset_device()`:

	if (dev->hdr_type == PCI_HEADER_TYPE_NORMAL) {
		...
		if (pci_is_enabled(dev))
			pci_disable_device(dev);

		dev->is_busmaster = 0;
	} else {
		pci_read_config_word(dev, PCI_COMMAND, &cmd);
		if (cmd & (PCI_COMMAND_INVALIDATE)) {
			cmd &= ~(PCI_COMMAND_INVALIDATE);
			pci_write_config_word(dev, PCI_COMMAND, cmd);

			dev->is_busmaster = 0;
		}
	}

Lukas Wunner suggested converting both assignments to `pci_clear_master()`,
so that nothing outside drivers/pci writes the flag [2]. That is not
behavior-preserving: the assignments clear the software flag only, while
`pci_clear_master()` also clears `PCI_COMMAND_MASTER` in config space (it
skips the write only if the bit is already clear).

I do not know xen-pciback, so I cannot tell whether that difference
matters. One thing makes me suspicious: commit 7681f31ec9cd ("xen/pciback:
Don't disable PCI_COMMAND on PCI device reset.") deliberately removed a
`pci_write_config_word(dev, PCI_COMMAND, 0)` from directly above the first
assignment, and `pci_clear_master()` would put a `PCI_COMMAND` write back
at that exact spot.

So my question is simply: would converting these two assignments to
`pci_clear_master()` break anything?

If it would, I will keep xen-pciback's current semantics and export a
narrow flag-only helper instead.

[1] https://lore.kernel.org/linux-pci/20260714-pci-dev-flags-v2-1-a1d7dc441cf3@mailbox.org/
[2] https://lore.kernel.org/linux-pci/alcSjoypegNolW48@wunner.de/

Best,

Maurice

