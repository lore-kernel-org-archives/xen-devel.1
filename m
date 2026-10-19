Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D260DCCF2D6
	for <xen-devel@archiver.kernel.org>; Mon, 19 Oct 2026 08:09:24 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1453993.1667455 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xIiQg-0004Ah-07; Mon, 19 Oct 2026 08:09:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1453993.1667455; Mon, 19 Oct 2026 08:09:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xIiQf-0004Aa-Tc; Mon, 19 Oct 2026 08:09:09 +0000
Received: by outflank-mailman (input) for mailman id 1453993;
 Mon, 19 Oct 2026 08:09:08 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <armbru@redhat.com>) id 1xIiQe-0004AU-Ic
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2026 08:09:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xIiQd-000Y3j-K8
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2026 10:09:07 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <armbru@redhat.com>)
 id 6ad5d016-2eae-0a2a0a5409dd-0a2a450a81e0-24
 for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2026 10:09:07 +0200
Received: from [170.10.129.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <armbru@redhat.com>)
 id 6ad5d021-f2d2-0a2a450a0019-aa0a817c6aab-3
 for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2026 10:09:06 +0200
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-65-F_NLUpEMNv-XFrasoz7gyw-1; Mon,
 19 Oct 2026 08:09:03 +0000
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 90A5B1955DAB; Mon, 19 Oct 2026 08:08:54 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.44.22.5])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 9A2781800642; Mon, 19 Oct 2026 08:08:50 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id DC3D421E6A04; Mon, 19 Oct 2026 10:08:47 +0200 (CEST)
Resent-To: 17746591750@163.com, graf@amazon.com, FangSheng.Huang@amd.com,
 michael.roth@amd.com, jamin_lin@aspeedtech.com, kane_chen@aspeedtech.com,
 steven_lee@aspeedtech.com, andrew@codeconstruct.com.au,
 palmer@dabbelt.com, foss@defmacro.it, sebastian.huber@embedded-brains.de,
 jiaxun.yang@flygoat.com, lizhijian@fujitsu.com, edgar.iglesias@gmail.com,
 jasowangio@gmail.com, leetroy@gmail.com, liwei1518@gmail.com,
 npiggin@gmail.com, zhangckid@gmail.com, titusr@google.com,
 wuhaotsh@google.com, arei.gonglei@huawei.com, berto@igalia.com,
 zhao1.liu@intel.com, its@irrelevant.dk, joel@jms.id.au, clg@kaod.org,
 conor@kernel.org, david@kernel.org, jic23@kernel.org, kbusch@kernel.org,
 sstabellini@kernel.org, peter.maydell@linaro.org,
 richard.henderson@linaro.org, lixianglai@loongson.cn,
 zhiwei_liu@linux.alibaba.com, maobibo@loongson.cn, zhenwei.pi@linux.dev,
 qemu-arm@nongnu.org, adityag@linux.ibm.com, qemu-block@nongnu.org,
 amachhiw@linux.ibm.com, qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, kfting@nuvoton.com,
 den@openvz.org, daniel.barboza@oss.qualcomm.com, philmd@oss.qualcomm.com,
 pierrick.bouvier@oss.qualcomm.com, chao.liu@processmission.com,
 sam@rfc1149.net, kvm@vger.kernel.org, linux-cxl@vger.kernel.org,
 alistair.francis@wdc.com, anthony@xenproject.org,
 borntraeger@linux.ibm.com, brueckner@linux.ibm.com, farman@linux.ibm.com,
 harshpb@linux.ibm.com, iii@linux.ibm.com, jjherne@linux.ibm.com,
 milesg@linux.ibm.com, mjrosato@linux.ibm.com, pasic@linux.ibm.com,
 rathc@linux.ibm.com, xen-devel@lists.xenproject.org, luc@lmichel.fr
