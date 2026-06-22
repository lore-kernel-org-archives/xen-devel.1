Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37542CD98F2
	for <xen-devel@archiver.kernel.org>; Mon, 22 Jun 2026 13:31:15 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1343743.1602970 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wbejv-00018t-K9; Mon, 22 Jun 2026 13:31:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1343743.1602970; Mon, 22 Jun 2026 13:31:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wbejv-00018m-HO; Mon, 22 Jun 2026 13:31:03 +0000
Received: by outflank-mailman (input) for mailman id 1343743;
 Mon, 22 Jun 2026 13:31:02 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19eef86ef2b000701b@swg.vates.tech>)
 id 1wbeju-000184-45
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2026 13:31:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wbejs-006KOz-RX
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2026 15:31:00 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19eef86ef2b000701b@swg.vates.tech>)
 id 6a393909-bab6-0a2a0a5309dd-0a2a4508ae4c-40
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jun 2026 15:31:00 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19eef86ef2b000701b@swg.vates.tech>)
 id 6a393914-9ee7-0a2a45080019-b9ff1c128679-3
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jun 2026 15:31:00 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19eef86ef2b000701b.001 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 22 Jun 2026 13:30:58 +0000
Received: from l14 (lfbn-lyo-1-414-55.w2-7.abo.wanadoo.fr [2.7.24.55])
 (Authenticated sender: anthony.perard)
 by mail2.vates.fr (Postfix) with ESMTPSA id 658F486AF4;
 Mon, 22 Jun 2026 15:30:57 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=GwQ6hm4F0MeoiE3YABrvwHcyKOrf1yvwiCG4hVP2X/8=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=SYcKZZ9iAxkPWKrJwTMkDFldEmCZHvCy6JuiIUHutswNwPrHdF7bhDfcsn5gOmlb7sUbpPKmW
 0CIHTDKkONBEmrePgXQ5u23VGKLOoflj/Kz5oAOEhPoDuDxePzNrBiKk7Ogl5b8/6QMhX2W5D6W
 dW0HR/OocBg/K60pwFjsNlgJHXAzjvwzxUm0oIy2fdBJ+PZODIchQ2IQyr+jqnM+AW7rTQs9C+V
 q1dy7S9K4cE7PwgVh5XHZHkbQzp9w5PZFhciw1qDCBpVZOAkeQ9Uqs8O3yzNdlt1NDebeu9tGsF
 1dZgKxVgkNj9cnHVKWisu7R02/hUrt4v32j0EJSLwByg==
X-Zone-Loop: 59fd5cde602c309d8c9b86fb44b54c8d7e8919a8e922
x-campaign-type: default
x-transaction-id: 02bc8435-eaeb-496a-959c-38877451c82f
x-swg-uid: 01-4ed7bf1c-4b53-44f7-8554-cb86aa18fedb
X-Mailer: Sweego
Message-ID:
 <1782135058.8631fc262581453bbf619ec5b2062170.19eef86ef2b000701b@vates.tech>
x-swg-bid: 1782135058.8631fc262581453bbf619ec5b2062170.19eef86ef2b000701b
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Mon, 22 Jun 2026 15:30:57 +0200
From: Anthony PERARD <anthony.perard@vates.tech>
To: Thierry Escande <thierry.escande@vates.tech>
Cc: xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>
Subject: Re: [RFC PATCH v4 4/6] libxl: Extend libxl__json_object_to_json()
 prototype
References: <1776955586.8631fc262581453bbf619ec5b2062170.19dbace7684000f373@vates.tech>
 <1776955855.8631fc262581453bbf619ec5b2062170.19dbad29220000f373@vates.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1776955855.8631fc262581453bbf619ec5b2062170.19dbad29220000f373@vates.tech>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.939.1e6a0ec3bcff382a.19eef86ec5c.7efd0d5a77d1c01d=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1782135057500
X-purgate-ID: tlsNG-c1860d/1782135060-5CFFD0FA-8241D763/0/0
X-purgate-type: clean
X-purgate-size: 1212

---=Part.939.1e6a0ec3bcff382a.19eef86ec5c.7efd0d5a77d1c01d=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 23, 2026 at 04:50:29PM +0200, Thierry Escande wrote:
> The function libxl__json_object_to_json() returns a json object as
> string in a pretty format=2E

> With support for the new PCI device
> passthrough option hotplug=3D0,=20

That biggining of the sentence, which mention of hotplug=3D0 can be
removed=2E


> the function will be used to generate the
> json string passed to qemu -device command line parameter, but the
> string needs to be in plain format, i=2Ee=2E without carriage return or =
tab
> characters=2E
>=20
> This patch adds a 'pretty' parameter to the function to control the
> output string format=2E
>=20
> Signed-off-by: Thierry Escande <thierry=2Eescande@vates=2Etech>

With the commit message striped of the mention of the "hotplug"
option: Reviewed-by: Anthony PERARD <anthony=2Eperard@vates=2Etech>

Thanks,


-- 
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vate=
s solutions

web: https://vates=2Etech
---=Part.939.1e6a0ec3bcff382a.19eef86ec5c.7efd0d5a77d1c01d=---

