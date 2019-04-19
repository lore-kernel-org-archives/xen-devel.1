Return-Path: <SRS0=iVlm=SV=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33EFAC282DA
	for <xen-devel@archiver.kernel.org>; Fri, 19 Apr 2019 06:08:08 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EDBC921736
	for <xen-devel@archiver.kernel.org>; Fri, 19 Apr 2019 06:08:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HfFAyH2v"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EDBC921736
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hHMgf-0002ny-UE; Fri, 19 Apr 2019 06:07:49 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=yXLQ=SV=gmail.com=kevin.buckley.ecs.vuw.ac.nz@srs-us1.protection.inumbo.net>)
 id 1hHMge-0002nt-US
 for xen-devel@lists.xenproject.org; Fri, 19 Apr 2019 06:07:49 +0000
X-Inumbo-ID: 73b613d9-6269-11e9-92d7-bc764e045a96
Received: from mail-wr1-x442.google.com (unknown [2a00:1450:4864:20::442])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 73b613d9-6269-11e9-92d7-bc764e045a96;
 Fri, 19 Apr 2019 06:07:47 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id s15so5678723wra.12
 for <xen-devel@lists.xenproject.org>; Thu, 18 Apr 2019 23:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xLoFjyxdc0yKkcAzi5EJCXxqaymqk/ohh8DDh/RaAvQ=;
 b=HfFAyH2vs2LDb274TZuxqyDMnyvJUFw+vx40U9J3wzxS0T4TQMZIlDLHWJgbkTqBbA
 9MQyJKyVkqoh6W6/urk9zH7Inv3Fu4G7b553mU3THZCCFcJv/eSGy9KlYfxhc06pIO4L
 mR/M6WWfxRmUrZjl8RYBmRHqIMOnGor/u51L1OULQMq/Tnzmv8gd0OBeaj5VPSY4fxNM
 44OH7/kbH0abvCVPrvRlfKziH0BzCOLU5y1m9CYSQyCVi0uPPsDia9Uf44CHWv58Vd60
 8M97KEXGyxZroanZjRlh1eLsmmQj9NNQkdyu71wdEvt8oo+R8jRj3vBTgLo9abLfCIN0
 SJgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xLoFjyxdc0yKkcAzi5EJCXxqaymqk/ohh8DDh/RaAvQ=;
 b=KvlrMsr+6eU2+HR7eZlxkimEtUvqsALFqR7Ls+tevjP6D0d3YfBbQF5ej7SV2MtR6Q
 2K/DC5r/sCFdvpm5jTb2Xi+FKc5DZ3wepGtbz4X3xqztrc9TgVqARKQmzSHY0NlwN37h
 dDdZD7gy5lz26MURVwpK5Ikzqm16hc3RzEwTSesEnN42jkp9s13OqiI+23eSj+cDIUhE
 G5UCoO7bQa/AF45nQ+Syiv3dsD+XrlPV52RnoHj/CkH8JkZW4uO2vc222btnPaAb2x1T
 ycOkyUUToj3+3k3b4Hl8lTL1XDwWARLbApHXHpJ5phWSy7065lhigYRf6XfoYq67p8K2
 ArJg==
X-Gm-Message-State: APjAAAX9WuQmanCGBiGKWAm/7fqU21krry/m14SOAzJGv7Lvy5dfryao
 0eF6U9IWdb2qFurrVyDMg1vNxRUoGvW8Nr2TBc0=
X-Google-Smtp-Source: APXvYqyst5x+7GriXrMEx67U/MJAvi45gMfvi5uWfq7nz0liHrX3FsxsBHjjcK8Yha2X8yBtLERdG92n4HRXH6nlTzU=
X-Received: by 2002:a05:6000:1292:: with SMTP id
 f18mr1555138wrx.115.1555654066052; 
 Thu, 18 Apr 2019 23:07:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190417105729.GS30543@zion.uk.xensource.com>
 <cda91b28-50c4-308a-30d8-6cecceb973c6@citrix.com>
 <20190417110356.GT30543@zion.uk.xensource.com>
 <a3576f49-eebc-6684-d043-b9511895cf1a@citrix.com>
 <20190417111635.GU30543@zion.uk.xensource.com>
 <7fe14ebe-987a-8b95-1d77-d6d40a473fa3@citrix.com>
 <20190417112645.GV30543@zion.uk.xensource.com>
 <1ff06c9a-8e81-7c00-9dab-26f3d4173714@suse.com>
 <3d698d86-c406-df10-ccb9-17d38988b0a8@citrix.com>
 <606a37f6-2158-14bf-8f49-79ea249b8f62@suse.com>
 <20190417145136.GZ30543@zion.uk.xensource.com>
In-Reply-To: <20190417145136.GZ30543@zion.uk.xensource.com>
From: Kevin Buckley <kevin.buckley.ecs.vuw.ac.nz@gmail.com>
Date: Fri, 19 Apr 2019 14:07:34 +0800
Message-ID:
 <CABwOO=fCBUWZMipjJdHFAgqjc95z6Btmk-ZFCWyGOSSmpY_EUQ@mail.gmail.com>
To: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [Xen-devel] Hypervisor build can't work without `python` (Was:
 Re: Xen commit 9b0bc91b3 possibly removed too much info from README)
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <JBeulich@suse.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190419060734._NBQ-oB7Hhz0yMgBL4Xe_sAEDRyl2HUfPUz7s8FZzTY@z>

