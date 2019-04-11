Return-Path: <SRS0=7RrO=SN=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DBB3C10F13
	for <xen-devel@archiver.kernel.org>; Thu, 11 Apr 2019 06:53:53 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2CF0B20873
	for <xen-devel@archiver.kernel.org>; Thu, 11 Apr 2019 06:53:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2CF0B20873
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hETab-0002Bp-1X; Thu, 11 Apr 2019 06:53:37 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=i7IS=SN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hETaZ-0002Be-Kg
 for xen-devel@lists.xenproject.org; Thu, 11 Apr 2019 06:53:35 +0000
X-Inumbo-ID: 85e5c56e-5c26-11e9-92d7-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 85e5c56e-5c26-11e9-92d7-bc764e045a96;
 Thu, 11 Apr 2019 06:53:34 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 11 Apr 2019 00:53:33 -0600
Message-Id: <5CAEE46B020000780022679C@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Thu, 11 Apr 2019 00:53:31 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "xen-devel" <xen-devel@lists.xenproject.org>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [Xen-devel] [PATCH] xen-cpuid: constification
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190411065331.DsuCj8MWuNFd9scOtSah2dHIlHNzdz3McyBtrvtAEa8@z>

VGhlIG1ham9yaXR5IG9mIHRoZSBzdGF0aWMgdGFibGVzIGlzIG5ldmVyIHdyaXR0ZW4gdG8uIEFk
ZCBjb25zdCB3aGVyZQpwb3NzaWJsZS4KClNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1
bGljaEBzdXNlLmNvbT4KCi0tLSBhL3Rvb2xzL21pc2MveGVuLWNwdWlkLmMKKysrIGIvdG9vbHMv
bWlzYy94ZW4tY3B1aWQuYwpAQCAtMTMsNyArMTMsNyBAQAogCiBzdGF0aWMgdWludDMyX3QgbnJf
ZmVhdHVyZXM7CiAKLXN0YXRpYyBjb25zdCBjaGFyICpzdHJfMWRbMzJdID0KK3N0YXRpYyBjb25z
dCBjaGFyICpjb25zdCBzdHJfMWRbMzJdID0KIHsKICAgICBbIDBdID0gImZwdSIsICBbIDFdID0g
InZtZSIsCiAgICAgWyAyXSA9ICJkZSIsICAgWyAzXSA9ICJwc2UiLApAQCAtMzMsNyArMzMsNyBA
QCBzdGF0aWMgY29uc3QgY2hhciAqc3RyXzFkWzMyXSA9CiAgICAgWzMwXSA9ICJpYTY0IiwgWzMx
XSA9ICJwYmUiLAogfTsKIAotc3RhdGljIGNvbnN0IGNoYXIgKnN0cl8xY1szMl0gPQorc3RhdGlj
IGNvbnN0IGNoYXIgKmNvbnN0IHN0cl8xY1szMl0gPQogewogICAgIFsgMF0gPSAic3NlMyIsICAg
IFsgMV0gPSAicGNsbXVscWRxIiwKICAgICBbIDJdID0gImR0ZXM2NCIsICBbIDNdID0gIm1vbml0
b3IiLApAQCAtNTMsNyArNTMsNyBAQCBzdGF0aWMgY29uc3QgY2hhciAqc3RyXzFjWzMyXSA9CiAg
ICAgWzMwXSA9ICJyZHJuZCIsICAgWzMxXSA9ICJoeXBlciIsCiB9OwogCi1zdGF0aWMgY29uc3Qg
Y2hhciAqc3RyX2UxZFszMl0gPQorc3RhdGljIGNvbnN0IGNoYXIgKmNvbnN0IHN0cl9lMWRbMzJd
ID0KIHsKICAgICBbIDBdID0gImZwdSIsICAgIFsgMV0gPSAidm1lIiwKICAgICBbIDJdID0gImRl
IiwgICAgIFsgM10gPSAicHNlIiwKQEAgLTczLDcgKzczLDcgQEAgc3RhdGljIGNvbnN0IGNoYXIg
KnN0cl9lMWRbMzJdID0KICAgICBbMzBdID0gIjNkbm93KyIsIFszMV0gPSAiM2Rub3ciLAogfTsK
IAotc3RhdGljIGNvbnN0IGNoYXIgKnN0cl9lMWNbMzJdID0KK3N0YXRpYyBjb25zdCBjaGFyICpj
b25zdCBzdHJfZTFjWzMyXSA9CiB7CiAgICAgWyAwXSA9ICJsYWhmX2xtIiwgICAgWyAxXSA9ICJj
bXAiLAogICAgIFsgMl0gPSAic3ZtIiwgICAgICAgIFsgM10gPSAiZXh0YXBpYyIsCkBAIC05Miw3
ICs5Miw3IEBAIHN0YXRpYyBjb25zdCBjaGFyICpzdHJfZTFjWzMyXSA9CiAgICAgWzI4XSA9ICJw
Y3hfbDJpIiwgICAgWzI5XSA9ICJtb25pdG9yeCIsCiB9OwogCi1zdGF0aWMgY29uc3QgY2hhciAq
c3RyXzdiMFszMl0gPQorc3RhdGljIGNvbnN0IGNoYXIgKmNvbnN0IHN0cl83YjBbMzJdID0KIHsK
ICAgICBbIDBdID0gImZzZ3NiYXNlIiwgWyAxXSA9ICJ0c2MtYWRqIiwKICAgICBbIDJdID0gInNn
eCIsICAgICAgWyAzXSA9ICJibWkxIiwKQEAgLTExMiwxMyArMTEyLDEzIEBAIHN0YXRpYyBjb25z
dCBjaGFyICpzdHJfN2IwWzMyXSA9CiAgICAgWzMwXSA9ICJhdng1MTJidyIsIFszMV0gPSAiYXZ4
NTEydmwiLAogfTsKIAotc3RhdGljIGNvbnN0IGNoYXIgKnN0cl9EYTFbMzJdID0KK3N0YXRpYyBj
b25zdCBjaGFyICpjb25zdCBzdHJfRGExWzMyXSA9CiB7CiAgICAgWyAwXSA9ICJ4c2F2ZW9wdCIs
IFsgMV0gPSAieHNhdmVjIiwKICAgICBbIDJdID0gInhnZXRidjEiLCAgWyAzXSA9ICJ4c2F2ZXMi
LAogfTsKIAotc3RhdGljIGNvbnN0IGNoYXIgKnN0cl83YzBbMzJdID0KK3N0YXRpYyBjb25zdCBj
aGFyICpjb25zdCBzdHJfN2MwWzMyXSA9CiB7CiAgICAgWyAwXSA9ICJwcmVmZXRjaHd0MSIsICAg
ICAgWyAxXSA9ICJhdng1MTJfdmJtaSIsCiAgICAgWyAyXSA9ICJ1bWlwIiwgICAgICAgICAgICAg
WyAzXSA9ICJwa3UiLApAQCAtMTM2LDEzICsxMzYsMTMgQEAgc3RhdGljIGNvbnN0IGNoYXIgKnN0
cl83YzBbMzJdID0KICAgICBbMzBdID0gInNneF9sYyIsCiB9OwogCi1zdGF0aWMgY29uc3QgY2hh
ciAqc3RyX2U3ZFszMl0gPQorc3RhdGljIGNvbnN0IGNoYXIgKmNvbnN0IHN0cl9lN2RbMzJdID0K
IHsKICAgICBbIDhdID0gIml0c2MiLAogICAgIFsxMF0gPSAiZWZybyIsCiB9OwogCi1zdGF0aWMg
Y29uc3QgY2hhciAqc3RyX2U4YlszMl0gPQorc3RhdGljIGNvbnN0IGNoYXIgKmNvbnN0IHN0cl9l
OGJbMzJdID0KIHsKICAgICBbIDBdID0gImNsemVybyIsCiAKQEAgLTE0OSw3ICsxNDksNyBAQCBz
dGF0aWMgY29uc3QgY2hhciAqc3RyX2U4YlszMl0gPQogICAgIFsxMl0gPSAiaWJwYiIsCiB9Owog
Ci1zdGF0aWMgY29uc3QgY2hhciAqc3RyXzdkMFszMl0gPQorc3RhdGljIGNvbnN0IGNoYXIgKmNv
bnN0IHN0cl83ZDBbMzJdID0KIHsKICAgICBbIDJdID0gImF2eDUxMl80dm5uaXciLCBbIDNdID0g
ImF2eDUxMl80Zm1hcHMiLAogICAgIFsgNF0gPSAiZnNybSIsCkBAIC0xNjMsMTAgKzE2MywxMCBA
QCBzdGF0aWMgY29uc3QgY2hhciAqc3RyXzdkMFszMl0gPQogICAgIC8qIDMwICovICAgICAgICAg
ICAgICAgIFszMV0gPSAic3NiZCIsCiB9OwogCi1zdGF0aWMgc3RydWN0IHsKK3N0YXRpYyBjb25z
dCBzdHJ1Y3QgewogICAgIGNvbnN0IGNoYXIgKm5hbWU7CiAgICAgY29uc3QgY2hhciAqYWJicjsK
LSAgICBjb25zdCBjaGFyICoqc3RyczsKKyAgICBjb25zdCBjaGFyICpjb25zdCAqc3RyczsKIH0g
ZGVjb2Rlc1tdID0KIHsKICAgICB7ICIweDAwMDAwMDAxLmVkeCIsICAgIjFkIiwgIHN0cl8xZCB9
LApAQCAtMTk1LDcgKzE5NSw3IEBAIHN0YXRpYyBzdHJ1Y3QgZnNpbmZvIHsKICAgICBbWEVOX1NZ
U0NUTF9jcHVfZmVhdHVyZXNldF9odm1dICA9IHsgIkhWTSIsICAwLCBOVUxMIH0sCiB9OwogCi1z
dGF0aWMgdm9pZCBkdW1wX2xlYWYodWludDMyX3QgbGVhZiwgY29uc3QgY2hhciAqKnN0cnMpCitz
dGF0aWMgdm9pZCBkdW1wX2xlYWYodWludDMyX3QgbGVhZiwgY29uc3QgY2hhciAqY29uc3QgKnN0
cnMpCiB7CiAgICAgdW5zaWduZWQgaTsKIApAQCAtMzMyLDcgKzMzMiw3IEBAIGludCBtYWluKGlu
dCBhcmdjLCBjaGFyICoqYXJndikKICAgICB7CiAgICAgICAgIGNvbnN0IGNoYXIgKnRtcF9vcHRh
cmc7CiAgICAgICAgIGludCBvcHRpb25faW5kZXggPSAwLCBjOwotICAgICAgICBzdGF0aWMgc3Ry
dWN0IG9wdGlvbiBsb25nX29wdGlvbnNbXSA9CisgICAgICAgIHN0YXRpYyBjb25zdCBzdHJ1Y3Qg
b3B0aW9uIGxvbmdfb3B0aW9uc1tdID0KICAgICAgICAgewogICAgICAgICAgICAgeyAiaGVscCIs
IG5vX2FyZ3VtZW50LCBOVUxMLCAnaCcgfSwKICAgICAgICAgICAgIHsgImluZm8iLCBub19hcmd1
bWVudCwgTlVMTCwgJ2knIH0sCgoKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
