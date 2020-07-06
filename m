Return-Path: <SRS0=bMr6=AR=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD254C433E0
	for <xen-devel@archiver.kernel.org>; Mon,  6 Jul 2020 09:48:19 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 991F82073E
	for <xen-devel@archiver.kernel.org>; Mon,  6 Jul 2020 09:48:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="ZOT1s780"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 991F82073E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jsNj0-0000RN-Vu; Mon, 06 Jul 2020 09:47:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=G1NU=AR=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jsNiy-0000RE-RT
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2020 09:47:44 +0000
X-Inumbo-ID: bd287e82-bf6d-11ea-8c54-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bd287e82-bf6d-11ea-8c54-12813bfff9fa;
 Mon, 06 Jul 2020 09:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1594028864;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=sqnbfKB3XZ7n+12b9GL9SpftWYstMSgku8osYhTMpDk=;
 b=ZOT1s780nysRFzLNCBVL55Dj9OFukSljbWvnpRoLLJ/azEEvsUzcK6Ub
 Tnny0OWP0Q2X10glib3fEPd2HBJEEtSJZGCVJJnVD4wOzA5Pi/pcyG1Sx
 RbGuCuEop1PGrICNdK+ewYQ5niTuoD/P3kiBsmez0fPajPy1xQWl9jME6 0=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: U8tFnO2KivVWJS3ZndysidKi+4L8DKykSPX4JiHs5EVVxoHlplpbbXp9Sig1HxQFlafNbmFV6T
 Ek4pDTZUfaApp5KMiRAGLjGvOp6okf6p8RyjpLVN0/yNedB3A1kxWM8bQIfINJ0OVdcVOoVKok
 hEtL3OLrLYkvKYfxi6/OotOJy71jCs8gu+3caW6i7OJex7S7OiMdAip/m8w8d2/ur02xkFTamV
 FGOpfxtw1TZUDtNuUcq4Cpcnek/zNEmmiCvExl+acNitFrKYB4Dr1Btzgol5akdHNwH8LVlBik
 g9U=
X-SBRS: 2.7
X-MesageID: 21979292
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,318,1589256000"; d="scan'208";a="21979292"
Subject: Re: [PATCH v5 11/11] tools/proctrace: add proctrace tool
To: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?=
 <michal.leszczynski@cert.pl>
References: <cover.1593974333.git.michal.leszczynski@cert.pl>
 <cover.1593974333.git.michal.leszczynski@cert.pl>
 <e0ac5422825ce307470256aab1652336d5179a9a.1593974333.git.michal.leszczynski@cert.pl>
 <983829150.19744505.1593975521301.JavaMail.zimbra@cert.pl>
 <78e96f30-acf3-ad44-1488-62bf974bd83a@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <d1948f7a-22ed-c525-d7ac-35ea98929a01@citrix.com>
Date: Mon, 6 Jul 2020 10:47:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <78e96f30-acf3-ad44-1488-62bf974bd83a@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
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
Cc: xen-devel@lists.xenproject.org, tamas lengyel <tamas.lengyel@intel.com>,
 luwei kang <luwei.kang@intel.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 06/07/2020 09:33, Jan Beulich wrote:
> On 05.07.2020 20:58, Michał Leszczyński wrote:
>> ----- 5 lip 2020 o 20:55, Michał Leszczyński michal.leszczynski@cert.pl napisał(a):
>>> --- /dev/null
>>> +++ b/tools/proctrace/proctrace.c
>>> +#include <stdlib.h>
>>> +#include <stdio.h>
>>> +#include <sys/mman.h>
>>> +#include <signal.h>
>>> +
>>> +#include <xenctrl.h>
>>> +#include <xen/xen.h>
>>> +#include <xenforeignmemory.h>
>>> +
>>> +#define BUF_SIZE (16384 * XC_PAGE_SIZE)
>> I would like to discuss here, how we should retrieve the trace buffer size
>> in runtime? Should there be a hypercall for it, or some extension to
>> acquire_resource logic?
> Personally I'd prefer the latter, but the question is whether one can
> be made in a backwards compatible way.

I already covered this in v4.

~Andrew

