Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5516606A31A
	for <xen-devel@archiver.kernel.org>; Wed, 21 Oct 2026 10:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RlDigF9l
Received: from list by lists.xenproject.org with outflank-mailman.1456506.1669961 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJTj9-0004iJ-Ed; Wed, 21 Oct 2026 10:39:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1456506.1669961; Wed, 21 Oct 2026 10:39:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJTj9-0004gX-9I; Wed, 21 Oct 2026 10:39:23 +0000
Received: by outflank-mailman (input) for mailman id 1456506;
 Tue, 20 Oct 2026 20:42:31 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <milesg@linux.ibm.com>) id 1xJGfH-0004Go-NR
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 20:42:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xJGfH-001FLS-4N
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 22:42:31 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <milesg@linux.ibm.com>)
 id 6ad7d216-8faa-0a2a0a5109dd-0a2a4508c6f2-38
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 22:42:31 +0200
Received: from [148.163.156.1] (helo=mx0a-001b2d01.pphosted.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <milesg@linux.ibm.com>)
 id 6ad7d235-f659-0a2a45080019-94a39c0114fa-3
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 22:42:30 +0200
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69KHE7fa1368439; Tue, 20 Oct 2026 20:41:38 GMT
Received: from ppma21.wdc07v.mail.ibm.com
 (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4hdw5bda8x-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Tue, 20 Oct 2026 20:41:37 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
 by ppma21.wdc07v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id
 69KKL8rN1753729; Tue, 20 Oct 2026 20:41:36 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([172.16.1.72])
 by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4he7bs24g1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Oct 2026 20:41:36 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com
 [10.39.53.229])
 by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 69KKfZRk12517922
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 20 Oct 2026 20:41:35 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1F0905805E;
 Tue, 20 Oct 2026 20:41:35 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BD8ED58058;
 Tue, 20 Oct 2026 20:41:27 +0000 (GMT)
