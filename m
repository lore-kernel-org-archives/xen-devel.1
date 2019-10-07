Return-Path: <SRS0=0Q+7=YA=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A1F4C4740A
	for <xen-devel@archiver.kernel.org>; Mon,  7 Oct 2019 08:27:23 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 522B42084D
	for <xen-devel@archiver.kernel.org>; Mon,  7 Oct 2019 08:27:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 522B42084D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iHOMF-0003Bq-RL; Mon, 07 Oct 2019 08:27:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Vpmc=YA=gmail.com=geert.uytterhoeven@srs-us1.protection.inumbo.net>)
 id 1iHOME-0003Bl-ID
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2019 08:27:06 +0000
X-Inumbo-ID: 3c7c2c4c-e8dc-11e9-97a6-12813bfff9fa
Received: from mail-ot1-f68.google.com (unknown [209.85.210.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3c7c2c4c-e8dc-11e9-97a6-12813bfff9fa;
 Mon, 07 Oct 2019 08:27:02 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id e11so10250200otl.5
 for <xen-devel@lists.xenproject.org>; Mon, 07 Oct 2019 01:27:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VKymJxaLp2SF18G9ExdMOsAdXsmgBDVfrU/If3JZGxo=;
 b=IKsRq5yrad+YGzseNEl19IuYcsccX+76/XwDV9yJy+AudWmTNUzdhIwY7AP3LOGj/m
 rvS8eciHHVbPRxxI7aDG/vqIRa6N3KrJxjLLxEXZ/IoZ/lBO59NhgxOhb8zKQaDgx6oJ
 8AiQO89izYZSZ/ea1o7LKIw39/fUNDhRr18fRYe4asTk6nYKl/2u4l1ZGnlr4VIPSOmf
 jeie7lwD/kR3vwiehtgqbQYyWgouTFAE2ua+vFVSbNU9850WcFJ1vcXR1s5XmTb6kgpd
 XEWCOnJxrWQTet/frXy5vB0X3bNDpo78+JRN98wFBFQSspIO2Seby/lhEz5YMmG6Z/OS
 JvoQ==
X-Gm-Message-State: APjAAAUcZ8vdCQjMad9OLBc/dLz0o/LXmzpzCvwiKyX/jigFVJXXIt8E
 Sqh3rDHWqpCqUSgx9wxqU9DZL18JOaMVIr/YWck=
X-Google-Smtp-Source: APXvYqxEOkV8nJCSllSqxdkQVypo90wcNgBvYDBNSKRgpoLJCvXTnmOdSLlUAojqzzfR9rCgupdlwodIFF5kpYpgt28=
X-Received: by 2002:a9d:17e6:: with SMTP id j93mr20339687otj.297.1570436821298; 
 Mon, 07 Oct 2019 01:27:01 -0700 (PDT)
MIME-Version: 1.0
References: <20191004145544.5066-1-krzk@kernel.org>
 <20191004145544.5066-3-krzk@kernel.org>
In-Reply-To: <20191004145544.5066-3-krzk@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 7 Oct 2019 10:26:49 +0200
Message-ID: <CAMuHMdW0DSujexoGq4CJAYP40DvMcigk08aEnyQ72haY6jds5Q@mail.gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [Xen-devel] [RESEND TRIVIAL 3/3] treewide: arch: Fix Kconfig
 indentation
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 linux-efi <linux-efi@vger.kernel.org>,
 Linux-sh list <linux-sh@vger.kernel.org>, linux-iio@vger.kernel.org,
 linux-pci <linux-pci@vger.kernel.org>,
 "open list:REMOTE PROCESSOR \(REMOTEPROC\) SUBSYSTEM"
 <linux-remoteproc@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 platform-driver-x86@vger.kernel.org, linux-ide@vger.kernel.org,
 dm-devel@redhat.com, keyrings@vger.kernel.org,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Linux I2C <linux-i2c@vger.kernel.org>, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, ac100@lists.launchpad.net,
 linux-rtc@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 scsi <linux-scsi@vger.kernel.org>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 linux-rdma <linux-rdma@vger.kernel.org>, esc.storagedev@microsemi.com,
 linux-security-module@vger.kernel.org, linux-clk <linux-clk@vger.kernel.org>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 bcm-kernel-feedback-list@broadcom.com,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 linux-input@vger.kernel.org, xen-devel@lists.xenproject.org,
 virtualization@lists.linux-foundation.org,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 "moderated list:H8/300 ARCHITECTURE" <uclinux-h8-devel@lists.sourceforge.jp>,
 driverdevel <devel@driverdev.osuosl.org>,
 Linux PM list <linux-pm@vger.kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, linux-um@lists.infradead.org,
 linux-block@vger.kernel.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Openrisc <openrisc@lists.librecores.org>, linux-mediatek@lists.infradead.org,
 linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>,
 linux-tegra <linux-tegra@vger.kernel.org>,
 openipmi-developer@lists.sourceforge.net,
 "open list:TI ETHERNET SWITCH DRIVER \(CPSW\)" <linux-omap@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-edac@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-raid@vger.kernel.org,
 Jiri Kosina <trivial@kernel.org>, Linux MM <linux-mm@kvack.org>,
 netdev <netdev@vger.kernel.org>, Linux MMC List <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-spi <linux-spi@vger.kernel.org>,
 Linux IOMMU <iommu@lists.linux-foundation.org>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 alpha <linux-alpha@vger.kernel.org>, dmaengine@vger.kernel.org,
 linux-integrity <linux-integrity@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBPY3QgNCwgMjAxOSBhdCA0OjU3IFBNIEtyenlzenRvZiBLb3psb3dza2kgPGtyemtA
a2VybmVsLm9yZz4gd3JvdGU6Cj4gQWRqdXN0IGluZGVudGF0aW9uIGZyb20gc3BhY2VzIHRvIHRh
YiAoK29wdGlvbmFsIHR3byBzcGFjZXMpIGFzIGluCj4gY29kaW5nIHN0eWxlIHdpdGggY29tbWFu
ZCBsaWtlOgo+ICAgICAkIHNlZCAtZSAncy9eICAgICAgICAvXHQvJyAtaSAqL0tjb25maWcKPgo+
IFNpZ25lZC1vZmYtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4KCj4g
IGFyY2gvbTY4ay9LY29uZmlnLmJ1cyAgICAgICAgICAgICAgICAgIHwgIDIgKy0KPiAgYXJjaC9t
NjhrL0tjb25maWcuZGVidWcgICAgICAgICAgICAgICAgfCAxNiArKysrKysrKy0tLS0tLS0tCj4g
IGFyY2gvbTY4ay9LY29uZmlnLm1hY2hpbmUgICAgICAgICAgICAgIHwgIDggKysrKy0tLS0KCkZv
ciBtNjhrOgpBY2tlZC1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9y
Zz4KCkdye29ldGplLGVldGluZ31zLAoKICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQKCi0t
IApHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMy
IC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnCgpJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGgg
dGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0CndoZW4gSSdtIHRh
bGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5n
IGxpa2UgdGhhdC4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2
YWxkcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
