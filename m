Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACDEECA9EC5
	for <xen-devel@archiver.kernel.org>; Mon, 12 Oct 2026 12:32:49 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1446246.1662321 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGFCn-0007rV-JT; Mon, 12 Oct 2026 12:32:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1446246.1662321; Mon, 12 Oct 2026 12:32:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGFCn-0007rO-Fv; Mon, 12 Oct 2026 12:32:37 +0000
Received: by outflank-mailman (input) for mailman id 1446246;
 Mon, 12 Oct 2026 12:32:36 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a13019aa8f00080d7@swg.vates.tech>)
 id 1xGFCm-0007rI-BH
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 12:32:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGFCl-009Sqk-O3
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 14:32:35 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a13019aa8f00080d7@swg.vates.tech>)
 id 6accd362-bab6-0a2a0a5309dd-0a2a4509b29a-24
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 14:32:35 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a13019aa8f00080d7@swg.vates.tech>)
 id 6accd363-be1a-0a2a45090019-b9ff1c23b22f-3
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 14:32:35 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a13019aa8f00080d7.003 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 12 Oct 2026 12:32:30 +0000
Received: from l14 (areims-651-1-80-194.w90-18.abo.wanadoo.fr [90.18.187.194])
 (Authenticated sender: anthony.perard)
 by mail2.vates.fr (Postfix) with ESMTPSA id 0220580034;
 Mon, 12 Oct 2026 14:32:29 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=v3WAVolUNBdAD/WjrQ5F8a3upMbDiOBdT+IgDDOeFKc=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=Tr7TnD6bJN4ymtRB6wmlBRMMlxAWKoAS8LZyI6DdYEn2YyCE7KASR3vWIhoap0FDWF0d3bxe4
 SUTI1bQ3yr9REHsURd1CIp4UJJFV+jGZrrPli/Sc6jkuVnkhrom0npUbB1SFC8lngPhPvwY0NJU
 nPbtjgkjbSpT1D0x2goubeZdeLk91jBKCI/43JO0jL0pFHk1qRtu1b1GNKsdiPY2ahTqCSqqx3L
 d2vjI0x532c+wk2xfH2vwA++4M43Lvnso2rDrrIMAecMT7mVm/Khuvfs5dwlpFyldtPxAExmtGi
 tq0JhgEybVulAl/3v16r42XgSQfszjXo6ZcughekbAAg==
X-Zone-Loop: bccb06bb912f0fbe5f9e8bc020ae44cd6eb73d810284
x-campaign-type: default
x-transaction-id: 54062355-7069-4c47-9308-a4f6ad9277c3
x-swg-uid: 01-cb8a983f-a249-4b8e-971d-87fcfc9abf50
X-Mailer: Sweego
Message-ID:
 <1791808350.8631fc262581453bbf619ec5b2062170.1a13019aa8f00080d7@vates.tech>
x-swg-bid: 1791808350.8631fc262581453bbf619ec5b2062170.1a13019aa8f00080d7
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Mon, 12 Oct 2026 14:32:29 +0200
From: Anthony PERARD <anthony.perard@vates.tech>
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Leigh Brown <leigh@solinno.co.uk>, xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v4 1/2] tools/hotplug/Linux: Add bridge VLAN support
References: <20240517140506.8460-1-leigh@solinno.co.uk>
 <20240517140506.8460-2-leigh@solinno.co.uk>
 <CAKf6xpvprAScrAKN_s1K7EXc+mNXyvS7-3iaqhK8Cu=BKCYrEw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKf6xpvprAScrAKN_s1K7EXc+mNXyvS7-3iaqhK8Cu=BKCYrEw@mail.gmail.com>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.f3.2540ef4c741cd6f.1a13019a78b.1def3c6f87db37fc=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1791808350091
X-purgate-ID: tlsNG-bad1c0/1791808355-3B8D1034-07637423/0/0
X-purgate-type: clean
X-purgate-size: 1629

---=Part.f3.2540ef4c741cd6f.1a13019a78b.1def3c6f87db37fc=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Sat, May 18, 2024 at 08:03:13AM -0400, Jason Andryuk wrote:
> On Fri, May 17, 2024 at 10:05=E2=80=AFAM Leigh Brown <leigh@solinno=2Eco=
=2Euk> wrote:
> >
> > Update add_to_bridge shell function to read the vlan parameter from
> > xenstore and set the bridge VLAN configuration for the VID=2E
> >
> > Add additional helper functions to parse the vlan specification,
> > which consists of one or more of the following:
> >
> > a) single VLAN (e=2Eg=2E 10)=2E
> > b) contiguous range of VLANs (e=2Eg=2E 10-15)=2E
> > c) discontiguous range with base, increment and count
> >    (e=2Eg=2E 100+10x9 which gives VLAN IDs 100, 110, =2E=2E=2E 190)=2E
> >
> > A single VLAN can be suffixed with "p" to indicate the PVID, or
> > "u" to indicate untagged=2E A range of VLANs can be suffixed with
> > "u" to indicate untagged=2E  A complex example would be:
> >
> >    vlan=3D1p/10-15/20-25u
> >
> > This capability requires the iproute2 bridge command to be
> > installed=2E  An error will be generated if the vlan parameter is
> > set and the bridge command is not available=2E
> >
> > Signed-off-by: Leigh Brown <leigh@solinno=2Eco=2Euk>
>=20
> Reviewed-by: Jason Andryuk <jason=2Eandryuk@amd=2Ecom>

Acked-by: Anthony PERARD <anthony=2Eperard@vates=2Etech>

Thanks,


-- 
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vate=
s solutions

web: https://vates=2Etech
---=Part.f3.2540ef4c741cd6f.1a13019a78b.1def3c6f87db37fc=---

