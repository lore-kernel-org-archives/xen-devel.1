Return-Path: <SRS0=7BPq=XB=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C643EC43331
	for <xen-devel@archiver.kernel.org>; Fri,  6 Sep 2019 07:30:04 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A0F6120693
	for <xen-devel@archiver.kernel.org>; Fri,  6 Sep 2019 07:30:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A0F6120693
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i68gc-0002fb-G4; Fri, 06 Sep 2019 07:29:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ai1O=XB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i68gb-0002fW-BL
 for xen-devel@lists.xenproject.org; Fri, 06 Sep 2019 07:29:37 +0000
X-Inumbo-ID: 13844738-d078-11e9-978d-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 13844738-d078-11e9-978d-bc764e2007e4;
 Fri, 06 Sep 2019 07:29:35 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E67D7ADDC;
 Fri,  6 Sep 2019 07:29:34 +0000 (UTC)
To: osstest service owner <osstest-admin@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <osstest-141063-mainreport@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5023ad5a-5af9-f399-08f3-fe2716972c2a@suse.com>
Date: Fri, 6 Sep 2019 09:29:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <osstest-141063-mainreport@xen.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [xen-unstable-smoke test] 141063: regressions - FAIL
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDYuMDkuMjAxOSAwMDowNCwgb3NzdGVzdCBzZXJ2aWNlIG93bmVyIHdyb3RlOgo+IGZsaWdo
dCAxNDEwNjMgeGVuLXVuc3RhYmxlLXNtb2tlIHJlYWwgW3JlYWxdCj4gaHR0cDovL2xvZ3MudGVz
dC1sYWIueGVucHJvamVjdC5vcmcvb3NzdGVzdC9sb2dzLzE0MTA2My8KPiAKPiBSZWdyZXNzaW9u
cyA6LSgKPiAKPiBUZXN0cyB3aGljaCBkaWQgbm90IHN1Y2NlZWQgYW5kIGFyZSBibG9ja2luZywK
PiBpbmNsdWRpbmcgdGVzdHMgd2hpY2ggY291bGQgbm90IGJlIHJ1bjoKPiAgYnVpbGQtYW1kNjQg
ICAgICAgICAgICAgICAgICAgNiB4ZW4tYnVpbGQgICAgICAgICAgICAgICAgZmFpbCBSRUdSLiB2
cy4gMTQxMDQ5CgpMb29rcyBsaWtlIHRoaXMgY3VycmVudGx5IGZhaWxzIGFib3V0IGV2ZXJ5IG90
aGVyIHRpbWUsIGFuZAoKL2hvbWUvb3NzdGVzdC9idWlsZC4xNDEwNjMuYnVpbGQtYW1kNjQveGVu
L3Rvb2xzL2Zpcm13YXJlLy4uLy4uL3Rvb2xzL2Nyb3NzLWluc3RhbGwgLW0wNjQ0IC1wIHhlbi1k
aXIveGVuLXNoaW0gL2hvbWUvb3NzdGVzdC9idWlsZC4xNDEwNjMuYnVpbGQtYW1kNjQveGVuL2Rp
c3QvaW5zdGFsbC91c3IvbG9jYWwvbGliL3hlbi9ib290L3hlbi1zaGltCmluc3RhbGw6IGNhbm5v
dCBzdGF0ICd4ZW4tZGlyL3hlbi1zaGltJzogTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeQpNYWtl
ZmlsZTo0ODogcmVjaXBlIGZvciB0YXJnZXQgJ2luc3RhbGwnIGZhaWxlZAptYWtlWzRdOiBMZWF2
aW5nIGRpcmVjdG9yeSAnL2hvbWUvb3NzdGVzdC9idWlsZC4xNDEwNjMuYnVpbGQtYW1kNjQveGVu
L3Rvb2xzL2Zpcm13YXJlJwptYWtlWzRdOiAqKiogW2luc3RhbGxdIEVycm9yIDEKCnN1Z2dlc3Rz
IHRvIG1lIHRoYXQgdGhlIGZ1cnRoZXIgYW1vdW50IG9mIGR1Y3QgdGFwZSBwdXQgaW4KcGxhY2Ug
YnkgYTM0MjkwMGQ0OCBzdGlsbCB3YXNuJ3QgZW5vdWdoLgoKSmFuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
