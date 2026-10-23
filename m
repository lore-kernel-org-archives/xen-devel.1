Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84770606A31B
	for <xen-devel@archiver.kernel.org>; Fri, 23 Oct 2026 19:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Aqa7FbgG
Received: from list by lists.xenproject.org with outflank-mailman.1459180.1671424 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xKKvV-0001u2-MX; Fri, 23 Oct 2026 19:27:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1459180.1671424; Fri, 23 Oct 2026 19:27:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xKKvV-0001ts-IZ; Fri, 23 Oct 2026 19:27:41 +0000
Received: by outflank-mailman (input) for mailman id 1459180;
 Fri, 23 Oct 2026 11:39:40 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <mlureau@redhat.com>) id 1xKDca-0002Wo-O9
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2026 11:39:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xKDca-008B5F-4J
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2026 13:39:40 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <mlureau@redhat.com>)
 id 6adb4775-bab6-0a2a0a5309dd-0a2a4501aeba-32
 for <xen-devel@lists.xenproject.org>; Fri, 23 Oct 2026 13:39:39 +0200
Received: from [170.10.129.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <mlureau@redhat.com>)
 id 6adb477a-5984-0a2a45010019-aa0a817ce147-3
 for <xen-devel@lists.xenproject.org>; Fri, 23 Oct 2026 13:39:39 +0200
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-617-loeKYFAsO7u3lfe1n9GFgA-1; Fri, 23 Oct 2026 07:39:36 -0400
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-3ac76132001so696339a91.0
 for <xen-devel@lists.xenproject.org>; Fri, 23 Oct 2026 04:39:36 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=mimecast20190719 header.d=redhat.com header.i="@redhat.com" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792755578;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BwZKJ1y9GJGdttliesnC6UNJffqn1NZdo/yH29SzxfQ=;
	b=Aqa7FbgG+y24GyAqMkXLrjublyxPemhdCvGAybNmKiR0JKJIM08rOFmhz8RUPT1S/oPtcE
	HvSEb2nUL8qJ9Ls9q2l3yzRH67H9Ig26L5X7U1MskK4yPoe81aDBWD8moPnxVR2Eb7K+dq
	zgiflRKszSi4EgaHr9Ory7liolUJzF8=
X-MC-Unique: loeKYFAsO7u3lfe1n9GFgA-1
X-Mimecast-MFC-AGG-ID: loeKYFAsO7u3lfe1n9GFgA_1792755576
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792755576; x=1793360376;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BwZKJ1y9GJGdttliesnC6UNJffqn1NZdo/yH29SzxfQ=;
        b=CtgDB/K+zF6rC1cMOiEL3Kvy0bNDkO6lKP14dTT1yeuWTlkThdky0bPvcKmLXgJCsC
         2ZmI64/5sxAZIHNoeP0XXWkjKAhFL3Qos5w+UGqap8jobwT1algxvW7YcpwfKTHRDPmM
         VhcnY51xc7CnrUxA2kIPPywG6fQJej/JK8qCBDfSc2XnWWw82eGDsElI3UM3+uFZDCg9
         T7HMSJlai+5Avmm24CIGwjsyi378cFkMjMKN46toPvwgXs72mFhAdxPlTLd0+NvcwwfC
         E9bPvoEmvHLqXLQLJ4nQ1xiWbnfXwEmh4iJN17XAfJSorv+14tN7RlVY9s8DflGQ4xzW
         FD7g==
X-Forwarded-Encrypted: i=1; AKwUvBw5zmUY9KaQWGuV6Knc6UQib5tud0z4UlrW+iHXJ7NC9FWGtdXNYqS+ZQha+1LiV7GgFO1dgEmbOUc=@lists.xenproject.org
X-Gm-Message-State: AFq9FYJEVHPp1lHqa5skNIjHcb5Xyy3Y5chZoBxtSywVmaN/rsrfvZix
	O+szqJcrfKqR1vbwfjl3prjt9TbYAT8VEq3AqJ31/sBApLBNKb4IL4303mtXCEgPWRkUvec5U+P
	1U7IqXUouvIN8RVwEI7wnr2vqzt4In7G70/z5vyjz2yZCsh+GdML4Pt4b0/dmg08k41gHB4FNgF
	CNFDI+kh8hl6foJ4qKU3ALw9NSM61Bd+2F2eR1SViwyt0=
X-Gm-Gg: AYBFou3+1v7/6CzoeCzirNwkBTLt/ohRuRL/Er5jlUoAIBxXhYdt/dtvkGcq1ZTTL/X
	KPeLIMiiANjPkuhk3aD8zwyBhheuHW7EOdXNcWmvVutiKoXFMDJY0wQUoNVfi9qZ72c/WSs9mHY
	1iOwE3Px6aXivPCPS0plq5GFWnDqEcb52ZyhnAybkGKBVAnwXvWvZy08HtanOndojXcf8XUv1Mw
	UIoi97/B+40ChT7jVfqlaa7MZnE2SyqgODZO7Olb3xhpz8Zf7hcH9Wn5767YaDdivZ1WGeg9P6c
	vQ==
