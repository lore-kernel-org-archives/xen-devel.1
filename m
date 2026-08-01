Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 195B6C55173
	for <xen-devel@archiver.kernel.org>; Sat,  1 Aug 2026 12:03:46 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1379972.1624246 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wq8RA-0001tf-ST; Sat, 01 Aug 2026 12:03:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1379972.1624246; Sat, 01 Aug 2026 12:03:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wq8RA-0001tY-PH; Sat, 01 Aug 2026 12:03:32 +0000
Received: by outflank-mailman (input) for mailman id 1379972;
 Sat, 01 Aug 2026 12:03:31 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <brchuckz@netscape.net>) id 1wq8R9-0001tQ-BB
 for xen-devel@lists.xenproject.org; Sat, 01 Aug 2026 12:03:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wq8R8-005qb0-OK
 for xen-devel@lists.xenproject.org; Sat, 01 Aug 2026 14:03:30 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <brchuckz@netscape.net>)
 id 6a6de084-2eae-0a2a0a5409dd-0a2a4501e058-24
 for <xen-devel@lists.xenproject.org>; Sat, 01 Aug 2026 14:03:30 +0200
Received: from [98.137.64.147] (helo=sonic301-21.consmr.mail.gq1.yahoo.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <brchuckz@netscape.net>)
 id 6a6de090-5984-0a2a45010019-628940938312-3
 for <xen-devel@lists.xenproject.org>; Sat, 01 Aug 2026 14:03:29 +0200
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic301.consmr.mail.gq1.yahoo.com with HTTP; Sat, 1 Aug 2026 12:03:28 +0000
Received: by hermes--production-ne1-6f6bdbdd7c-w9xxm (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID ad3319020c74423f6b69925ddd631e52; 
 Sat, 01 Aug 2026 12:03:23 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=a2048 header.d=netscape.net header.i="@netscape.net" header.h="Date:Subject:To:Cc:References:From:In-Reply-To"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netscape.net; s=a2048; t=1785585808; bh=W0MydP2oUX8/HYVYaoYYc6r8/esVa87AQ2CEiLLTU1E=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=ffC9Ik3graT2CJhW++p7INhiiZEAHJIgo3bsG+g/reKKr7HZ/P4uyycCyMpDguWtYS38lLy9zPVLhB5RVYfHLQn86SacE1qCWbjmrdRH8H6NYE3iBqQ8Mhjc0U/LfNXdXuTs/ks5LYZLgOUfFWCNudc/Fh5Ad6OOLDgm/jv8KtOS26ttk2qzBI59+N4gCbbc48i3vJ/dKAcNmgMxKrjImk8jDZlxMjTKo3FU080qFYj/++60OOF1u19i6DIQRIsQ6zEk91nOnfXRB+8FToYJdsPktyZnxKiwwXBf3s5h4tHzHv7mPsy5WZN6SOUlX7goBlGWRpj6g88Rf8HF5lptVA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1785585808; bh=VA3wADtmLWVH2/OEkFO9nIiNxhVsfZRpcgwrie4z1wo=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=TumVOIKNKpXhAVJmMPra0bLYp46neYIUct0hSGptSSiiP03izywkag8iVlv7cvg64oh9NqVpbsTq1SbDqSHaM/rnZy7u+/GFbqgAV46CpILoy8iwNNB1U/3znf0vQIYT1dGIlVGqgk2Lq5JndZfo1kd05515Sm/1iZMPXutm+g2RZH0yiYwjc3RLbJ2uXs0OJJ3VtGKqqDREuhijI0lc9BnavX5jCQLmeYhGgrxQP2fjo3schk4JrS9Jm55fkUZ7q4dU0feMwExuLWdd9HoYa6TQXb83wewLZw0LP/7fulU//MmRM8yrh/haRHjUH4zvwC8UsEmEU0xHmZTQJj657w==
X-YMail-OSG: 7AOkLyYVM1nc0L2KIboVCyc2u3fUpk01ULdAuHHVXgEIrgHjs_utYiXQ7Qhf420
 VT5ESB0Y6XHjA0QySs7e_CVe7JDA8XhV8k0EyCXUUDWHIEsvHsSzeajILGXneruw_uOJc_KgGol_
 7kyGnFb.8NtPYUWKyISUYzLSklmnE8pkyNgwODg0QdjVcDQD4LLGHVEGLpnRdGlxO0OWrJHG9bWA
 MfOID75l5SZ7QYmQvviM38Xx2jrjcPzqtG.LRZRsGdST.nTLnAkmf0J2tZkUfcL.qyHJXGHqeHT0
 DS6RG1elXwk.VYT1TyxR94EIqfwhcXST5HVjEv2azWmcQ10Z.q.EZ1nyAIa8dJ0YPSfr9HHS4R0K
 bX9MEEPiUUFd.Bb6Ba8LmSGpnZ0g3zke7Sp0dtX0p7jn3KBUxrdo89331srrIz.JhSdSJLdw9_0h
 DRn1bD3C3XySL0Hr.8rGMcOnBXJ6LSBYXYJTynxmOlmO_3JOFJ2ZsrasmqFxKl_6xHjUDCvRskm9
 zbwA_bLtxZUcw4F.4TSJrEsAuupNxqBu1IFIpl_SUDAAXvbk9FeAhAiHronBFsykkvr0RTlKsPSj
 h1OnB3xmCY_uhIyrznnyf9GX_gABBChwlX2wfr9s2ycJ8xNPAwLLVtONMNx5wD9E3S7jmTeEK6P5
 5mTvNr4qMBpCnGnBCvmlADi9Aong2W4lTkCBEU7vUiMfQPzu4QanDZfNJ_fDdospmBGNol3aKc_3
 Z9nacZUYws1q1R3GRsDfgBYLcKsjdNYxiFw42kfQFcDfz.GFCqpVNIOZtYrlVQqKCOZUkvNWJAdC
 and42_N3cqaddYlOuYWMYF0_7SC1aGA1UvH6k7MX1edgDOj1kK8Ue7SB1P90UEKXIXlfqzx8Gd5o
 SmC.Z2kWbzKrfojIOswLtDzRvJneint46VOsuhqLa_sODPQ3INjBzvHXfykwjhJ.I2Cp4A2MyQ7L
 Rvdm3HjHd4wLEeamS9TXJ8rVfLV8bMYYJ2t2RxHus_nELfQpvgu9s_2F8C5n6EftOwtU3SbmSIxm
 Mr1U6Ug6pAnR8N6hRFRBrK3Q9fYD8i5yJzTnq2ZPLwcs1kOPagQE31QWVfGz6ZmBw4kphSM2MG48
 S4Ja40GRmTfKYvNZIQzIlnM03HHw3kB99nk07qTDtn4v0lN4mlUMnJAOc2sIO00c4jZ0zC_lVP.x
 HlUrEb6PI8H.jDPXfKRXCB1.hsDQBti4pfK1.3KoGZXjyryBr8r7EknKFzL_EWNcme2toBjP8W8Y
 2qPYWnV_RofGLsIUtbWwIkWLZU5pvNjEIbkDXBhqp7jBR5_Rb2O90Cvqa5Zshq4loupZa8P_Vt7_
 vee549jbJ0OTVf2.D8gnRPdBrouQ5vR6paWvYNJt5R7YeojbZXC3HmahVClWcgjcqoZH.Ew4lLAM
 YslY7bjVWhne0HqbAOhltpVgtc60dvBMhupgUgEoa7PkgUtUPSqtl6H5J9XPqGZyFm95cg0IGb36
 FGxSBesQKzm4NCD6wWRujxR8taVaIg7YID6nrjlM3aQCElD4E8cvKns1eqWR1sKPeg0NdHA5nog6
 SQyi5gPmDyDG1C9h1cq3LEghD9neV0yJ.sFILIifGsLVIrvDAuVhk61PNArv7J26fOQJl166IaUo
 lW7waRJlvMEnQ0ZdcJByL683UlNSLltQ72bIaxs3wPg4iywosj1o9yXd7Ve1j1_OA7o0mo.fV3AH
 jU_4JnOOLMIbwIEzr3Qg01wC8sUZkLl9GL27Ef5bYAcf5PRtu5tD4cTRRamLBjPIjAl8iK0pAfKu
 NbJMB93KLenZRQ5KYqqEH2KBEEBLG5zsT6regLwEFrs81wrYm_WcohyQf9hJmRJv82DL6SNzXbCi
 E9yGmtHUIKvfGwbQJezNDdXwnoiYE5mnpkFJEqlBMjuiW61rAFRePEJqgVK0SZs2UzZlUDrubnge
 ._sszneJ7fX2LIf42Mx9mOG7BaLPUPelWDcyZFO3RkicjEtU092GENvuXqH2kUmhcCjxZRudSaKs
 6DidXiKiR8tDe9ZIsGdJcW8ppLOM...vpipu3sL7SUkGlxAfQKF.wvstak8WnZV9MHBIfvgxqQI0
 WBYuEjB5C9IU_088XSD2tMGI2YUEHU3vetkXbewC6jvgjadaSu426Q4p9NGKi2_zxe6z7NegCAPV
 TEZ9HDGDXVNM1FnjUNNvGkf_ZAyxMattWPy3d0LBVTlM1D8hzR3wtiACeNtbAgkaMtTdAOtqVfhx
 qsZPZOeRuobdkp6rLtMe1.Ff.19IsqWMq4ekCGo78EvpfZYDNpo.Axw--
X-Sonic-MF: <brchuckz@netscape.net>
X-Sonic-ID: c0652755-41f1-40de-b129-bf55e3b14eed
Message-ID: <7e4719b8-7396-4daa-aa8e-4c4836951de9@netscape.net>
Date: Sat, 1 Aug 2026 08:03:23 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/hvmloader: implement Intel IGD extended VBT support
To: xen-devel@lists.xenproject.org
Cc: qemu-devel@nongnu.org, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>, Tomita Moeko <tomitamoeko@gmail.com>
References: <20260801000354.16446-1-brchuckz.ref@aol.com>
 <20260801000354.16446-1-brchuckz@aol.com>
Content-Language: en-US
From: Chuck Zmudzinski <brchuckz@netscape.net>
In-Reply-To: <20260801000354.16446-1-brchuckz@aol.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailer: WebService/1.1.26215 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol
X-purgate-ID: tlsNG-d62444/1785585810-BDA7E757-ED7C9CD1/0/0
X-purgate-type: clean
X-purgate-size: 5498

On 7/31/2026 8:03 PM, Chuck Zmudzinski wrote:
> Modern Intel IGD devices do not work well with the current
> implementation of support for the Intel IGD in hvmloader because
> it lacks support for an extended video bios table (VBT).
> 
> Code 43 errors in Windows guests and failure of the guest screen
> to light up are some of the problems that occur with the
> current implementation.
> 
> To address this problem, this patch implements support for
> Intel IGD devices with an extended VBT and OpRegion version 2
> and higher which is required for most modern Intel IGD devices.
> 
> This patch also depends on compatible support in the device
> model. If hvmloader detects the device model lacks such support,
> it will fall back to the currently implemented protocol for
> configuring the OpRegion to provide backward compatibiltiy for
> systems that lack a device model with support for an extended VBT.
> 
> Support for an extended VBT is implemented in the newly introduced
> function opregion_setup() which is implemented in the new file
> intel_opregion.c.
> 
> Major differences between this implementation and the current
> implemntation that only supports older devices without an
> extended VBT:
> 
> 1. The current implemntation reserves a constant number of
>    pages (3) in the E820 map for the OpRegion which is set by
>    the IGD_OPREGION_PAGES macro in the current implementation.
>    With OpRegion 2 and higher, the OpRegion can have an
>    extended VBT that must be provided to the guest with the
>    OpRegion. This means the size of the region is not fixed,
>    so in this new implementation the IGD_OPREGION_PAGES constant
>    is changed to a variable in e820.c, igd_opregion_e820_pages,
>    that is set to its proper value based on the the size of the
>    VBT. In this new implemntation, the size of the ACPI NVS region
>    reserved for the OpRegion in the E820 map is equal to the value
>    of the igd_opregion_e820_pages variable instead of being set
>    to the constant value determined by IGD_OPREGION_PAGES.
> 
> 2. The current implemntation provides the guest with access
>    to the unmodified OpRegion on the host via memory mapping
>    from the host to the guest. This is insufficient for
>    OpRegion 2 and higher because some devices will require
>    modifications to the OpRegion for proper operation in the
>    guest. So this new implementation provides hvmloader with a
>    copy of the host's OpRegion that hvmloader can modify as
>    needed for proper operation. Mapping the OpRegion from the
>    host to the guest is only used temporarily during setup of
>    the OpRegion by hvmloader and once hvmloader has a copy of
>    the OpRegion and the extended VBT, the device model removes
>    the host mapping and hvmloader configures the guest to use
>    the guest's possibly modified copy of the OpRegion instead.
> 
> 3. The current implementation lacks useful debugging information
>    for the more recent devices. This new implementation provides
>    useful debugging output from hvmloader, such as the detected
>    host OpRegion version and address, the values for rvda, rvds,
>    and the guest OpRegion address when the guest_loglvl is set
>    to all/all.
> 
> Link: https://lore.kernel.org/kvm/20211012124855.52463-1-colin.xu@gmail.com/
> Link: https://lore.kernel.org/kvm/20210325170953.24549-1-fred.gao@intel.com/
> Signed-off-by: Chuck Zmudzinski <brchuckz@aol.com>
> ---
> Later versions of this patch will provide a link to the compatible patch
> for extended VBT support in the device model which will be posted to
> the qemu-devel and xen-devel mailing lists and Cc'd to the appropriate
> maintainers and reviewers soon.

I forgot to mention that there is an undocumented setting that works in
the xl.cfg(5) domain configuration file, firmware_override, that makes it
possible to use a patched version of hvmloader alongside an installation
of unpatched upstream Xen or a version of Xen packaged by a distro. So
one can download the source for one's installed version of Xen, apply this
patch and build just hvmloader and then install the patched version of
hvmloader with a different filename, such as hvmloader-igd-testing, into
the same directory where hvmloader is installed (usually something like
/usr/libexec/xen/boot) and then one can configure a guest to use the patched
version of hvmloader with one's installed version of Xen by adding a line
like this to the domain xl.cfg file:

firmware_override = 'hvmloader-igd-testing'

> 
> The compatible patch for the device model is part of a larger patchset
> that fixes many of the problems that currently affect the feature of
> Intel IGD passthrough to Xen HVM guests. This patch should be considered
> as a companion patch to that patchset for the device model. Do not try
> to test this patch with a real Intel IGD device without also applying
> the patchset for the device model because without those patches, the
> guest will most likely fail to start if an Intel IGD is passed through
> to the guest.
> 
> There are different requirements to support OpRegion version 2.0
> and OpRegion version 2.1+, with support for OpRegion 2 the more
> difficult case because it always requires modifications to the OpRegion
> for proper operation in the guest. For some details about OpRegion
> 2 and higher and the extended VBT, see the links in the commit message.
> 

