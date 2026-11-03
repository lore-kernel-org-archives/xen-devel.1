Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12C3D606A326
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 13:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=h4fLuo8G
Received: from list by lists.xenproject.org with outflank-mailman.1469847.1678611 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOEzD-0006vy-SV; Tue, 03 Nov 2026 13:55:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1469847.1678611; Tue, 03 Nov 2026 13:55:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOEzD-0006vr-PH; Tue, 03 Nov 2026 13:55:39 +0000
Received: by outflank-mailman (input) for mailman id 1469847;
 Tue, 03 Nov 2026 13:55:38 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <berrange@redhat.com>) id 1xOEzC-0006vf-41
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 13:55:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOEzB-006zxr-Go
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 14:55:37 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <berrange@redhat.com>)
 id 6ae9e7d0-8faa-0a2a0a5109dd-0a2a450bc31c-34
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 14:55:34 +0100
Received: from [170.10.133.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <berrange@redhat.com>)
 id 6ae9e7d5-b7e8-0a2a450b0019-aa0a857c9fbf-3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 14:55:34 +0100
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-60-FkhH78s2NBeluyaD0FvwgA-1; Tue,
 03 Nov 2026 08:55:29 -0500
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id DC4591955BC4; Tue,  3 Nov 2026 13:55:21 +0000 (UTC)
Received: from redhat.com (headnet04.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.116])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 82727195608C; Tue,  3 Nov 2026 13:55:10 +0000 (UTC)
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
	s=mimecast20190719; t=1793714132;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HkLAd4qQaoBYZVRD0j1kGkVYOIEsMDHpcx8amGDTFMA=;
	b=h4fLuo8GqIm7LMlrEK4WhlkOzhOVNtG6hKH6YcCxJioF5znXlnxIziMIko246klldJ8TKN
	Kc5eGyqObbXXdZHGCtmzX5Rm6RZ5YDzztoOzF9pfcbJZUv2SpD0Pu2BeadS7k4l6qpctRf
	P+nVd/oKBCkjpDmpxQ4o8wbtSq6KLAs=
X-MC-Unique: FkhH78s2NBeluyaD0FvwgA-1
X-Mimecast-MFC-AGG-ID: FkhH78s2NBeluyaD0FvwgA_1793714124
Date: Tue, 3 Nov 2026 13:55:07 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Yonggang Luo <luoyonggang@gmail.com>
Cc: BALATON Zoltan <balaton@eik.bme.hu>,
	Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
	qemu-devel@nongnu.org, Anthony PERARD <anthony@xenproject.org>,
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
Message-ID: <aunnuwhsx9ZOOXBX@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20261030151539.1872-1-luoyonggang@gmail.com>
 <d1db54c6-b802-676a-7779-0c2c63f5f807@eik.bme.hu>
 <aa70e94c-d9a8-41c9-850f-7ded87f7f327@oss.qualcomm.com>
 <aumYOBw-nKQAWdYK@redhat.com>
 <CAE2XoE8Xwevk523OfB+GgwbRu0iVnyD4VNOx81rj7J7F5aq=OA@mail.gmail.com>
 <54851326-3627-2b86-57d6-c338ed4e4b50@eik.bme.hu>
 <CAE2XoE_P2mZAT8wZwzFsTqJTK8nxNSSqJRrOM2T-AJkQjwJHBw@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CAE2XoE_P2mZAT8wZwzFsTqJTK8nxNSSqJRrOM2T-AJkQjwJHBw@mail.gmail.com>
