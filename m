Return-Path: <SRS0=Rhtt=CZ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33552C35256
	for <xen-devel@archiver.kernel.org>; Wed, 16 Sep 2020 08:50:26 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB83920872
	for <xen-devel@archiver.kernel.org>; Wed, 16 Sep 2020 08:50:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=trmm.net header.i=@trmm.net header.b="GW/Jorvw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CB83920872
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=trmm.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kIT8q-00032F-05; Wed, 16 Sep 2020 08:50:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HSPg=CZ=trmm.net=hudson@srs-us1.protection.inumbo.net>)
 id 1kIT8n-000325-Vk
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2020 08:50:14 +0000
X-Inumbo-ID: c1d76dc2-8388-48fb-9442-7517298dac9a
Received: from mail-40136.protonmail.ch (unknown [185.70.40.136])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c1d76dc2-8388-48fb-9442-7517298dac9a;
 Wed, 16 Sep 2020 08:50:13 +0000 (UTC)
Date: Wed, 16 Sep 2020 08:50:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=trmm.net;
 s=protonmail; t=1600246211;
 bh=IJU9Q+ln7kVaMFRRF8h4wOiwfI/uEh7VPPx93H3/oTQ=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=GW/JorvwBJ6MzOUteCXrv8FDqxqa5fKlGdfmRzKmhznyGY8pDnHHkB1aaL5I5vA/l
 ZzTn7MYEtW+8oo3gv4VfTFnwrNb0OWvmFYJDD4YfZusn9w70wV3ANUayFN11o/FrEU
 NLKL5BchXABi2CG6IrLp8S3R1uDW/SdAW5N/4Jxs=
To: =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Trammell Hudson <hudson@trmm.net>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "wl@xen.org" <wl@xen.org>
Subject: Re: [PATCH v4 4/4] efi: Do not use command line if secure boot is
 enabled.
Message-ID: <qZE7KyS-f57SLweovl4ooU4DeiB-dOQELVrxH38JpcuZtZawcz98dIu1KU1Dg0jumQ9FLkdw31pVzr6EeObfxqi71JIa8qkZiJ9kXD59ec8=@trmm.net>
In-Reply-To: <20200916074544.GS753@Air-de-Roger>
References: <20200914115013.814079-1-hudson@trmm.net>
 <20200914115013.814079-5-hudson@trmm.net> <20200916074544.GS753@Air-de-Roger>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: Trammell Hudson <hudson@trmm.net>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wednesday, September 16, 2020 3:45 AM, Roger Pau Monn=C3=A9 <roger.pau@c=
itrix.com> wrote:
> On Mon, Sep 14, 2020 at 07:50:13AM -0400, Trammell Hudson wrote:
> > If secure boot is enabled, the Xen command line arguments are ignored.
> > If a unified Xen image is used, then the bundled configuration, dom0
> > kernel, and initrd are prefered over the ones listed in the config file=
.
>
> I understand that you must ignore the cfg option when using the
> bundled image, but is there then an alternative way for passing the
> basevideo and mapbs parameters?

The cfg option will be ignored regardless since a bundled config
(or kernel, ramdisk, etc) takes precedence over any files,
so perhaps parsing the command line is not as much of a risk
as initially thought.

The concern is that *any* non-signed configuration values are
potentially a risk, even if we don't see exactly how the attacker
can use them right now. Especially if an option is added later
and we haven't thought about the security ramifications of it.

> Or there's simply no way of doing so when using secure boot with a
> bundled image?

Should these options be available in the config file instead?
That way the system owner can sign the configuration and ensure
that an adversary can't change them.

> > Unlike the shim based verification, the PE signature on a unified image
> > covers the all of the Xen+config+kernel+initrd modules linked into the
>
> Extra 'the'.

Fixed, along with the style issues in upcoming v5.

--
Trammell

