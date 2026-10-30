Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C812D606A31A
	for <xen-devel@archiver.kernel.org>; Fri, 30 Oct 2026 12:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DQOa9Uir
Received: from list by lists.xenproject.org with outflank-mailman.1465600.1676097 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMlix-0005ki-Ag; Fri, 30 Oct 2026 12:28:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1465600.1676097; Fri, 30 Oct 2026 12:28:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMlix-0005kY-7H; Fri, 30 Oct 2026 12:28:47 +0000
Received: by outflank-mailman (input) for mailman id 1465600;
 Fri, 30 Oct 2026 12:11:32 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <mlureau@redhat.com>) id 1xMlSG-00049T-86
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2026 12:11:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xMlSF-00Ch0A-IJ
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2026 13:11:31 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <mlureau@redhat.com>)
 id 6ae4896b-bab6-0a2a0a5309dd-0a2a4509ed1e-8
 for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2026 13:11:31 +0100
Received: from [170.10.133.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <mlureau@redhat.com>)
 id 6ae48970-be1a-0a2a45090019-aa0a857ce175-3
 for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2026 13:11:29 +0100
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-608-RHM01w-8N3K6fC56XHf3BQ-1; Fri, 30 Oct 2026 08:11:26 -0400
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-3abb4c24125so631469a91.3
 for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2026 05:11:26 -0700 (PDT)
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
	s=mimecast20190719; t=1793362288;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=huheSnuaAH41QXuP+wJKnnRPWFroH2JWTjHVE5i6hXA=;
	b=DQOa9UirA6se8ZCtd6+NTOnhD+doNcFc0nnF7SrxG0Z5hU6s9serkhqSYEbgiXgwZw06OF
	hZgx5XaA3oeXgcATPEpShBrCsyeOnFA/WaOQiZUlSliLje0nVI6mY7COfw+SoFzZpyXpMB
	6EFPzdJC+ekBxnQl7+b8bjR/3OIUOMI=
X-MC-Unique: RHM01w-8N3K6fC56XHf3BQ-1
X-Mimecast-MFC-AGG-ID: RHM01w-8N3K6fC56XHf3BQ_1793362286
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793362286; x=1793967086;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=huheSnuaAH41QXuP+wJKnnRPWFroH2JWTjHVE5i6hXA=;
        b=HQmBTU9n7zoeH0VSi96WXPC/K5g7ar6QzNHvmUJSRKsR3hAFV5uPpWWQeTeX8IA868
         u+SpkA4HkkUNumyrjSGAwYDGc4+WAp/ed3LPLo9CLTZLYKUnN38gYm0qKD2i820Kdg+J
         g2y8rgWvu1GWClJgakHW6BRRu4utm2RISUrsB6XN1XzOSiG/kU6glFKOXfAePQEEVqbk
         iKEKEgpsQPkepH/RugqJ9K1wct1YzQXixGKt+Gc1ZzwxATSlIX42AfD2029BNn239tXT
         TdQrLnlMt1BVEvW9JFHmB1T4LMMpMlX9zHdeElNQqX+vH+BDaB2XGySjCgkGT28r3cuk
         GtLQ==
X-Forwarded-Encrypted: i=1; AKwUvBzp+/Hl/FPqxyr90+O47jAyyh4RjRxcIXU1mxFpu8WyIL9ORlDrkF3hQLug+QrTrWuLkWq1gTOGRKA=@lists.xenproject.org
X-Gm-Message-State: AFq9FYIRs3DTsN7vElkb//OyGoEyB0Cn1CyBAdBlJr/eEznJbJZ727FY
	WIxuBVTGdJhnHSu5JppBYs0tZMcOp9hE7p9Ef0xP52mI7nwrhp8F/QjtljnQx6RCC9jMHVQ07DU
	ycVkgcicLiu3kcUw0SXBCvs9sMqyfHJFNUXJaNZczlrYdOPQ0jrHKTGqAwasIvzT4hM6tp1pfEE
	TUdJUY/uTIDlWqIFkt0tm+700HQaDTik4Ip6s+SnSqOno=
X-Gm-Gg: AYBFou1ahiWwoEw6xBlHJA/PaJYngdaLrOZaAzy8sGGbtjcelCjj8mEVwKda8Zs8bMp
	4f+aoatLLkS7TVmJdBJJtlgz26qiaVtdJxtOrnLz+LAc2rxfZjiK3nf1byJc1aGUFY7u8D2Gx6z
	ElWSeh1RjBGiVtxIY5Mb+0NsBNUQUaHh4EMtiGDVXv+vliJcwomPPov45vTiB5Vq2eD37hlY+xz
	TZVgyWRlmN2BsItP0PK3r3ksCHLa3tmBf1oxiMJxmPffeqMTeHHsbwyOxtF9L/XSVPgU7wqPkJo
	Vw==
X-Received: by 2002:a17:90a:c2cc:b0:3a8:f70f:2437 with SMTP id 98e67ed59e1d1-3ae8980bd04mr1669658a91.50.1793362285557;
        Fri, 30 Oct 2026 05:11:25 -0700 (PDT)
X-Received: by 2002:a17:90a:c2cc:b0:3a8:f70f:2437 with SMTP id
 98e67ed59e1d1-3ae8980bd04mr1669589a91.50.1793362284955; Fri, 30 Oct 2026
 05:11:24 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261020-qom-qapi-v7-0-431a86b02b58@redhat.com>
 <20261020-qom-qapi-v7-17-431a86b02b58@redhat.com> <871p97a4mf.fsf@pond.sub.org>
