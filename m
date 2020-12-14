Return-Path: <SRS0=B7AJ=FS=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 168DCC4361B
	for <xen-devel@archiver.kernel.org>; Mon, 14 Dec 2020 07:46:48 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB0DD22838
	for <xen-devel@archiver.kernel.org>; Mon, 14 Dec 2020 07:46:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AB0DD22838
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.51910.90801 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1koiZ5-0006sg-AC; Mon, 14 Dec 2020 07:46:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 51910.90801; Mon, 14 Dec 2020 07:46:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1koiZ5-0006sZ-76; Mon, 14 Dec 2020 07:46:39 +0000
Received: by outflank-mailman (input) for mailman id 51910;
 Mon, 14 Dec 2020 07:46:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fVEM=FS=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1koiZ3-0006sO-Ob
 for xen-devel@lists.xenproject.org; Mon, 14 Dec 2020 07:46:37 +0000
Received: from mail-wr1-x431.google.com (unknown [2a00:1450:4864:20::431])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 09ee6bb4-1e0a-4f04-8e39-c84790cbcc61;
 Mon, 14 Dec 2020 07:46:36 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id i9so15409176wrc.4
 for <xen-devel@lists.xenproject.org>; Sun, 13 Dec 2020 23:46:36 -0800 (PST)
Received: from CBGR90WXYV0
 (host109-146-187-221.range109-146.btcentralplus.com. [109.146.187.221])
 by smtp.gmail.com with ESMTPSA id l8sm22757751wrb.73.2020.12.13.23.46.34
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 13 Dec 2020 23:46:35 -0800 (PST)
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
X-Inumbo-ID: 09ee6bb4-1e0a-4f04-8e39-c84790cbcc61
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:content-language
         :thread-index;
        bh=BHdVfpz+ocsNz74gAxwIP81g3moH3iC8iFGO8Kw/XoA=;
        b=EqIYR0tThu0qgNT9T9xuUohREN7uU3/nYv2o9PZnwkOoy01/33JaIyu7qjOqsBcuBt
         ttZXZnErtJvmoG+OdZZuREtbZKdtqk1cClVT5cU94+1MAhbExhdJUJ+wLJrr0OPNsnds
         WnljGaZ+nCGc0loroMGOehmrR4mhGjlb/nyZz2nzFZ2I5EwLb0JQZ4tgue3wh9DA8wBQ
         LPCqWQ1saSnEsV2iewf7sACgyqhbZtNSpil3n9GJA+y+9HIJSZ9aBAmIrNkpBRmm5bki
         cdHT6QneiqzWsET313O/4GTy/f5RqgWPwTsgQw7dbD1zUi5olGdsus9Mp1k8WVixPPth
         ymCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :content-language:thread-index;
        bh=BHdVfpz+ocsNz74gAxwIP81g3moH3iC8iFGO8Kw/XoA=;
        b=nBz0zMzVbs8dl3NN+6HHKQR7Av1VFc/Raxhw7KKr+2P6oTRNm4sLeTrFuA82LOh0GT
         iXXJShnXI6qvU7uLEbtL/lSaFZ83c1VATzqkTS9xyKVrycX3O2CyS8vpZ2/5oMiEIALD
         uxBGEz4CMAzx7JnAJe27WGao4bQ9Wfo3Njsbcq0Z1zw/pwXZ5rmcBu6C235dsK69zMmN
         jlBkmjeEWhtNgdODgXMRMFQSRoD41+7IkmGFCy7UGb9IU4NagySDFZPX2iU80I33M3Lf
         R6ygRFrtTtXPee3XCqOkW+EayGxJQrcZMSPz057m1DXvVXiwi0M5wP3d5bPdDPRXuAJ8
         +xEA==
X-Gm-Message-State: AOAM533sLqO5ttm5WH0WnFyz5iJI7eZHsUric8yQzYtZMey4HZGzh+HS
	KkcL89Z984yPlVE5hFTMKJA=
X-Google-Smtp-Source: ABdhPJx1o2F74k/LxZ5tJsRx38QeGjW5/fG5PrI1cslg1GHy7K/GNOmK8lswMQAkQ3sLyeXEW4rXaA==
X-Received: by 2002:adf:e688:: with SMTP id r8mr27357468wrm.20.1607931996233;
        Sun, 13 Dec 2020 23:46:36 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: "'Eduardo Habkost'" <ehabkost@redhat.com>,
	<qemu-devel@nongnu.org>
