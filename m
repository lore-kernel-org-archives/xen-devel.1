Return-Path: <SRS0=LbOi=SU=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB4BFC10F14
	for <xen-devel@archiver.kernel.org>; Thu, 18 Apr 2019 12:32:23 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F8AF21479
	for <xen-devel@archiver.kernel.org>; Thu, 18 Apr 2019 12:32:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9F8AF21479
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hH6Cz-0006ZE-Ht; Thu, 18 Apr 2019 12:32:05 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TYG2=SU=citrix.com=prvs=00452dca2=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hH6Cy-0006Z5-2F
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2019 12:32:04 +0000
X-Inumbo-ID: f7c403c2-61d5-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id f7c403c2-61d5-11e9-92d7-bc764e045a96;
 Thu, 18 Apr 2019 12:32:02 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,366,1549929600"; d="scan'208";a="83883744"
Date: Thu, 18 Apr 2019 13:31:59 +0100
From: Wei Liu <wei.liu2@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Message-ID: <20190418123159.GD30543@zion.uk.xensource.com>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: [Xen-devel] Xen project CI systems and committer workflow
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
Cc: Juergen Gross <jgross@suse.com>, Committers <committers@xenproject.org>,
 Wei Liu <wei.liu2@citrix.com>, Doug Goldstein <cardoe@cardoe.com>,
 Lars Kurth <lars.kurth@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190418123159.lwp1dE5_EbSEyQMjAduuDI5u_p2VNYBGGS8FWqGdTm0@z>