Received: from mambor8.rchland.ibm.com (unknown [9.10.239.198])
 by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Tue, 20 Oct 2026 20:41:27 +0000 (GMT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=pp1 header.d=ibm.com header.i="@ibm.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:In-Reply-To:Message-ID:Mime-Version:References:Reply-To:Subject:To"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=pp1;
	 bh=ZUXi7wiEMe2tdgO/StfvU9pGNatYDPEYkYpr3SsxzLE=; b=RlDigF9lsTqM
	tTcz67lqRcQIIyKRfsH2omumJlO9v1oYu2keY01iqqNQY/OXRuHPKVgo+dusPdJ7
	TGMAmQzdHEtoUzqBRRB+p2jRhm6uspUWal7wI9ETaxB7v4JQ8JU5l6ekl6yl63h0
	I5F4rs0YN/foiumMEHVENZdyuVKFpnRoCVJlw8ZkHcMXj4EXARAPQW9qDiGT/1W1
	7JY5cppKkFFpP3zE73cbYFUhDIa9gIU/EWG1a0lLAkWMg7J+Tay56rcVl0KlsR7s
	ep0odC2xwDk5qAi4L9bWaylnuZpgl4gDIDJAdCxdP4u5plML+T+q41SD70UW1Go0
	J7KgO4BwPQ==
Message-ID: <b71f57e2e611b24bed7c0db597cfa8acd4336460.camel@linux.ibm.com>
Subject: Re: [PATCH v7 50/65] hw/gpio/pca955x: convert pin/led property to
 QAPI-aware enum
From: Miles Glenn <milesg@linux.ibm.com>
Reply-To: milesg@linux.ibm.com
To: =?ISO-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
        qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>,
        Michael Roth
 <michael.roth@amd.com>, John Snow <jsnow@redhat.com>,
        Peter Maydell
 <peter.maydell@linaro.org>,
        Mauro Carvalho Chehab
 <mchehab+huawei@kernel.org>,
        Pierrick Bouvier
 <pierrick.bouvier@oss.qualcomm.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        "Daniel P." =?ISO-8859-1?Q?Berrang=E9?= <berrange@redhat.com>,
        Kostiantyn
 Kostiuk <kkostiuk@redhat.com>,
        Eric Blake <eblake@redhat.com>, David
 Hildenbrand <david@kernel.org>,
        Igor Mammedov <imammedo@redhat.com>,
        "Edgar
 E. Iglesias" <edgar.iglesias@gmail.com>,
        Jason Wang <jasowangio@gmail.com>,
        Marcelo Tosatti <mtosatti@redhat.com>, kvm@vger.kernel.org,
        Alberto Garcia
 <berto@igalia.com>, Kevin Wolf <kwolf@redhat.com>,
        Hanna Reitz
 <hreitz@redhat.com>,
        Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?=
 <philmd@oss.qualcomm.com>,
        Zhao Liu <zhao1.liu@intel.com>, Jonathan Cameron
 <jic23@kernel.org>,
        Junjie Cao <junjie.cao@intel.com>, Anisa Su
 <anisa.su@samsung.com>,
        Elena Ufimtseva <elena.ufimtseva@oracle.com>,
        Jagannathan Raman <jag.raman@oracle.com>,
        John Levon
 <john.levon@nutanix.com>,
        Thanos Makatos <thanos.makatos@nutanix.com>,
        =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@redhat.com>,
        Cornelia Huck
 <cohuck@redhat.com>, Eric Farman <farman@linux.ibm.com>,
        Matthew Rosato
 <mjrosato@linux.ibm.com>,
        Richard Henderson <richard.henderson@linaro.org>,
        Ilya Leoshkevich <iii@linux.ibm.com>, qemu-block@nongnu.org,
        linux-cxl@vger.kernel.org, qemu-s390x@nongnu.org,
        "Michael S. Tsirkin"
 <mst@redhat.com>, Sergio Lopez <slp@redhat.com>,
        qemu-arm@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
        Alistair Francis
 <alistair.francis@wdc.com>,
        Weiwei Li <liwei1518@gmail.com>,
        Daniel
 Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
        Liu Zhiwei
 <zhiwei_liu@linux.alibaba.com>,
        Chao Liu <chao.liu@processmission.com>, qemu-riscv@nongnu.org,
        Song Gao <17746591750@163.com>, Bibo Mao
 <maobibo@loongson.cn>,
        Xianglai Li <lixianglai@loongson.cn>,
        Jiaxun Yang
 <jiaxun.yang@flygoat.com>,
        Pedro Barbuda <pbarbuda@microsoft.com>,
        Mohamed
 Mediouni <mohamed@unpredictable.fr>,
        Nicholas Piggin <npiggin@gmail.com>,
        Harsh Prateek Bora <harshpb@linux.ibm.com>,
        Amit Machhiwal
 <amachhiw@linux.ibm.com>, qemu-ppc@nongnu.org,
        Zhang Chen
 <zhangckid@gmail.com>, Li Zhijian <lizhijian@fujitsu.com>,
        Alistair Francis
 <alistair@alistair23.me>,
        Alexander Graf <graf@amazon.com>,
        "Gonglei
 (Arei)" <arei.gonglei@huawei.com>,
        zhenwei pi <zhenwei.pi@linux.dev>, Ani
 Sinha <anisinha@redhat.com>,
        Luc Michel <luc@lmichel.fr>,
        =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
        Jamin Lin
 <jamin_lin@aspeedtech.com>,
        Kane Chen <kane_chen@aspeedtech.com>,
        Samuel
 Tardieu <sam@rfc1149.net>, "Denis V. Lunev" <den@openvz.org>,
        FangSheng
 Huang <FangSheng.Huang@amd.com>,
        Tyrone Ting <kfting@nuvoton.com>, Hao Wu
 <wuhaotsh@google.com>,
        Keith Busch <kbusch@kernel.org>, Klaus Jensen
 <its@irrelevant.dk>,
        Jesper Devantier <foss@defmacro.it>,
        Aditya Gupta
 <adityag@linux.ibm.com>, Conor Dooley <conor@kernel.org>,
        Sebastian Huber
 <sebastian.huber@embedded-brains.de>,
        Halil Pasic <pasic@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Jason Herne
 <jjherne@linux.ibm.com>,
        Titus Rwantare <titusr@google.com>,
        Stefano
 Stabellini <sstabellini@kernel.org>,
        Anthony PERARD
 <anthony@xenproject.org>, Peter Xu <peterx@redhat.com>,
        Chinmay Rath
 <rathc@linux.ibm.com>,
        Hendrik Brueckner <brueckner@linux.ibm.com>,
        xen-devel@lists.xenproject.org, Roman Bolshakov <rbolshakov@ddn.com>,
        Phil
 Dennis-Jordan <phil@philjordan.eu>, Fam Zheng <fam@euphon.net>,
        Farhan Ali
 <alifm@linux.ibm.com>, Alex Williamson <alex@shazbot.org>,
        Tao Tang
 <tangtao1634@phytium.com.cn>,
        Stefan Berger <stefanb@linux.vnet.ibm.com>,
        Fabiano Rosas <farosas@suse.de>,
        Mark Cave-Ayland
 <mark.cave-ayland@ilande.co.uk>,
        Artyom Tarasenko <atar4qemu@gmail.com>,
        Yoshinori Sato <yoshinori.sato@nifty.com>,
        Jiri Pirko <jiri@resnulli.us>, Eric Auger <eric.auger@redhat.com>,
        Laurent Vivier <lvivier@redhat.com>
Date: Tue, 20 Oct 2026 15:41:27 -0500
In-Reply-To: <20261020-qom-qapi-v7-50-431a86b02b58@redhat.com>
References: <20261020-qom-qapi-v7-0-431a86b02b58@redhat.com>
	 <20261020-qom-qapi-v7-50-431a86b02b58@redhat.com>
Organization: IBM
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-27.el8_10) 
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: MXNIWy7ihcYs6ZABOpKsku9FGo9K_Fsm
X-Proofpoint-ORIG-GUID: E8l_roD9eJZDAYf_etXkufCAlSk0HsoM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA4MCBTYWx0ZWRfXylQtXOBUYn2S
 8ic3H33Wbx+UaOQcpsfS63FTsNzMONF93+2gyuhJrO/HAENTOynFoSQ/OuYq+F6f3jvj4SyQ1Pj
 kK2NEWGppQTvC8Z3l6yG5RRlieIgMbw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA4MCBTYWx0ZWRfX3CKW0Q6y9zhw
 6Ai+rszw6bufj+NJae9+cn8L4vAgniY6lSu2ZTiMgcZOhgrG9urFqnsQ0BLJYwk3d70Iu66d2sc
 04XYvilt8gzcZpmMhwsqa0/cdEzReOh0/tq54yle+o3U2YbAuolYYXFpQ7aXZTgDdp9BidjSTHa
 a3uIhn/Hrb4CaGBcpGOmUqY+JcGeA9YWkBCUE0ER/iuF3+DmrcjrIidiPjpwKtD9dboXefDQLtg
 TYm88yr9WvhgKUs3Dx6CkrF+qs9i0NMj2Y2qiF4GzusCB0SEJrWIgSkuigDXitLW4wh/cB81T55
 WlTmlX10FEwAMrYNUwotMipdOQ6Zh7OyD6/DUK8c5b2siDndwtiplaPCEYnUrnLtm28OESKDZD2
 /fi6Yc02Ni+Vwub6jYcU3fM8cdHUY1wk5CiqE8Qtk5ivScxwaOP73OuiQU1vlb/opP5WcwYCl0N
 veKhZny0BFO4MtC559Q==