X-Received: by 2002:a17:90b:4d06:b0:3ac:ffb8:1809 with SMTP id 98e67ed59e1d1-3adce45dd72mr1525578a91.39.1792755575396;
        Fri, 23 Oct 2026 04:39:35 -0700 (PDT)
X-Received: by 2002:a17:90b:4d06:b0:3ac:ffb8:1809 with SMTP id
 98e67ed59e1d1-3adce45dd72mr1525520a91.39.1792755574796; Fri, 23 Oct 2026
 04:39:34 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261020-qom-qapi-v7-0-431a86b02b58@redhat.com>
 <20261020-qom-qapi-v7-54-431a86b02b58@redhat.com> <atsxLV5YZo8dr-8G@redhat.com>
In-Reply-To: <atsxLV5YZo8dr-8G@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Fri, 23 Oct 2026 15:39:22 +0400
X-Gm-Features: AclHuK9JciU6rOmPmxGP7LAL0cKom9fJOgwoGNnQZ4aTaCAv64YMDSwyPsEK5ck
Message-ID: <CAMxuvazd7G_NBOM_c6BxZn5PFSw=XQUHueHqBoQQfpzPPgi9qA@mail.gmail.com>
Subject: Re: [PATCH v7 54/65] qdev: adjust PciDevfn declared type
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>, 
	Michael Roth <michael.roth@amd.com>, John Snow <jsnow@redhat.com>, 
	Peter Maydell <peter.maydell@linaro.org>, 
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
	Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Kostiantyn Kostiuk <kkostiuk@redhat.com>, Eric Blake <eblake@redhat.com>, 
	David Hildenbrand <david@kernel.org>, Igor Mammedov <imammedo@redhat.com>, 
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Jason Wang <jasowangio@gmail.com>, 
	Marcelo Tosatti <mtosatti@redhat.com>, kvm@vger.kernel.org, 
	Alberto Garcia <berto@igalia.com>, Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
	Zhao Liu <zhao1.liu@intel.com>, Jonathan Cameron <jic23@kernel.org>, 
	Junjie Cao <junjie.cao@intel.com>, Anisa Su <anisa.su@samsung.com>, 
	Elena Ufimtseva <elena.ufimtseva@oracle.com>, Jagannathan Raman <jag.raman@oracle.com>, 
	John Levon <john.levon@nutanix.com>, Thanos Makatos <thanos.makatos@nutanix.com>, 
	=?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>, 
	Cornelia Huck <cohuck@redhat.com>, Eric Farman <farman@linux.ibm.com>, 
	Matthew Rosato <mjrosato@linux.ibm.com>, Richard Henderson <richard.henderson@linaro.org>, 
	Ilya Leoshkevich <iii@linux.ibm.com>, qemu-block@nongnu.org, linux-cxl@vger.kernel.org, 
	qemu-s390x@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>, Sergio Lopez <slp@redhat.com>, 
	qemu-arm@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>, 
	Alistair Francis <alistair.francis@wdc.com>, Weiwei Li <liwei1518@gmail.com>, 
	Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
	Chao Liu <chao.liu@processmission.com>, qemu-riscv@nongnu.org, 
	Song Gao <17746591750@163.com>, Bibo Mao <maobibo@loongson.cn>, 
	Xianglai Li <lixianglai@loongson.cn>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	Pedro Barbuda <pbarbuda@microsoft.com>, Mohamed Mediouni <mohamed@unpredictable.fr>, 
	Nicholas Piggin <npiggin@gmail.com>, Harsh Prateek Bora <harshpb@linux.ibm.com>, 
	Amit Machhiwal <amachhiw@linux.ibm.com>, qemu-ppc@nongnu.org, 
	Zhang Chen <zhangckid@gmail.com>, Li Zhijian <lizhijian@fujitsu.com>, 
	Alistair Francis <alistair@alistair23.me>, Alexander Graf <graf@amazon.com>, 
	"Gonglei (Arei)" <arei.gonglei@huawei.com>, zhenwei pi <zhenwei.pi@linux.dev>, 
	Ani Sinha <anisinha@redhat.com>, Luc Michel <luc@lmichel.fr>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
	Jamin Lin <jamin_lin@aspeedtech.com>, Kane Chen <kane_chen@aspeedtech.com>, 
	Samuel Tardieu <sam@rfc1149.net>, "Denis V. Lunev" <den@openvz.org>, 
	FangSheng Huang <FangSheng.Huang@amd.com>, Tyrone Ting <kfting@nuvoton.com>, 
	Hao Wu <wuhaotsh@google.com>, Keith Busch <kbusch@kernel.org>, 
	Klaus Jensen <its@irrelevant.dk>, Jesper Devantier <foss@defmacro.it>, 
	Aditya Gupta <adityag@linux.ibm.com>, Glenn Miles <milesg@linux.ibm.com>, 
	Conor Dooley <conor@kernel.org>, Sebastian Huber <sebastian.huber@embedded-brains.de>, 
	Halil Pasic <pasic@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Jason Herne <jjherne@linux.ibm.com>, Titus Rwantare <titusr@google.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD <anthony@xenproject.org>, 
	Peter Xu <peterx@redhat.com>, Chinmay Rath <rathc@linux.ibm.com>, 
	Hendrik Brueckner <brueckner@linux.ibm.com>, xen-devel@lists.xenproject.org, 
	Roman Bolshakov <rbolshakov@ddn.com>, Phil Dennis-Jordan <phil@philjordan.eu>, Fam Zheng <fam@euphon.net>, 
	Farhan Ali <alifm@linux.ibm.com>, Alex Williamson <alex@shazbot.org>, 
	Tao Tang <tangtao1634@phytium.com.cn>, Stefan Berger <stefanb@linux.vnet.ibm.com>, 
	Fabiano Rosas <farosas@suse.de>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
	Artyom Tarasenko <atar4qemu@gmail.com>, Yoshinori Sato <yoshinori.sato@nifty.com>, 
	Jiri Pirko <jiri@resnulli.us>, Eric Auger <eric.auger@redhat.com>, 
	Laurent Vivier <lvivier@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: r4RsJWxQfozpVUPVIOZfOwadISvpumVJwNP5L0fiElE_1792755576
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-d62444/1792755579-BD87F757-F4D7F959/0/0
X-purgate-type: clean
X-purgate-size: 2837
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi

