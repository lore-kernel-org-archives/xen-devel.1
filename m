Return-Path: <SRS0=DHYy=7O=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05D19C433E0
	for <xen-devel@archiver.kernel.org>; Mon,  1 Jun 2020 10:55:19 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CDC3020679
	for <xen-devel@archiver.kernel.org>; Mon,  1 Jun 2020 10:55:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CDC3020679
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jfi5i-0001Zo-2A; Mon, 01 Jun 2020 10:54:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3ele=7O=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jfi5g-0001Zj-9v
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2020 10:54:48 +0000
X-Inumbo-ID: 4e3e1794-a3f6-11ea-ab0a-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4e3e1794-a3f6-11ea-ab0a-12813bfff9fa;
 Mon, 01 Jun 2020 10:54:46 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: dE4OJlvFGeDUUtAzk3Pi5zV28ZQIW5UOP7UQrOT5lcQFU2YWh+Xc0k4Dbio1M5jzIQRGIdcbgX
 T0UA6G1hW8qVM0IXQuYrEA++MNqKuY+BQHzK8tdGNAXiBGrCA+PzIKy+tFZB/X5eMboLe8OBRi
 W/yT9uFgzTE+mD8IurFET4SeUBhqARgj1gOIEfCdjngudjQ7bEGpkuIoJXc0yVJffNpn7AyqoH
 Ac5ZSqvawoklGR18qCojrS7GFT73+YeKkHaDVpPE0iJZTpsNv82xn7a5GQ7gS4FqVLy6QkZWmH
 zDk=
X-SBRS: 2.7
X-MesageID: 19251855
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,460,1583211600"; d="scan'208";a="19251855"
Date: Mon, 1 Jun 2020 12:54:37 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Daniel Kiper <daniel.kiper@oracle.com>
Subject: Re: [BOOTLOADER SPECIFICATION RFC] The bootloader log format for
 TrenchBoot and others
Message-ID: <20200601105437.GS1195@Air-de-Roger>
References: <20200529112735.qln44ds6z7djheof@tomti.i.net-space.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20200529112735.qln44ds6z7djheof@tomti.i.net-space.pl>
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
Cc: dpsmith@apertussolutions.com, alexander.burmashev@oracle.com,
 krystian.hebel@3mdeb.com, hpa@zytor.com, michal.zygowski@3mdeb.com,
 grub-devel@gnu.org, x86@kernel.org, javierm@redhat.com,
 kanth.ghatraju@oracle.com, phcoder@gmail.com, xen-devel@lists.xenproject.org,
 leif@nuviainc.com, trenchboot-devel@googlegroups.com, alec.brown@oracle.com,
 mtottenh@akamai.com, konrad.wilk@oracle.com, ross.philipson@oracle.com,
 piotr.krol@3mdeb.com, ard.biesheuvel@linaro.org, andrew.cooper3@citrix.com,
 linux-kernel@vger.kernel.org, mjg59@google.com, eric.snowberg@oracle.com,
 pjones@redhat.com, lukasz.hawrylko@linux.intel.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, May 29, 2020 at 01:27:35PM +0200, Daniel Kiper wrote:
> Hey,
> 
> Below you can find my rough idea of the bootloader log format which is
> generic thing but initially will be used for TrenchBoot work. I discussed
> this proposal with Ross and Daniel S. So, the idea went through initial
> sanitization. Now I would like to take feedback from other folks too.
> So, please take a look and complain...
> 
> In general we want to pass the messages produced by the bootloader to the OS
> kernel and finally to the userspace for further processing and analysis. Below
> is the description of the structures which will be used for this thing.
> 
>   struct bootloader_log_msgs
>   {
>     grub_uint32_t level;
>     grub_uint32_t facility;

Nit: if this is aimed at cross-OS and cross-bootloader compatibility
uint32_t should be used here instead of a grub specific alias.

>     char type[];
>     char msg[];

I think you want char * here instead? Or are the above arrays expected
to have a fixed size in the final spec?

>   }
> 
>   struct bootloader_log
>   {
>     grub_uint32_t version;
>     grub_uint32_t producer;
>     grub_uint32_t size;
>     grub_uint32_t next_off;
>     bootloader_log_msgs msgs[];

As I understand it this is not a pointer to an array of
bootloader_log_msgs but rather in-place?

>   }
> 
> The members of struct bootloader_log:
>   - version: the bootloader log format version number, 1 for now,
>   - producer: the producer/bootloader type; we can steal some values from
>     linux/Documentation/x86/boot.rst:type_of_loader,
>   - size: total size of the log buffer including the bootloader_log struct,
>   - next_off: offset in bytes, from start of the bootloader_log struct,
>     of the next byte after the last log message in the msgs[];
>     i.e. the offset of the next available log message slot,

So this will be a memory area that's shared between the OS and the
bootloader and needs to be updated at runtime?

If this is something that's created by the bootloader during loading
and passed to the OS for consumption (but it's not further updated), I
don't see much point in the next_off field. The size field could be
updated to reflect the actual size of the produced messages?

Roger.

