Return-Path: <SRS0=EOea=HE=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B374BC433DB
	for <xen-devel@archiver.kernel.org>; Tue,  2 Feb 2021 00:20:56 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A07964DB1
	for <xen-devel@archiver.kernel.org>; Tue,  2 Feb 2021 00:20:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A07964DB1
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.80236.146670 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6jQl-0006qg-Q7; Tue, 02 Feb 2021 00:20:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80236.146670; Tue, 02 Feb 2021 00:20:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6jQl-0006qZ-N2; Tue, 02 Feb 2021 00:20:31 +0000
Received: by outflank-mailman (input) for mailman id 80236;
 Tue, 02 Feb 2021 00:20:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=33Vw=HE=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1l6jQk-0006qU-FE
 for xen-devel@lists.xenproject.org; Tue, 02 Feb 2021 00:20:30 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bfb0b5e2-c7d7-489e-986b-8efad4bbf45f;
 Tue, 02 Feb 2021 00:20:29 +0000 (UTC)
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
X-Inumbo-ID: bfb0b5e2-c7d7-489e-986b-8efad4bbf45f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612225228;
  h=subject:to:references:from:message-id:date:mime-version:
   in-reply-to:content-transfer-encoding;
  bh=qYRCDf454/9gViQXW6sCARkf8D4a98DJsrtCD/deB/Y=;
  b=PRo/mFU+pG5SNLEvcfuAPzlehRUz3B95W+lRsDXqmVKCbe8xO4KCQvDC
   7UMGvJXy1yRQBc13o2g8KtLoJpsaE+00AZ+slaJJ0ZpMWyRs/qXSLAjl2
   LhPawqFrzhfGyJ6BWxvQEK6pdkJGbuhJIgb1hVuLmkUMexzqp9A1LaUnl
   Y=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: pSXi1n/ArSFDmDmP3Wj2/HrEBHF7dcBtMvr/FAXyN/chPv76xa5CkPeVyBtw39o6e6mszFoD6o
 6FHeGSyazeKksF5VOTvdaRUFWyOWrNjIz2AzvOTF9mOkymtfsaPwkIWTE8/TfO/mthalkGuzRC
 s1Uii+9OacAcitJPQt2Yts71dN+3XDLvE5UT/lqpEqfC4rhkIfjxhFpDMMHqMJxddwUhVsgwC5
 +Wat+FpxpVNbIoKkEyn1IEkFDlCr6cQi3aQqfpD4yzPrOsC8+ktX1pbP+mo0sT/ckgKboEL6VO
 OS0=
X-SBRS: 5.1
X-MesageID: 36322045
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,393,1602561600"; 
   d="scan'208";a="36322045"
Subject: Re: staging: unable to restore HVM with Viridian param set
To: Andrew Cooper <andrew.cooper3@citrix.com>, Tamas K Lengyel
	<tamas.k.lengyel@gmail.com>, Xen-devel <xen-devel@lists.xenproject.org>, "Wei
 Liu" <wl@xen.org>, Ian Jackson <iwj@xenproject.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>
References: <CABfawhkxEKOha7RYpSvTaJEtxyBsio9Pcc=xtRD7DszHm2k2pw@mail.gmail.com>
 <12e17af4-3502-0047-36e2-3c1262602747@citrix.com>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <7ea14fac-7832-fe68-529e-03a8f9812f88@citrix.com>
Date: Tue, 2 Feb 2021 00:20:24 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <12e17af4-3502-0047-36e2-3c1262602747@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit

n 01/02/2021 22:57, Andrew Cooper wrote:
> On 01/02/2021 22:51, Tamas K Lengyel wrote:
>> Hi all,
>> trying to restore a Windows VM saved on Xen 4.14 with Xen staging results in:
>>
>> # xl restore -p /shared/cfg/windows10.save
>> Loading new save file /shared/cfg/windows10.save (new xl fmt info 0x3/0x0/1475)
>>  Savefile contains xl domain config in JSON format
>> Parsing config from <saved>
>> xc: info: Found x86 HVM domain from Xen 4.14
>> xc: info: Restoring domain
>> xc: error: set HVM param 9 = 0x0000000000000065 (17 = File exists):
>> Internal error
>> xc: error: Restore failed (17 = File exists): Internal error
>> libxl: error: libxl_stream_read.c:850:libxl__xc_domain_restore_done:
>> restoring domain: File exists
>> libxl: error: libxl_create.c:1581:domcreate_rebuild_done: Domain
>> 8:cannot (re-)build domain: -3
>> libxl: error: libxl_domain.c:1182:libxl__destroy_domid: Domain
>> 8:Non-existant domain
>> libxl: error: libxl_domain.c:1136:domain_destroy_callback: Domain
>> 8:Unable to destroy guest
>> libxl: error: libxl_domain.c:1063:domain_destroy_cb: Domain
>> 8:Destruction of domain failed
>>
>> Running on staging 419cd07895891c6642f29085aee07be72413f08c
> 
> CC'ing maintainers and those who've edited the code recently.
> 
> What is happening is xl/libxl is selecting some viridian settings,
> applying them to the domain, and then the migrations stream has a
> different set of viridian settings.
> 
> For a migrating-in VM, nothing should be set during domain build. 
> Viridian state has been part of the migrate stream since before mig-v2,
> so can be considered to be everywhere relevant now.

The fallout is likely from my changes that modified default set of viridian
settings. The relevant commits:
983524671031fcfdb24a6c0da988203ebb47aebe
7e5cffcd1e9300cab46a1816b5eb676caaeed2c1

The same config from migrated domains now implies different set of viridian
extensions then those set at the source side. That creates inconsistency in
libxl. I don't really know how to address it properly in libxl other than
don't extend the default set ever.

Igor

