Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F31C606A31D
	for <xen-devel@archiver.kernel.org>; Fri, 23 Oct 2026 19:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=S2kPSjLf
Received: from list by lists.xenproject.org with outflank-mailman.1459204.1671429 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xKKvV-0001z4-UL; Fri, 23 Oct 2026 19:27:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1459204.1671429; Fri, 23 Oct 2026 19:27:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xKKvV-0001w7-On; Fri, 23 Oct 2026 19:27:41 +0000
Received: by outflank-mailman (input) for mailman id 1459204;
 Fri, 23 Oct 2026 12:04:52 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <mst@redhat.com>) id 1xKE0y-00062g-0m
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2026 12:04:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xKE0x-00AEic-E3
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2026 14:04:51 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <mst@redhat.com>)
 id 6adb4d52-2eae-0a2a0a5409dd-0a2a4504c106-30
 for <xen-devel@lists.xenproject.org>; Fri, 23 Oct 2026 14:04:51 +0200
Received: from [170.10.133.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <mst@redhat.com>)
 id 6adb4d62-b57f-0a2a45040019-aa0a857cc531-3
 for <xen-devel@lists.xenproject.org>; Fri, 23 Oct 2026 14:04:51 +0200
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-648-RNn1o_AYP7626sFnSx-wfw-1; Fri, 23 Oct 2026 08:04:48 -0400
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-48af4046a3bso857164f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 23 Oct 2026 05:04:48 -0700 (PDT)
Received: from redhat.com ([2a06:c701:73f6:2400:30a8:9e33:7d82:c035])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e37edce4fsm5022761f8f.6.2026.10.23.05.04.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 05:04:45 -0700 (PDT)
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
	s=mimecast20190719; t=1792757090;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ktFG9S7cIu86S66z6woz0uEJeRaYlQD7UfoTSNONZWI=;
	b=S2kPSjLfswkW3Ui3xIO+tGRdKjde7UuboyKe4nd9SiW3pwvCp+DmA+bPsGEQxQvMX+lXgm
	51hDMNY3Sw0Ikl2ujEMg3cosUeHuTxlVRo8XrNvYPSDbRd04ZQ6qHxRItUFTQXCRx/nd9a
	3lw1bbqGLdOu4BHQgojdUARnmCRmZzU=
X-MC-Unique: RNn1o_AYP7626sFnSx-wfw-1
X-Mimecast-MFC-AGG-ID: RNn1o_AYP7626sFnSx-wfw_1792757087
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792757087; x=1793361887;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ktFG9S7cIu86S66z6woz0uEJeRaYlQD7UfoTSNONZWI=;
        b=gB0P4livGXF736rxk7/1z4RfaMFv7Lpwpkct1Q15DIgg3uJmXRA+LpmFeL8OZAGGAD
         0pSJxhSNAFDjQ2anV0lqih9gtrqU+E1cVQQzDyLm+niIn7VwSjOZ4ChHVFog0PkAdEee
         ptGVW2GDlb3haTTOmh/vR1Og+4XDaD1G8pbiOUOZStzIhjIYCsQP+hVJ5aSA3Zg4CL1M
         cte3rYUSZtvx4AMdpH8tFyRBclHiyw7SEHu/Drsc8QKwU7i0bXs7YWl+gO7fdz7i7z9V
         G4zlRcvCXgYg3d4p4cs98D6nfA6inIOzTUOzfBFLeIJ6Bzlx9Q8ua/M3J9Fxnjxm4Ci+
         /qDg==
X-Forwarded-Encrypted: i=1; AKwUvBwsuJPPyuKdOI3JkxBUrUwieeNGcfPVXVR6kRlJ6KdmXNkCLRYwywaKjCz1DVoHSOfUYMa9cw0fdU0=@lists.xenproject.org
X-Gm-Message-State: AFq9FYL2rE3LncA0PPvzz11RiV8a9L4KFvDMZ3Q2IoxDWS3qssgL8bjb
	2+ue5uaxZk6qpQLbM/emX9iBqkJwQmo0qxq6XKYmzuWt092nPRUhBbjYzY8k3wJpwIhUI2Cy9ig
	ubVH2Zog1/J54AlHGfADFJ3O7URXRSft42wi+SdTvikFAVmuHzgWNLp1ur7g37fbjgdrh
