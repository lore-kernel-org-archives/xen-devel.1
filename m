Return-Path: <SRS0=Vd0m=MI=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE684C636CA
	for <xen-devel@archiver.kernel.org>; Fri, 16 Jul 2021 16:27:28 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7108C613CF
	for <xen-devel@archiver.kernel.org>; Fri, 16 Jul 2021 16:27:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7108C613CF
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.157654.290345 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m4QgJ-0006vg-PU; Fri, 16 Jul 2021 16:27:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 157654.290345; Fri, 16 Jul 2021 16:27:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m4QgJ-0006vZ-Lz; Fri, 16 Jul 2021 16:27:19 +0000
Received: by outflank-mailman (input) for mailman id 157654;
 Fri, 16 Jul 2021 16:27:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KHJG=MI=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1m4QgI-0006vT-Q2
 for xen-devel@lists.xenproject.org; Fri, 16 Jul 2021 16:27:19 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1b351fb7-12f3-4be6-aea2-44a3086d366b;
 Fri, 16 Jul 2021 16:27:18 +0000 (UTC)
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
X-Inumbo-ID: 1b351fb7-12f3-4be6-aea2-44a3086d366b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1626452838;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=ih5Sho/HDtkgIBTLXNuUZNykrGDoYybbypvcz7CZA6U=;
  b=eXb25GajTK+vdrvHkeLBTotcdi+Ge++6V15Tph191iwww9bCLeYqjyMu
   KLCxP8C9RsYWJQhuSX5eibTdkedpHiziatKX60X65TJkoMOIfNTLynS9D
   gWYfZ2Z2gwRr7BqIRld/CDt7LY89D+vndOhd2qhUYsfbWWDLGiyfL6N7C
   g=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: edHNbH1WkPWpNT38zJUkfSyUKrpdNHh4gAmX94thIv6UBzjiaByvpDPXJva0UrcTFDPWveceEC
 JY+JgLNwD8Blve8+JW9ahBLsO+Fz5LB7TfnnpHCH+fgeMrL0i+dqYKy/gQ/at0jSrhIF71Oew0
 qZag0w9Dox3arXHAaFIn2sVO8BMdU1dOiuHXC7iedbiSjMN9xBxIPxWEgSXcTWib7Vq4lVVdYb
 VLEGVjg2ACuRca7rAE1eyiepteJzL06ARlog0n7E5tiOgUH7HNpKxvesU/nUHjf5SLUxorKpEE
 3LU=
X-SBRS: 5.1
X-MesageID: 48508684
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:3dMfM65Tw3+5DTUIkAPXwAzXdLJyesId70hD6qkQc3Fom62j5q
 WTdZEgvyMc5wx/ZJhNo7690cq7MBHhHPxOgbX5VI3KNGXbUQOTR72KhrGSoAEIdReeygZcv5
 0QCZSXCrfLfCVHZRCR2njFLz4iquP3j5xBnY3lvhNQpZkBUdAZ0+9+YDzrdXFedU19KrcSMo
 GT3cZDryrIQwVtUizqbkN1OdQqvrfw5evbXSI=
X-IronPort-AV: E=Sophos;i="5.84,245,1620705600"; 
   d="scan'208";a="48508684"
Date: Fri, 16 Jul 2021 17:27:13 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: George Dunlap <George.Dunlap@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <Andrew.Cooper3@citrix.com>, Ian Jackson <iwj@xenproject.org>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH] xen: allow XSM_FLASK_POLICY only if checkpolicy
 binary is available
Message-ID: <YPGzYbDVOV3T7zCd@perard>
References: <20210714161734.256246-1-anthony.perard@citrix.com>
 <40A28D22-91BC-438D-99C9-46DF6DA90A5E@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <40A28D22-91BC-438D-99C9-46DF6DA90A5E@citrix.com>

On Fri, Jul 16, 2021 at 04:26:39PM +0100, George Dunlap wrote:
> What this patch does is to make it so that if someone explicitly sets CONFIG_XSM_FLASK_POLICY=y, but doesn’t have checkpolicy, the build system will silently disable the policy behind their backs without telling them?

FYI, silenty disabling unavailable config options is actually
documented, in "INSTALL", section "Xen Hypervisor". ;-) Well kind of.

-- 
Anthony PERARD