X-Authority-Analysis: v=2.4 cv=Gb2CDgXL c=1 sm=1 tr=0 ts=6ad7d202 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=uAbxVGIbfxUO_5tXvNgY:22 a=20KFwNOVAAAA:8
 a=zBbYNmvnHTV63AnQkW4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 malwarescore=0 spamscore=0 phishscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200080
X-purgate-ID: tlsNG-c1860d/1792528951-D4F4F87B-9AC4E369/0/0
X-purgate-type: clean
X-purgate-size: 19268
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 2026-10-20 at 14:46 +0400, Marc-André Lureau wrote:
> Replaces the runtime-parsed visitor-based QOM property accessors with
> compile-time per-pin/per-LED accessor functions using QEMU_REPEAT.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>  hw/gpio/pca9552.c | 205 +++++++++++++++++++++---------------------------------
>  hw/gpio/pca9554.c | 136 ++++++++++++++----------------------
>  2 files changed, 131 insertions(+), 210 deletions(-)
> 
> diff --git a/hw/gpio/pca9552.c b/hw/gpio/pca9552.c
> index 16741c22dea3..0a007bbbe4ac 100644
> --- a/hw/gpio/pca9552.c
> +++ b/hw/gpio/pca9552.c
> @@ -25,6 +25,7 @@
>  #include "qapi/error.h"
>  #include "qapi/qapi-types-machine.h"
>  #include "qapi/qapi-visit-machine.h"