X-Gm-Gg: AYBFou0Jf0C4A8k22MWL4DO2xbIBlpemp+BVUWXdbXqjDrexZ/l3/B0EoqctA/92ngJ
	Rfp8JKkPxsEpYLxpmonLDFLNrmqIpRiaP3IhLq7ocnBfNGmXCOG6lyTo4R1Q9rBJcJyFQRPaP0w
	boH9ShKp2a2RE8q1yzTva+XjJxFL+pk3FewZd1t2/yvKcg7MbqE9ecAHFx1kL4PZFnCYYYe07EK
	0mRtofTYMIrPzZiGw69oLV87BMhVxqLq60IkMs0zbGqJdm/ynqb4hzu90QpcD3lVLqxV1u4stwS
	PpisLnzru+70qy7tiKT6cGsgwsOh5KlHrJOO1ieuIsZuUkqv6GddKxNGW+UjLKIlUjswr58=
X-Received: by 2002:a05:6000:4a0a:b0:48e:1299:663f with SMTP id ffacd0b85a97d-48e385b0d95mr3400701f8f.56.1792757086768;
        Fri, 23 Oct 2026 05:04:46 -0700 (PDT)
X-Received: by 2002:a05:6000:4a0a:b0:48e:1299:663f with SMTP id ffacd0b85a97d-48e385b0d95mr3400583f8f.56.1792757085931;
        Fri, 23 Oct 2026 05:04:45 -0700 (PDT)
Date: Fri, 23 Oct 2026 08:04:36 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>
Cc: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
	qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
	Michael Roth <michael.roth@amd.com>, John Snow <jsnow@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Kostiantyn Kostiuk <kkostiuk@redhat.com>,
	Eric Blake <eblake@redhat.com>,
	David Hildenbrand <david@kernel.org>,
	Igor Mammedov <imammedo@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Jason Wang <jasowangio@gmail.com>,
	Marcelo Tosatti <mtosatti@redhat.com>, kvm@vger.kernel.org,
	Alberto Garcia <berto@igalia.com>, Kevin Wolf <kwolf@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@oss.qualcomm.com>,
	Zhao Liu <zhao1.liu@intel.com>, Jonathan Cameron <jic23@kernel.org>,
	Junjie Cao <junjie.cao@intel.com>, Anisa Su <anisa.su@samsung.com>,
	Elena Ufimtseva <elena.ufimtseva@oracle.com>,
	Jagannathan Raman <jag.raman@oracle.com>,
	John Levon <john.levon@nutanix.com>,
	Thanos Makatos <thanos.makatos@nutanix.com>,
	=?iso-8859-1?Q?C=E9dric?= Le Goater <clg@redhat.com>,
	Cornelia Huck <cohuck@redhat.com>,
	Eric Farman <farman@linux.ibm.com>,
	Matthew Rosato <mjrosato@linux.ibm.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Ilya Leoshkevich <iii@linux.ibm.com>, qemu-block@nongnu.org,
	linux-cxl@vger.kernel.org, qemu-s390x@nongnu.org,
	Sergio Lopez <slp@redhat.com>, qemu-arm@nongnu.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Weiwei Li <liwei1518@gmail.com>,
	Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Chao Liu <chao.liu@processmission.com>, qemu-riscv@nongnu.org,
	Song Gao <17746591750@163.com>, Bibo Mao <maobibo@loongson.cn>,
	Xianglai Li <lixianglai@loongson.cn>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Pedro Barbuda <pbarbuda@microsoft.com>,
	Mohamed Mediouni <mohamed@unpredictable.fr>,
	Nicholas Piggin <npiggin@gmail.com>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	Amit Machhiwal <amachhiw@linux.ibm.com>, qemu-ppc@nongnu.org,
	Zhang Chen <zhangckid@gmail.com>,
	Li Zhijian <lizhijian@fujitsu.com>,
	Alistair Francis <alistair@alistair23.me>,
	Alexander Graf <graf@amazon.com>,
	"Gonglei (Arei)" <arei.gonglei@huawei.com>,
	zhenwei pi <zhenwei.pi@linux.dev>, Ani Sinha <anisinha@redhat.com>,
	Luc Michel <luc@lmichel.fr>,
	=?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
	Jamin Lin <jamin_lin@aspeedtech.com>,
	Kane Chen <kane_chen@aspeedtech.com>,
	Samuel Tardieu <sam@rfc1149.net>, "Denis V. Lunev" <den@openvz.org>,
	FangSheng Huang <FangSheng.Huang@amd.com>,
	Tyrone Ting <kfting@nuvoton.com>, Hao Wu <wuhaotsh@google.com>,
	Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
	Jesper Devantier <foss@defmacro.it>,
	Aditya Gupta <adityag@linux.ibm.com>,
	Glenn Miles <milesg@linux.ibm.com>, Conor Dooley <conor@kernel.org>,
	Sebastian Huber <sebastian.huber@embedded-brains.de>,
	Halil Pasic <pasic@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Jason Herne <jjherne@linux.ibm.com>,
	Titus Rwantare <titusr@google.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Peter Xu <peterx@redhat.com>, Chinmay Rath <rathc@linux.ibm.com>,
	Hendrik Brueckner <brueckner@linux.ibm.com>,
	xen-devel@lists.xenproject.org,
	Roman Bolshakov <rbolshakov@ddn.com>,
	Phil Dennis-Jordan <phil@philjordan.eu>, Fam Zheng <fam@euphon.net>,
	Farhan Ali <alifm@linux.ibm.com>,
	Alex Williamson <alex@shazbot.org>,
	Tao Tang <tangtao1634@phytium.com.cn>,
	Stefan Berger <stefanb@linux.vnet.ibm.com>,
	Fabiano Rosas <farosas@suse.de>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: [PATCH v7 54/65] qdev: adjust PciDevfn declared type
