Return-Path: <SRS0=3Xfx=75=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 987D0C433DF
	for <xen-devel@archiver.kernel.org>; Tue, 16 Jun 2020 15:25:36 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 743C6208B3
	for <xen-devel@archiver.kernel.org>; Tue, 16 Jun 2020 15:25:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 743C6208B3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlDSo-0001Pn-HS; Tue, 16 Jun 2020 15:25:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AL9H=75=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jlDSn-0001PT-Hr
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2020 15:25:25 +0000
X-Inumbo-ID: 9942cdf2-afe5-11ea-8496-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9942cdf2-afe5-11ea-8496-bc764e2007e4;
 Tue, 16 Jun 2020 15:25:24 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 4YeycwbLnR0Q+5ReITbnQGl3JzNlBbWvLCbC/GwLfj7fKXix6wIYIHJLjHr/sYe2Qit9DVvX4E
 /EY1zSLBHxYBeVAiceDHz3YTvIIsCd5sJ9jJH0XJ07wBKbRynwu56eQYuTpsF4gb7D+t5d1AlO
 0oBoOLHFe79S94cQKaY6m48nke/OpqbNIOeLuboZX5Amokw0DhUSLREgBKoffKlJmLtf5LuWNe
 SCv+w+IgE7d+Dm1hEalo/NzjVZWnQ7ll5xQDVjZhlkSCPmC8a/hmlU/8hpyNd4AHWpvF1bgXSI
 TeQ=
X-SBRS: 2.7
X-MesageID: 20178617
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,518,1583211600"; d="scan'208";a="20178617"
Date: Tue, 16 Jun 2020 17:25:15 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH 1/1] x86/acpi: Use FADT flags to determine the PMTMR width
Message-ID: <20200616152515.GQ735@Air-de-Roger>
References: <cover.1592142369.git.gorbak25@gmail.com>
 <dba39869b788f7f9d937fac48f0476a0443925f0.1592142369.git.gorbak25@gmail.com>
 <6b921b43-03f6-448c-297e-8c8f041eea2a@suse.com>
 <20200616103204.GN735@Air-de-Roger>
 <e6356183-cabe-1c54-dc6d-04365d4650a7@suse.com>
 <20200616145951.GP735@Air-de-Roger>
 <cfe13cc5-ce0a-a50f-fed6-8546407d2e81@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cfe13cc5-ce0a-a50f-fed6-8546407d2e81@suse.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: artur@puzio.waw.pl, Wei Liu <wl@xen.org>, jakub@bartmin.ski,
 Andrew Cooper <andrew.cooper3@citrix.com>, marmarek@invisiblethingslab.com,
 Grzegorz Uriasz <gorbak25@gmail.com>, j.nowak26@student.uw.edu.pl,
 xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Jun 16, 2020 at 05:11:58PM +0200, Jan Beulich wrote:
> On 16.06.2020 16:59, Roger Pau Monné wrote:
> > On Tue, Jun 16, 2020 at 03:25:42PM +0200, Jan Beulich wrote:
> >> --- unstable.orig/xen/arch/x86/acpi/boot.c
> >> +++ unstable/xen/arch/x86/acpi/boot.c
> >> @@ -480,7 +480,9 @@ static int __init acpi_parse_fadt(struct
> >>  	if (fadt->header.revision >= FADT2_REVISION_ID) {
> >>  		/* FADT rev. 2 */
> >>  		if (fadt->xpm_timer_block.space_id ==
> >> -		    ACPI_ADR_SPACE_SYSTEM_IO) {
> >> +		    ACPI_ADR_SPACE_SYSTEM_IO &&
> >> +		    (fadt->xpm_timer_block.access_width == 0 ||
> >> +		     fadt->xpm_timer_block.access_width == 3)) {
> > 
> > We should really have defines for those values, or else they seem to
> > imply actual access sizes. What about adding
> > ACPI_ADDR_ACCESS_{LEGACY,BYTE,WORD,DWORD,QWORD}?
> 
> If there were such defines, I'd have used them. Adding them is
> inappropriate though, as this would modify an imported header in a
> Xen-specific way. We could leverage ACPI_ACCESS_BIT_WIDTH() here,
> though.

Yes, that would be better IMO.

Thanks, Roger.

