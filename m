Return-Path: <SRS0=y719=BK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29B98C433DF
	for <xen-devel@archiver.kernel.org>; Fri, 31 Jul 2020 13:57:37 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC0A122B40
	for <xen-devel@archiver.kernel.org>; Fri, 31 Jul 2020 13:57:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="Q5H57N2Z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EC0A122B40
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1VXC-0000jG-1i; Fri, 31 Jul 2020 13:57:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xDYK=BK=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1k1VXA-0000jB-N3
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2020 13:57:16 +0000
X-Inumbo-ID: bd0c082a-d335-11ea-8e40-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bd0c082a-d335-11ea-8e40-bc764e2007e4;
 Fri, 31 Jul 2020 13:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1596203834;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=4RzrWCIV0sUMk4OmbfP6TdBvcG7aq4SBkVZTyZG5USU=;
 b=Q5H57N2ZEVe6LNKZ2CASsOOKQxm3IuX7iKfMcqKLkX30DTvFguNuQtWv
 U0KHpOExVrD6bmOldKnUXzVQ71tM48RfKoR5K75hiTdWNouthFuyG9Nhy
 RY0RzE0X1eutPJHQRlYA1gCSkZg60ebkT5rkg8XVhQ+TLReGL8HHz8bGV 0=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: lYBgwtNojffg8me2tMYK+TdIMt1R4Rw6s59L1lDEjqqTWz/4HQKl0oH+SQeud8JvLkUYS2Syu7
 04r9Fk/Kf8alVC83vQ9SWQ0rDeRB/TtuER1MzlBLXna48iStRkgUuZDGTfNxzW5krS+FXarJQG
 G68OvhHq627BjqLYHfx6Sjvr6z68jW2RuEuCeD1kzYvyxZDGFN9YNsOytEny31c7ktaq6XBoae
 XZIdiG96syJuhd8ZD6JM3OBohhKWQ9YCtlEmb4Q91zCk0dtE/Z4CISJ7mfuZqAa/O2OaA+N9Cj
 JU0=
X-SBRS: 3.7
X-MesageID: 23810834
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,418,1589256000"; d="scan'208";a="23810834"
Date: Fri, 31 Jul 2020 15:56:56 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH] x86/vmx: reorder code in vmx_deliver_posted_intr
Message-ID: <20200731135656.GB88772@Air-de-Roger>
References: <20200730140309.59916-1-roger.pau@citrix.com>
 <505b30dc-e504-918e-e676-70d856b76899@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <505b30dc-e504-918e-e676-70d856b76899@suse.com>
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
Cc: xen-devel@lists.xenproject.org, Kevin Tian <kevin.tian@intel.com>,
 Wei Liu <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, Jul 31, 2020 at 03:05:52PM +0200, Jan Beulich wrote:
> On 30.07.2020 16:03, Roger Pau Monne wrote:
> > Remove the unneeded else branch, which allows to reduce the
> > indentation of a larger block of code, while making the flow of the
> > function more obvious.
> > 
> > No functional change intended.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> One minor request (could likely be taken care of while
> committing):
> 
> > @@ -2014,41 +2016,36 @@ static void vmx_deliver_posted_intr(struct vcpu *v, u8 vector)
> >           * VMEntry as it used to be.
> >           */
> >          pi_set_on(&v->arch.hvm.vmx.pi_desc);
> > +        vcpu_kick(v);
> > +        return;
> >      }
> > -    else
> > -    {
> > -        struct pi_desc old, new, prev;
> >  
> > -        prev.control = v->arch.hvm.vmx.pi_desc.control;
> > +    prev.control = v->arch.hvm.vmx.pi_desc.control;
> >  
> > -        do {
> > -            /*
> > -             * Currently, we don't support urgent interrupt, all
> > -             * interrupts are recognized as non-urgent interrupt,
> > -             * Besides that, if 'ON' is already set, no need to
> > -             * sent posted-interrupts notification event as well,
> > -             * according to hardware behavior.
> > -             */
> > -            if ( pi_test_sn(&prev) || pi_test_on(&prev) )
> > -            {
> > -                vcpu_kick(v);
> > -                return;
> > -            }
> > -
> > -            old.control = v->arch.hvm.vmx.pi_desc.control &
> > -                          ~((1 << POSTED_INTR_ON) | (1 << POSTED_INTR_SN));
> > -            new.control = v->arch.hvm.vmx.pi_desc.control |
> > -                          (1 << POSTED_INTR_ON);
> > +    do {
> > +        /*
> > +         * Currently, we don't support urgent interrupt, all
> > +         * interrupts are recognized as non-urgent interrupt,
> > +         * Besides that, if 'ON' is already set, no need to
> > +         * sent posted-interrupts notification event as well,
> > +         * according to hardware behavior.
> > +         */
> 
> Would be nice to s/sent/send/ here as you move it (maybe also
> remove the plural from "posted-interrupts") and - if possible -
> re-flow for the now increased space on the right side.

Oh, sure, I should have realized myself. Feel free to adjust at commit
if you don't mind. I would also adjust 'non-urgent interrupts'.

Thanks, Roger.

