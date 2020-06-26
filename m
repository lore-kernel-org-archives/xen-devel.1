Return-Path: <SRS0=3C9E=AH=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 526BFC433DF
	for <xen-devel@archiver.kernel.org>; Fri, 26 Jun 2020 13:25:21 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A24A2075D
	for <xen-devel@archiver.kernel.org>; Fri, 26 Jun 2020 13:25:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2A24A2075D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jooLh-0002qa-Iv; Fri, 26 Jun 2020 13:24:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ijbv=AH=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jooLg-0002qT-H4
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2020 13:24:56 +0000
X-Inumbo-ID: 6c715640-b7b0-11ea-82bb-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6c715640-b7b0-11ea-82bb-12813bfff9fa;
 Fri, 26 Jun 2020 13:24:55 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: XXeK9ztN8Q4G5Q+vpgZIaNeqdGGaj44a4E3h5jgkHVJ69nRZwP2rEGKj/Qw0GF6TwZpBcuZvOk
 v1nqrrF9RuSwOtsJJYDbBycB6DiLEQnEi8ZPWojZ2TFDeGKZoGy7DsPzAzMOyE01qLkrmKkViI
 9yTgtnz6hSM1FFEcZyQ0/VNNIXT08JgEQMHv1dAaxZs0fHmfUPyRs6BctieVJxg9vMC5Kq/9g/
 OX8p6nohivV5opyEadARG0mzBACytNklgWVRoyJqoQ66p6AwGjTXjlfP3Wjvgk6i4bujh1XOK8
 P+I=
X-SBRS: 2.7
X-MesageID: 21032529
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,283,1589256000"; d="scan'208";a="21032529"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: 8bit
Message-ID: <24309.63267.596889.412833@mariner.uk.xensource.com>
Date: Fri, 26 Jun 2020 14:24:51 +0100
To: Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 7/7] tools/proctrace: add proctrace tool
In-Reply-To: <20200626114824.mt2zsbwdbed5dtwj@liuwe-devbox-debian-v2>
References: <1617453791.11443328.1592849168658.JavaMail.zimbra@cert.pl>
 <1786138246.11444015.1592849576272.JavaMail.zimbra@cert.pl>
 <20200626114824.mt2zsbwdbed5dtwj@liuwe-devbox-debian-v2>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?iso-8859-2?Q?Micha=B3_Leszczy=F1ski?= <michal.leszczynski@cert.pl>, Tamas K
 Lengyel <tamas.lengyel@intel.com>, "Kang, Luwei" <luwei.kang@intel.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Wei Liu writes ("Re: [PATCH v3 7/7] tools/proctrace: add proctrace tool"):
> On Mon, Jun 22, 2020 at 08:12:56PM +0200, Micha³ Leszczyñski wrote:
> > Add an demonstration tool that uses xc_vmtrace_* calls in order
> > to manage external IPT monitoring for DomU.
...
> > +    if (rc) {
> > +        fprintf(stderr, "Failed to call xc_vmtrace_pt_disable\n");
> > +        return 1;
> > +    }
> > +
> 
> You should close fmem and xc in the exit path.

Thanks for reviewing this.  I agree with your comments.  But I
disagree with this one.

This is in main().  When the program exits, the xc handle and memory
mappings will go away as the kernel tears down the process.

Leaving out this kind of cleanup in standalone command-line programs
is fine, I think.  It can make the code simpler - and it avoids the
risk of doing it wrong, which can turn errors into crashes.

Ian.