Message-ID: <20261023072206-mutt-send-email-mst@kernel.org>
References: <20261020-qom-qapi-v7-0-431a86b02b58@redhat.com>
 <20261020-qom-qapi-v7-54-431a86b02b58@redhat.com>
 <atsxLV5YZo8dr-8G@redhat.com>
 <CAMxuvazd7G_NBOM_c6BxZn5PFSw=XQUHueHqBoQQfpzPPgi9qA@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CAMxuvazd7G_NBOM_c6BxZn5PFSw=XQUHueHqBoQQfpzPPgi9qA@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Qx1QBoSGGKEhzTLDemWQri86wJSXDH2q13Y1MQwv9kw_1792757087
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1792757091-C30CDB50-DDC26F48/0/0
X-purgate-type: clean
X-purgate-size: 3079
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 23, 2026 at 03:39:22PM +0400, Marc-André Lureau wrote:
> Hi
> 
> On Fri, Oct 23, 2026 at 2:04 PM Daniel P. Berrangé <berrange@redhat.com> wrote:
> >
> > On Tue, Oct 20, 2026 at 02:46:11PM +0400, Marc-André Lureau wrote:
> > > PciDevfn is a bit special, since it accepts integer and string as
> > > setter, but only output integer as getter.
> > >
> > > Unfortunately, we can't declare an alternate str|int QAPI type for it,
> > > since: branch 'string' can't be distinguished from 'integer'
> > >
> > > Rather than declaring it as "str", use the common type instead.
> > >
> > > Signed-off-by: Markus Armbruster <armbru@redhat.com>
> > > Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> > > ---
> > >  hw/core/qdev-properties-system.c | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/hw/core/qdev-properties-system.c b/hw/core/qdev-properties-system.c
> > > index 5bfdfe1ab9d9..3381de1144d6 100644
> > > --- a/hw/core/qdev-properties-system.c
> > > +++ b/hw/core/qdev-properties-system.c
> > > @@ -904,7 +904,8 @@ static char *print_pci_devfn(Object *obj, const Property *prop)
> > >  }
> > >
> > >  const PropertyInfo qdev_prop_pci_devfn = {
> > > -    .type  = "str",
> > > +    /* The formatted string accepted by the setter is a CLI convenience. */
> >
> > IIUC, this is not limited to the CLI, it will work anywhere the JSON
> > syntax is permitted which is both CLI and QMP.
> >
> > libvirt uses this string syntax:
> >
> >   -device '{"driver":"pcie-root-port","port":9,"chassis":2,"id":"pci.2","bus":"pcie.0","multifunction":true,"addr":"0x1.0x1"}' \
> >
> > > +    .type  = "int32",
> > >      .description = "Slot and optional function number, example: 06.0 or 06",
> >
> >
> > Changing the type to 'int32', where 99% of usage is input only
> > and string based, is pretty unpleasant. Even more so that the
> > description doesn't even mention encoding dev+function as an
> > integer.
> 
> This is purely a metadata change, the setter still accepts both str &
> int, so I don't think this change blocks this series. But I agree we
> could do better.
> 
> There are multiple options. We could keep declaring the property as
> str instead. In this case, the getter should probably return a string
> for consistency and correctness. This might surprise some existing
> users though.
> 
> We could introduce new properties like `devfn-str` and `devfn-int`
> that alias the same value.
> 
> We could also introduce a new structured QAPI type.
> 
> Markus, what's your take?
> 
> thanks

I like the idea of a structured type. Will be handy for other things.

> >
> > >      .print = print_pci_devfn,
> > >      .get   = qdev_propinfo_get_int32,
> >
> > With regards,
> > Daniel
> > --
> > |: https://berrange.com       ~~        https://hachyderm.io/@berrange :|
> > |: https://libvirt.org          ~~          https://entangle-photo.org :|
> > |: https://pixelfed.art/berrange   ~~    https://fstop138.berrange.com :|
> >


