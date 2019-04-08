Return-Path: <SRS0=fn8+=SK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44916C10F13
	for <xen-devel@archiver.kernel.org>; Mon,  8 Apr 2019 17:56:36 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1943D20830
	for <xen-devel@archiver.kernel.org>; Mon,  8 Apr 2019 17:56:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="BhquHNQ7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1943D20830
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDYVL-0005q4-9z; Mon, 08 Apr 2019 17:56:23 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8ak9=SK=amazonses.com=01000169fe18026e-a0951268-516c-4604-a4c3-140f3cbb6f7a-000000@srs-us1.protection.inumbo.net>)
 id 1hDYVJ-0005pv-TQ
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2019 17:56:21 +0000
X-Inumbo-ID: 9da2dc2d-5a27-11e9-92d7-bc764e045a96
Received: from a9-37.smtp-out.amazonses.com (unknown [54.240.9.37])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 9da2dc2d-5a27-11e9-92d7-bc764e045a96;
 Mon, 08 Apr 2019 17:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=6gbrjpgwjskckoa6a5zn6fwqkn67xbtw; d=amazonses.com; t=1554746180;
 h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-Type:Feedback-ID;
 bh=FGQYKpCnazjT54bTTIGuRCYcvNyyScveT4xOgq2kK7A=;
 b=BhquHNQ7AZfbW9NrrEMamL4FnrexNg+/metU16jwMylL1GaWxsF42EFPAsJg0J9v
 tc+5WCOmNP0dP6L1HXS1/yFJJ0wnr1KoG/nafsQIPh3W7juc87F9jGdDw0vfUMRQq5u
 56cVXB49zLi4dYei2YPpbeVQ06b1OZMNm0aOpwAs=
Date: Mon, 8 Apr 2019 17:56:20 +0000
From: Christopher Lameter <cl@linux.com>
X-X-Sender: cl@nuc-kabylake
To: Thomas Garnier <thgarnie@chromium.org>
In-Reply-To: <CAJcbSZETNhr=Pv+0daEWUsD2=qnZxT9rbmFaE+y7ag-xKOs89w@mail.gmail.com>
Message-ID: <01000169fe18026e-a0951268-516c-4604-a4c3-140f3cbb6f7a-000000@email.amazonses.com>
References: <20190131192533.34130-1-thgarnie@chromium.org>
 <20190131192533.34130-15-thgarnie@chromium.org>
 <01000168a5b35a86-b79bfe67-191e-43bc-a5c7-0e74eac06195-000000@email.amazonses.com>
 <CAJcbSZGKR7dKVqNEDEO7Qzf7tnNqmL=p1uVKvsUefS=Hs-=iNA@mail.gmail.com>
 <01000168a6e5ab88-0deea73f-387f-4941-bd11-d1c161aac88a-000000@email.amazonses.com>
 <CAJcbSZFvafvNX1pS96jaTBGNJad+NszLwSgKnRQgyT70gUGWqQ@mail.gmail.com>
 <CAJcbSZETNhr=Pv+0daEWUsD2=qnZxT9rbmFaE+y7ag-xKOs89w@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-SES-Outgoing: 2019.04.08-54.240.9.37
Feedback-ID: 1.us-east-1.fQZZZ0Xtj2+TD7V5apTT/NrT6QKuPgzCT/IC7XYgDKI=:AmazonSES
Subject: Re: [Xen-devel] [PATCH v6 14/27] x86/percpu: Adapt percpu for PIE
 support
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
Cc: Michal Hocko <mhocko@suse.com>, Brijesh Singh <brijesh.singh@amd.com>,
 Kernel Hardening <kernel-hardening@lists.openwall.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Kristen Carlson Accardi <kristen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Stefano Stabellini <sstabellini@kernel.org>,
 the arch/x86 maintainers <x86@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Dennis Zhou <dennis@kernel.org>, Joerg Roedel <jroedel@suse.de>,
 Kees Cook <keescook@chromium.org>, Cao jin <caoj.fnst@cn.fujitsu.com>,
 Mike Rapoport <rppt@linux.vnet.ibm.com>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, xen-devel <xen-devel@lists.xenproject.org>,
 Thomas Gleixner <tglx@linutronix.de>, Juergen Gross <jgross@suse.com>,
 LKML <linux-kernel@vger.kernel.org>, Andi Kleen <ak@linux.intel.com>,
 Tejun Heo <tj@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCA4IEFwciAyMDE5LCBUaG9tYXMgR2FybmllciB3cm90ZToKCj4gPiBJdCBkaWRuJ3Qg
d29yayBvcmlnaW5hbGx5IGJ1dCBJIHdpbGwgcmV2aXNpdCB0byBzZWUgaWYgSSBtaXNzZWQgc29t
ZXRoaW5nLgo+Cj4gSSByZXZpc2l0ZWQgYW5kIGNvdWxkbid0IGZpbmQgYSB3YXkgdG8gcHJldmVu
dCByZWxvY2F0aW9ucyB0byB0aGUKPiBwZXJjcHUgc2VjdGlvbi4gV2l0aG91dCBQSUUsIHlvdSBj
YW4gcmVmZXJlbmNlIGFic29sdXRlIGFkZHJlc3Mgd2hpY2gKPiB3YXMgY29udmVuaWVudCBmb3Ig
cGVyY3B1LgoKQ2FuIHlvdSBzd2l0Y2ggUElFIG9mZiBmb3IgdGhlIHBlcmNwdSBzZWN0aW9uPyBJ
ZiBub3QgbWF5YmUgdGhlIGxpbmtlcgpuZWVkcyB0byBoYXZlIGFuIGFkZGl0aW9uYWwgb3B0aW9u
PwoKQ2Fubm90IGltYWdpbmUgdGhhdCB0aGlzIGlzIG5vdCBwb3NzaWJsZS4gWW91IG5lZWVkIHRv
IGJlIGFibGUgdG8KcmVmZXJlbmNlIHJlZ2lzdGVycyB0aGF0IGFyZSBpbiBmaXhlZCBtZW1vcnkg
bG9jYXRpb25zLgoKCj4gQ2hyaXN0b3BoZXI6IERpZCB5b3UgaGF2ZSBzb21ldGhpbmcgc3BlY2lm
aWMgaW4gbWluZD8KCkkgdGhvdWdodCB0aGF0IHdlIGp1c3QgbGVhdmUgaXQgYXMgaXMuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