T24gV2VkLCAxNyBBcHIgMjAxOSBhdCAyMjo1MSwgV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNv
bT4gd3JvdGU6Cj4KPgo+IEZyYW5rbHkgSSdtIG5vdCBhIGJpZyBmYW4gb2YgdGhpcyBhcHByb2Fj
aCAtLSB5b3UgY2FuIHBvdGVudGlhbGx5IGdldAo+IGRpZmZlcmVudCB0b29sY2hhaW4gZGVwZW5k
aW5nIG9uIGhvdyB5b3UgYnVpbGQgc3R1ZmYuIEkgd291bGQgcmF0aGVyCj4ganVzdCBkb2N1bWVu
dCB0aGF0IGZvciBoeXBlcnZpc29yIGJ1aWxkIGVpdGhlciBweXRob24gaXMgYXZhaWxhYmxlIG9y
Cj4geW91IHNob3VsZCBzcGVjaWZ5IFBZVEhPTj0gd2hlbiBpbnZva2luZyBtYWtlLgo+Cj4gV2Vp
LgoKQXMgSSBzdGFydGVkIGFsbCB0aGlzIG9mZiwgSSB0aG91Z2h0IEknZCBhZGQgaW4gYSBsaXR0
bGUgYml0IG1vcmUsIGFzIEkKdGhpbmsgdGhlcmUgbWF5IGJlIG1vcmUgb3QgdGhpcyB0aGFuIG1l
ZXRzIHRoZSBleWUsIHdlbGwsIGNlcnRhaW5seQpteSBleWUgYW55d2F5LgoKQ2xlYXJseSwgbWFu
eSBvZiB0aGUgc2NyaXB0cyBpbiB0aGUgdG9vbHMgcGFydCB1c2UgcHl0aG9uIHNjcmlwdHMgdGhh
dApoYXZlIGEgL3Vzci9iaW4vZW52IHB5dGhvbiBhcHByb2FjaCB0byBmaW5kaW5nIGEgInB5dGhv
biIKCkkgdGhlcmVmb3JlIHRyaWVkIG1ha2luZyBhIGxpbmsgZnJvbQoKL3Vzci9iaW4vcHl0aG9u
MwoKdG8KCi91c3IvYmluL3B5dGhvbgoKYW5kIHRoZW4gcmFuIHRoZSBjb25maWd1cmUsIFdJVEhP
VVQgZGVmaW5pbmcgYSBQWVRIT04KCi4vY29uZmlndXJlIC0tcHJlZml4PS91c3IgICBcCiAgIC0t
ZGlzYWJsZS1zZWFiaW9zICAgXAogICAtLWRpc2FibGUtcWVtdS10cmFkaXRpb25hbCAgXAogICAt
LWRpc2FibGUtcm9tYmlvcyAgICAgXAogICAtLWRpc2FibGUtc3R1YmRvbSAyPiYxIHwgdGVlIC4u
L2NvbmZpZy5sb2cKCgpUaGlzIGZhaWxlZCB3aGlsc3QgbG9va2luZyBmb3IgUHl0aG9uLmgKClNv
LCBldmVuIHRob3VnaCBJIGhhdmUgdGhlIGxpbmssIEkgaGF2ZSBzdGlsbCBiZWVuIHJ1bm5pbmcg
dGhlCmNvbmZpZ3VyZSBXSVRIIGEgUFlUSE9OIGJlaW5nIGRlZmluZWQKClBZVEhPTj0vdXNyL2Jp
bi9weXRob24zIC4vY29uZmlndXJlIC0tcHJlZml4PS91c3IgICBcCiAgIC0tZGlzYWJsZS1zZWFi
aW9zICAgXAogICAtLWRpc2FibGUtcWVtdS10cmFkaXRpb25hbCAgXAogICAtLWRpc2FibGUtcm9t
YmlvcyAgICAgXAogICAtLWRpc2FibGUtc3R1YmRvbSAyPiYxIHwgdGVlIC4uL2NvbmZpZy5sb2cK
CmFuZCB0aGF0IGRvZXMgYXBwZWFyIHRvIGNvbmZpZ3VyZSB0aGluZ3MuCgpNeSAibWFrZSB3b3Js
ZCIgaXMgc3RpbGwgZmFpbGluZwoKSSBhbSBhY3R1YWxseSB0aGlua2luZyBvZiBpbnN0YWxsaW5n
IGEgUHl0aG9uIDIgYW5kIG1ha2luZyB0aGUgbGluayB0bwp0aGUgYmFyZSAvdXNyL2Jpbi9weXRo
b24gcG9pbnQgdG8gdGhhdCwganVzdCB0byBzZWUgaWYgSSBjYW4gZ2V0IHRoaW5ncwp0byBidWls
ZC4KCkhvcGUgdGhhdCdzIHVzZWZ1bCwKS2V2aW4KClBTCgpJIGhhdmUgYW5vdGhlciBxdWVzdGlv
biBhYm91dCB0aGUgL3Rvb2xzL01ha2VmaWxlIGJ1dCBJJ2xsIGFzayB0aGF0CmluIGFub3RoZXIg
dGhyZWFkLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
