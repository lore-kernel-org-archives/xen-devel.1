Return-Path: <SRS0=QQ86=UZ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82172C48BD6
	for <xen-devel@archiver.kernel.org>; Wed, 26 Jun 2019 09:39:28 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 62E462082F
	for <xen-devel@archiver.kernel.org>; Wed, 26 Jun 2019 09:39:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 62E462082F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hg4OU-0002dc-E9; Wed, 26 Jun 2019 09:39:10 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=3S3C=UZ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hg4OS-0002dT-Fj
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2019 09:39:08 +0000
X-Inumbo-ID: 3de4f8e8-97f6-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 3de4f8e8-97f6-11e9-8980-bc764e045a96;
 Wed, 26 Jun 2019 09:39:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 6FC1DAEFD;
 Wed, 26 Jun 2019 09:39:06 +0000 (UTC)
To: Zhenzhong Duan <zhenzhong.duan@oracle.com>, linux-kernel@vger.kernel.org
References: <1561377779-28036-1-git-send-email-zhenzhong.duan@oracle.com>
 <1561377779-28036-5-git-send-email-zhenzhong.duan@oracle.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <c77e5df3-77ac-bce2-ccd3-7848f1915b43@suse.com>
Date: Wed, 26 Jun 2019 11:39:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1561377779-28036-5-git-send-email-zhenzhong.duan@oracle.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH v2 4/7] Revert "xen: Introduce 'xen_nopv' to
 disable PV extensions for HVM guests."
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
Cc: sstabellini@kernel.org, peterz@infradead.org, mingo@kernel.org,
 Ingo Molnar <mingo@redhat.com>, bp@alien8.de, hpa@zytor.com,
 xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com,
 srinivas.eeda@oracle.com, tglx@linutronix.de
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjQuMDYuMTkgMTQ6MDIsIFpoZW56aG9uZyBEdWFuIHdyb3RlOgo+IFRoaXMgcmV2ZXJ0cyBj
b21taXQgOGQ2OTNiOTExYmI5YzU3MDA5YzI0Y2IxNzcyZDIwNWI4NGM3OTg1Yy4KPiAKPiBJbnN0
ZWFkIHdlIHVzZSBhbiB1bmlmaWVkIHBhcmFtZXRlciAnbm9wdicgZm9yIGFsbCB0aGUgaHlwZXJ2
aXNvcgo+IHBsYXRmb3Jtcy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBaaGVuemhvbmcgRHVhbiA8emhl
bnpob25nLmR1YW5Ab3JhY2xlLmNvbT4KPiBDYzogQm9yaXMgT3N0cm92c2t5IDxib3Jpcy5vc3Ry
b3Zza3lAb3JhY2xlLmNvbT4KPiBDYzogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgo+
IENjOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+Cj4gQ2M6IFRo
b21hcyBHbGVpeG5lciA8dGdseEBsaW51dHJvbml4LmRlPgo+IENjOiBJbmdvIE1vbG5hciA8bWlu
Z29AcmVkaGF0LmNvbT4KPiBDYzogQm9yaXNsYXYgUGV0a292IDxicEBhbGllbjguZGU+Cj4gQ2M6
IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwoKUmV2aWV3ZWQtYnk6IEp1ZXJnZW4gR3Jv
c3MgPGpncm9zc0BzdXNlLmNvbT4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