Resent-From: Markus Armbruster <armbru@redhat.com>
Resent-Date: Mon, 19 Oct 2026 10:08:47 +0200
Resent-Message-ID: <87v76y159s.fsf@pond.sub.org>
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=mimecast20190719 header.d=redhat.com header.i="@redhat.com" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:Resent-To:Resent-From:Resent-Message-ID:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792397345;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:resent-to:
	 resent-from:resent-message-id:in-reply-to:in-reply-to:  references:references;
	bh=ZapaecIeMcbF8m3IzNayfIxAgM/GC5btRJ9Thst8mm4=;
	b=W/gjaCuR2NYg+raTTNbjHh55j1jRCanrGEBJ8t6EsE5ydA+VLV+VZEbbTatoNmeHBv2hNj
	TWAHP21IKRk47ZKSPSbF5tN6Uf563Cg5yusHaBJUs1Azf4uDPhbPSg9g114YhYaloIRm9s
	7gnOmDbI0rlKICV9vFH7oIxf3SPzv/c=
X-MC-Unique: F_NLUpEMNv-XFrasoz7gyw-1
X-Mimecast-MFC-AGG-ID: F_NLUpEMNv-XFrasoz7gyw_1792397338
From: Markus Armbruster <armbru@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Cc: qemu-devel@nongnu.org,  Markus Armbruster <armbru@redhat.com>,  Paolo
 Bonzini <pbonzini@redhat.com>,  Daniel P. =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,
  Michael Roth <michael.roth@amd.com>,  Pierrick Bouvier
 <pierrick.bouvier@oss.qualcomm.com>,  Philippe =?utf-8?Q?Mathieu-Daud?=
 =?utf-8?Q?=C3=A9?=
 <philmd@oss.qualcomm.com>,  Amit Machhiwal <amachhiw@linux.ibm.com>,
  Alexander Graf <graf@amazon.com>,  Richard Henderson
 <richard.henderson@linaro.org>,  "Gonglei (Arei)"
 <arei.gonglei@huawei.com>,  zhenwei pi <zhenwei.pi@linux.dev>,  David
 Hildenbrand <david@kernel.org>,  Igor Mammedov <imammedo@redhat.com>,
  Alberto Garcia <berto@igalia.com>,  Kevin Wolf <kwolf@redhat.com>,  Hanna
 Reitz <hreitz@redhat.com>,  "Michael S. Tsirkin" <mst@redhat.com>,  Ani
 Sinha <anisinha@redhat.com>,  Peter Maydell <peter.maydell@linaro.org>,
  Luc Michel <luc@lmichel.fr>,  Zhao Liu <zhao1.liu@intel.com>,  Jonathan
 Cameron <jic23@kernel.org>,  =?utf-8?Q?C=C3=A9dric?= Le Goater
 <clg@kaod.org>,  Steven Lee
 <steven_lee@aspeedtech.com>,  Troy Lee <leetroy@gmail.com>,  Jamin Lin
 <jamin_lin@aspeedtech.com>,  Kane Chen <kane_chen@aspeedtech.com>,  Andrew
 Jeffery <andrew@codeconstruct.com.au>,  Joel Stanley <joel@jms.id.au>,
  Samuel Tardieu <sam@rfc1149.net>,  Marcelo Tosatti <mtosatti@redhat.com>,
  John Snow <jsnow@redhat.com>,  "Denis V. Lunev" <den@openvz.org>,  Song
 Gao <17746591750@163.com>,  Bibo Mao <maobibo@loongson.cn>,  Xianglai Li
 <lixianglai@loongson.cn>,  Jiaxun Yang <jiaxun.yang@flygoat.com>,
  FangSheng Huang <FangSheng.Huang@amd.com>,  Tyrone Ting
 <kfting@nuvoton.com>,  Hao Wu <wuhaotsh@google.com>,  Jason Wang
 <jasowangio@gmail.com>,  Keith Busch <kbusch@kernel.org>,  Klaus Jensen
 <its@irrelevant.dk>,  Jesper Devantier <foss@defmacro.it>,  Nicholas
 Piggin <npiggin@gmail.com>,  Aditya Gupta <adityag@linux.ibm.com>,  Glenn
 Miles <milesg@linux.ibm.com>,  Harsh Prateek Bora <harshpb@linux.ibm.com>,
  Conor Dooley <conor@kernel.org>,  Sebastian Huber
 <sebastian.huber@embedded-brains.de>,  Palmer Dabbelt
 <palmer@dabbelt.com>,  Alistair Francis <alistair.francis@wdc.com>,
  Weiwei Li <liwei1518@gmail.com>,  Daniel Henrique Barboza
 <daniel.barboza@oss.qualcomm.com>,  Liu Zhiwei
 <zhiwei_liu@linux.alibaba.com>,  Chao Liu <chao.liu@processmission.com>,
  Halil Pasic <pasic@linux.ibm.com>,  Christian Borntraeger
 <borntraeger@linux.ibm.com>,  Jason Herne <jjherne@linux.ibm.com>,
  Cornelia Huck <cohuck@redhat.com>,  Eric Farman <farman@linux.ibm.com>,
  Matthew Rosato <mjrosato@linux.ibm.com>,  Ilya Leoshkevich
 <iii@linux.ibm.com>,  Titus Rwantare <titusr@google.com>,  Stefano
 Stabellini <sstabellini@kernel.org>,  Anthony PERARD
 <anthony@xenproject.org>,  "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
  Zhang Chen <zhangckid@gmail.com>,  Li Zhijian <lizhijian@fujitsu.com>,
  Peter Xu <peterx@redhat.com>,  Chinmay Rath <rathc@linux.ibm.com>,
  Hendrik Brueckner <brueckner@linux.ibm.com>,  kvm@vger.kernel.org,
  qemu-block@nongnu.org,  qemu-arm@nongnu.org,  linux-cxl@vger.kernel.org,
  qemu-ppc@nongnu.org,  qemu-riscv@nongnu.org,  qemu-s390x@nongnu.org,
  xen-devel@lists.xenproject.org