Do you still need to include qapi/qapi-visit-machine.h?

> +#include "qapi/qapi-type-infos-machine.h"
>  #include "trace.h"
>  #include "qom/object.h"
>  
> @@ -354,33 +355,6 @@ static int pca955x_event(I2CSlave *i2c, enum i2c_event event)
>      return 0;
>  }
>  
> -static void pca955x_get_led(Object *obj, Visitor *v, const char *name,
> -                            void *opaque, Error **errp)
> -{
> -    PCA955xClass *k = PCA955X_GET_CLASS(obj);
> -    PCA955xState *s = PCA955X(obj);
> -    int led, rc, reg;
> -    Pca9552LedState state;
> -
> -    rc = sscanf(name, "led%2d", &led);
> -    if (rc != 1) {
> -        error_setg(errp, "%s: error reading %s", __func__, name);
> -        return;
> -    }
> -    if (led < 0 || led >= k->pin_count) {
> -        error_setg(errp, "%s: invalid led %s", __func__, name);
> -        return;
> -    }
> -    /*
> -     * Get the LSx register as the qom interface should expose the device
> -     * state, not the modeled 'input line' behaviour which would come from
> -     * reading the INPUTx reg
> -     */
> -    reg = PCA9552_LS0 + led / 4;
> -    state = (pca955x_read(s, reg) >> ((led % 4) * 2)) & 0x3;
> -    visit_type_Pca9552LedState(v, name, &state, errp);
> -}
> -
>  /*
>   * Return an LED selector register value based on an existing one, with
>   * the appropriate 2-bit state value set for the given LED number (0-3).
> @@ -391,97 +365,8 @@ static inline uint8_t pca955x_ledsel(uint8_t oldval, int led_num, int state)
>                  ((state & 0x3) << (led_num << 1));
>  }
>  
> -static void pca955x_set_led(Object *obj, Visitor *v, const char *name,
> -                            void *opaque, Error **errp)
> -{
> -    PCA955xClass *k = PCA955X_GET_CLASS(obj);
> -    PCA955xState *s = PCA955X(obj);
> -    int led, rc, reg, val;
> -    Pca9552LedState state;
> -
> -    if (!visit_type_Pca9552LedState(v, name, &state, errp)) {
> -        return;
> -    }
> -    rc = sscanf(name, "led%2d", &led);
> -    if (rc != 1) {
> -        error_setg(errp, "%s: error reading %s", __func__, name);
> -        return;
> -    }
> -    if (led < 0 || led >= k->pin_count) {
> -        error_setg(errp, "%s: invalid led %s", __func__, name);
> -        return;
> -    }
> -
> -    reg = PCA9552_LS0 + led / 4;
> -    val = pca955x_read(s, reg);
> -    val = pca955x_ledsel(val, led % 4, state);
> -    pca955x_write(s, reg, val);
> -}
> -
>  static void pca955x_set_ext_state(PCA955xState *s, int pin, int level);
>  
> -static void pca955x_get_pin(Object *obj, Visitor *v, const char *name,
> -                            void *opaque, Error **errp)
> -{
> -    PCA955xClass *k = PCA955X_GET_CLASS(obj);
> -    PCA955xState *s = PCA955X(obj);
> -    int pin, rc;
> -    uint8_t input_reg;
> -    Pca9552PinState state;
> -
> -    rc = sscanf(name, "pin%2d", &pin);
> -    if (rc != 1) {
> -        error_setg(errp, "%s: error reading %s", __func__, name);
> -        return;
> -    }
> -    if (pin < 0 || pin >= k->pin_count) {
> -        error_setg(errp, "%s invalid pin %s", __func__, name);
> -        return;
> -    }
> -
> -    /*
> -     * Report the raw pin logic level; polarity inversion is a read-time
> -     * transform applied to the INPUT register, not to the pin state itself.
> -     */
> -    input_reg = PCA9535_INPUT0 + (pin / 8);
> -    state = (s->regs[input_reg] >> (pin % 8)) & 0x1;
> -    visit_type_Pca9552PinState(v, name, &state, errp);
> -}
> -
> -static void pca955x_set_pin(Object *obj, Visitor *v, const char *name,
> -                            void *opaque, Error **errp)
> -{
> -    PCA955xClass *k = PCA955X_GET_CLASS(obj);
> -    PCA955xState *s = PCA955X(obj);
> -    int pin, rc;
> -    Pca9552PinState state;
> -    uint8_t config_reg;
> -
> -    if (!visit_type_Pca9552PinState(v, name, &state, errp)) {
> -        return;
> -    }
> -    rc = sscanf(name, "pin%2d", &pin);
> -    if (rc != 1) {
> -        error_setg(errp, "%s: error reading %s", __func__, name);
> -        return;
> -    }
> -    if (pin < 0 || pin >= k->pin_count) {
> -        error_setg(errp, "%s invalid pin %s", __func__, name);
> -        return;
> -    }
> -
> -    /* Only input-configured pins can be driven by an external device. */
> -    config_reg = PCA9535_CONFIG0 + (pin / 8);
> -    if (!((s->regs[config_reg] >> (pin % 8)) & 0x1)) {
> -        qemu_log_mask(LOG_UNIMP,
> -                      "%s: pin %d is configured as output, ignoring set\n",
> -                      s->description, pin);
> -        return;
> -    }
> -
> -    pca955x_set_ext_state(s, pin, state != PCA9552_PIN_STATE_LOW);
> -}
> -
>  static const VMStateDescription pca9552_vmstate = {
>      .name = "PCA9552",
>      .version_id = 0,
> @@ -536,26 +421,92 @@ static void pca9535_reset_hold(Object *obj, ResetType type)
>      s->len = 0;
>  }
>  
> +/*
> + * Get the LSx register as the qom interface should expose the device
> + * state, not the modeled 'input line' behaviour which would come from
> + * reading the INPUTx reg
> + */
> +#define DEFINE_LED_ACCESSORS(n)                                              \
> +static int prop_get_led##n(Object *obj, Error **errp)                        \
> +{                                                                            \
> +    PCA955xState *s = PCA955X(obj);                                          \
> +    uint8_t reg = PCA9552_LS0 + (n) / 4;                                     \
> +    return (pca955x_read(s, reg) >> (((n) % 4) * 2)) & 0x3;                  \
> +}                                                                            \
> +static void prop_set_led##n(Object *obj, int val, Error **errp)              \
> +{                                                                            \
> +    PCA955xState *s = PCA955X(obj);                                          \
> +    uint8_t reg = PCA9552_LS0 + (n) / 4;                                     \
> +    uint8_t old = pca955x_read(s, reg);                                      \
> +    pca955x_write(s, reg, pca955x_ledsel(old, (n) % 4, val));                \
> +}
> +
> +QEMU_REPEAT(PCA955X_PIN_COUNT_MAX, DEFINE_LED_ACCESSORS)
> +
> +#define LED_ENUM_PROP(n) {                                              \
> +    .name = "led" #n,                                                   \
> +    .default_value = -1,                                                \
> +    .qapi_type = &Pca9552LedState_type_info,                            \
> +    .get = prop_get_led##n,                                             \
> +    .set = prop_set_led##n,                                             \
> +},
> +
> +static const QapiEnumProp led_enum_props[] = {
> +    QEMU_REPEAT(PCA955X_PIN_COUNT_MAX, LED_ENUM_PROP)
> +};
> +
> +/*
> + * Report the raw pin logic level; polarity inversion is a read-time
> + * transform applied to the INPUT register, not to the pin state
> + * itself.
> + */
> +#define DEFINE_PIN_ACCESSORS(n)                                              \
> +static int prop_get_pin##n(Object *obj, Error **errp)                        \
> +{                                                                            \
> +    PCA955xState *s = PCA955X(obj);                                          \
> +    uint8_t input_reg = PCA9535_INPUT0 + (n) / 8;                            \
> +    return (s->regs[input_reg] >> ((n) % 8)) & 0x1;                          \
> +}                                                                            \
> +static void prop_set_pin##n(Object *obj, int val, Error **errp)              \
> +{                                                                            \
> +    PCA955xState *s = PCA955X(obj);                                          \
> +    uint8_t config_reg = PCA9535_CONFIG0 + (n) / 8;                          \
> +    /* Only input-configured pins can be driven by an external device */     \
> +    if (!((s->regs[config_reg] >> ((n) % 8)) & 0x1)) {                       \
> +        qemu_log_mask(LOG_UNIMP,                                             \
> +                      "%s: pin %d configured as output, ignoring set\n",     \
> +                      s->description, (n));                                  \
> +        return;                                                              \
> +    }                                                                        \
> +    pca955x_set_ext_state(s, (n), val != PCA9552_PIN_STATE_LOW);             \
> +}
> +
> +QEMU_REPEAT(PCA955X_PIN_COUNT_MAX, DEFINE_PIN_ACCESSORS)
> +
> +#define PIN_ENUM_PROP(n) {                                              \
> +    .name = "pin" #n,                                                   \
> +    .default_value = -1,                                                \
> +    .qapi_type = &Pca9552PinState_type_info,                            \
> +    .get = prop_get_pin##n,                                             \
> +    .set = prop_set_pin##n,                                             \
> +},
> +
> +static const QapiEnumProp pin_enum_props[] = {
> +    QEMU_REPEAT(PCA955X_PIN_COUNT_MAX, PIN_ENUM_PROP)
> +};
> +
>  static void pca955x_initfn(Object *obj)
>  {
>      PCA955xClass *k = PCA955X_GET_CLASS(obj);
>  
>      assert(k->pin_count <= PCA955X_PIN_COUNT_MAX);
> +    /* TODO: use array/list instead of individual QAPI enum properties */
>      for (int ix = 0; ix < k->pin_count; ix++) {
> -        char *name;
> -
>          if (k->has_led_support) {
> -            /* LED variant: expose the LED selector state as led%d. */
> -            name = g_strdup_printf("led%d", ix);
> -            object_property_add(obj, name, "Pca9552LedState",
> -                                pca955x_get_led, pca955x_set_led, NULL, NULL);
> +            object_property_add_qapi_enum(obj, &led_enum_props[ix]);
>          } else {
> -            /* GPIO variant: expose the pin logic level as pin%d. */
> -            name = g_strdup_printf("pin%d", ix);
> -            object_property_add(obj, name, "Pca9552PinState",
> -                                pca955x_get_pin, pca955x_set_pin, NULL, NULL);
> +            object_property_add_qapi_enum(obj, &pin_enum_props[ix]);
>          }
> -        g_free(name);
>      }
>  }
>  
> diff --git a/hw/gpio/pca9554.c b/hw/gpio/pca9554.c
> index e4eddc829ef7..f2a5b94a36d8 100644
> --- a/hw/gpio/pca9554.c
> +++ b/hw/gpio/pca9554.c
> @@ -18,7 +18,7 @@
>  #include "qapi/error.h"
>  #include "qapi/qapi-types-machine.h"
>  #include "qapi/qapi-visit-machine.h"