Cc: "'Markus Armbruster'" <armbru@redhat.com>,
	"'Igor Mammedov'" <imammedo@redhat.com>,
	"'Stefan Berger'" <stefanb@linux.ibm.com>,
	=?UTF-8?Q?'Marc-Andr=C3=A9_Lureau'?= <marcandre.lureau@redhat.com>,
	"'Daniel P. Berrange'" <berrange@redhat.com>,
	=?UTF-8?Q?'Philippe_Mathieu-Daud=C3=A9'?= <philmd@redhat.com>,
	"'John Snow'" <jsnow@redhat.com>,
	"'Kevin Wolf'" <kwolf@redhat.com>,
	"'Eric Blake'" <eblake@redhat.com>,
	"'Paolo Bonzini'" <pbonzini@redhat.com>,
	"'Stefan Berger'" <stefanb@linux.vnet.ibm.com>,
	"'Stefano Stabellini'" <sstabellini@kernel.org>,
	"'Anthony Perard'" <anthony.perard@citrix.com>,
	"'Max Reitz'" <mreitz@redhat.com>,
	"'Cornelia Huck'" <cohuck@redhat.com>,
	"'Halil Pasic'" <pasic@linux.ibm.com>,
	"'Christian Borntraeger'" <borntraeger@de.ibm.com>,
	"'Richard Henderson'" <rth@twiddle.net>,
	"'David Hildenbrand'" <david@redhat.com>,
	"'Thomas Huth'" <thuth@redhat.com>,
	"'Matthew Rosato'" <mjrosato@linux.ibm.com>,
	"'Alex Williamson'" <alex.williamson@redhat.com>,
	"'Mark Cave-Ayland'" <mark.cave-ayland@ilande.co.uk>,
	"'Artyom Tarasenko'" <atar4qemu@gmail.com>,
	<xen-devel@lists.xenproject.org>,
	<qemu-block@nongnu.org>,
	<qemu-s390x@nongnu.org>
References: <20201211220529.2290218-1-ehabkost@redhat.com> <20201211220529.2290218-24-ehabkost@redhat.com>
In-Reply-To: <20201211220529.2290218-24-ehabkost@redhat.com>
Subject: RE: [PATCH v4 23/32] qdev: Move dev->realized check to qdev_property_set()
Date: Mon, 14 Dec 2020 07:46:36 -0000
Message-ID: <009c01d6d1ed$40f216b0$c2d64410$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQLXjZRr+qbM/S7ZJ9VMMfP1SWcevwGTHZYap+gmSaA=

> -----Original Message-----
> From: Eduardo Habkost <ehabkost@redhat.com>
> Sent: 11 December 2020 22:05
> To: qemu-devel@nongnu.org
> Cc: Markus Armbruster <armbru@redhat.com>; Igor Mammedov =
<imammedo@redhat.com>; Stefan Berger
> <stefanb@linux.ibm.com>; Marc-Andr=C3=A9 Lureau =
<marcandre.lureau@redhat.com>; Daniel P. Berrange
> <berrange@redhat.com>; Philippe Mathieu-Daud=C3=A9 =
<philmd@redhat.com>; John Snow <jsnow@redhat.com>; Kevin
> Wolf <kwolf@redhat.com>; Eric Blake <eblake@redhat.com>; Paolo Bonzini =
<pbonzini@redhat.com>; Stefan
> Berger <stefanb@linux.vnet.ibm.com>; Stefano Stabellini =
<sstabellini@kernel.org>; Anthony Perard
> <anthony.perard@citrix.com>; Paul Durrant <paul@xen.org>; Max Reitz =
<mreitz@redhat.com>; Cornelia Huck
> <cohuck@redhat.com>; Halil Pasic <pasic@linux.ibm.com>; Christian =
Borntraeger
> <borntraeger@de.ibm.com>; Richard Henderson <rth@twiddle.net>; David =
Hildenbrand <david@redhat.com>;
> Thomas Huth <thuth@redhat.com>; Matthew Rosato =
<mjrosato@linux.ibm.com>; Alex Williamson
> <alex.williamson@redhat.com>; Mark Cave-Ayland =
<mark.cave-ayland@ilande.co.uk>; Artyom Tarasenko
> <atar4qemu@gmail.com>; xen-devel@lists.xenproject.org; =
qemu-block@nongnu.org; qemu-s390x@nongnu.org
> Subject: [PATCH v4 23/32] qdev: Move dev->realized check to =
qdev_property_set()
>=20
> Every single qdev property setter function manually checks
> dev->realized.  We can just check dev->realized inside
> qdev_property_set() instead.
>=20
> The check is being added as a separate function
> (qdev_prop_allow_set()) because it will become a callback later.
>=20
> Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>

Xen parts...

Acked-by: Paul Durrant <paul@xen.org>


