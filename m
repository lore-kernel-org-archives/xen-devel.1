Return-Path: <SRS0=5Xtu=SY=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84E28C10F11
	for <xen-devel@archiver.kernel.org>; Mon, 22 Apr 2019 23:59:46 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4850E20665
	for <xen-devel@archiver.kernel.org>; Mon, 22 Apr 2019 23:59:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="nK6/Px/+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4850E20665
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hIiqB-0005lZ-Qf; Mon, 22 Apr 2019 23:59:15 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FyI/=SY=protonmail.com=mathieu.tarral@srs-us1.protection.inumbo.net>)
 id 1hIiqA-0005lU-89
 for xen-devel@lists.xenproject.org; Mon, 22 Apr 2019 23:59:14 +0000
X-Inumbo-ID: 9f80d412-655a-11e9-92d7-bc764e045a96
Received: from mail4.protonmail.ch (unknown [185.70.40.27])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 9f80d412-655a-11e9-92d7-bc764e045a96;
 Mon, 22 Apr 2019 23:59:11 +0000 (UTC)
Date: Mon, 22 Apr 2019 23:59:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=default; t=1555977550;
 bh=lPwd9CvkZKCYU1SwW/cnoIiMNY5fX/i8vNFzpt4K1T8=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:
 Feedback-ID:From;
 b=nK6/Px/+R8IrEFUP5h1/g3c36G+s03qdjKZ7T7D4dWvscnyZVqIK7uoik2QE9QHIS
 q4Xf0FRKn8FVCXOhI84sON+PlZ8yS4MLvLmUFlJ14gMSK9JP1Z+gwFf1CXmnAdDdYX
 41MxYVo5Y+1zlbm4AZ2dPpE9rrTBHgjqURda5bkg=
To: Razvan Cojocaru <rcojocaru@bitdefender.com>
From: Mathieu Tarral <mathieu.tarral@protonmail.com>
Message-ID:
 <jYLnqeXXkfLqocyaorTwgUHTTQ7AozmbsPb8X4HGvjuGF2shfDIkAw7G363xoRRWmSZShCUqzriK-bBF3S93QKQkXS_9wUFrlKbdjKr6tUM=@protonmail.com>
In-Reply-To: <5c0480bb-24bc-81cf-066b-a66b2e83d51f@bitdefender.com>
References: <YOhUr-yh3i9FqDqcdQqL11UtyVP7-YReXRJkQKBvuECQRZNHOrOcihig0vnBkLiEj4StXz6rFVftF7Zl4q14uG-CayajSBtGdke6doinhgI=@protonmail.com>
 <5c0480bb-24bc-81cf-066b-a66b2e83d51f@bitdefender.com>
Feedback-ID: 7ARND6YmrAEqSXE0j3TLm6ZqYiFFaDDEkO_KW8fTUEW0kYwGM1KEsuPxEPVWH5YuEnR43INtqwIKH-usvnxVQQ==:Ext:ProtonMail
MIME-Version: 1.0
Subject: Re: [Xen-devel] VMI: singlestep event not received
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
Reply-To: Mathieu Tarral <mathieu.tarral@protonmail.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190422235904.4Mun8s8GZBarckN9w_z2L38ElxhjOfcASfgNwiNygu0@z>

T24gTW9uZGF5IDIyIEFwcmlsIDIwMTkgMTE6MjIsIFJhenZhbiBDb2pvY2FydSA8cmNvam9jYXJ1
QGJpdGRlZmVuZGVyLmNvbT4gd3JvdGU6Cgo+IE9uIDQvMjIvMTkgMToyNiBBTSwgTWF0aGlldSBU
YXJyYWwgd3JvdGU6Cj4KPiA+IFRoZSBwcm9ibGVtIGlzIHRoYXQgUnRsVXNlclRocmVhZFN0YXJ0
IGlzIHBhZ2VkLW91dCwgc28gaSdtIHRyeWluZyB0byByZWFjaCBpdCB2aWEgc2luZ2xlc3RlcHBp
bmcgYXMgYSBiYWNrdXAgc29sdXRpb24uCj4KPiBGV0lXLCB5b3UgY2FuIGp1c3QgdXNlIHhjX2h2
bV9pbmplY3RfdHJhcCgpIHdpdGggYSBUUkFQX3BhZ2VfZmF1bHQKPiBwYXJhbWV0ZXIgdG8gY2F1
c2UgdGhlIE9TIHRvIGJyaW5nIGEgcGFnZWQgb3V0IHBhZ2UgYmFjayBpbnRvIG1haW4gbWVtb3J5
LgoKVGhlIHByb2JsZW0gaXMgdGhhdCBpJ20gZnVsbHkgYmFzZWQgb24gTGliVk1JLCB3aGljaCBk
b2Vzbid0IHByb3ZpZGUgYW4gQVBJIGZvciBwYWdlIGluamVjdGlvbiB5ZXQuCgpJIHRoaW5rIFRh
bWFzIHdhcyB3YWl0aW5nIGZvciBhIGZ1bGwgc3VwcG9ydCBvZiBwYWdlZmF1bHQgaW5qZWN0aW9u
IG9uIFhlbiBiZWZvcmUgb3BlbmluZyBhbiBBUEkuCgpNYXliZSB3ZSBzaG91bGQgb3BlbiBhbiBp
c3N1ZSB0byB0cmFjayB0aGUgcHJvZ3Jlc3MgYWJvdXQgaXQuCgpUaGFua3MgYW55d2F5IGZvciB0
aGUgc3VnZ2VzdGlvbiAhCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
