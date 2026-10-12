Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26DF7CA9EC5
	for <xen-devel@archiver.kernel.org>; Mon, 12 Oct 2026 12:18:53 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1446222.1662294 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGEzA-00046T-6H; Mon, 12 Oct 2026 12:18:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1446222.1662294; Mon, 12 Oct 2026 12:18:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGEzA-00046M-3X; Mon, 12 Oct 2026 12:18:32 +0000
Received: by outflank-mailman (input) for mailman id 1446222;
 Mon, 12 Oct 2026 12:18:30 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1300cbf0e00080d7@swg.vates.tech>)
 id 1xGEz8-00045B-N7
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 12:18:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGEz8-004OBe-3B
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 14:18:30 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1300cbf0e00080d7@swg.vates.tech>)
 id 6accd00b-2eae-0a2a0a5409dd-0a2a450cd424-38
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 14:18:30 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1300cbf0e00080d7@swg.vates.tech>)
 id 6accd015-f479-0a2a450c0019-b9ff1c229db3-3
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 14:18:29 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a1300cbf0e00080d7.00a for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 12 Oct 2026 12:18:24 +0000
Received: from l14 (areims-651-1-80-194.w90-18.abo.wanadoo.fr [90.18.187.194])
 (Authenticated sender: anthony.perard)
 by mail2.vates.fr (Postfix) with ESMTPSA id 36CBF81F9C;
 Mon, 12 Oct 2026 14:18:23 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=TAp6qJHwb1BuZFbptVZG/MxxPJ4OhDKCO4NoJ6+UgWU=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=cDr4oayZCkIuc+WbYupfx7YnivJX2pgpzOoI85rqB0AsY2axcbY73xw87azxMi74MP7hzqO1v
 05bXuraevaH5smaaBhRB5e/+2cPWO7a+w3jmkhWNpdPrfZ44wmWvHNUtzXMoBpJmmlysUvnfaKa
 cliN+MX+SiudoBTH5+bbcwLhpznfSE1GcFMAzQ/ibC75bU+jqqpkrws5Niqym/x8i0BDAqxKnYh
 zNBGiHVbT17kDy05AP7RbBiN6LMr0Oh/pJ7X9bU2GA1LInqdWcj7X4dITDvAKWwg3pJQp4qRD9f
 LvgIWgiHBxa2ImfQRdpEhlR3JyxGTPYYDkhrhEKm6AYA==
X-Zone-Loop: b7e8b2c9174127f66944e444a5bac031074d55d6331e
x-campaign-type: default
x-transaction-id: b888df8e-6552-47f9-958e-12b0b573fb19
x-swg-uid: 01-638e2716-74dc-4ce9-84d9-40dda7ecdb67
X-Mailer: Sweego
Message-ID:
 <1791807504.8631fc262581453bbf619ec5b2062170.1a1300cbf0e00080d7@vates.tech>
x-swg-bid: 1791807504.8631fc262581453bbf619ec5b2062170.1a1300cbf0e00080d7
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Mon, 12 Oct 2026 14:18:22 +0200
From: Anthony PERARD <anthony.perard@vates.tech>
To: Julian Vetter <julian.vetter@vates.tech>
Cc: xen-devel@lists.xenproject.org,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Juergen Gross <jgross@suse.com>,
	Andrii Sultanov <andriy.sultanov@vates.tech>,
	Guillaume Thouvenin <guillaume.thouvenin@vates.tech>,
	Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Oleksii Moisieiev <oleksii_moisieiev@epam.com>,
	Timothy Pearson <tpearson@raptorengineering.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH v6 4/5] xen/arm: report clock_frequency via sysctl
 physinfo, not createdomain
References: <1790597845.8631fc262581453bbf619ec5b2062170.1a0e7f2cff3000b504@vates.tech>
 <1790598010.8631fc262581453bbf619ec5b2062170.1a0e7f55818000b504@vates.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1790598010.8631fc262581453bbf619ec5b2062170.1a0e7f55818000b504@vates.tech>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.f0.2dbcc85ed79f6079.1a1300cbc9a.931ebf8cee0f999d=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1791807503515
