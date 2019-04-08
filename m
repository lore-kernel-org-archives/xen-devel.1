Return-Path: <SRS0=fn8+=SK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32065C10F13
	for <xen-devel@archiver.kernel.org>; Mon,  8 Apr 2019 16:05:39 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 017EB20857
	for <xen-devel@archiver.kernel.org>; Mon,  8 Apr 2019 16:05:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Tgx5xyCI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 017EB20857
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDWlq-0004oM-G8; Mon, 08 Apr 2019 16:05:18 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4iMB=SK=chromium.org=thgarnie@srs-us1.protection.inumbo.net>)
 id 1hDWlp-0004oH-EY
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2019 16:05:17 +0000
X-Inumbo-ID: 196dffeb-5a18-11e9-92d7-bc764e045a96
Received: from mail-io1-xd41.google.com (unknown [2607:f8b0:4864:20::d41])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 196dffeb-5a18-11e9-92d7-bc764e045a96;
 Mon, 08 Apr 2019 16:05:16 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id d201so11501583iof.7
 for <xen-devel@lists.xenproject.org>; Mon, 08 Apr 2019 09:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ITlIss5JlNmHr6h7/GJ+WO1zukGFR0T0+8FXF5kIEW8=;
 b=Tgx5xyCIuznHAa4L24TZv/ZXknLAgPoKsLc/o/EbVrGqDZ/IN2ScTuyKe67ag7gDrR
 5Sxq9BRZbRN+0b2otaUVhJFIA7x/W1hQq5bTTjw1NjVjcaVjRj/CHBb8fkeNipls21GN
 iDfR1soX16kDdbf6ROSyg34ynic1/EOIhZPeo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ITlIss5JlNmHr6h7/GJ+WO1zukGFR0T0+8FXF5kIEW8=;
 b=Tn9VkZgvw4iQ8Aotr9DVXNA7LXp5pjYy+MrugklImtcDf/OLf56GsWzpGA8g1eH4yu
 yxXeLISGrxGrb08nHZ6VM3daO9JKIm+gpYTMFOH8Oq16vI/W9EP2wQuUbZ+3b52ex3a4
 rQpOvOxNTtfnGu1WlV1PVevkDpzauP/VfylvbEMJfrOrWjB9/X9sebB96jwHrKRtYvFy
 NAEfsafVoD32W6yC27vVcSjR0wZ+l3CV8DGGzeQzVhowdXaIPaVQJdyhtzK+cEE8zSgG
 nKQviTFUJNVtU1XCwXLJ0atK85FRczepSGe1Il53vLHgWP6EI+32Y5s7MIWDwfxYdaYw
 dxIA==
X-Gm-Message-State: APjAAAVhm4bzhYd8kCsSqohPMqSIip77ANTh86lAoo6bA6+v30KJkv5S
 If8jPXuy0df7eGRYN/fYWd9qEmV5zzU=
X-Google-Smtp-Source: APXvYqzHMwCRh/8QAFuizmNst/GU8h6QX5jg0OvkypUMKzNO0PotH4X3Kx+Zmlxi3lgjOeq9nxG0Nw==
X-Received: by 2002:a5d:9446:: with SMTP id x6mr17764813ior.236.1554739515964; 
 Mon, 08 Apr 2019 09:05:15 -0700 (PDT)
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com.
 [209.85.166.51])
 by smtp.gmail.com with ESMTPSA id c200sm5209349itc.43.2019.04.08.09.05.15
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 08 Apr 2019 09:05:15 -0700 (PDT)
Received: by mail-io1-f51.google.com with SMTP id e13so11491057ioq.6
 for <xen-devel@lists.xenproject.org>; Mon, 08 Apr 2019 09:05:15 -0700 (PDT)
X-Received: by 2002:a6b:6509:: with SMTP id z9mr21038168iob.43.1554739145445; 
 Mon, 08 Apr 2019 08:59:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190131192533.34130-1-thgarnie@chromium.org>
 <20190131192533.34130-15-thgarnie@chromium.org>
 <01000168a5b35a86-b79bfe67-191e-43bc-a5c7-0e74eac06195-000000@email.amazonses.com>
 <CAJcbSZGKR7dKVqNEDEO7Qzf7tnNqmL=p1uVKvsUefS=Hs-=iNA@mail.gmail.com>
 <01000168a6e5ab88-0deea73f-387f-4941-bd11-d1c161aac88a-000000@email.amazonses.com>
 <CAJcbSZFvafvNX1pS96jaTBGNJad+NszLwSgKnRQgyT70gUGWqQ@mail.gmail.com>
