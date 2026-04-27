Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB9FAFF8860
	for <xen-devel@archiver.kernel.org>; Mon, 27 Apr 2026 12:47:32 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1294863.1571564 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHLMb-0007RE-Fn; Mon, 27 Apr 2026 12:47:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1294863.1571564; Mon, 27 Apr 2026 12:47:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHLMb-0007R7-Ct; Mon, 27 Apr 2026 12:47:01 +0000
Received: by outflank-mailman (input) for mailman id 1294863;
 Mon, 27 Apr 2026 12:47:00 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19dcefa7237000f373@swg.vates.tech>)
 id 1wHLMa-0007Qu-85
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2026 12:47:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHLMY-00FgIm-5f
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2026 14:46:58 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19dcefa7237000f373@swg.vates.tech>)
 id 69ef5aab-5cb7-0a2a0a5109dd-0a2a450ac1e0-48
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2026 14:46:58 +0200
Received: from [185.255.28.34] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19dcefa7237000f373@swg.vates.tech>)
 id 69ef5ac1-56b3-0a2a450a0019-b9ff1c2298a9-3
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2026 14:46:58 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19dcefa7237000f373.002 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 27 Apr 2026 12:46:52 +0000
Received: from l14 (lfbn-lyo-1-414-55.w2-7.abo.wanadoo.fr [2.7.24.55])
 (Authenticated sender: anthony.perard)
 by mail2.vates.fr (Postfix) with ESMTPSA id 4425B86257;
 Mon, 27 Apr 2026 14:46:52 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=yNv3GZWdnJuUmBT81tuZQ6RqfJ2y2IIOCAcAm6zC9dg=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=FoEnBjsfVKEe8Ivovikyi9aiLaF1k4lJCTGVlobMXe9ySnKbfRyVvTxwFD5yKuaTcJJTt/WQ2
 1eIlxXh5QkgSQWXinG59UehCpRh8xrP6hVpr0p5dWEt0svt13vINQ67/j4mw+epIo2B98UEe9Nr
 LQ3W7RAZITWPtSZxRyeMfEa+zdENFVDzLOP68zJWI9qKzqZXvk+Ae56dwLHIHnoteBy7w03BdbS
 puOBIPvgB1A1gDi0Og8E+oG6OuL7Yx+1oOj2mFDJD2CfvswtOVTON1Gl+M8l/kwKKGCUdJfYXYz
 H1N6j0IR/PZ10xRrq1MWPXWxuaHZs+G2y8kWitd/txLw==
X-Zone-Loop: b2700b57ea5ec49072933ad2e27a08536a4522fa6a6d
x-campaign-type: default
x-transaction-id: 6fafbd85-6eaf-405d-8691-80c2ae55437e
x-swg-uid: 01-3fe0df3f-fbca-41cc-b70b-c9ac24d58f3d
X-Mailer: Sweego
Message-ID:
 <1777294013.8631fc262581453bbf619ec5b2062170.19dcefa7237000f373@vates.tech>
x-swg-bid: 1777294013.8631fc262581453bbf619ec5b2062170.19dcefa7237000f373
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Mon, 27 Apr 2026 14:46:51 +0200
From: Anthony PERARD <anthony.perard@vates.tech>
To: Thierry Escande <thierry.escande@vates.tech>
Cc: xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>,
	Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
	Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: [RFC PATCH v4 0/6] xl: Allow PCI devices to be passthrough'd via
 Qemu command line
References: <1776955586.8631fc262581453bbf619ec5b2062170.19dbace7684000f373@vates.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1776955586.8631fc262581453bbf619ec5b2062170.19dbace7684000f373@vates.tech>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.2953.2ae372a6068e561c.19dcefa6ff4.4de407b991a5f481=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1777294012405
X-purgate-ID: tlsNG-4011c0/1777294018-453638B7-9F98EF3C/0/0
X-purgate-type: clean
X-purgate-size: 3014

---=Part.2953.2ae372a6068e561c.19dcefa6ff4.4de407b991a5f481=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 23, 2026 at 04:46:10PM +0200, Thierry Escande wrote:
> This series adds new 'hotplug' option for PCI device passthrough=2E
>=20
> The current mechanism for device passthrough uses QMP device_add command
> to hot-plug PCI devices to the guest Qemu instance=2E This is an issue f=
or
> guests running on Q35 chipset (preliminary support posted at [1]) since =
the
> Q35 PCI root bus does not support hotplug=2E Devices could be hotplugged=
 to
> a secondary PCI bus but Xen only support 1 PCI bus for now=2E
>=20
> The 'hotplug' option allows to control how devices are attached to the
> guest, either by using the legacy QMP mechanism (this is the default) or=
 by
> passing them directly to the Qemu command line using xen-pci-passthrough
> device=2E

Hi Thierry,

I don't like this new "hotplug" option=2E It is just an implementation
detail on how the device is added to QEMU=2E It is just going to be
confusing for users=2E Because in both case, the device is "cold-plugged",
it just happen to be inserted after QEMU thing it is fully configured,
but the guest hasn't really started yet=2E

It is likely that we implemented the pci passthrough this way because it
worked and because we could reuse the same code path for real hotplug as
well=2E

So, for the patch that is really needed (adding the device on the
command line), we could do just for the Q35 machine, or we could do that
for all guests=2E For the second option, probably the best one, but we are
going to try to find out if everything work as expected, especially
Linux stubdomain=2E

> Example usage in cfg file:
>  pci =3D [ "00:03=2E0,seize=3D1,hotplug=3D0" ]
>=20
> Since Qemu -device option accepts parameters in json format, this
> patchset adds a new internal function libxl__device_pci_get_qapi_json() =
that
> generates the device json object used for both QMP hotplug and command l=
ine
> passing=2E
>=20
> Also, to handle the assignable PCI device list, the function
> libxl_pci_assignable() is renamed as libxl_device_pci_assignable() and i=
s

I though you were renaming a public API function, but the original one
was static with the wrong name=2E (function prefixed with "libxl_", one
underscore, are in the public API, private one to libxl are prefixed
with "libxl__"=2E)

> made available from libxl=2Eh for access in libxl_dm=2Ec=2E 2 other func=
tions are

If you only mean to use a function internally, add it to
libxl_internal=2Eh, I don't want to expose more functions to the API
without a good reason=2E `xl pci-assignable-list` already work, so I don't
think exposing a new function is useful=2E

Cheers,


-- 
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vate=
s solutions

web: https://vates=2Etech
---=Part.2953.2ae372a6068e561c.19dcefa6ff4.4de407b991a5f481=---