X-purgate-ID: tlsNG-d25034/1791807510-028DDA5B-F667147A/0/0
X-purgate-type: clean
X-purgate-size: 3637

---=Part.f0.2dbcc85ed79f6079.1a1300cbc9a.931ebf8cee0f999d=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 02:20:00PM +0200, Julian Vetter wrote:
> The xen_arch_domainconfig=2Eclock_frequency value is populated in
> domain_vtimer_init() during XEN_DOMCTL_createdomain from the global
> timer_dt_clock_frequency, which comes from the host's DT timer node and
> has nothing to do with the domain being created=2E Like now removed
> GIC_NATIVE resolution, this is a host-wide system property being
> smuggled out through a domain-creation IN struct=2E
>=20
> Expose it instead as a new arm_clock_frequency_hz field in
> XEN_SYSCTL_physinfo, populated via arch_do_physinfo(), and mirroring how
> the GIC capability bits were already moved there=2E
>=20
> Rather than making the field dependant on DT boot, make Xen always
> report the timer frequency, either via the DT "clock-frequency" node, or
> directly via CNTFRQ_EL0=2E preinit_xen_time() already computes cpu_khz f=
or
> every boot path=2E The renamed timer_clock_frequency_hz now captures
> whichever of the two produced that value, in full Hz precision, instead
> of only recording the DT case=2E So, ACPI guests get a real value too,
> allowing to drop the special case=2E
>=20
> The DT "clock-frequency" property exists because firmware might leave
> CNTFRQ_EL0 wrong, and since CNTFRQ_EL0 cannot be trapped the only fix is
> to replicate the correct value into the guest DT=2E To keep that signal,=
 a
> new XEN_SYSCTL_PHYSCAP_ARM_TIMER_DT_FREQ capability bit records whether
> arm_clock_frequency_hz came from the DT property=2E Then libxl only emit=
s
> a "clock-frequency" property into the guest timer node when that bit is
> set=2E A guest whose CNTFRQ_EL0 is already correct keeps an unmodified
> timer node, exactly as before=2E
>=20
> Although the CNTFRQ_EL0 register is 64 bits wide, and some current timer
> implementations run at 1GHz, a 32bit value is sufficient to store the
> timer value, because it only mirrors the DT 'clock-frequency' property,
> which the bindings define as a single 32-bit cell=2E
>=20
> In struct xen_sysctl_physinfo the new field just reuses the former pad
> word, so sysctl consumers are unaffected=2E struct xen_arch_domainconfig
> however loses clock_frequency from its middle, which shrinks the struct
> and shifts every field after it, so bump XEN_DOMCTL_INTERFACE_VERSION=2E
>=20
> The xen_arch_domainconfig parameter passed to domain_vtimer_init() is no
> longer needed, so drop that parameter entirely=2E libxl now fetches the
> frequency via libxl_get_physinfo() in libxl__arch_domain_save_config()
> instead of reading it back out of the createdomain reply=2E The OCaml
> xen_arch_domainconfig mirror drops the field too=2E
>=20
> Signed-off-by: Julian Vetter <julian=2Evetter@vates=2Etech>
> Reviewed-by: Michal Orzel <michal=2Eorzel@amd=2Ecom>
> ---
> Changes in v6:
> - Rename arch_clock_frequency_hz to arm_clock_frequency_hz
> - Drop now-redundant "# ARM only" comment on the libxl IDL entry
> - Rework libxl__arch_domain_save_config() to a single exit point: fetch
>   physinfo up front and use "goto out" on every error path
> - Move the gic_version IN/OUT -> IN comment update to the GIC_NATIVE
>   removal patch
> - Added Reviewed-by

Reviewed-by: Anthony PERARD <anthony=2Eperard@vates=2Etech>

Thanks,


-- 
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vate=
s solutions

web: https://vates=2Etech
---=Part.f0.2dbcc85ed79f6079.1a1300cbc9a.931ebf8cee0f999d=---