Subject: Re: [PATCH v5 35/62] qom: convert scalar properties to QAPI-aware
 registration
In-Reply-To: <20260911-qom-qapi-v5-35-7732a55b7760@redhat.com>
 (=?utf-8?Q?=22Marc-Andr=C3=A9?=
	Lureau"'s message of "Fri, 11 Sep 2026 20:35:09 +0400")
References: <20260911-qom-qapi-v5-0-7732a55b7760@redhat.com>
	<20260911-qom-qapi-v5-35-7732a55b7760@redhat.com>
Date: Mon, 19 Oct 2026 09:41:59 +0200
Message-ID: <87jyne2l2w.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: OEBf1xfxTIX4kYDZKg7X_Fu27dAcXbyfqGrBW-JeCms_1792397338
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-4011c0/1792397346-593C4CFC-A20E2AF9/0/0
X-purgate-type: clean
X-purgate-size: 1675

Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com> writes:

> Reviewed-by: Amit Machhiwal <amachhiw@linux.ibm.com>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

[...]

> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 872920b6482b..4e5d8d9f86e3 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -4258,7 +4258,7 @@ static void virt_machine_class_init(ObjectClass *oc=
, const void *data)
>                                            "Set on/off to enable/disable =
high "
>                                            "memory region for PCI MMIO");
> =20
> -    object_class_property_add(oc, "highmem-mmio-size", "size",
> +    object_class_property_add_qapi(oc, "highmem-mmio-size", &size_type_i=
nfo,
>                                     virt_get_highmem_mmio_size,
>                                     virt_set_highmem_mmio_size,
>                                     NULL, NULL);
> @@ -4266,7 +4266,7 @@ static void virt_machine_class_init(ObjectClass *oc=
, const void *data)
>                                            "Set the high memory region si=
ze "
>                                            "for PCI MMIO");
> =20
> -    object_class_property_add(oc, "virtio-mmio-transports", "uint8",
> +    object_class_property_add_qapi(oc, "virtio-mmio-transports", &uint8_=
type_info,

scripts/checkpatch.pl gripes

    WARNING: line over 80 characters

Easy enough to avoid.

Many more below.

>                                     virt_get_virtio_transports,
>                                     virt_set_virtio_transports,
>                                     NULL, NULL);

[...]


