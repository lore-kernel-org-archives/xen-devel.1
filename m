Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1A51606A31B
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 10:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HU9Ky5gg
Received: from list by lists.xenproject.org with outflank-mailman.1474392.1681527 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOui4-0007oS-4Z; Thu, 05 Nov 2026 10:28:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1474392.1681527; Thu, 05 Nov 2026 10:28:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOui4-0007oL-0e; Thu, 05 Nov 2026 10:28:44 +0000
Received: by outflank-mailman (input) for mailman id 1474392;
 Thu, 05 Nov 2026 10:28:43 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <berrange@redhat.com>) id 1xOui3-0007oF-7V
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 10:28:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOui2-00HQP8-KH
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 11:28:42 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <berrange@redhat.com>)
 id 6aec5a55-2eae-0a2a0a5409dd-0a2a450b86ec-26
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 11:28:42 +0100
Received: from [170.10.129.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <berrange@redhat.com>)
 id 6aec5a59-b7e8-0a2a450b0019-aa0a817cb309-3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 11:28:42 +0100
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-623-F6ZWGNpJMw-Pg2F3xWgSYQ-1; Thu,
 05 Nov 2026 05:28:35 -0500
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id CCE78180120C; Thu,  5 Nov 2026 10:28:28 +0000 (UTC)
Received: from redhat.com (headnet04.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.116])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id B120019AC074; Thu,  5 Nov 2026 10:28:18 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=mimecast20190719 header.d=redhat.com header.i="@redhat.com" header.h="From:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793874521;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=beoCTXwXgtPga18h8hkf+gkXIHVW2MJu8A4Vg/XMQo4=;
	b=HU9Ky5ggLARTz+4j/k2KEOLPKVkIlW11F00ioNz+wXHJpNtXbcoB2XlwNdQ5I0IoMqbOVf
	uGrgJMi1u2zKnBygnAcsVT1IzbEKR5NDB+8I+3307Z0dXK/+DRBHBx0YcT/zRPT6CNknh0
	GMid6m+zfmfbgzwyu4k1VOy2JRS9ElA=
X-MC-Unique: F6ZWGNpJMw-Pg2F3xWgSYQ-1
X-Mimecast-MFC-AGG-ID: F6ZWGNpJMw-Pg2F3xWgSYQ_1793874510
Date: Thu, 5 Nov 2026 10:28:15 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Cc: Yonggang Luo <luoyonggang@gmail.com>,
	BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
	Anthony PERARD <anthony@xenproject.org>,
	Felipe Balbi <balbi@kernel.org>,
	Aleksandar Rikalo <arikalo@gmail.com>,
	Philippe Mathieu-Daude <philmd@mailo.com>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	=?utf-8?B?SGVydsOp?= Poussineau <hpoussin@reactos.org>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Niek Linnenbank <nieklinnenbank@gmail.com>,
	xen-devel@lists.xenproject.org, qemu-riscv@nongnu.org,
	Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-ppc@nongnu.org,
	Alexandre Iooss <erdnaxe@crans.org>,
	Weiwei Li <liwei1518@gmail.com>, Zhao Liu <zhao1.liu@intel.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
	Thomas Huth <th.huth+qemu@posteo.eu>,
	=?utf-8?Q?Cl=C3=A9ment?= Chigot <chigot@adacore.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Yoshinori Sato <yoshinori.sato@nifty.com>,
	Frederic Konrad <konrad.frederic@yahoo.fr>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Chao Liu <chao.liu@processmission.com>,
	Sai Pavan Boddu <sai.pavan.boddu@amd.com>,
	Alistair Francis <alistair@alistair23.me>,
	Huacai Chen <chenhuacai@kernel.org>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Gaurav Sharma <gaurav.sharma_7@nxp.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Alistair Francis <alistair.francis@wdc.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>, qemu-arm@nongnu.org
Subject: Re: [PATCH 00/15] hw: expand DEFINE_MACHINE to explicit TypeInfo
 registration
Message-ID: <auxaPyRRm3MTBz1f@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20261030151539.1872-1-luoyonggang@gmail.com>
 <d1db54c6-b802-676a-7779-0c2c63f5f807@eik.bme.hu>
 <aa70e94c-d9a8-41c9-850f-7ded87f7f327@oss.qualcomm.com>
 <aumYOBw-nKQAWdYK@redhat.com>
 <CAE2XoE8Xwevk523OfB+GgwbRu0iVnyD4VNOx81rj7J7F5aq=OA@mail.gmail.com>
 <54851326-3627-2b86-57d6-c338ed4e4b50@eik.bme.hu>
 <CAE2XoE_P2mZAT8wZwzFsTqJTK8nxNSSqJRrOM2T-AJkQjwJHBw@mail.gmail.com>
 <aunnuwhsx9ZOOXBX@redhat.com>
 <45433754-3cea-41fc-9f45-65a328d0efca@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <45433754-3cea-41fc-9f45-65a328d0efca@oss.qualcomm.com>
User-Agent: Mutt/2.4.3 (2026-10-09)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-MFC-PROC-ID: ZIiY6djJNnBH7eNc4lekrcUQLCh2s6JZ3Hwp7ax609k_1793874510
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1793874522-184CB9EA-1A33C7E2/35/111497
X-purgate-type: clean
X-purgate-size: 1736
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 05, 2026 at 12:27:18AM -0800, Pierrick Bouvier wrote:
> On 11/3/2026 5:55 AM, Daniel P. Berrangé wrote:
> > On Tue, Nov 03, 2026 at 09:48:44PM +0800, Yonggang Luo wrote:
> >> On Tue, Nov 3, 2026 at 9:23 PM BALATON Zoltan <balaton@eik.bme.hu> wrote:
> >>>
> >>> On Tue, 3 Nov 2026, Yonggang Luo wrote:
> >>> That means exposing all the boiler plate for all machines other than the
> >>> simplest case. I think it would be better to keep DEFINE_MACHINE_EXTENDED
> >>> but maybe rethink the existing wrappers and drop unused ones and maybe add
> >>> new ones that reduce the usage of DEFINE_MACHINE_EXTENDED but still keep
> >>> the boiler plate hidden.
> >>
> >> Thanks, I'll go this way, remove unused macros, and keep DEFINE_MACHINE_EXTENDED
> >> and extend both DEFINE_MACHINE_EXTENDED DEFINE_MACHINE supports
> >> "targets" or "arch_mask" parameter.
> > 
> > Given that we don't need to do general per-arch type filtering in
> > QOM, we could just move 'is_available' out of TypeInfo, and into the
> > MachineClass, so it is a regular class level property, which can be
> > set in the class_init methods, and thus avoid any changes to the
> > DEFINE_MACHINE macros.
> >
> 
> Some cpus need it also, and it's used for filtering purpose at this time
> (to avoid duplication at registration). We already depend on this behavior.

Can you give me more info on the problem with the CPUs ? What cases
have duplicate class names with CPUs ?

With regards,
Daniel
-- 
|: https://berrange.com       ~~        https://hachyderm.io/@berrange :|
|: https://libvirt.org          ~~          https://entangle-photo.org :|
|: https://pixelfed.art/berrange   ~~    https://fstop138.berrange.com :|