On Fri, Oct 23, 2026 at 2:04=E2=80=AFPM Daniel P. Berrang=C3=A9 <berrange@r=
edhat.com> wrote:
>
> On Tue, Oct 20, 2026 at 02:46:11PM +0400, Marc-Andr=C3=A9 Lureau wrote:
> > PciDevfn is a bit special, since it accepts integer and string as
> > setter, but only output integer as getter.
> >
> > Unfortunately, we can't declare an alternate str|int QAPI type for it,
> > since: branch 'string' can't be distinguished from 'integer'
> >
> > Rather than declaring it as "str", use the common type instead.
> >
> > Signed-off-by: Markus Armbruster <armbru@redhat.com>
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >  hw/core/qdev-properties-system.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/hw/core/qdev-properties-system.c b/hw/core/qdev-properties=
-system.c
> > index 5bfdfe1ab9d9..3381de1144d6 100644
> > --- a/hw/core/qdev-properties-system.c
> > +++ b/hw/core/qdev-properties-system.c
> > @@ -904,7 +904,8 @@ static char *print_pci_devfn(Object *obj, const Pro=
perty *prop)
> >  }
> >
> >  const PropertyInfo qdev_prop_pci_devfn =3D {
> > -    .type  =3D "str",
> > +    /* The formatted string accepted by the setter is a CLI convenienc=
e. */
>
> IIUC, this is not limited to the CLI, it will work anywhere the JSON
> syntax is permitted which is both CLI and QMP.
>
> libvirt uses this string syntax:
>
>   -device '{"driver":"pcie-root-port","port":9,"chassis":2,"id":"pci.2","=
bus":"pcie.0","multifunction":true,"addr":"0x1.0x1"}' \
>
> > +    .type  =3D "int32",
> >      .description =3D "Slot and optional function number, example: 06.0=
 or 06",
>
>
> Changing the type to 'int32', where 99% of usage is input only
> and string based, is pretty unpleasant. Even more so that the
> description doesn't even mention encoding dev+function as an
> integer.

This is purely a metadata change, the setter still accepts both str &
int, so I don't think this change blocks this series. But I agree we
could do better.

There are multiple options. We could keep declaring the property as
str instead. In this case, the getter should probably return a string
for consistency and correctness. This might surprise some existing
users though.

We could introduce new properties like `devfn-str` and `devfn-int`
that alias the same value.

We could also introduce a new structured QAPI type.

Markus, what's your take?

thanks

>
> >      .print =3D print_pci_devfn,
> >      .get   =3D qdev_propinfo_get_int32,
>
> With regards,
> Daniel
> --
> |: https://berrange.com       ~~        https://hachyderm.io/@berrange :|
> |: https://libvirt.org          ~~          https://entangle-photo.org :|
> |: https://pixelfed.art/berrange   ~~    https://fstop138.berrange.com :|
>


