Return-Path: <SRS0=9ImI=TA=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42CE9C04AA8
	for <xen-devel@archiver.kernel.org>; Tue, 30 Apr 2019 11:49:04 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D6C321707
	for <xen-devel@archiver.kernel.org>; Tue, 30 Apr 2019 11:49:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D6C321707
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hLRFU-0001hT-D4; Tue, 30 Apr 2019 11:48:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=xzkl=TA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hLRFT-0001hO-L4
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2019 11:48:35 +0000
X-Inumbo-ID: e170f114-6b3d-11e9-9e82-6f4032437c38
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e170f114-6b3d-11e9-9e82-6f4032437c38;
 Tue, 30 Apr 2019 11:48:33 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 30 Apr 2019 05:48:32 -0600
Message-Id: <5CC8360E020000780022A70A@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Tue, 30 Apr 2019 05:48:30 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Juergen Gross" <jgross@suse.com>
References: <3ce4998b*a8a8*37bd*bb26*9550571709b6@suse.com>
 <5CC82306020000780022A4E3@prv1*mh.provo.novell.com>
 <ae94fdca-bd2a-2086-450e-c485ca4e59f0@arm.com>
 <5CC82593020000780022A50D@suse.com>
 <dd2eb4c4-4144-17ae-f7a6-a4287aeac461@suse.com>
In-Reply-To: <dd2eb4c4-4144-17ae-f7a6-a4287aeac461@suse.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] vcpu_block() and do_poll() question
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Julien Grall <julien.grall@arm.com>, Dario Faggioli <dfaggioli@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190430114830.DC2A_M0Q91xm93cCmgPjhqiJWgZAqKQSttSa-yPuVpE@z>

Pj4+IE9uIDMwLjA0LjE5IGF0IDEyOjQ0LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBBbiBh
bHRlcm5hdGl2ZSB3b3VsZCBiZSBtZW1vcnkgYmFycmllcnMgYmV0d2VlbiB0aGUgd3JpdGVzIG9u
IEFSTSwKPiByaWdodD8gT3IgYSBzdHJvbmcgb3JkZXJlZCBzZXRfYml0KCkgdmFyaWFudCAod2Ug
aGFkIHRoYXQgZGlzY3Vzc2lvbgo+IHJlY2VudGx5IHJlbGF0ZWQgdG8gYSBiYXJyaWVyIGluIEFS
TS1zcGVjaWZpYyBfX2NwdV9kaXNhYmxlKCkpLgoKWWVzLgoKPiBUaGVuIHdlIGNvdWxkIGRyb3Ag
dGhpcyAjaWZuZGVmIHNlY3Rpb24uCgpOb3Qgc3VyZSBhYm91dCB0aGlzIC0gSSdtIGFjdHVhbGx5
IHVuY29udmluY2VkIHRoZSBsYXR0ZXIgcGFydCBvZgp3aGF0J3MgaW5zaWRlIHRoZSAjaWZkZWYg
aXNuJ3QgYWN0dWFsbHkgbmVlZGVkIG9uIHg4NiBhcyB3ZWxsLiBKdXN0CmNvbnNpZGVyIHRoZSBj
YXNlIG9mIHZjcHVfdW5ibG9jaygpIG1ha2luZyBpdCB0byB0aGUgdmNwdV93YWtlKCkKaW52b2Nh
dGlvbiBvbiBhbm90aGVyIENQVSB3aGlsZSB3ZSdyZSBiZXR3ZWVuIGFueSB0d28gb2YgdGhlCnRo
cmVlIHdyaXRlcyBoZXJlLiAoSSBrbm93IEkndmUgYmVlbiBmZWVsaW5nIHVuZWFzeSBhYm91dCB0
aGlzCmJlZm9yZSwgYnV0IEkgZ3Vlc3MgSSBtdXN0IGhhdmUgY29tZSB0byB0aGUgY29uY2x1c2lv
biB0aGF0IGl0J3MKX3Byb2JhYmx5XyBva2F5LikKCkphbgoKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
