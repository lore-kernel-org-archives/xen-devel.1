Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49BB1606A324
	for <xen-devel@archiver.kernel.org>; Mon,  2 Nov 2026 05:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MgLxlP3v
Received: from list by lists.xenproject.org with outflank-mailman.1467443.1676785 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNkwB-0003TF-Ke; Mon, 02 Nov 2026 05:50:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1467443.1676785; Mon, 02 Nov 2026 05:50:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNkwB-0003P1-7W; Mon, 02 Nov 2026 05:50:31 +0000
Received: by outflank-mailman (input) for mailman id 1467443;
 Sun, 01 Nov 2026 20:13:34 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <armbru@redhat.com>) id 1xNbvp-0001uH-WB
 for xen-devel@lists.xenproject.org; Sun, 01 Nov 2026 20:13:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xNbvp-004xRp-D8
 for xen-devel@lists.xenproject.org; Sun, 01 Nov 2026 21:13:33 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <armbru@redhat.com>)
 id 6ae79d6b-e002-0a2a0a5209dd-0a2a450be44e-2
 for <xen-devel@lists.xenproject.org>; Sun, 01 Nov 2026 21:13:33 +0100
Received: from [170.10.133.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <armbru@redhat.com>)
 id 6ae79d6c-b7e8-0a2a450b0019-aa0a857c9525-3
 for <xen-devel@lists.xenproject.org>; Sun, 01 Nov 2026 21:13:33 +0100
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-640-EOQDkoJqOrSzuYyhPjyxGw-1; Sun,
 01 Nov 2026 15:13:26 -0500
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 305B619560B3; Sun,  1 Nov 2026 20:13:22 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.44.22.2])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id E9645195608B; Sun,  1 Nov 2026 20:13:20 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7626A21E6A04; Sun, 01 Nov 2026 21:13:18 +0100 (CET)
Resent-To: 17746591750@163.com, alistair@alistair23.me, graf@amazon.com,
 FangSheng.Huang@amd.com, michael.roth@amd.com, jamin_lin@aspeedtech.com,
 kane_chen@aspeedtech.com, palmer@dabbelt.com, rbolshakov@ddn.com,
 foss@defmacro.it, sebastian.huber@embedded-brains.de, fam@euphon.net,
 jiaxun.yang@flygoat.com, lizhijian@fujitsu.com, atar4qemu@gmail.com,
 edgar.iglesias@gmail.com, jasowangio@gmail.com, liwei1518@gmail.com,
 npiggin@gmail.com, zhangckid@gmail.com, titusr@google.com,
 wuhaotsh@google.com, arei.gonglei@huawei.com, berto@igalia.com,
 mark.cave-ayland@ilande.co.uk, junjie.cao@intel.com, zhao1.liu@intel.com,
 pasic@linux.ibm.com, its@irrelevant.dk, rathc@linux.ibm.com, clg@kaod.org,
 stefanb@linux.vnet.ibm.com, conor@kernel.org,
 xen-devel@lists.xenproject.org, david@kernel.org, luc@lmichel.fr,
 jic23@kernel.org, kbusch@kernel.org, mchehab+huawei@kernel.org,
 sstabellini@kernel.org, peter.maydell@linaro.org,
 richard.henderson@linaro.org, zhiwei_liu@linux.alibaba.com,
 zhenwei.pi@linux.dev, adityag@linux.ibm.com, alifm@linux.ibm.com,
 amachhiw@linux.ibm.com, borntraeger@linux.ibm.com,
 brueckner@linux.ibm.com, farman@linux.ibm.com, harshpb@linux.ibm.com,
 iii@linux.ibm.com, jjherne@linux.ibm.com, milesg@linux.ibm.com,
 mjrosato@linux.ibm.com, lixianglai@loongson.cn, maobibo@loongson.cn,
 pbarbuda@microsoft.com, yoshinori.sato@nifty.com, qemu-arm@nongnu.org,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, john.levon@nutanix.com,
 thanos.makatos@nutanix.com, kfting@nuvoton.com, den@openvz.org,
 elena.ufimtseva@oracle.com, jag.raman@oracle.com,
 daniel.barboza@oss.qualcomm.com, philmd@oss.qualcomm.com,
 pierrick.bouvier@oss.qualcomm.com, phil@philjordan.eu,
 tangtao1634@phytium.com.cn, chao.liu@processmission.com, jiri@resnulli.us,
 sam@rfc1149.net, anisa.su@samsung.com, alex@shazbot.org, farosas@suse.de,
 mohamed@unpredictable.fr, kvm@vger.kernel.org, linux-cxl@vger.kernel.org,
 alistair.francis@wdc.com, anthony@xenproject.org
Resent-From: Markus Armbruster <armbru@redhat.com>
Resent-Date: Sun, 01 Nov 2026 21:13:18 +0100
Resent-Message-ID: <871p941fa9.fsf@pond.sub.org>
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=mimecast20190719 header.d=redhat.com header.i="@redhat.com" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Resent-To:Resent-From:Resent-Message-ID:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793564012;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 resent-to:resent-from:resent-message-id:in-reply-to:in-reply-to:
	 references:references; bh=XB5EnWMeZC+TuUTfvw5ippbkRaPu3bjzBuwOlljxabM=;
	b=MgLxlP3vGdYDkYabroiwKjr6n7Zpanagi6qP2VV/ilVgnEJ7mmhO0XBLN+wkvt2+YpAWYT
	RuwL5mEDJkXomTik7A7WbWARH2wyyw/MNrdj8H57cC4qHpxlOG8SRS+DYlqbK8TCiRGulo
	0wGxz+K8/gEz8ecXozXpmboHfZqtL00=
X-MC-Unique: EOQDkoJqOrSzuYyhPjyxGw-1
X-Mimecast-MFC-AGG-ID: EOQDkoJqOrSzuYyhPjyxGw_1793564002
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
In-Reply-To: <87ik2g7cd6.fsf@pond.sub.org> (Markus Armbruster's message of
	"Sun, 01 Nov 2026 17:19:49 +0100")
References: <20261020-qom-qapi-v7-0-431a86b02b58@redhat.com>
	<20261020-qom-qapi-v7-7-431a86b02b58@redhat.com>
	<87ik2g7cd6.fsf@pond.sub.org>
Date: Sun, 01 Nov 2026 17:27:17 +0100
Message-ID: <87a4ns7c0q.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: YzQhKd_P8-cLHAijkh7GwQGtDjCr6nYS28WObv_w1UM_1793564002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
X-purgate-ID: tlsNG-42698a/1793564013-18ECE9EA-72CC74E4/0/0
X-purgate-type: clean
X-purgate-size: 288
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Markus Armbruster <armbru@redhat.com> writes:

> As far as I can tell, @name is used outside tests only for an error
> message in object_property_get_enum(), and I'm not sure that error makes
> sense.  Observation, not a demand.

No, I managed to confuse myself.  Please ignore.


