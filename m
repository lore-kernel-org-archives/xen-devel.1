Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C827C4451C
	for <xen-devel@archiver.kernel.org>; Sat, 18 Jul 2026 17:03:39 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1365665.1615929 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wl8RO-0004dy-1Q; Sat, 18 Jul 2026 17:03:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1365665.1615929; Sat, 18 Jul 2026 17:03:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wl8RN-0004dr-Uo; Sat, 18 Jul 2026 17:03:05 +0000
Received: by outflank-mailman (input) for mailman id 1365665;
 Sat, 18 Jul 2026 17:03:05 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <mhi@mailbox.org>) id 1wl8RM-0004dl-Uj
 for xen-devel@lists.xenproject.org; Sat, 18 Jul 2026 17:03:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wl8RM-002R0A-BK
 for xen-devel@lists.xenproject.org; Sat, 18 Jul 2026 19:03:04 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <mhi@mailbox.org>)
 id 6a5bb176-2eae-0a2a0a5409dd-0a2a4504d31e-28
 for <xen-devel@lists.xenproject.org>; Sat, 18 Jul 2026 19:03:04 +0200
Received: from [80.241.56.172] (helo=mout-p-202.mailbox.org)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <mhi@mailbox.org>)
 id 6a5bb1c7-b57f-0a2a45040019-50f138acc6b4-3
 for <xen-devel@lists.xenproject.org>; Sat, 18 Jul 2026 19:03:04 +0200
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4h2Y4l0wzyzMlGr;
 Sat, 18 Jul 2026 19:03:03 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=mail20150812 header.d=mailbox.org header.i="@mailbox.org" header.h="From:Subject:Date:Message-Id:To:Cc:Mime-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References"; dkim=pass header.s=mail20150812 header.d=mailbox.org header.i="@mailbox.org" header.h="From:Subject:Date:Message-Id:To:Cc:Mime-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1784394183;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Tzj3jkroeJ9qDDBuoFNN5o4ycSfZDKYPcOED/sOa+Lg=;
	b=aln+E3eaDYlrKxaSGm+3XSpYABwLi/lqLzy3Oq/jtOJc9K9Tps6sA48suz7viwG90Zg3Ni
	wqIG+itekNyrfXz+41zykPa4OlzUiIMP3Npkm6+tgr1j6s6Sxj803Pdj+bnrql4LPbTQxi
	j0b0WlVgCzzGEvrRwF6madkNIREjjEKRnzxRGRpu+OKHzuTSRdc2CnLuSKHZm+wo4nVHx6
	mLCmRhYh4q4Mww2gNWrDfXw4IsWJ3r3CW3CCZznwIOeywKFWB6Lks+KbtiNdGHrOkQtdS7
	uaedeQLxKm1WOhJQ4vatK2OWGOtpjlO74CcbJZkQJNAyNWwcvnWj9HYp1wgVow==
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1784394181;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Tzj3jkroeJ9qDDBuoFNN5o4ycSfZDKYPcOED/sOa+Lg=;
	b=P1KW0RuF0ntpYj4ZoBCfrMOhMBGzPbYCgUpbaeL1Wn4ib5OzTkiDIDo/p1j3QOU65c+DDl
	iGMhUQy3cTkjNWLuo8iKKT+ZDJE18EYX6SW4ZfihB/7x4xi4VC1spxl05O2kzzblBhd/dv
	kr9sOGx1z2CWIVp/sJMv9IwerysVsW4iinlWh5DvbHiAVPaGkBbHD2ykdKkt9aALllUIDw
	z7S08aSpusUPHeXVQs+zO4vrPaCLygYoUdJ/h6sMHdUvGQn9ruWFdq6gqC06sIV3tpyHsR
	aCIiCttc5Xl16k2AInJyP5fXCPElESzBdgxGOLmlwEhCov3FuZ3RRDBae0IUAA==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 18 Jul 2026 19:02:51 +0200
