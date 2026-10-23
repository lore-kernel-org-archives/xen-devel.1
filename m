Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 525E3606A31A
	for <xen-devel@archiver.kernel.org>; Fri, 23 Oct 2026 10:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eVyWOozq
Received: from list by lists.xenproject.org with outflank-mailman.1458989.1671090 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xKCLb-00089z-0Y; Fri, 23 Oct 2026 10:18:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1458989.1671090; Fri, 23 Oct 2026 10:18:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xKCLa-00087u-Qg; Fri, 23 Oct 2026 10:18:02 +0000
Received: by outflank-mailman (input) for mailman id 1458989;
 Fri, 23 Oct 2026 08:40:14 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <armbru@redhat.com>) id 1xKAow-0004VA-1h
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2026 08:40:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xKAov-00EThL-7X
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2026 10:40:13 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <armbru@redhat.com>)
 id 6adb1d60-2eae-0a2a0a5409dd-0a2a450ca93e-42
 for <xen-devel@lists.xenproject.org>; Fri, 23 Oct 2026 10:40:13 +0200
Received: from [170.10.129.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <armbru@redhat.com>)
 id 6adb1d6b-f479-0a2a450c0019-aa0a817cb687-3
 for <xen-devel@lists.xenproject.org>; Fri, 23 Oct 2026 10:40:12 +0200
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-433-gEH36swhMSWp1ifHI3FC6w-1; Fri,
 23 Oct 2026 04:40:06 -0400
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id A187518005AB; Fri, 23 Oct 2026 08:39:58 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.44.22.5])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 2BC4018001CA; Fri, 23 Oct 2026 08:39:54 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D776D21E6A04; Fri, 23 Oct 2026 10:39:51 +0200 (CEST)
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
	s=mimecast20190719; t=1792744811;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0Pj6QyZW/xESjev5XVWjzENx6fIcmKFZWXFYVSlbY78=;
	b=eVyWOozqMdrr6xuX5tASdfgBjiqqgZUI1H3RwWdVsJwHvzUa58dD5XgCADIaPUnyhVGyPE
	QPI8HSsyUTvpVsKK7cLhDFwh8W5lsGA9+EaXTlfQnCd4+9Yx9C74CizZbUvJEi9DrDybFH
	V38uqlkXCyXZpWXHeHjxVuJpRWuqgO8=