Do you still need qapi/qapi-visit-machine.h?


> -#include "qapi/visitor.h"
> +#include "qapi/qapi-type-infos-machine.h"
>  #include "trace.h"
>  #include "qom/object.h"
>  
> @@ -151,83 +151,60 @@ static void pca9554_set_ext_state(PCA9554State *s, int pin, int level)
>      }
>  }
>  
> -static void pca9554_get_pin(Object *obj, Visitor *v, const char *name,
> -                            void *opaque, Error **errp)
> -{
> -    PCA9554State *s = PCA9554(obj);
> -    int pin, rc;
> -    Pca9554PinState state;
> -
> -    rc = sscanf(name, "pin%2d", &pin);
> -    if (rc != 1) {
> -        error_setg(errp, "%s: error reading %s", __func__, name);
> -        return;
> -    }
> -    if (pin < 0 || pin >= PCA9554_GET_CLASS(s)->pin_count) {
> -        error_setg(errp, "%s invalid pin %s", __func__, name);
> -        return;
> -    }
> -
> -    /*
> -     * Report the physical pin level. The input register is kept in sync by
> -     * pca9554_update_pin_input(): output pins mirror the OUTPUT register and
> -     * input pins reflect the externally driven (or pulled-up) level, so it
> -     * holds the wire level regardless of the configured direction.
> -     */
> -    state = (s->regs[PCA9554_INPUT] >> pin) & 0x1;
> -    visit_type_Pca9554PinState(v, name, &state, errp);
> +/*
> + * Report the physical pin level. The input register is kept in sync
> + * by pca9554_update_pin_input(): output pins mirror the OUTPUT
> + * register and input pins reflect the externally driven (or
> + * pulled-up) level, so it holds the wire level regardless of the
> + * configured direction.
> + */
> +#define DEFINE_PIN_ACCESSORS(n)                                              \
> +static int prop_get_pin##n(Object *obj, Error **errp)                        \
> +{                                                                            \
> +    PCA9554State *s = PCA9554(obj);                                          \
> +    return (s->regs[PCA9554_INPUT] >> (n)) & 0x1;                            \
> +}                                                                            \
> +static void prop_set_pin##n(Object *obj, int val, Error **errp)              \
> +{                                                                            \
> +    PCA9554State *s = PCA9554(obj);                                          \
> +    if (s->hw_dir) {                                                         \
> +        if (!((s->regs[PCA9554_CONFIG] >> (n)) & 0x1)) {                     \
> +            qemu_log_mask(LOG_UNIMP,                                         \
> +                          "%s: pin %d configured as output,"                 \
> +                          " ignoring set\n",                                 \
> +                          s->description, (n));                              \
> +            return;                                                          \
> +        }                                                                    \
> +        pca9554_set_ext_state(s, (n), val != PCA9554_PIN_STATE_LOW);         \
> +    } else {                                                                 \
> +        /* Legacy behavior: force output mode and drive */                   \
> +        uint8_t mask = 0x1 << (n);                                           \
> +        int v = pca9554_read(s, PCA9554_OUTPUT);                             \
> +        if (val == PCA9554_PIN_STATE_LOW) {                                  \
> +            v &= ~mask;                                                      \
> +        } else {                                                             \
> +            v |= mask;                                                       \
> +        }                                                                    \
> +        pca9554_write(s, PCA9554_OUTPUT, v);                                 \
> +        v = pca9554_read(s, PCA9554_CONFIG);                                 \
> +        v &= ~mask;                                                          \
> +        pca9554_write(s, PCA9554_CONFIG, v);                                 \
> +    }                                                                        \
>  }
>  
> -static void pca9554_set_pin(Object *obj, Visitor *v, const char *name,
> -                            void *opaque, Error **errp)
> -{
> -    PCA9554State *s = PCA9554(obj);
> -    int pin, rc, val;
> -    uint8_t mask;
> -    Pca9554PinState state;
> +QEMU_REPEAT(PCA9554_PIN_COUNT, DEFINE_PIN_ACCESSORS)
>  
> -    if (!visit_type_Pca9554PinState(v, name, &state, errp)) {
> -        return;
> -    }
> -    rc = sscanf(name, "pin%2d", &pin);
> -    if (rc != 1) {
> -        error_setg(errp, "%s: error reading %s", __func__, name);
> -        return;
> -    }
> -    if (pin < 0 || pin >= PCA9554_GET_CLASS(s)->pin_count) {
> -        error_setg(errp, "%s invalid pin %s", __func__, name);
> -        return;
> -    }
> +#define PIN_ENUM_PROP(n) {                                              \
> +    .name = "pin" #n,                                                   \
> +    .default_value = -1,                                                \
> +    .qapi_type = &Pca9554PinState_type_info,                            \
> +    .get = prop_get_pin##n,                                             \
> +    .set = prop_set_pin##n,                                             \
> +},
>  
> -    if (s->hw_dir) {
> -        /* Warn and ignore if the guest has configured this pin as output */
> -        if (!((s->regs[PCA9554_CONFIG] >> pin) & 0x1)) {
> -            qemu_log_mask(LOG_UNIMP,
> -                          "%s: pin %d is configured as output, "
> -                          "ignoring external set\n",
> -                          s->description, pin);
> -            return;
> -        }
> -        /* Drive the external input level */
> -        pca9554_set_ext_state(s, pin, state != PCA9554_PIN_STATE_LOW);
> -    } else {
> -        /* Legacy behavior: force output mode and drive */
> -        /* First, modify the output register bit */
> -        val = pca9554_read(s, PCA9554_OUTPUT);
> -        mask = 0x1 << pin;
> -        if (state == PCA9554_PIN_STATE_LOW) {
> -            val &= ~(mask);
> -        } else {
> -            val |= mask;
> -        }
> -        pca9554_write(s, PCA9554_OUTPUT, val);
> -
> -        /* Then, clear the config register bit for output mode */
> -        val = pca9554_read(s, PCA9554_CONFIG);
> -        val &= ~mask;
> -        pca9554_write(s, PCA9554_CONFIG, val);
> -    }
> -}
> +static const QapiEnumProp pin_enum_props[] = {
> +    QEMU_REPEAT(PCA9554_PIN_COUNT, PIN_ENUM_PROP)
> +};
>  
>  static const VMStateDescription pca9554_vmstate = {
>      .name = "PCA9554",
> @@ -264,16 +241,9 @@ static void pca9554_reset(DeviceState *dev)
>  static void pca9554_initfn(Object *obj)
>  {
>      PCA9554Class *pc = PCA9554_GET_CLASS(obj);
> -    int pin;
>  
> -    for (pin = 0; pin < pc->pin_count; pin++) {
> -        char *name;
> -
> -        name = g_strdup_printf("pin%d", pin);
> -        object_property_add(obj, name, "Pca9554PinState",
> -                            pca9554_get_pin, pca9554_set_pin,
> -                            NULL, NULL);
> -        g_free(name);

Should we have the same TODO comment here as with the 9552 code?

Thanks,

Glenn

> +    for (int pin = 0; pin < pc->pin_count; pin++) {
> +        object_property_add_qapi_enum(obj, &pin_enum_props[pin]);
>      }
>  }
>  
> 


