Return-Path: <SRS0=QQ86=UZ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2B67C4646B
	for <xen-devel@archiver.kernel.org>; Wed, 26 Jun 2019 03:37:26 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B5679204EC
	for <xen-devel@archiver.kernel.org>; Wed, 26 Jun 2019 03:37:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="mpIGug1B"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B5679204EC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hfykE-00079F-LT; Wed, 26 Jun 2019 03:37:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=b9+3=UZ=kernel.org=luto@srs-us1.protection.inumbo.net>)
 id 1hfykD-00079A-L2
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2019 03:37:13 +0000
X-Inumbo-ID: aede8830-97c3-11e9-bab5-d37c4e9a162b
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id aede8830-97c3-11e9-bab5-d37c4e9a162b;
 Wed, 26 Jun 2019 03:37:12 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 76A8B217D6
 for <xen-devel@lists.xenproject.org>; Wed, 26 Jun 2019 03:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1561520231;
 bh=JmzGPKsmUvSdNsSmIymUCFxAhA+cTqqTboCcY+e/GPI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=mpIGug1BN7TkavcEanSgy9S5TtgTAZM159v3f/R0RGk2ktaFcZBiwXCLs/azsmbLf
 uUPFAtrSsYkESs/Ex05eq88JFcXbg2ESx8nqbaF8XaupoKVIi7fl+KcUqLwW38K/ma
 gTC6bPVOCj3EOyALXyVKo6/zCvdWEcp4HhF6RByI=
Received: by mail-wr1-f48.google.com with SMTP id p13so865994wru.10
 for <xen-devel@lists.xenproject.org>; Tue, 25 Jun 2019 20:37:11 -0700 (PDT)
X-Gm-Message-State: APjAAAW8KmlDlhzfUzP1OaSyKqWCCPm5P4n1PNEBPUEaTNt4sg4XwKoi
 Gsb+iR2hFptxHIIZoYohzXG8GgJ+WHJYpJD2L0GbPg==
X-Google-Smtp-Source: APXvYqwElpql8oD8RU81s8JM59UICeBjuSUCnq2AkPAPHmk5YrgJh6ZyasGJxpLlUDzaC8WV+AQ53SYq53YWmoIFgSg=
X-Received: by 2002:adf:f28a:: with SMTP id k10mr1277832wro.343.1561520229959; 
 Tue, 25 Jun 2019 20:37:09 -0700 (PDT)
MIME-Version: 1.0
References: <20190613064813.8102-1-namit@vmware.com>
 <20190613064813.8102-5-namit@vmware.com>
In-Reply-To: <20190613064813.8102-5-namit@vmware.com>
From: Andy Lutomirski <luto@kernel.org>
Date: Tue, 25 Jun 2019 20:36:59 -0700
X-Gmail-Original-Message-ID: <CALCETrXyJ8y7PSqf+RmGKjM4VSLXmNEGi6K=Jzw4jmckRQECTg@mail.gmail.com>
Message-ID: <CALCETrXyJ8y7PSqf+RmGKjM4VSLXmNEGi6K=Jzw4jmckRQECTg@mail.gmail.com>
To: Nadav Amit <namit@vmware.com>
Subject: Re: [Xen-devel] [PATCH 4/9] x86/mm/tlb: Flush remote and local TLBs
 concurrently
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
Cc: Sasha Levin <sashal@kernel.org>, Juergen Gross <jgross@suse.com>,
 linux-hyperv@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>,
 Stephen Hemminger <sthemmin@microsoft.com>, kvm list <kvm@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Haiyang Zhang <haiyangz@microsoft.com>,
 X86 ML <x86@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 Linux Virtualization <virtualization@lists.linux-foundation.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, xen-devel <xen-devel@lists.xenproject.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBKdW4gMTIsIDIwMTkgYXQgMTE6NDkgUE0gTmFkYXYgQW1pdCA8bmFtaXRAdm13YXJl
LmNvbT4gd3JvdGU6Cj4KPiBUbyBpbXByb3ZlIFRMQiBzaG9vdGRvd24gcGVyZm9ybWFuY2UsIGZs
dXNoIHRoZSByZW1vdGUgYW5kIGxvY2FsIFRMQnMKPiBjb25jdXJyZW50bHkuIEludHJvZHVjZSBm
bHVzaF90bGJfbXVsdGkoKSB0aGF0IGRvZXMgc28uIFRoZSBjdXJyZW50Cj4gZmx1c2hfdGxiX290
aGVycygpIGludGVyZmFjZSBpcyBrZXB0LCBzaW5jZSBwYXJhdmlydHVhbCBpbnRlcmZhY2VzIG5l
ZWQKPiB0byBiZSBhZGFwdGVkIGZpcnN0IGJlZm9yZSBpdCBjYW4gYmUgcmVtb3ZlZC4gVGhpcyBp
cyBsZWZ0IGZvciBmdXR1cmUKPiB3b3JrLiBJbiBzdWNoIFBWIGVudmlyb25tZW50cywgVExCIGZs
dXNoZXMgYXJlIG5vdCBwZXJmb3JtZWQsIGF0IHRoaXMKPiB0aW1lLCBjb25jdXJyZW50bHkuCgpX
b3VsZCBpdCBiZSBzdHJhaWdodGZvcndhcmQgdG8gaGF2ZSBhIGRlZmF1bHQgUFYgZmx1c2hfdGxi
X211bHRpKCkKdGhhdCB1c2VzIGZsdXNoX3RsYl9vdGhlcnMoKSB1bmRlciB0aGUgaG9vZD8KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