In-Reply-To: <CAJcbSZFvafvNX1pS96jaTBGNJad+NszLwSgKnRQgyT70gUGWqQ@mail.gmail.com>
From: Thomas Garnier <thgarnie@chromium.org>
Date: Mon, 8 Apr 2019 08:58:54 -0700
X-Gmail-Original-Message-ID: <CAJcbSZETNhr=Pv+0daEWUsD2=qnZxT9rbmFaE+y7ag-xKOs89w@mail.gmail.com>
Message-ID: <CAJcbSZETNhr=Pv+0daEWUsD2=qnZxT9rbmFaE+y7ag-xKOs89w@mail.gmail.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBGZWIgMSwgMjAxOSBhdCA5OjEzIEFNIFRob21hcyBHYXJuaWVyIDx0aGdhcm5pZUBj
aHJvbWl1bS5vcmc+IHdyb3RlOgo+Cj4gT24gVGh1LCBKYW4gMzEsIDIwMTkgYXQgNjozMSBQTSBD
aHJpc3RvcGhlciBMYW1ldGVyIDxjbEBsaW51eC5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIFRodSwg
MzEgSmFuIDIwMTksIFRob21hcyBHYXJuaWVyIHdyb3RlOgo+ID4KPiA+ID4gVGhlIHBlci1jcHUg
c3ltYm9scyBhcmUgaW4gYSBzZWN0aW9uIHRoYXQgaXMgemVybyBiYXNlZCB0byBjcmVhdGUKPiA+
ID4gb2Zmc2V0cy4gVGhlIGNvbXBpbGVyIGRvZXNuJ3Qgc2VlIHRoZW0gYXMgb2Zmc2V0cyBidXQg
YXMgcmVsYXRpdmUKPiA+ID4gc3ltYm9sIGFuZCB0cnkgdG8gcmVsb2NhdGUgdGhlbS4gR2l2ZW4g
dGhlIGRpc3RhbmNlIGJldHdlZW4gemVybyBhbmQKPiA+ID4gdGhlIG1hcHBlZCBrZXJuZWwgaXMg
bXVjaCBsYXJnZXIgdGhhbiB0aGUgaW5zdHJ1Y3Rpb24gb2Zmc2V0IHJhbmdlLCBpdAo+ID4gPiBm
YWlscyB0byBkbyBpdC4KPiA+Cj4gPiBXZSBzd2l0Y2ggdGhhdCBvZmYgaW4gdGhlIGxpbmtlci4g
SWYgdGhhdCBkb2VzIG5vdCB3b3JrIHdpdGggeW91cgo+ID4gbW9kaWZpY2F0aW9ucyB0aGVuIHlv
dSBuZWVkIHRvIGZpZ3VyZSBvdXQgaG93IHRvIHVwZGF0ZSB0aGUgbGluawo+ID4gY29uZmlndXJh
dGlvbi4KPiA+Cj4KPiBJdCBkaWRuJ3Qgd29yayBvcmlnaW5hbGx5IGJ1dCBJIHdpbGwgcmV2aXNp
dCB0byBzZWUgaWYgSSBtaXNzZWQgc29tZXRoaW5nLgoKSSByZXZpc2l0ZWQgYW5kIGNvdWxkbid0
IGZpbmQgYSB3YXkgdG8gcHJldmVudCByZWxvY2F0aW9ucyB0byB0aGUKcGVyY3B1IHNlY3Rpb24u
IFdpdGhvdXQgUElFLCB5b3UgY2FuIHJlZmVyZW5jZSBhYnNvbHV0ZSBhZGRyZXNzIHdoaWNoCndh
cyBjb252ZW5pZW50IGZvciBwZXJjcHUuCgpDaHJpc3RvcGhlcjogRGlkIHlvdSBoYXZlIHNvbWV0
aGluZyBzcGVjaWZpYyBpbiBtaW5kPwoKSSBjaGVja2VkIHRoZSBmb2xsb3dpbmc6CiAtIENoYW5n
aW5nIHRoZSBGTEFHUygpIG9uIHRoZSBQSERSUy4KIC0gdXNpbmcgLXogbm9yZWxvYy1vdmVyZmxv
dyB3aGljaCBhY3R1YWxseSBkb2Vzbid0IHNlZW0gdG8gYXBwbHkgdG8KUEMzMiByZWxvY2F0aW9u
cy4KIC0gTG9vayBhdCBhbGwgbGlua2VyIG9wdGlvbnMgYW5kIHNjcmlwdCBmb3JtYXQgZm9yIGFu
eXRoaW5nIGFyb3VuZCB0aGF0LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
