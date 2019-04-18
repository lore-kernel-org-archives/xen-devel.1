Return-Path: <SRS0=LbOi=SU=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4ABAC10F0E
	for <xen-devel@archiver.kernel.org>; Thu, 18 Apr 2019 18:03:31 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B5C0F21872
	for <xen-devel@archiver.kernel.org>; Thu, 18 Apr 2019 18:03:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="nLHQfKzI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B5C0F21872
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hHBNR-000379-15; Thu, 18 Apr 2019 18:03:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tnl2=SU=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hHBNP-000374-Lc
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2019 18:03:11 +0000
X-Inumbo-ID: 39efc268-6204-11e9-8bf2-e3c62a940f8d
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 39efc268-6204-11e9-8bf2-e3c62a940f8d;
 Thu, 18 Apr 2019 18:03:10 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id ABA6C21871;
 Thu, 18 Apr 2019 18:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1555610590;
 bh=9Ys8frBN978ywFWqYHQ51IckTiorgu3CNaapSyk1k58=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=nLHQfKzIK2iYKpXlp3dwyj428gvtJqYzOKVrnD7ZScbOjJgfpUFBHboW7uWYRFNVb
 /IssFWFaCp81h/XUv5yRMzhwvdoJtPHrEzJdInAjEZdjuzrMvuTZ4qxovZMpPMT+LU
 mk2u9IZapdqs4B4oTaVS5eJ4nz7nXrvtmsr6Eg44=
Date: Thu, 18 Apr 2019 11:03:09 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-X260
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <be790e9c-75bb-b38b-9a01-8c586580ed1a@arm.com>
Message-ID: <alpine.DEB.2.10.1904181056410.1370@sstabellini-ThinkPad-X260>
References: <20190327184531.30986-1-julien.grall@arm.com>
 <20190327184531.30986-3-julien.grall@arm.com>
 <alpine.DEB.2.10.1904171340390.1370@sstabellini-ThinkPad-X260>
 <be790e9c-75bb-b38b-9a01-8c586580ed1a@arm.com>
User-Agent: Alpine 2.10 (DEB 1266 2009-07-14)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 02/12] xen/arm: fix get_cpu_info() when
 built with clang
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
Cc: Artem_Mygaiev@epam.com, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>, Andrii_Anisov@epam.com,
 Oleksandr_Tyshchenko@epam.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190418180309.cGWttCDXK3zA3obC2ham1O7xij5bydzG_uHeNCbP7aw@z>

T24gV2VkLCAxNyBBcHIgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpLAo+IAo+IE9uIDQv
MTcvMTkgOTo0NSBQTSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+ID4gT24gV2VkLCAyNyBN
YXIgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+ID4gPiBDbGFuZyB1bmRlcnN0YW5kcyB0aGUg
R0NDaXNtIGluIHVzZSBoZXJlLCBidXQgc3RpbGwgY29tcGxhaW5zIHRoYXQgc3AgaXMKPiA+ID4g
dW5pdGlhbGlzZWQuIEluIHN1Y2ggY2FzZXMsIHJlc29ydCB0byB0aGUgb2xkZXIgdmVyc2lvbnMg
b2YgdGhpcyBjb2RlLAo+ID4gPiB3aGljaCBkaXJlY3RseSByZWFkIHNwIGludG8gdGhlIHRlbXBv
cmFyeSB2YXJpYWJsZS4KPiA+ID4gCj4gPiA+IE5vdGUgdGhhdCB3ZSBzdGlsbCBrZWVwIHRoZSBH
Q0Npc20gaW4gdGhlIGRlZmF1bHQgY2FzZSwgYXMgaXQgY2F1c2VzIEdDQwo+ID4gPiB0byBjcmVh
dGUgcmF0aGVyIGJldHRlciBhc3NlbWJseS4KPiA+ID4gCj4gPiA+IFRoaXMgaXMgYmFzZWQgb24g
dGhlIHg4NiBjb3VudGVycGFydC4KPiA+IAo+ID4gSSB1bmRlcnN0YW5kIHRoaXMgaXMgYmFzZWQg
b24gYW4gZXhpc3RpbmcgYXBwcm9hY2ggYnV0IHdoYXQgYWJvdXQgb3RoZXIKPiA+IGNvbXBpbGVy
cz8gSSBoYXZlIGEgc3VnZ2VzdGlvbiBiZWxvdy4KPiAKPiBXaGF0IGlmIHRoZSBjb21waWxlciBh
Y3R1YWxseSBzdXBwb3J0IG5hbWVkIHJlZ2lzdGVycz8gV2h5IHdvdWxkIHdlIG1ha2UgdGhlCj4g
Y29kZSBsZXNzIGVmZmljaWVudD8KCkl0IGlzIG5vdCBteSBpbnRlbnRpb24gdG8gbWFrZSB0aGUg
Y29kZSBsZXNzIGVmZmljaWVudCBmb3Igb3RoZXIKY29tcGlsZXJzLiBIb3dldmVyLCByZWFkaW5n
IHRoZSBjb21taXQgbWVzc2FnZSBhbmQgdGhlIHBhdGNoIEkgaGF2ZSB0aGUKaW1wcmVzc2lvbiB0
aGF0IHRoZSBjbGFuZyB2ZXJzaW9uIGlzIG1vcmUgbGlrZWx5IHRvIGJlIGFwcGxpY2FibGUgdG8K
b3RoZXIgY29tcGlsZXJzLCBjb21wYXJlZCB0byB0aGUgZ2NjIHZlcnNpb24uIE1vcmUgInN0YW5k
YXJkIi4gVGhlCnJlYXNvbiBpcyB0aGF0IHRoZSBjbGFuZyB2ZXJzaW9uIG9ubHkgcmVxdWlyZXMg
YXNtIGlubGluZSwgd2hpbGUgdGhlIGdjYwp2ZXJzaW9uIHJlcXVpcmVzIGJvdGggYXNtIGlubGlu
ZSBhbmQgbmFtZWQgcmVnaXN0ZXJzLiBGb3IgdGhlIHNha2Ugb2YKZ2V0dGluZyBYZW4gdG8gY29t
cGlsZSBvdXQgb2YgdGhlIGJveCB3aXRoIGFueSBDIGNvbXBpbGVyLCBJIHRoaW5rIGl0IGlzCmJl
c3QgaWYgd2UgZGVmYXVsdCB0byB0aGUgbGVzcyBkZW1hbmRpbmcgdmVyc2lvbiBvZiB0aGUgaW1w
bGVtZW50YXRpb24KZm9yIHVua25vd24gY29tcGlsZXJzLgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
