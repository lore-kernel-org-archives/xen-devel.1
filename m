Return-Path: <SRS0=M+rI=D3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45DE7C4363A
	for <xen-devel@archiver.kernel.org>; Tue, 20 Oct 2020 18:43:23 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE7FD22200
	for <xen-devel@archiver.kernel.org>; Tue, 20 Oct 2020 18:43:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE7FD22200
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.9767.25740 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUwaz-00041E-9Y; Tue, 20 Oct 2020 18:42:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 9767.25740; Tue, 20 Oct 2020 18:42:53 +0000
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
	id 1kUwaz-000417-6f; Tue, 20 Oct 2020 18:42:53 +0000
Received: by outflank-mailman (input) for mailman id 9767;
 Tue, 20 Oct 2020 18:42:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ko+4=D3=perches.com=joe@srs-us1.protection.inumbo.net>)
 id 1kUway-00040w-E5
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2020 18:42:52 +0000
Received: from smtprelay.hostedemail.com (unknown [216.40.44.73])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 67f6738a-9a97-4cd4-bdc6-ad77f90ad99f;
 Tue, 20 Oct 2020 18:42:51 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay02.hostedemail.com (Postfix) with ESMTP id 43FA51260;
 Tue, 20 Oct 2020 18:42:51 +0000 (UTC)
Received: from XPS-9350.home (unknown [47.151.133.149])
 (Authenticated sender: joe@perches.com)
 by omf17.hostedemail.com (Postfix) with ESMTPA;
 Tue, 20 Oct 2020 18:42:43 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Ko+4=D3=perches.com=joe@srs-us1.protection.inumbo.net>)
	id 1kUway-00040w-E5
	for xen-devel@lists.xenproject.org; Tue, 20 Oct 2020 18:42:52 +0000
X-Inumbo-ID: 67f6738a-9a97-4cd4-bdc6-ad77f90ad99f
Received: from smtprelay.hostedemail.com (unknown [216.40.44.73])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 67f6738a-9a97-4cd4-bdc6-ad77f90ad99f;
	Tue, 20 Oct 2020 18:42:51 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
	by smtprelay02.hostedemail.com (Postfix) with ESMTP id 43FA51260;
	Tue, 20 Oct 2020 18:42:51 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: humor84_3a06a8527241
X-Filterd-Recvd-Size: 4943
Received: from XPS-9350.home (unknown [47.151.133.149])
	(Authenticated sender: joe@perches.com)
	by omf17.hostedemail.com (Postfix) with ESMTPA;
	Tue, 20 Oct 2020 18:42:43 +0000 (UTC)
Message-ID: <3bc5c2e3b3edc22a4d167ec807ecdaaf8dcda76d.camel@perches.com>
Subject: Re: [RFC] treewide: cleanup unreachable breaks
From: Joe Perches <joe@perches.com>
To: Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>
Cc: LKML <linux-kernel@vger.kernel.org>, linux-edac@vger.kernel.org, 
 linux-acpi@vger.kernel.org, linux-pm@vger.kernel.org, 
 xen-devel@lists.xenproject.org, linux-block@vger.kernel.org, 
 openipmi-developer@lists.sourceforge.net, "open list:HARDWARE RANDOM NUMBER
 GENERATOR CORE" <linux-crypto@vger.kernel.org>, Linux ARM
 <linux-arm-kernel@lists.infradead.org>,  linux-power@fi.rohmeurope.com,
 linux-gpio@vger.kernel.org, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 nouveau@lists.freedesktop.org, virtualization@lists.linux-foundation.org, 
 spice-devel@lists.freedesktop.org, linux-iio@vger.kernel.org, 
 linux-amlogic@lists.infradead.org,
 industrypack-devel@lists.sourceforge.net,  linux-media@vger.kernel.org,
 MPT-FusionLinux.pdl@broadcom.com,  linux-scsi@vger.kernel.org,
 linux-mtd@lists.infradead.org,  linux-can@vger.kernel.org, Network
 Development <netdev@vger.kernel.org>,  intel-wired-lan@lists.osuosl.org,
 ath10k@lists.infradead.org, linux-wireless
 <linux-wireless@vger.kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
  linux-nfc@lists.01.org, linux-nvdimm <linux-nvdimm@lists.01.org>, 
 linux-pci@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 platform-driver-x86@vger.kernel.org, patches@opensource.cirrus.com, 
 storagedev@microchip.com, devel@driverdev.osuosl.org, 
 linux-serial@vger.kernel.org, linux-usb@vger.kernel.org, 
 usb-storage@lists.one-eyed-alien.net, linux-watchdog@vger.kernel.org, 
 ocfs2-devel@oss.oracle.com, bpf <bpf@vger.kernel.org>, 
 linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org, 
 keyrings@vger.kernel.org, alsa-devel@alsa-project.org, clang-built-linux
 <clang-built-linux@googlegroups.com>, Greg KH <gregkh@linuxfoundation.org>,
  George Burgess <gbiv@google.com>
Date: Tue, 20 Oct 2020 11:42:42 -0700
In-Reply-To: <CAKwvOdkR_Ttfo7_JKUiZFVqr=Uh=4b05KCPCSuzwk=zaWtA2_Q@mail.gmail.com>
References: <20201017160928.12698-1-trix@redhat.com>
	 <20201018054332.GB593954@kroah.com>
	 <CAKwvOdkR_Ttfo7_JKUiZFVqr=Uh=4b05KCPCSuzwk=zaWtA2_Q@mail.gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Mon, 2020-10-19 at 12:42 -0700, Nick Desaulniers wrote:
> On Sat, Oct 17, 2020 at 10:43 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> > On Sat, Oct 17, 2020 at 09:09:28AM -0700, trix@redhat.com wrote:
> > > From: Tom Rix <trix@redhat.com>
> > > 
> > > This is a upcoming change to clean up a new warning treewide.
> > > I am wondering if the change could be one mega patch (see below) or
> > > normal patch per file about 100 patches or somewhere half way by collecting
> > > early acks.
> > 
> > Please break it up into one-patch-per-subsystem, like normal, and get it
> > merged that way.
> > 
> > Sending us a patch, without even a diffstat to review, isn't going to
> > get you very far...
> 
> Tom,
> If you're able to automate this cleanup, I suggest checking in a
> script that can be run on a directory.  Then for each subsystem you
> can say in your commit "I ran scripts/fix_whatever.py on this subdir."
>  Then others can help you drive the tree wide cleanup.  Then we can
> enable -Wunreachable-code-break either by default, or W=2 right now
> might be a good idea.
> 
> Ah, George (gbiv@, cc'ed), did an analysis recently of
> `-Wunreachable-code-loop-increment`, `-Wunreachable-code-break`, and
> `-Wunreachable-code-return` for Android userspace.  From the review:
> ```
> Spoilers: of these, it seems useful to turn on
> -Wunreachable-code-loop-increment and -Wunreachable-code-return by
> default for Android
> ...
> While these conventions about always having break arguably became
> obsolete when we enabled -Wfallthrough, my sample turned up zero
> potential bugs caught by this warning, and we'd need to put a lot of
> effort into getting a clean tree. So this warning doesn't seem to be
> worth it.
> ```
> Looks like there's an order of magnitude of `-Wunreachable-code-break`
> than the other two.
> 
> We probably should add all 3 to W=2 builds (wrapped in cc-option).
> I've filed https://github.com/ClangBuiltLinux/linux/issues/1180 to
> follow up on.

I suggest using W=1 as people that are doing cleanups
generally use that and not W=123 or any other style.

Every other use of W= is still quite noisy and these
code warnings are relatively trivially to fix up.