In-Reply-To: <871p97a4mf.fsf@pond.sub.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Fri, 30 Oct 2026 16:11:12 +0400
X-Gm-Features: AclHuK9SdcKVottvuTeAWY4qSYFB8MXW7mNBnZIWRbyUXQq4NjRMq0jo7wIcSr4
Message-ID: <CAMxuvayHXMftaQP6X_14pAf63bjX8mXxsW4TsXnLf_wbOq6eUA@mail.gmail.com>
Subject: Re: [PATCH v7 17/65] qom: add object_{class_}property_add_qapi_enum
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Michael Roth <michael.roth@amd.com>, 
	John Snow <jsnow@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, 
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
	Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	=?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
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
X-Mimecast-MFC-PROC-ID: pfaJY7RSKI5fsQPaU6mr0K-Y2xwy5DfFGs9JQlDuxn8_1793362286
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-bad1c0/1793362289-39AC0034-86513897/0/0
X-purgate-type: clean
X-purgate-size: 5096
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi

On Fri, Oct 30, 2026 at 2:02=E2=80=AFPM Markus Armbruster <armbru@redhat.co=
m> wrote:
>
> Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com> writes:
>
> > Signed-off-by: Markus Armbruster <armbru@redhat.com>
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >  include/qom/object.h | 74 ++++++++++++++++++++++++++++++++++++++++++
> >  qom/object.c         | 90 ++++++++++++++++++++++++++++++++++++++++++++=
+++++---
> >  2 files changed, 159 insertions(+), 5 deletions(-)
> >
> > diff --git a/include/qom/object.h b/include/qom/object.h
> > index eb61d8842b80..e04be4caed57 100644
> > --- a/include/qom/object.h
> > +++ b/include/qom/object.h
> > @@ -2027,6 +2027,80 @@ ObjectProperty *object_class_property_add_enum(O=
bjectClass *klass,
> >                                      int (*get)(Object *, Error **),
> >                                      void (*set)(Object *, int, Error *=
*));
> >
> > +/**
> > + * struct QapiEnumProp: Descriptor for a property backed by a QAPI enu=
m type
> > + *
> > + * Binds a QOM object property to a QAPI enum, providing automatic
> > + * string<->int conversion through QAPI visitors and optional
> > + * default-value initialization during object instance init.
> > + *
> > + * Use the QAPI_ENUM_PROP() macro to construct instances inline.
> > + *
> > + * @name: property name exposed on the QOM object
> > + * @description: human-readable description (shown in ``-device help``=
, etc.)
> > + * @default_value: initial enum value applied via @set during instance=
 init,
> > + *                 or -1 (the QAPI_ENUM_PROP default) to skip initiali=
zation
> > + * @qapi_type: pointer to the generated QAPITypeInfo for the enum
> > + *             (provides the string<->int lookup table)
> > + * @get: getter that returns the current enum value as int, or -1 on e=
rror
> > + * @set: setter that receives the enum value as int; %NULL for read-on=
ly props
> > + */
> > +typedef struct QapiEnumProp {
> > +    const char *name;
> > +    const char *description;
> > +    const int default_value;
> > +    const QAPITypeInfo *qapi_type;
> > +    int (*get)(Object *, Error **);
> > +    void (*set)(Object *, int, Error **);
> > +} QapiEnumProp;
> > +
> > +#define QAPI_ENUM_PROP(...) ({                                        =
   \
> > +    static const QapiEnumProp _prop =3D {                             =
     \
> > +        .default_value =3D -1, __VA_ARGS__                            =
     \
> > +    };                                                                =
   \
> > +    &_prop; })
>
> This is a cute and reasonably well-known macro trick for optional
> keyword arguments in C.
>
> The example [*] below specifies all arguments.  What happens when we
> omit any?  They default to zero via default initializaion, except for
> .default_value, which defaults to -1.
>
> Trap for developers: some arguments aren't actually optional!  If you
> forget to specify @name or @qapi_type, the code compiles, but crashes at
> run time.
>
> Not a fan.

Agree (not a fan of C either). We could probably add more
static/runtime checks. Or clearly state that there is room for
improvements, or just drop it altogether - either as follow up or with
the series. I leave that up to you since you are going to respin it.
thanks!



>
> > +
> > +/**
> > + * object_property_add_qapi_enum:
> > + * @obj: the object to add a property to
> > + * @prop: property descriptor
> > + *
> > + * Add an enum property with QAPI type association.
> > + *
> > + * Returns: The newly added property on success, or %NULL on failure.
> > + */
> > +ObjectProperty *
> > +object_property_add_qapi_enum(Object *obj, const QapiEnumProp *prop);
> > +
> > +/**
> > + * object_class_property_add_qapi_enum:
> > + * @klass: the class object to add a property to
> > + * @prop: property descriptor
> > + *
> > + * Add an enum property with QAPI type association.
> > + *
> > + * Use the QAPI_ENUM_PROP() macro to construct the property descriptor
> > + * inline. If .default_value is not set, the property is not initializ=
ed
> > + * (default_value is -1). Otherwise, the setter is called with
> > + * default_value during object instance init.
> > + *
> > + * Example::
>
> [*]
>
> > + *
> > + *   object_class_property_add_qapi_enum(oc, QAPI_ENUM_PROP(
> > + *       .name =3D "policy",
> > + *       .description =3D "Set the NUMA policy",
> > + *       .default_value =3D HOST_MEM_POLICY_DEFAULT,
> > + *       .qapi_type =3D &HostMemPolicy_type_info,
> > + *       .get =3D my_get_policy,
> > + *       .set =3D my_set_policy,
> > + *   ));
> > + *
> > + * Returns: The newly added property on success, or %NULL on failure.
> > + */
> > +ObjectProperty *
> > +object_class_property_add_qapi_enum(ObjectClass *klass,
> > +                                    const QapiEnumProp *prop);
> > +
> >  /**
> >   * object_property_add_qapi:
> >   * @obj: the object to add a property to
>
> [...]
>


