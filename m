Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35998C61DD6
	for <xen-devel@archiver.kernel.org>; Wed,  2 Sep 2026 14:52:46 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1406035.1639474 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1mKI-0007Gz-Fk; Wed, 02 Sep 2026 14:52:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1406035.1639474; Wed, 02 Sep 2026 14:52:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1mKI-0007Gs-D8; Wed, 02 Sep 2026 14:52:34 +0000
Received: by outflank-mailman (input) for mailman id 1406035;
 Wed, 02 Sep 2026 14:52:32 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0629b6e88000c4f3@swg.vates.tech>)
 id 1x1mKG-0007Gm-52
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 14:52:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x1mKF-007a3c-HW
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 16:52:31 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0629b6e88000c4f3@swg.vates.tech>)
 id 6a98382c-2eae-0a2a0a5409dd-0a2a45018f16-16
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 16:52:31 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0629b6e88000c4f3@swg.vates.tech>)
 id 6a98382f-5984-0a2a45010019-b9ff1c23ac87-3
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 16:52:31 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a0629b6e88000c4f3.004 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 02 Sep 2026 14:52:28 +0000
Received: from l14 (areims-651-1-80-194.w90-18.abo.wanadoo.fr [90.18.187.194])
 (Authenticated sender: anthony.perard)
 by mail2.vates.fr (Postfix) with ESMTPSA id CB7E083EE7;
 Wed,  2 Sep 2026 16:52:27 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=CL2hReGaaWaj54CytTnQ6YJZFUNcFx53xEE3LaY8KZY=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=sDCYh9DCS0lpnQ/yUdxa9P4/MetZJC7ZcElb6T3p4SOKcKRh9tp8qVrUqQtgK0xlOhD3bq1LM
 Yp0Um9YrI3ta8AcKf1TMyiwJW/LkF7j6slSvO+p5bb948pHSKluZ9G2c8/ZC4qSN2QxVeJjZiJ8
 9CqTuxyed6OQUioa4fRaTGw0k6GWXJ+CRqWJe62mJRok0n0Av8Laz/4HWL01MsPRsxFQ8P13cZm
 i/L3yNdhCTfOXxonoDsXd4PYleaaSMT1vdM/xFXZQP96wzACsH24auJ5R5JqQ1ZRPfQ2EPIDFxU
 h3Vef6DcFXoFUAd7q+SEDCiL6m8LWwwyx7p4lyLWzisw==
X-Zone-Loop: f7ad57ef7186d705eceaf2d322db7318785eafcdb9f9
x-campaign-type: default
x-transaction-id: 7967a60f-09b5-4882-a012-f9a6c425ed90
x-swg-uid: 01-0adbc4c7-733b-4b7c-8f8c-fbb6e6b7c5ac
X-Mailer: Sweego
Message-ID:
 <1788360748.8631fc262581453bbf619ec5b2062170.1a0629b6e88000c4f3@vates.tech>
x-swg-bid: 1788360748.8631fc262581453bbf619ec5b2062170.1a0629b6e88000c4f3
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Wed, 2 Sep 2026 16:52:27 +0200
From: Anthony PERARD <anthony.perard@vates.tech>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH v2 1/7] x86: split xen-syms/xen.efi linking rules
References: <9a78fdea-08ba-4e04-bfa1-ba09730a300b@suse.com>
 <8e1b4212-ddb6-424a-91cf-ed80d985825c@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8e1b4212-ddb6-424a-91cf-ed80d985825c@suse.com>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.3472.b97dd43ba83536cf.1a0629b6c5c.5c134587c0e420a3=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1788360748124
X-purgate-ID: tlsNG-d62444/1788360751-1D272757-487E35B3/0/0
X-purgate-type: clean
X-purgate-size: 7342

