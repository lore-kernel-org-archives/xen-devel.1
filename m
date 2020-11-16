Return-Path: <SRS0=LqdB=EW=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2012CC4742C
	for <xen-devel@archiver.kernel.org>; Mon, 16 Nov 2020 07:02:39 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 35C1C222B9
	for <xen-devel@archiver.kernel.org>; Mon, 16 Nov 2020 07:02:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 35C1C222B9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=rz.uni-regensburg.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.27672.56264 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1keYWe-0005kI-5j; Mon, 16 Nov 2020 07:02:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 27672.56264; Mon, 16 Nov 2020 07:02:08 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1keYWe-0005kB-2j; Mon, 16 Nov 2020 07:02:08 +0000
Received: by outflank-mailman (input) for mailman id 27672;
 Mon, 16 Nov 2020 07:02:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xL3D=EW=rz.uni-regensburg.de=ulrich.windl@srs-us1.protection.inumbo.net>)
 id 1keYWc-0005k6-Lg
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2020 07:02:06 +0000
Received: from mx2.uni-regensburg.de (unknown [194.94.157.147])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7067ca79-81df-43ba-a8d8-4e7e6e57e626;
 Mon, 16 Nov 2020 07:02:04 +0000 (UTC)
Received: from mx2.uni-regensburg.de (localhost [127.0.0.1])
 by localhost (Postfix) with SMTP id 619BC600004E
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2020 08:02:03 +0100 (CET)
Received: from gwsmtp.uni-regensburg.de (gwsmtp1.uni-regensburg.de
 [132.199.5.51])
 by mx2.uni-regensburg.de (Postfix) with ESMTP id EC2196000052
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2020 08:02:02 +0100 (CET)
Received: from uni-regensburg-smtp1-MTA by gwsmtp.uni-regensburg.de
 with Novell_GroupWise; Mon, 16 Nov 2020 08:02:02 +0100
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=xL3D=EW=rz.uni-regensburg.de=ulrich.windl@srs-us1.protection.inumbo.net>)
	id 1keYWc-0005k6-Lg
	for xen-devel@lists.xenproject.org; Mon, 16 Nov 2020 07:02:06 +0000
X-Inumbo-ID: 7067ca79-81df-43ba-a8d8-4e7e6e57e626
Received: from mx2.uni-regensburg.de (unknown [194.94.157.147])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 7067ca79-81df-43ba-a8d8-4e7e6e57e626;
	Mon, 16 Nov 2020 07:02:04 +0000 (UTC)
Received: from mx2.uni-regensburg.de (localhost [127.0.0.1])
	by localhost (Postfix) with SMTP id 619BC600004E
	for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2020 08:02:03 +0100 (CET)
Received: from gwsmtp.uni-regensburg.de (gwsmtp1.uni-regensburg.de [132.199.5.51])
	by mx2.uni-regensburg.de (Postfix) with ESMTP id EC2196000052
	for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2020 08:02:02 +0100 (CET)
Received: from uni-regensburg-smtp1-MTA by gwsmtp.uni-regensburg.de
	with Novell_GroupWise; Mon, 16 Nov 2020 08:02:02 +0100
Message-Id: <5FB223E8020000A10003CB88@gwsmtp.uni-regensburg.de>
X-Mailer: Novell GroupWise Internet Agent 18.3.0 
Date: Mon, 16 Nov 2020 08:02:00 +0100
From: "Ulrich Windl" <Ulrich.Windl@rz.uni-regensburg.de>
To: <coreboot@coreboot.org>,<grub-devel@gnu.org>,
 <trenchboot-devel@googlegroups.com>, <x86@kernel.org>,
 <u-boot@lists.denx.de>,
 "systemd-devel@lists.freedesktop.org" <systemd-devel@lists.freedesktop.org>,
 <xen-devel@lists.xenproject.org>, <daniel.kiper@oracle.com>,
 <linux-kernel@vger.kernel.org>
Cc: <krystian.hebel@3mdeb.com>,<michal.zygowski@3mdeb.com>,
 <piotr.krol@3mdeb.com>, <mtottenh@akamai.com>, <luto@amacapital.net>,
 <dpsmith@apertussolutions.com>, <andrew.cooper3@citrix.com>,
 <roger.pau@citrix.com>, <allen.cryptic@gmail.com>,
 <btrotter@gmail.com>, <phcoder@gmail.com>,
 <lukasz.hawrylko@intel.com>, <ard.biesheuvel@linaro.org>,
 <tyhicks@linux.microsoft.com>, <pmenzel@molgen.mpg.de>,
 <hun@n-dimensional.de>, <leif@nuviainc.com>,
 <alexander.burmashev@oracle.com>, <eric.devolder@oracle.com>,
 <eric.snowberg@oracle.com>, <joao.m.martins@oracle.com>,
 <kanth.ghatraju@oracle.com>, <konrad.wilk@oracle.com>,
 <ross.philipson@oracle.com>, <javierm@redhat.com>,
 <pjones@redhat.com>, <alecb@umass.edu>,
 "H. Peter Anvin" <hpa@zytor.com>
Subject: Antw: [EXT] [systemd-devel] [SPECIFICATION RFC] The firmware
 and bootloader log specification
References: <20201113235242.k6fzlwmwm2xqhqsi@tomti.i.net-space.pl>
In-Reply-To: <20201113235242.k6fzlwmwm2xqhqsi@tomti.i.net-space.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Content-Disposition: inline

>>> Daniel Kiper <daniel.kiper@oracle.com> schrieb am 14.11.2020 um 00:52 in
Nachricht <20201113235242.k6fzlwmwm2xqhqsi@tomti.i.net-space.pl>:
...
> The members of struct bf_log_msg:
>   ‑ size: total size of bf_log_msg struct,
>   ‑ ts_nsec: timestamp expressed in nanoseconds starting from 0,

Who or what defines t == 0?
...

Regards,
Ulrich Windl


