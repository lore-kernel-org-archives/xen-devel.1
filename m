Return-Path: <SRS0=xV0j=7I=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F081C433E1
	for <xen-devel@archiver.kernel.org>; Tue, 26 May 2020 09:31:48 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 26B1C20787
	for <xen-devel@archiver.kernel.org>; Tue, 26 May 2020 09:31:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 26B1C20787
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jdVvS-0004E6-Au; Tue, 26 May 2020 09:31:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=52a6=7I=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1jdVvQ-0004E0-Hk
 for xen-devel@lists.xenproject.org; Tue, 26 May 2020 09:31:08 +0000
X-Inumbo-ID: a0a23186-9f33-11ea-9947-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a0a23186-9f33-11ea-9947-bc764e2007e4;
 Tue, 26 May 2020 09:31:08 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: rgihcP8gIIQagQhwJFYJQIdELqxwqe1yKw2omxAEys5e239J57ICUBGKrUdg4+3CP9J3DCyblH
 GOWZWIF624KDvUvbWtiWOLTEer8VcOKIoebvRYcXxsWLLxDw1g62ZQOWTgqfrdDjlE6SMkG/5n
 OU3fXZC8Q2xymg1HxAqE9kXRzOW4kaDA9Ide46DAvMq6VEtiK95HM4d8sxtjO2aT6ow6NlJ6op
 SXF4rne7oBaKIWROrDutBKy2gqQX+kuu3z9pVgV6bdiaKRvkOHjyPZr4VHE0hj+3hDnC7iz3ex
 wMQ=
X-SBRS: None
X-MesageID: 18650797
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
From: George Dunlap <George.Dunlap@citrix.com>
To: Nick Rosbrook <rosbrookn@gmail.com>
Subject: Re: [PATCH 4/5] golang/xenlight: Use XEN_PKG_DIR variable rather than
 open-coding
Thread-Topic: [PATCH 4/5] golang/xenlight: Use XEN_PKG_DIR variable rather
 than open-coding
Thread-Index: AQHWMFPdgo/hf5/zFkClp7r2x+3aSai1v3IAgAACUICABDzNAA==
Date: Tue, 26 May 2020 09:31:03 +0000
Message-ID: <8040BE07-B452-4036-ADE8-6E5CA0ED41A9@citrix.com>
References: <20200522161240.3748320-1-george.dunlap@citrix.com>
 <20200522161240.3748320-5-george.dunlap@citrix.com>
 <CAEBZRSfF8KAnzz5LW8GhcuJu=2rex3d6bvgz=a7-kLMp-itjqQ@mail.gmail.com>
 <CAEBZRScpycd2_A8moi68AA3asbsUSRjkW1kUVdpsdwgx-SZKpQ@mail.gmail.com>
In-Reply-To: <CAEBZRScpycd2_A8moi68AA3asbsUSRjkW1kUVdpsdwgx-SZKpQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.80.23.2.2)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="us-ascii"
Content-ID: <D3D4CE974867CA4CAE73CCAE56AD2B14@citrix.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
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
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Ian Jackson <Ian.Jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



> On May 23, 2020, at 5:48 PM, Nick Rosbrook <rosbrookn@gmail.com> wrote:
>=20
>>> Signed-off-by: George Dunlap <george.dunlap@citrix.com>
>> Reviewed-by: Nick Rosbrook <rosbrookn@ainfosec.com>
>=20
> Oh, I just noticed your commit message calls the variable
> "XEN_PKG_DIR", but it's actually named "GOXL_PKG_DIR."

Oh, weird.  I presume the R-b stands if I fix the title?

 -George


