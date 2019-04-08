Return-Path: <SRS0=fn8+=SK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85D5DC10F13
	for <xen-devel@archiver.kernel.org>; Mon,  8 Apr 2019 18:09:35 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 596FD2084C
	for <xen-devel@archiver.kernel.org>; Mon,  8 Apr 2019 18:09:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gQB6U321"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 596FD2084C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDYhn-0006tB-T9; Mon, 08 Apr 2019 18:09:15 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4iMB=SK=chromium.org=thgarnie@srs-us1.protection.inumbo.net>)
 id 1hDYhn-0006t6-0t
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2019 18:09:15 +0000
X-Inumbo-ID: 6a1ed94a-5a29-11e9-92d7-bc764e045a96
Received: from mail-io1-xd42.google.com (unknown [2607:f8b0:4864:20::d42])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 6a1ed94a-5a29-11e9-92d7-bc764e045a96;
 Mon, 08 Apr 2019 18:09:13 +0000 (UTC)
Received: by mail-io1-xd42.google.com with SMTP id v4so11877757ioj.5
 for <xen-devel@lists.xenproject.org>; Mon, 08 Apr 2019 11:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yAux5Ku0F8TRvhryUL3sJjmWLG4xBlH/cwp7PMlXDQ4=;
 b=gQB6U321p5l/j1bhWHg7deKeKkPzJq3JDVM1H/jgmbf5pBBh0E4d6ZZ8Nu6vPs8yyJ
 Thc2griKgGO8Bh/PKRIxYl0aiZDySne4Ur20bcxor2I7eFhUiaWxuzfFcJplwTz23qFr
 UgT6OPKw0vGt1HGM21aY+9Mu0sCOkYEBIvcdA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yAux5Ku0F8TRvhryUL3sJjmWLG4xBlH/cwp7PMlXDQ4=;
 b=RwssIkIlPF0Q1YD8G2rrAa23pq2IyR+dR+3PGFtf4xaeBrWF0fXC3LfM3k45dUS3ub
 qK0QzAADDfV6zBGtSzvhCGFPFukf+Di71KxniQgULMsDU2YL2vA3uyCfKitlQfYHdAaT
 dF8fiHNBzLDnqNgLV1QMGnIAXjPdu8FjZtzvOsOYnZA0rRBu7P6rKtFb8F7RB+dRCj1j
 bb5bMqO8w6w7893cDnjRRqiaj7K62PpJBflB2y2f3E1pxnVLERSaDGWH3jIOY9JVbXmm
 UwsfEThyJzXXJz5Nx0luhcz9w7WvByvPa4k8I21oqQhaGyAVcbWXRMMvtZKOWJwbwgaa
 vAHg==
X-Gm-Message-State: APjAAAXaFs+tLjgFVmraRHonaLnHgbEsWgzN+zsYbTJJPFWZsErUGRZX
 Dho5KuD8pSNygIOddXDPvm2lwtZu9jw=
X-Google-Smtp-Source: APXvYqwj3y1sjL1pHce7WtPX8OaTVGau/mfqr7sNcplE2usmWheCaXFjhx8p7zXVaV3XJTI4uykGjA==
X-Received: by 2002:a6b:8b50:: with SMTP id n77mr20322449iod.222.1554746952825; 
 Mon, 08 Apr 2019 11:09:12 -0700 (PDT)
Received: from mail-it1-f175.google.com (mail-it1-f175.google.com.
 [209.85.166.175])
 by smtp.gmail.com with ESMTPSA id b1sm11244503ioj.82.2019.04.08.11.09.11
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 08 Apr 2019 11:09:12 -0700 (PDT)
Received: by mail-it1-f175.google.com with SMTP id q14so634808itk.0
 for <xen-devel@lists.xenproject.org>; Mon, 08 Apr 2019 11:09:11 -0700 (PDT)
X-Received: by 2002:a24:298b:: with SMTP id p133mr22379438itp.81.1554746949463; 
 Mon, 08 Apr 2019 11:09:09 -0700 (PDT)
MIME-Version: 1.0
References: <20190131192533.34130-1-thgarnie@chromium.org>
 <20190131192533.34130-15-thgarnie@chromium.org>
 <01000168a5b35a86-b79bfe67-191e-43bc-a5c7-0e74eac06195-000000@email.amazonses.com>
 <CAJcbSZGKR7dKVqNEDEO7Qzf7tnNqmL=p1uVKvsUefS=Hs-=iNA@mail.gmail.com>
 <01000168a6e5ab88-0deea73f-387f-4941-bd11-d1c161aac88a-000000@email.amazonses.com>
 <CAJcbSZFvafvNX1pS96jaTBGNJad+NszLwSgKnRQgyT70gUGWqQ@mail.gmail.com>
 <CAJcbSZETNhr=Pv+0daEWUsD2=qnZxT9rbmFaE+y7ag-xKOs89w@mail.gmail.com>
 <01000169fe18026e-a0951268-516c-4604-a4c3-140f3cbb6f7a-000000@email.amazonses.com>