SGkgYWxsCgpXZSBub3cgaGF2ZSBHaXRsYWIgQ0kgYXMgYSBjb21wbGVtZW50YXJ5IHN5c3RlbSB0
byBPc3N0ZXN0IGFuZCBoYXZlIHBsYW5uZWQgdG8KYWRkIGJvdHMuIEl0J3MgaGlnaCB0aW1lIHdl
IHRoaW5rIGFib3V0IGhvdyB3ZSBpbnRlZ3JhdGUgdGhlbSBhbmQgaG93IGl0IG1heQppbXByb3Zl
IG91ciB3b3JrZmxvdy4KCiMjIFJlcXVpcmVtZW50cwoKMS4gV2Ugd2FudCB0byBoYXZlIGxpZ2h0
IHdlaWdodCBidWlsZCB0ZXN0cyBiZWZvcmUgYSBwYXRjaCBzZXJpZXMgaXMgcmV2aWV3ZWQKb3Ig
Y29tbWl0dGVkLgoKMi4gV2UgZG9uJ3Qgd2FudCB0byBwdXNoIGJyb2tlbiBwYXRjaGVzIHRvIGNl
bnRyYWwgcmVwb3NpdG9yeSBzdWNoIHRoYXQKZXZlcnlvbmUgaXMgYmxvY2tlZC4KCjMuIFdlIGRv
bid0IHdhbnQgdG8gc2lnbmlmaWNhbnRseSBjaGFuZ2UgY29tbWl0dGVyIHdvcmtmbG93LgoKUmVx
dWlyZW1lbnQgMiBtZWFucyB0aGF0IG91ciBjdXJyZW50IGJyYW5jaGluZyBtb2RlbCB3aWxsIG5l
ZWQgdG8gYmUgY2hhbmdlZC4KRGV0YWlscyB3aWxsIGZvbGxvdy4KCiMjIE92ZXJ2aWV3IG9mIGF1
dG9tYXRpb24gc3lzdGVtcwoKLSBHaXRsYWIgQ0kKCiAgICBJdCBpcyBjYXBhYmxlIG9mIHJ1bm5p
bmcgYnVpbGQgdGVzdHMgd2l0aCByZWxhdGl2ZWx5IHNob3J0IHR1cm5hcm91bmQgdGltZS4KCi0g
Qm90cyBsaWtlIFBhdGNoZXcgYW5kIFBhdGNod29yawoKICAgIFRoZXkgYXJlIGFibGUgdG8gc2x1
cnAgcGF0Y2hlcyBmcm9tIHhlbi1kZXZlbCBhbmQgbWF5YmUgcnVuIGN1c3RvbWlzZWQKICAgIHNj
cmlwdHMgb24gdGhvc2UgcGF0Y2hlcy4KCi0gT3NzdGVzdAoKICAgIFB1c2hnYXRlLCBpbnRlZ3Jh
dGlvbiB0ZXN0IHN5c3RlbS4gSXQgcnVucyBtb3JlIHNvcGhpc3RpY2F0ZWQgdGVzdHMKICAgIGNv
bXBhcmVkIHRvIEdpdGxhYiBDSS4gVHVybmFyb3VuZCB0aW1lIGlzIGxvbmcuCiAgICAKIyMgTmV3
IHdvcmxkCgpUaGVyZSB3aWxsIGJlIGFuIHVuaWZpZWQgZW5kcG9pbnQgZm9yIGNvbW1pdHRlcnMg
YW5kIGJvdHMuIENvbW1pdHRlcnMgYW5kIGJvdHMKd2lsbCBoYXZlIHRoZWlyIGdpdCB0cmVlcy4g
UGF0Y2hlcyBhcmUgY29tbWl0dGVkIHRvIHRob3NlIHRyZWVzLiBBbiBhdXRvbWF0ZWQKc3lzdGVt
IHdpbGwgZ2V0IHBhdGNoZXMgZnJvbSB0aG9zZSB0cmVlcyBhbmQgdHJpZ2dlciBDSSBydW5zLgoK
VGhlIHN5c3RlbSB3aWxsIHBpY2sgdXAgY29tbWl0cyBmcm9tIG9uZSBvZiB0aGUgdHJlZXMsIG1l
cmdlIHRoZW0gd2l0aCBtYXN0ZXIKYW5kIHNlbmQgdGhlIG1lcmdlIHRvIENJIHN5c3RlbXMuCgpG
b3IgYm90cywgb25seSBHaXRsYWIgQ0kgYnVpbGQgdGVzdHMgd2lsbCBydW4uIFJlc3VsdHMgYXJl
IHNlbnQgYmFjayB0bwp4ZW4tZGV2ZWwuCgpGb3IgY29tbWl0dGVycycgdHJlZXMsIGF0IGZpcnN0
IEdpdGxhYiBDSSBidWlsZCB0ZXN0cyBhcmUgcnVuLCBpZiB0aGUgcmVzdWx0IGlzCnN1Y2Nlc3Nm
dWwsIHRoZSBtZXJnZSBjb21taXQgaXMgc3VibWl0dGVkIHRvIG9zc3Rlc3QuIElmIG9zc3Rlc3Qg
ZGVlbXMgdGhlCm1lcmdlIGlzIGdvb2QsIHRoZSBtZXJnZSBpcyBwdXNoZWQgKHB1Ymxpc2hlZCkg
dG8geGVuLmdpdCwgb3RoZXJ3aXNlIHRoZSBtZXJnZQppcyBkaXNjYXJkZWQuIFRlc3QgcmVzdWx0
cyBhcmUgc2VudCBiYWNrIHRvIHhlbi1kZXZlbC4KCldpdGggdGhpcyBzeXN0ZW0sIGFsbCBwdWJs
aXNoZWQgY29tbWl0cyBzaG91bGQgaGF2ZSBhbHJlYWR5IHBhc3NlZCBHaXRsYWIgQ0kKYW5kIG9z
c3Rlc3QgdGVzdHMuCgojIyBHYXBzCgpUaGUgY29tcG9uZW50IC8gc3lzdGVtIHdoaWNoIG1lcmdl
cyB0cmVlcyBhbmQgZHJpdmVzIENJIHN5c3RlbXMgaXMgbWlzc2luZy4KClBhdGNoZXcgYW5kIFBh
dGNod29yayBkb24ndCBkbyBhbGwgdGhlIHRoaW5ncyB3ZSBjYXJlIGFib3V0IHlldC4KCiMjIENv
bmNlcm5zCgpGb3IgaW5kaXZpZHVhbCBjb21taXR0ZXJzLCB0dXJuYXJvdW5kIHRpbWUgbWF5IGJl
Y29tZSBsb25nZXIgc2luY2UgeW91IG5lZWQgdG8Kd2FpdCBmb3Igb3RoZXIgdHJlZXMgdG8gYmUg
cHJvY2Vzc2VkLgoKR2l0bGFiIENJIGRvZXNuJ3QgaGF2ZSBhIHNlbGYgcHVzaGdhdGUuIElmIGl0
IGlzIGJyb2tlbiBieSBhY2NpZGVudCBPc3N0ZXN0CndpbGwgYmUgYmxvY2tlZC4KCgpUaG91Z2h0
cyBhbmQgY29tbWVudHM/CgpXZWkuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