---=Part.3472.b97dd43ba83536cf.1a0629b6c5c.5c134587c0e420a3=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026 at 02:00:22PM +0200, Jan Beulich wrote:
> Doing so, besides (hopefully) adding clarity (not the least by way of
> using pattern rules where possible), also avoids explicit recursive
> $(MAKE) invocations=2E For xen-syms move re-usable helper rules to a new
> scripts/Makefile=2Elink=2E
>=20
> While doing so, re-order =2Emap file creation (which can in principle fa=
il)
> and check-endbr=2Esh invocation ahead of putting in place the final imag=
e
> (which is now the result of a simple rename)=2E
>=20
> Also drop --source-name=3D from the tools/symbols invocation which has
> --empty passed, for being meaningless there=2E
>=20
> Note that the original "rm" at the end of the rule needs limiting:
> Removing intermediate files (which $(MAKE) doesn't itself remove) would
> cause re-linking even when installing as root (when common/version=2Eo i=
s
> left unaltered, and hence an incremental build should do nothing as long
> as nothing else changed in the source tree)=2E

But as far as I can tell, both `rm` command are still the same,
unaltered=2E And both command do removes file mark as intermediate via
=2EINTERMEDIATE, before make would do so=2E Without the `rm` commands, mak=
e
would leave alone "=2Exen*=2E*=2Eo=2Esym" and "=2E=2Exen*=2E*=2Eo=2Ed"=2E

> Signed-off-by: Jan Beulich <jbeulich@suse=2Ecom>
> ---
> I'd like to keep the "beautification" part, i=2Ee=2E transforming to mor=
e use
> of Kbuild=2Einclude machinery, separate=2E

Sounds good to me=2E One step at a time=2E

> The check-endbr=2Esh invocation doesn't fit neatly into this model=2E I =
was
> considering to move it into $(TARGET)'s rule, but that's not very nice
> either (both because it'd be odd [strictly speaking: wrong] for xen=2Eef=
i,
> and because it would reduce parallelism)=2E
> ---
> v2: Mark intermediate files as such=2E Don't use $(if_changed =2E=2E=2E)=
=2E
>=20
> --- a/xen/arch/x86/Makefile
> +++ b/xen/arch/x86/Makefile
> @@ -102,12 +102,6 @@ notes_phdrs =3D --notes
> +LAST_LINKING_PASS :=3D 2
> +
> +final-image-check-$(CONFIG_XEN_IBT) =3D $(SHELL) $(srctree)/tools/check=
-endbr=2Esh $<

How about removing $< from this macro, and letting the users of
$(final-image-check-y) decide which argument to use?

> +
> +include scripts/Makefile=2Elink
> =20
>  $(obj)/note=2Eo: $(TARGET)-syms
>  	$(OBJCOPY) -O binary --only-section=3D=2Enote=2Egnu=2Ebuild-id $< $@=
=2Ebin
> @@ -191,51 +165,69 @@ note_file_option ?=3D $(note_file)
> =20
>  extra-$(XEN_BUILD_PE) +=3D efi=2Elds
>  ifeq ($(XEN_BUILD_PE),y)
> -$(TARGET)=2Eefi: $(obj)/efi/relocs-dummy=2Eo $(obj)/efi/relocs-empty=2E=
o $(obj)/efi/mkreloc
> -$(TARGET)=2Eefi: $(objtree)/prelink=2Eo $(note_file) $(obj)/efi=2Elds
> +
> +=2EINTERMEDIATE: $(addprefix =2E$(TARGET)=2Eefi=2E, \
> +                           $(foreach n, 0 1 2, \
> +                                     $(n) alt=2E$(n) $(n)r=2Eo $(n)s=2E=
o $(n)r=2ES $(n)s=2ES))
> +
> +=2E$(TARGET)=2Eefi=2E%=2Eo: =2E$(TARGET)=2Eefi=2E%=2ES FORCE

Left over "FORCE" from v1=2E Without if_changed we should let make decide
to execute the recipe or not=2E

> +	$(call cmd,cc_o_S)
> +
> +=2E$(TARGET)=2Eefi=2E1r=2ES: =2E$(TARGET)=2Eefi=2E0 $(if $(relocs-dummy=
),=2E$(TARGET)=2Eefi=2Ealt=2E0)
> +=2E$(TARGET)=2Eefi=2E2r=2ES: =2E$(TARGET)=2Eefi=2E1 $(if $(relocs-dummy=
),=2E$(TARGET)=2Eefi=2Ealt=2E1)
> +
> +=2E$(TARGET)=2Eefi=2E0r=2Eo: $(obj)/efi/relocs-dummy=2Eo $(obj)/efi/mkr=
eloc
> +	ln -sf $< $@

Why mkreloc is a prerequisite of this rule? It's not use here=2E

It could be move to the next rule, where it is actually used, and we
could use order-only prerequisite, so $^ won't be altered=2E I've check,
order-only prereq where introduced in make 3=2E80 according to the
changelog of 3=2E81=2E And they are not part of the $^ variable=2E

But the target won't get rebuilt if mkreloc is changed=2E So order-only
might not be the right type of prerequisite=2E

> +
> +=2E$(TARGET)=2Eefi=2E%r=2ES:
> +	$(MKRELOC) $^ > $@
> +
> +=2E$(TARGET)=2Eefi=2E0s=2ES:
> +	$(objtree)/tools/symbols $(all_symbols) --empty > $@
> +
> +=2E$(TARGET)=2Eefi=2E1s=2ES: =2E$(TARGET)=2Eefi=2E0
> +=2E$(TARGET)=2Eefi=2E2s=2ES: =2E$(TARGET)=2Eefi=2E1
> +
> +=2E$(TARGET)=2Eefi=2E%s=2ES:
> +	$(NM) -pa --format=3Dsysv $< \
> +	  | $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
> + 	    --source-name=3D$(TARGET)=2Eefi=2ES \
> +	  > $@
> +
> +# See above for why $(note_file) needs removing here=2E
> +efi-objs =3D $(filter-out $(note_file),$(filter %=2Eo,$^))
> +
> +=2E$(TARGET)=2Eefi=2E%: $(objtree)/prelink=2Eo =2E$(TARGET)=2Eefi=2E%r=
=2Eo \
> +                  =2E$(TARGET)=2Eefi=2E%s=2Eo $(note_file) $(obj)/efi=
=2Elds
> +	$(LD) $(call EFI_LDFLAGS,$(VIRT_BASE)) -T $(obj)/efi=2Elds $(efi-objs)=
 \
> +	      --strip-debug $(note_file_option) -o $@

This command have changed compared to what we have currently, for the
step "=2Exen=2Eefi=2E0"=2E In the case where $(relocs-dummy) is empty, thi=
s
command doesn't have relocs-dummy=2Eo on the command line=2E With this pat=
ch,
the object is added, via =2Exen=2Eefi=2E1r=2Eo=2E Is this fine?

> +
> +=2E$(TARGET)=2Eefi=2Ealt=2E%: $(objtree)/prelink=2Eo =2E$(TARGET)=2Eefi=
=2E%r=2Eo \
> +                      =2E$(TARGET)=2Eefi=2E%s=2Eo $(note_file) $(obj)/e=
fi=2Elds
> +	$(LD) $(call EFI_LDFLAGS,$(ALT_BASE)) -T $(obj)/efi=2Elds $(efi-objs) =
\
> +	      --strip-debug $(note_file_option) -o $@
> +
> --- /dev/null
> +++ b/xen/scripts/Makefile=2Elink
> @@ -0,0 +1,51 @@
> +# SPDX-License-Identifier: GPL-2=2E0
> +# =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> +# Helper rules for linking xen-syms
> +# =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> +
> +syms-warn-dup-y :=3D --warn-dup
> +syms-warn-dup-$(CONFIG_SUPPRESS_DUPLICATE_SYMBOL_WARNINGS) :=3D
> +syms-warn-dup-$(CONFIG_ENFORCE_UNIQUE_SYMBOLS) :=3D --error-dup
> +
> +orphan-handling-$(call ld-option,--orphan-handling=3Dwarn) :=3D --orpha=
n-handling=3Dwarn
> +
> +final-image-check-y ?=3D true
> +
> +=2EINTERMEDIATE: $(addprefix =2E$(TARGET)-syms=2E,$(foreach n,0 1 2 3,$=
(n) $(n)=2Eo $(n)=2ES))
> +
> +=2E$(TARGET)-syms=2E%=2Eo: =2E$(TARGET)-syms=2E%=2ES
> +	$(call cmd,cc_o_S)

That recipe change slight we what's currently in tree, there's now
"-DXEN_BUILD_EFI -DBUILD_ID_EFI", but that's probably fine, CFLAGS-y
from xen/arch/x86/Makefile are now taken into account=2E (That's
likely the case also for =2Exen=2Eefi=2E%=2Eo but I haven't checked=2E)


Overall, the changes looks good to me=2E

Thanks,


-- 
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vate=
s solutions

web: https://vates=2Etech
---=Part.3472.b97dd43ba83536cf.1a0629b6c5c.5c134587c0e420a3=---