X-MC-Unique: gEH36swhMSWp1ifHI3FC6w-1
X-Mimecast-MFC-AGG-ID: gEH36swhMSWp1ifHI3FC6w_1792744801
From: Markus Armbruster <armbru@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Cc: qemu-devel@nongnu.org,  Michael Roth <michael.roth@amd.com>,  John Snow
 <jsnow@redhat.com>,  Peter Maydell <peter.maydell@linaro.org>,  Mauro
 Carvalho Chehab <mchehab+huawei@kernel.org>,  Pierrick Bouvier
 <pierrick.bouvier@oss.qualcomm.com>,  Paolo Bonzini <pbonzini@redhat.com>,
  Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  Kostiantyn
 Kostiuk
 <kkostiuk@redhat.com>,  Eric Blake <eblake@redhat.com>,  David Hildenbrand
 <david@kernel.org>,  Igor Mammedov <imammedo@redhat.com>,  "Edgar E.
 Iglesias" <edgar.iglesias@gmail.com>,  Jason Wang <jasowangio@gmail.com>,
  Marcelo Tosatti <mtosatti@redhat.com>,  kvm@vger.kernel.org,  Alberto
 Garcia <berto@igalia.com>,  Kevin Wolf <kwolf@redhat.com>,  Hanna Reitz
 <hreitz@redhat.com>,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@oss.qualcomm.com>,
  Zhao Liu <zhao1.liu@intel.com>,  Jonathan Cameron <jic23@kernel.org>,
  Junjie Cao <junjie.cao@intel.com>,  Anisa Su <anisa.su@samsung.com>,
  Elena Ufimtseva <elena.ufimtseva@oracle.com>,  Jagannathan Raman
 <jag.raman@oracle.com>,  John Levon <john.levon@nutanix.com>,  Thanos
 Makatos <thanos.makatos@nutanix.com>,  =?utf-8?Q?C=C3=A9dric?= Le Goater
 <clg@redhat.com>,
  Cornelia Huck <cohuck@redhat.com>,  Eric Farman <farman@linux.ibm.com>,
  Matthew Rosato <mjrosato@linux.ibm.com>,  Richard Henderson
 <richard.henderson@linaro.org>,  Ilya Leoshkevich <iii@linux.ibm.com>,
  qemu-block@nongnu.org,  linux-cxl@vger.kernel.org,
  qemu-s390x@nongnu.org,  "Michael S. Tsirkin" <mst@redhat.com>,  Sergio
 Lopez <slp@redhat.com>,  qemu-arm@nongnu.org,  Palmer Dabbelt
 <palmer@dabbelt.com>,  Alistair Francis <alistair.francis@wdc.com>,
  Weiwei Li <liwei1518@gmail.com>,  Daniel Henrique Barboza
 <daniel.barboza@oss.qualcomm.com>,  Liu Zhiwei
 <zhiwei_liu@linux.alibaba.com>,  Chao Liu <chao.liu@processmission.com>,
  qemu-riscv@nongnu.org,  Song Gao <17746591750@163.com>,  Bibo Mao
 <maobibo@loongson.cn>,  Xianglai Li <lixianglai@loongson.cn>,  Jiaxun Yang
 <jiaxun.yang@flygoat.com>,  Pedro Barbuda <pbarbuda@microsoft.com>,
  Mohamed Mediouni <mohamed@unpredictable.fr>,  Nicholas Piggin
 <npiggin@gmail.com>,  Harsh Prateek Bora <harshpb@linux.ibm.com>,  Amit
 Machhiwal <amachhiw@linux.ibm.com>,  qemu-ppc@nongnu.org,  Zhang Chen
 <zhangckid@gmail.com>,  Li Zhijian <lizhijian@fujitsu.com>,  Alistair
 Francis <alistair@alistair23.me>,  Alexander Graf <graf@amazon.com>,
  "Gonglei (Arei)" <arei.gonglei@huawei.com>,  zhenwei pi
 <zhenwei.pi@linux.dev>,  Ani Sinha <anisinha@redhat.com>,  Luc Michel
 <luc@lmichel.fr>,  =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,  Jamin
 Lin
 <jamin_lin@aspeedtech.com>,  Kane Chen <kane_chen@aspeedtech.com>,  Samuel
 Tardieu <sam@rfc1149.net>,  "Denis V. Lunev" <den@openvz.org>,  FangSheng
 Huang <FangSheng.Huang@amd.com>,  Tyrone Ting <kfting@nuvoton.com>,  Hao
 Wu <wuhaotsh@google.com>,  Keith Busch <kbusch@kernel.org>,  Klaus Jensen
 <its@irrelevant.dk>,  Jesper Devantier <foss@defmacro.it>,  Aditya Gupta
 <adityag@linux.ibm.com>,  Glenn Miles <milesg@linux.ibm.com>,  Conor
 Dooley <conor@kernel.org>,  Sebastian Huber
 <sebastian.huber@embedded-brains.de>,  Halil Pasic <pasic@linux.ibm.com>,
  Christian Borntraeger <borntraeger@linux.ibm.com>,  Jason Herne
 <jjherne@linux.ibm.com>,  Titus Rwantare <titusr@google.com>,  Stefano
 Stabellini <sstabellini@kernel.org>,  Anthony PERARD
 <anthony@xenproject.org>,  Peter Xu <peterx@redhat.com>,  Chinmay Rath
 <rathc@linux.ibm.com>,  Hendrik Brueckner <brueckner@linux.ibm.com>,
  xen-devel@lists.xenproject.org,  Roman Bolshakov <rbolshakov@ddn.com>,
  Phil Dennis-Jordan <phil@philjordan.eu>,  Fam Zheng <fam@euphon.net>,
  Farhan Ali <alifm@linux.ibm.com>,  Alex Williamson <alex@shazbot.org>,
  Tao Tang <tangtao1634@phytium.com.cn>,  Stefan Berger
 <stefanb@linux.vnet.ibm.com>,  Fabiano Rosas <farosas@suse.de>,  Mark
 Cave-Ayland <mark.cave-ayland@ilande.co.uk>,  Artyom Tarasenko
 <atar4qemu@gmail.com>,  Yoshinori Sato <yoshinori.sato@nifty.com>,  Jiri
 Pirko <jiri@resnulli.us>,  Eric Auger <eric.auger@redhat.com>,  Laurent
 Vivier <lvivier@redhat.com>
