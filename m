Return-Path: <SRS0=1DY5=BW=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF6E3C433E0
	for <xen-devel@archiver.kernel.org>; Wed, 12 Aug 2020 12:47:58 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB9742065C
	for <xen-devel@archiver.kernel.org>; Wed, 12 Aug 2020 12:47:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="J0r75XcS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AB9742065C
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k5qAH-0006Z1-R3; Wed, 12 Aug 2020 12:47:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rOR4=BW=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1k5qAG-0006Yw-BK
 for xen-devel@lists.xenproject.org; Wed, 12 Aug 2020 12:47:32 +0000
X-Inumbo-ID: 43f13c03-38a8-47d2-8814-59f2f9223e2b
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 43f13c03-38a8-47d2-8814-59f2f9223e2b;
 Wed, 12 Aug 2020 12:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597236451;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uF/F2yfIT/eAfPrCDzbbPjkHRrxoZJW5fvYYO14wnvo=;
 b=J0r75XcS9564BZidoP+ETHYQZGng3bCyOiMqXxzkGraeob53kjhVLIe3
 xNJA0n4ASSVHeSzAgzFx6R1B9yU0nfZ2VAa5hGK7K4uMjLDCWZx9buEtx
 N4e1vWoLgTojrjJyoxDnIuLlkJHKZna4XjnPqcl6l/zDOlf6w89olwaJC s=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: eQF8/pzrQcNFuF6uJe2x0NvD3NslssVOzSaYIGeejvp0pJr7qNHkfYYMe1jMYB9SLgszFr13vJ
 xRpSI6z3GNIFpdrflqNkLzOIdaDxoBiyD2jsIrDTxwKR4wfhXSpcDCRvFITpJDzU7T05YJjqr4
 2RPc1R3y3uyuWk+WJCnq/1gDjAhCOBw0+Qqc6NQpXd4Q7XUf44vmkW4bJRjNn50zlgSTGCqXuf
 hCkFHLbG7kptRIekcRDhv8oIyeawjt1/bugvwcBuqX2yBgDn5RQIS95Xnii7SGNkVKbAiENbaT
 LBU=
X-SBRS: 2.7
X-MesageID: 24344708
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,304,1592884800"; d="scan'208";a="24344708"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jun Nakajima
 <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>, Jan Beulich
 <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu
 <wl@xen.org>, Paul Durrant <paul@xen.org>
Subject: [PATCH 0/5] x86/vlapic: implement EOI callbacks
Date: Wed, 12 Aug 2020 14:47:04 +0200
Message-ID: <20200812124709.4165-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hello,

The following series attempts to implement EOI callbacks for vlapic
injected vectors, this allows to remove the hardcoded callbacks in
vlapic_handle_EOI. Instead a new vlapic vector injection helper is
provided, that takes two extra parameters in order to pass a callback and
an opaque data blob that will be called once the vector is EOI'ed by the
guest.

My plan with this is to be able to provide EOI callbacks for all
interrupt types that we inject to the guest, this is only the first step
of that work by changing the emulated lapic to use this model. The
IO-APIC and PIC still need to be switched to a similar model.

Long term having such callbacks would greatly simplify the virtual
periodic timers code, as being able to get a callback when the injected
interrupt is EOI'ed simplifies the handling of missed ticks, as we would
no longer need to check at each vmentry whether a virtual interrupt
timer is being injected.

Thanks, Roger.

Roger Pau Monne (5):
  x86/hvm: change EOI exit bitmap helper parameter
  x86/vlapic: introduce an EOI callback mechanism
  x86/vmsi: use the newly introduced EOI callbacks
  x86/viridian: switch synic to use the new EOI callback
  x86/vioapic: switch to use the EOI callback mechanism

 xen/arch/x86/hvm/vioapic.c         | 90 +++++++++++++++---------------
 xen/arch/x86/hvm/viridian/synic.c  | 28 +++++-----
 xen/arch/x86/hvm/vlapic.c          | 61 ++++++++++++++++----
 xen/arch/x86/hvm/vmsi.c            | 36 +++++++-----
 xen/arch/x86/hvm/vmx/vmx.c         |  4 +-
 xen/drivers/passthrough/io.c       |  4 +-
 xen/include/asm-x86/hvm/hvm.h      |  2 +-
 xen/include/asm-x86/hvm/io.h       |  2 +-
 xen/include/asm-x86/hvm/viridian.h |  1 -
 xen/include/asm-x86/hvm/vlapic.h   | 10 ++++
 10 files changed, 150 insertions(+), 88 deletions(-)

-- 
2.28.0