In-Reply-To: <01000169fe18026e-a0951268-516c-4604-a4c3-140f3cbb6f7a-000000@email.amazonses.com>
From: Thomas Garnier <thgarnie@chromium.org>
Date: Mon, 8 Apr 2019 11:08:58 -0700
X-Gmail-Original-Message-ID: <CAJcbSZFVnJ6qYNsGipf6foa8dtsX_RDykRWK-edP85ySQacsVg@mail.gmail.com>
Message-ID:
 <CAJcbSZFVnJ6qYNsGipf6foa8dtsX_RDykRWK-edP85ySQacsVg@mail.gmail.com>
To: Christopher Lameter <cl@linux.com>
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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190408180858.GmKAPaZGf3FBL0AmoqlmL1urPNvWipPH76hpEAmS-yo@z>

T24gTW9uLCBBcHIgOCwgMjAxOSBhdCAxMDo1NiBBTSBDaHJpc3RvcGhlciBMYW1ldGVyIDxjbEBs
aW51eC5jb20+IHdyb3RlOgo+Cj4gT24gTW9uLCA4IEFwciAyMDE5LCBUaG9tYXMgR2FybmllciB3
cm90ZToKPgo+ID4gPiBJdCBkaWRuJ3Qgd29yayBvcmlnaW5hbGx5IGJ1dCBJIHdpbGwgcmV2aXNp
dCB0byBzZWUgaWYgSSBtaXNzZWQgc29tZXRoaW5nLgo+ID4KPiA+IEkgcmV2aXNpdGVkIGFuZCBj
b3VsZG4ndCBmaW5kIGEgd2F5IHRvIHByZXZlbnQgcmVsb2NhdGlvbnMgdG8gdGhlCj4gPiBwZXJj
cHUgc2VjdGlvbi4gV2l0aG91dCBQSUUsIHlvdSBjYW4gcmVmZXJlbmNlIGFic29sdXRlIGFkZHJl
c3Mgd2hpY2gKPiA+IHdhcyBjb252ZW5pZW50IGZvciBwZXJjcHUuCj4KPiBDYW4geW91IHN3aXRj
aCBQSUUgb2ZmIGZvciB0aGUgcGVyY3B1IHNlY3Rpb24/IElmIG5vdCBtYXliZSB0aGUgbGlua2Vy
Cj4gbmVlZHMgdG8gaGF2ZSBhbiBhZGRpdGlvbmFsIG9wdGlvbj8KCkkgZG9uJ3QgdGhpbmsgc28g
b3IgSSBkaWRuJ3QgZmluZCBhbnkgb3B0aW9uIHRvIGRvIHRoYXQuIENoYW5naW5nIHRoZQpsaW5r
ZXIgbWlnaHQgYmUgYSBiaXQgdG9vIG11Y2ggaWYgd2UgaGF2ZSBhIHNvZnR3YXJlIHNvbHV0aW9u
IHdoaWNoCmRvZXNuJ3QgaW1wYWN0IHBlcmZvcm1hbmNlLgoKPgo+IENhbm5vdCBpbWFnaW5lIHRo
YXQgdGhpcyBpcyBub3QgcG9zc2libGUuIFlvdSBuZWVlZCB0byBiZSBhYmxlIHRvCj4gcmVmZXJl
bmNlIHJlZ2lzdGVycyB0aGF0IGFyZSBpbiBmaXhlZCBtZW1vcnkgbG9jYXRpb25zLgo+Cj4KPiA+
IENocmlzdG9waGVyOiBEaWQgeW91IGhhdmUgc29tZXRoaW5nIHNwZWNpZmljIGluIG1pbmQ/Cj4K
PiBJIHRob3VnaHQgdGhhdCB3ZSBqdXN0IGxlYXZlIGl0IGFzIGlzLgoKSSB3b3VsZCBsaWtlIHRv
IGFzIHdlbGwuIEkgd2lsbCB0cnkgY291cGxlIHRoaW5ncyBhdCB0aGUgYXNzZW1ibHkKbGV2ZWwg
aW5zdGVhZCBvZiB0aGUgbGlua2VyIGFuZCBjb21lIGJhY2sgdG8gdGhpcyB0aHJlYWQuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