Subject: Re: [PATCH v7 07/65] qapi: add QAPITypeInfo struct definition
In-Reply-To: <20261020-qom-qapi-v7-7-431a86b02b58@redhat.com>
 (=?utf-8?Q?=22Marc-Andr=C3=A9?=
	Lureau"'s message of "Tue, 20 Oct 2026 14:45:24 +0400")
References: <20261020-qom-qapi-v7-0-431a86b02b58@redhat.com>
	<20261020-qom-qapi-v7-7-431a86b02b58@redhat.com>
Date: Fri, 23 Oct 2026 10:39:51 +0200
Message-ID: <875wyshktk.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: EE-TOXB0iDzNbM18DocB-LSXE_LcLU905L737Z_S_x4_1792744801
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-d25034/1792744813-03CD3A5B-AD6BD6F5/0/0
X-purgate-type: clean
X-purgate-size: 4060
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com> writes:

> Introduce a minimal struct that pairs a QAPI type's internal name with
> its "masked" introspection name. Generated constants of this type will
> let QOM property registration carry a reliable reference to the QAPI
> schema and possibly other associated data.
>
> The fields are populated in following commits.
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  include/qapi/qapi-type-info.h | 31 +++++++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
>
> diff --git a/include/qapi/qapi-type-info.h b/include/qapi/qapi-type-info.=
h
> new file mode 100644
> index 000000000000..6a6355568325
> --- /dev/null
> +++ b/include/qapi/qapi-type-info.h
> @@ -0,0 +1,31 @@
> +/*
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#ifndef QAPI_TYPE_INFO_H
> +#define QAPI_TYPE_INFO_H
> +
> +#include "qapi/util.h"
> +
> +/**
> + * QAPITypeInfo - QAPI type metadata
> + *
> + * @name: QAPI type name (e.g. "str", "OnOffAuto", "int32List").
> + *        QOM uses this as the property type string.
> + * @masked_name: Name of the type in the QAPI introspection schema, assi=
gned by
> + *        scripts/qapi code generator (e.g. "368").

I figure "in the output of query-qmp-schema" would be clearer.

> + * @lookup: QEnumLookup for this type, or NULL for non-enum types.
> + *        visit_type_enum(), qapi_enum_parse(), and qapi_enum_lookup()
> + *        all rely on it.

"It" is ambiguous and easily misunderstod.

Correct interpretation: the QEnumLookup.

Incorrect interpretation: QAPITypeInfo member @lookup.

QAPITypeInfo member @lookup is actually used by QOM property stuff in
object.c.  Or rather will be: PATCH 15+17.

Do we need the second sentence?

> + * @list: The list-type counterpart, or NULL if none exists.
> + *        str_type_info.list points to strList_type_info.  qdev array
> + *        properties follow this to find the list type for their element=
.

This alludes to

    static const QAPITypeInfo *qdev_prop_qapi_type(const Property *prop)
    {
        if (prop->info->qapi_type) {
            return prop->info->qapi_type;
        }
        if (prop->info->element_info) {
            assert(prop->info->element_info->qapi_type);
            assert(prop->info->element_info->qapi_type->list);
            return prop->info->element_info->qapi_type->list;
        }
        return NULL;
    }

These array properties don't have prop->info->qapi_type set, and instead
retrieve it from their element type [PATCH 59].

Maybe something like "qdev array properties lack a QAPITypeInfo, and
instead use their element QAPITypeInfo's @list to find it."

Except all that isn't true at this point in the series.  Consider adding
it only when it is true.

Ignorant question: could we set their prop->info->qapi_type at creation
time?  No need for qdev_prop_qapi_type() then.  Hmm, I guess not, the
obvious patch (appended) fails with "initializer element is not
constant".

> + */
> +typedef struct QAPITypeInfo {
> +    const char *name;
> +    const char *masked_name;
> +    const QEnumLookup *lookup;
> +    const struct QAPITypeInfo *list;
> +} QAPITypeInfo;
> +
> +#endif /* QAPI_TYPE_INFO_H */


diff --git a/hw/core/qdev-prop-internal.h b/hw/core/qdev-prop-internal.h
index 40fa4bc63f..18d982a212 100644
--- a/hw/core/qdev-prop-internal.h
+++ b/hw/core/qdev-prop-internal.h
@@ -40,6 +40,7 @@ void default_prop_array(ObjectProperty *op, const Propert=
y *prop);
  */
 #define DEFINE_PROP_ARRAY_INFO(_elem_prop_info, _elem_type) \
     {                                                       \
+        .qapi_type =3D _elem_prop_info.qapi_type->list,       \
         .element_info =3D &(_elem_prop_info),                 \
         .element_size =3D sizeof(_elem_type),                 \
         .get =3D get_prop_array,                              \


