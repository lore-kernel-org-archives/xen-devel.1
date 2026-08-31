Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B144FC61DFD
	for <xen-devel@archiver.kernel.org>; Mon, 31 Aug 2026 08:34:31 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1403827.1637788 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x0xT1-00038E-5p; Mon, 31 Aug 2026 08:34:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1403827.1637788; Mon, 31 Aug 2026 08:34:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x0xT1-000387-31; Mon, 31 Aug 2026 08:34:11 +0000
Received: by outflank-mailman (input) for mailman id 1403827;
 Mon, 31 Aug 2026 08:34:10 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <BATV+f7a82f6f9b31f2816fe4+8408+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1x0xSz-00037z-5z
 for xen-devel@lists.xenproject.org; Mon, 31 Aug 2026 08:34:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x0xSv-00EAuR-25; Mon, 31 Aug 2026 10:34:06 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <BATV+f7a82f6f9b31f2816fe4+8408+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 6a953c72-8faa-0a2a0a5109dd-0a2a450885c6-38
 for <multiple-recipients>; Mon, 31 Aug 2026 10:34:04 +0200
Received: from [90.155.92.199] (helo=desiato.infradead.org)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <BATV+f7a82f6f9b31f2816fe4+8408+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 6a953c7b-f659-0a2a45080019-5a9b5cc7e4d2-3
 for <multiple-recipients>; Mon, 31 Aug 2026 10:34:03 +0200
Received: from [172.31.31.139] (helo=ehlo.thunderbird.net)
 by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
 id 1x0xSh-00000009fo0-2qMu; Mon, 31 Aug 2026 08:33:52 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=desiato.20200630 header.d=infradead.org header.i="@infradead.org" header.h="Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:From:Date"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=fwFFIqVPng0FWB2Lx9Y4U6/a8WISTMZbjmkj3/3M/bo=; b=D/LoRkGMPMWcvC1tfmgmSsxHUl
	7+eV1p2HvRNRdog29xhoCX7RSM0cYJ5dF6PraNmaZLyZMdgd4smlIoIL/E6YzjQ3J39wCCZOvyiGT
	pRHdlI8nCo09EGRj1Gty75vHN+hi3KlZ1dx3HTH/foJ6VhuobFEDTCM+dC/1+YHrVCCPGxou8rArY
	MqQ2Ue1bcIFA9JVdYN8XbUQHdxSBP/IGneOOOG8g9wLBg12IT5/WABmh8QEZiN4cJNY5niz3jnIdV
	VbB8NtU70JEm6auQoiI4RI7f6zcjlvW6f89YBpox+mKTaaUc8Cw5P3yL5RVOFUCJFY+yZz8x732Px
	VGcWnh5g==;
Date: Mon, 31 Aug 2026 09:33:52 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: =?UTF-8?B?RnVya2FuIMOHYWzEscWfa2Fu?= <frn1furkan10@gmail.com>,
 linux-kernel@vger.kernel.org
CC: kvm@vger.kernel.org, x86@kernel.org, seanjc@google.com, pbonzini@redhat.com,
 tglx@kernel.org, mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
 hpa@zytor.com, paul@xen.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] KVM: x86/xen: Convert evtchn_ports from IDR to XArray
User-Agent: K-9 Mail for Android
In-Reply-To: <85c66385-7a28-4779-96d4-6b34f53b5994@gmail.com>
References: <20260706081311.13633-1-frn1furkan10@gmail.com> <efe39d24a2621ce23f9d53471b3b587feaaa8526.camel@infradead.org> <85c66385-7a28-4779-96d4-6b34f53b5994@gmail.com>
Message-ID: <B9710C21-8127-4DC1-8DFF-D6551EE09AE5@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html
X-purgate-ID: tlsNG-c1860d/1788165244-DFCD387B-3BB7CFB6/0/0
X-purgate-type: clean
X-purgate-size: 1119

On 31 August 2026 06:59:50 BST, "Furkan =C3=87al=C4=B1=C5=9Fkan" <frn1furka=
n10@gmail=2Ecom> wrote:
>
>
>On 7/7/26 12:16, David Woodhouse wrote:
>> On Mon, 2026-07-06 at 11:13 +0300, Furkan Caliskan wrote:
>>> IDR is deprecated in favor of XArray: see
>>> Documentation/core-api/idr=2Erst=2E Convert evtchn_ports accordingly=
=2E
>>>
>>> kvm_xen_eventfd_assign()'s single-slot idr_alloc() becomes
>>> xa_insert(), since it was really an insert-at-index, not an
>>> allocation: -EBUSY replaces -ENOSPC, still mapped to -EEXIST=2E
>>>
>>> kvm_xen_hcall_evtchn_send() drops its explicit rcu_read_lock(),
>>> since xa_load() takes its own RCU read-side section internally=2E
>>> evtchnfd's lifetime is still guaranteed by kvm->srcu=2E
>>>
>>> xen_lock is left in place: it protects state beyond the map itself=2E
>>>
>>> Signed-off-by: Furkan Caliskan <frn1furkan10@gmail=2Ecom>
>>=20
>> Reviewed-by: David Woodhouse <dwmw@amazon=2Eco=2Euk>
>>=20
>> Thanks=2E
>
>Ping?

I have a pile of Xen cleanups outstanding; I'll tack it on the end of that=
 series so it doesn't get lost=2E Thanks=2E