User-Agent: Mutt/2.4.3 (2026-10-09)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-MFC-PROC-ID: nx6NLDKONS1Upu0bA268i6IzawI6178LAYrl9LYrB3A_1793714124
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1793714134-194C39EA-896082AF/35/111497
X-purgate-type: clean
X-purgate-size: 5076
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 03, 2026 at 09:48:44PM +0800, Yonggang Luo wrote:
> On Tue, Nov 3, 2026 at 9:23 PM BALATON Zoltan <balaton@eik.bme.hu> wrote:
> >
> > On Tue, 3 Nov 2026, Yonggang Luo wrote:
> > > On Tue, Nov 3, 2026 at 4:16 PM Daniel P. Berrangé <berrange@redhat.com> wrote:
> > >>
> > >> On Fri, Oct 30, 2026 at 05:51:44PM -0800, Pierrick Bouvier wrote:
> > >>> On 10/30/2026 4:09 PM, BALATON Zoltan wrote:
> > >>>> On Fri, 30 Oct 2026, Yonggang Luo wrote:
> > >>>>> DEFINE_MACHINE and DEFINE_MACHINE_EXTENDED hide the TypeInfo and the
> > >>>>> type_init
> > >>>>> function that calls type_register_static(). A later change needs to
> > >>>>> pass a
> > >>>>
> > >>>> That's the point of the macro to hide the boiler plate code.
> > >>>>
> > >>>>> target mask into that registration, and the macros have no parameter
> > >>>>> for it.
> > >>>>
> > >>>> Couldn't you just change the macros to take that parameter instead of
> > >>>> expanding it everywhere?
> > >>>>
> > >>>
> > >>> Problem of macros is that they don't have default parameters, so you
> > >>> need variants for everything:
> > >>>
> > >>> DEFINE_MACHINE
> > >>> DEFINE_MACHINE_EXTENDED
> > >>> DEFINE_MACHINE_WITH_INTERFACES
> > >>> DEFINE_MACHINE_WITH_INTERFACE_ARRAY
> > >>> and now would need a new variant, with variant for other existing ones.
> > >>>
> > >>> In the end, it's just simpler to remove this and add the boilerplate.
> > >>> It's written once and never modified, so using a macro just save typing
> > >>> those lines once.
> > >>
> > >> For each machine, it is only written once, but we add machines
> > >> over time, and every time a new machine is added the code style
> > >> is slightly different. We introduced all the variuos DEFINE_*
> > >> macros for QOM to better ensure consistent style and usage as
> > >> new code is added over time.
> > >
> > > I understand that the DEFINE_* macros are bloating because of this.
> > > Indeed currently the only two macros used are "DEFINE_MACHINE" and
> > > "DEFINE_MACHINE_EXTENDED"
> >
> > There are a few machines using some others but these are the most used.
> > That suggests maybe we should change the convenience wrappers to match
> > what machines need but DEFINE_MACHINE_EXTENDED is meant to be the one that
> > allows all parameters which should be rarely needed.
> >
> > > ; each time people want to add a new attribute, the macros is twiced.
> >
> > Not necessarily. The SECURE parameter did that to preserve previous
> > behaviour but if you add new parameter changing all callers (which is the
> > same as expanding the macro that would also change all callers) then it's
> > just a new parameter added not changing the number of DEFINE_MACHINE*
> > wrappers. Rearranging the wrappers to make DEFINE_MACHINE_EXTENDED used
> > less is an independent change.
> >
> > > And the usage of DEFINE_MACHINE_EXTENDED is rare and can be replaced
> > > with DEFINE_TYPES or TypeInfo
> > > and be more explicit. When we used as macro parameter, we need think
> >
> > But that defies the purpose of hiding the QOM boiler plate as much as
> > possible. New people are confused by QOM and it's easier for them to look
> > up documentation on the DEFINE_MACHINE* macros to see what parameter is
> > what and not care about how it's stored in QOM TypeInfo or what is that
> > at all.
> >
> > > what's that parameter means, and for
> > > TypeInfo, we can directly know what that member is about(because we
> > > are assigned with the member name).
> >
> > The parameter also has a name and documentation so it's not simpler to
> > look up TypeInfo than look at the macro definition or docs. In fact it's
> > harder to guess from TypeInfo as then you also need to get into QOM.
> >
> > > That's why I suggest keeping a single DEFINE_MACHINE, just like
> > > DEFINE_TYPES; as they are the most
> > > used macros(and simple enough), and won't suffer from changes much.
> >
> > That means exposing all the boiler plate for all machines other than the
> > simplest case. I think it would be better to keep DEFINE_MACHINE_EXTENDED
> > but maybe rethink the existing wrappers and drop unused ones and maybe add
> > new ones that reduce the usage of DEFINE_MACHINE_EXTENDED but still keep
> > the boiler plate hidden.
> 
> Thanks, I'll go this way, remove unused macros, and keep DEFINE_MACHINE_EXTENDED
> and extend both DEFINE_MACHINE_EXTENDED DEFINE_MACHINE supports
> "targets" or "arch_mask" parameter.

Given that we don't need to do general per-arch type filtering in
QOM, we could just move 'is_available' out of TypeInfo, and into the
MachineClass, so it is a regular class level property, which can be
set in the class_init methods, and thus avoid any changes to the
DEFINE_MACHINE macros.

With regards,
Daniel
-- 
|: https://berrange.com       ~~        https://hachyderm.io/@berrange :|
|: https://libvirt.org          ~~          https://entangle-photo.org :|
|: https://pixelfed.art/berrange   ~~    https://fstop138.berrange.com :|


