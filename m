Return-Path: <SRS0=mRjJ=6B=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBBCFC2D0EF
	for <xen-devel@archiver.kernel.org>; Fri, 17 Apr 2020 20:12:30 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A699E221EC
	for <xen-devel@archiver.kernel.org>; Fri, 17 Apr 2020 20:12:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="EZTuNK5q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A699E221EC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jPXLL-0005KJ-Qs; Fri, 17 Apr 2020 20:12:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=z9Py=6B=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jPXLK-0005KE-4H
 for xen-devel@lists.xenproject.org; Fri, 17 Apr 2020 20:12:06 +0000
X-Inumbo-ID: b48fae36-80e7-11ea-8d8e-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b48fae36-80e7-11ea-8d8e-12813bfff9fa;
 Fri, 17 Apr 2020 20:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1587154325;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=gqFwEViAJgrKMTHTCOqBhD2phSQkPExre/t7MwiNmsU=;
 b=EZTuNK5qx/V4bvAtRAC5J5FdTWF9URTx0QHqeQ+8lX2HEwvZRoCiQJrD
 vyKLLZgfBVEa+Psvk/61XES7Sk5pKqrxLzxdl5cWWw2NEHn5fd2IOSQSK
 DiXUUYopuNB3ZEPXdqW21CaddCLDz5Xx5vSqYxf2SNjWyQxf0XAWKJj+t k=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: iU42E3VCpO6/vJVLQOQJpzcsgv/XOdSaJn+rqnOa5JUnpih7ZpTuhNlhIJtYjVGmLwkLnVakcH
 o2S0kvctXTJ10TrVIcwX0AkvzC9yR1U4dt8mJsAa+pD86jMxTBZvXBXpiHCCDpBIqrPC4iFGWA
 AKTXYInR/ksw6bCtOAN98Q2mTBwsoCYX01lGfcTTFzzNT0VdWuTuAQZaeSbUZJJdFFVrwHaqZD
 1nysmVzQvlYLiOLL6kqKcdPJfrXqAH/9LXh4d9eUn8W6eO+qwgOdlpJW7sa68ffgJVY/V8m/AL
 fmQ=
X-SBRS: 2.7
X-MesageID: 15849234
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,395,1580792400"; d="scan'208";a="15849234"
Subject: Re: [PATCH 00/10] x86: mm (mainly shadow) adjustments
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <65bfcd6a-2bb0-da6f-9e85-39f224bd81fb@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <ab717c57-2533-51fb-b14a-7bd19e2fe700@citrix.com>
Date: Fri, 17 Apr 2020 21:12:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <65bfcd6a-2bb0-da6f-9e85-39f224bd81fb@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 17/04/2020 15:23, Jan Beulich wrote:
> Large parts of this series are to further isolate pieces which
> are needed for HVM only, and hence would better not be built
> with HVM=n. But there are also a few other items which I've
> noticed along the road.
>
> 01: mm: no-one passes a NULL domain to init_xen_l4_slots()
> 02: shadow: drop a stray forward structure declaration
> 03: shadow: monitor table is HVM-only
> 04: shadow: sh_update_linear_entries() is a no-op for PV
> 05: mm: monitor table is HVM-only
> 06: shadow: sh_remove_write_access_from_sl1p() can be static
> 07: shadow: the guess_wrmap() hook is needed for HVM only
> 08: mm: pagetable_dying() is HVM-only
> 09: shadow: the trace_emul_write_val() hook is HVM-only
> 10: shadow: don't open-code shadow_blow_tables_per_domain()

Patch 1 I think ought to be dropped.  Everything else Acked-by: Andrew
Cooper <andrew.cooper3@citrix.com>, ideally with the suggested tweak in
patch 3.

~Andrew