Message-Id: <DK1UXXRGW737.2IVTYCHPRM9ET@mailbox.org>
Cc: "Edward Cree" <ecree.xilinx@gmail.com>, "Andrew Lunn"
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, "Eric
 Dumazet" <edumazet@google.com>, "Jakub Kicinski" <kuba@kernel.org>, "Paolo
 Abeni" <pabeni@redhat.com>, "Bjorn Helgaas" <bhelgaas@google.com>, "Justin
 Tee" <justin.tee@broadcom.com>, "Paul Ely" <paul.ely@broadcom.com>, "James
 E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, "Martin K.
 Petersen" <martin.petersen@oracle.com>, "Juergen Gross" <jgross@suse.com>,
 "Stefano Stabellini" <sstabellini@kernel.org>, "Oleksandr Tyshchenko"
 <oleksandr_tyshchenko@epam.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Tamir Duberstein"
 <tamird@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, "Borislav Petkov"
 <bp@alien8.de>, "Tony Luck" <tony.luck@intel.com>, "Danilo Krummrich"
 <dakr@kernel.org>, <rust-for-linux@vger.kernel.org>,
 <netdev@vger.kernel.org>, <linux-net-drivers@amd.com>,
 <linux-kernel@vger.kernel.org>, <linux-pci@vger.kernel.org>,
 <linux-scsi@vger.kernel.org>, <xen-devel@lists.xenproject.org>,
 <linux-edac@vger.kernel.org>
Subject: Re: [PATCH v2] PCI: Move pci_dev->is_busmaster into priv_flags
From: "Maurice Hieronymus" <mhi@mailbox.org>
To: "Lukas Wunner" <lukas@wunner.de>, "Maurice Hieronymus" <mhi@mailbox.org>
References: <20260714-pci-dev-flags-v2-1-a1d7dc441cf3@mailbox.org>
 <alcSjoypegNolW48@wunner.de>
In-Reply-To: <alcSjoypegNolW48@wunner.de>
X-MBO-RS-ID: b5973a326c905eef11a
X-MBO-RS-META: ac7hnh6jjxdgumx33umeygikqfdzbxu6
X-purgate-ID: tlsNG-ebf023/1784394184-502E4B50-5CB2EE2E/0/0
X-purgate-type: clean
X-purgate-size: 1571

On Wed Jul 15, 2026 at 6:54 AM CEST, Lukas Wunner wrote:

> pci_dev_assign_busmaster() should not have public visibility.
> Drivers should really use pci_set_master() / pci_clear_master()
> and nothing else.
>
> It seems Xen is the only one in the tree which needs this:
>
>> +++ b/drivers/xen/xen-pciback/pciback_ops.c
>> @@ -125,14 +125,14 @@ void xen_pcibk_reset_device(struct pci_dev *dev)
>>  		if (pci_is_enabled(dev))
>>  			pci_disable_device(dev);
>> =20
>> -		dev->is_busmaster =3D 0;
>> +		pci_dev_assign_busmaster(dev, false);
>>  	} else {
>>  		pci_read_config_word(dev, PCI_COMMAND, &cmd);
>>  		if (cmd & (PCI_COMMAND_INVALIDATE)) {
>>  			cmd &=3D ~(PCI_COMMAND_INVALIDATE);
>>  			pci_write_config_word(dev, PCI_COMMAND, cmd);
>> =20
>> -			dev->is_busmaster =3D 0;
>> +			pci_dev_assign_busmaster(dev, false);
>>  		}
>>  	}
>>  }
>
> Please change these direct assignments to pci_clear_master(),
> preferably in a separate patch to ease bisecting if anything
> breaks.
This conversion does not preserve behavior. The direct assignments
clear only the software flag, while pci_clear_master() also clears
PCI_COMMAND_MASTER in config space.

I am not an expert on xen devices. That's why I want to clarify first
that this does not break anything. Especially since commit
7681f31ec9cd ("xen/pciback: Don't disable PCI_COMMAND on PCI device
reset.") deliberately removed the PCI_COMMAND write right above the
first assignment, and pci_clear_master() would reintroduce a
PCI_COMMAND write there.

Best,

Maurice

