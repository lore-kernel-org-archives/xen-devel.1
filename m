Return-Path: <SRS0=AokV=TP=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EFEFC04E53
	for <xen-devel@archiver.kernel.org>; Wed, 15 May 2019 11:02:48 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A7C1216FD
	for <xen-devel@archiver.kernel.org>; Wed, 15 May 2019 11:02:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A7C1216FD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQrfo-0000yR-89; Wed, 15 May 2019 11:02:12 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=P7lW=TP=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hQrfn-0000yL-40
 for xen-devel@lists.xenproject.org; Wed, 15 May 2019 11:02:11 +0000
X-Inumbo-ID: e260501c-7700-11e9-8980-bc764e045a96
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id e260501c-7700-11e9-8980-bc764e045a96;
 Wed, 15 May 2019 11:02:09 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@eu.citrix.com;
 spf=SoftFail smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL02.citrite.net
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@eu.citrix.com) identity=pra;
 client-ip=23.29.105.83; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@eu.citrix.com";
 x-conformance=sidf_compatible
Received-SPF: SoftFail (esa4.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com is inclined to not designate
 23.29.105.83 as permitted sender) identity=mailfrom;
 client-ip=23.29.105.83; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 mx include:spf.citrix.com
 include:spf2.citrix.com include:ironport.citrix.com
 include:_spf.salesforce.com ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL02.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL02.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: rfejwD5h7yyK9pn1dq5ruf5FpDR8wOz323vomhnrg6UtXa2y283Fe3jE6eSPo9FrALbUrxRcM+
 QmHF5gupK4bNO20jOReQ37lK6U0hsRLhdEjnRRAD9oQA6idEtAkmiUmgDrXDDs5v/Zt4hk5ceM
 9MDpjB402t+OxX7cLhwPiguFrqHEF2KdaLGoSm9xvvyi8IXcxRasflpvxkdmoYakCorPislk0d
 oxllEpfslBRmZEkWJvpcWhCsTOEB5QqxrkOUuwSLGzTfGBAldYc25M/1CudBwodEbgxrvRawa2
 DZA=
X-SBRS: 2.7
X-MesageID: 458588
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,472,1549947600"; 
   d="scan'208";a="458588"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 15 May 2019 12:01:25 +0100
Message-ID: <20190515110125.16882-1-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH STABLE for-4.8] x86emul/test: don't use *_len
 symbols
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
Cc: Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Ian
 Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190515110125.fGcHSMQW1h9mVFEJMrFc2vlHlzr4LNSyh0Qyli83F70@z>

RnJvbTogSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPgoKLi4uIGFzIHRoZXkgZG9uJ3Qg
d29yayBhcyBpbnRlbmRlZCB3aXRoIC1mUElDLgoKSSBkaWQgcHJlZmVyIHRoZW0gb3ZlciAqX2Vu
ZCBvbmVzIGF0IHRoZSB0aW1lIGJlY2F1c2Ugb2xkZXIgZ2NjIHdvdWxkCmNhdXNlIC5MKiBzeW1i
b2xzIHRvIGJlIHB1YmxpYywgZHVlIHRvIGlzc3VpbmcgLmdsb2JsIGZvciBhbGwKcmVmZXJlbmNl
ZCBleHRlcm5hbHMuIEFuZCBsYWJlbHMgYXQgdGhlIGVuZCBvZiBpbnN0cnVjdGlvbnMgY29sbGlk
ZQp3aXRoIHRoZSBvbmVzIGF0IHRoZSBzdGFydCBvZiB0aGUgbmV4dCBpbnN0cnVjdGlvbiwgbWFr
aW5nIGRpc2Fzc2VtYmx5CmhhcmRlciB0byBncm9rLiBMdWNraWx5IHJlY2VudCBnY2Mgbm8gbG9u
Z2VyIGlzc3VlcyB0aG9zZSAuZ2xvYmwKZGlyZWN0aXZlcywgYW5kIGhlbmNlIC5MKiBsYWJlbHMs
IHN0YXlpbmcgbG9jYWwgYnkgZGVmYXVsdCwgbm8gbG9uZ2VyCmdldCBpbiB0aGUgd2F5LgoKUmVw
b3J0ZWQtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+ClNpZ25lZC1vZmYtYnk6IEph
biBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KUmV2aWV3ZWQtYnk6IFdlaSBMaXUgPHdlaS5s
aXUyQGNpdHJpeC5jb20+ClRlc3RlZC1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4K
CihjaGVycnkgcGlja2VkIGZyb20gY29tbWl0IDkzMTVmYTBlZjczNmQxMTUzYzk4Y2U0MmJmZjU4
NTNkYTVlYzY5N2YpCgpUaGlzIGJhY2twb3J0IGhhZCBzb21lIGNvbmZsaWN0cy4gIE5vdGFibHkK
ICAgNWFkOThlM2M3ZmE5MmY0NmQ3N2E3ODhlMTEwOWI3ZDI4MmJkMTI1NgogICB4ODZlbXVsOiBz
dXBwb3J0IEFEQ1gvQURPWApjb250YWlucyBhIGNoYW5nZSB0byB0aGUgZGVmaW5pdGlvbiBvZiBz
ZXRfaW5zbi4gIFRoaXMgaXMgbm90Cm1lbnRpb25lZCBpbiB0aGUgY29tbWl0IG1lc3NhZ2UgYW5k
IHRoZXJlZm9yZSBsYWNrcyBhbnkga2luZCBvZgpqdXN0aWZpY2F0aW9uLgoKSSBzdHJvbmdseSBk
ZXByZWNhdGUgdGhpczsgdGhhdCBjaGFuZ2Ugb3VnaHQgdG8gaGF2ZSBiZWVuIHNwbGl0IG91dApp
bnRvIGl0cyBvd24gY29tbWl0LCBubyBtYXR0ZXIgdGhhdCBpdCdzIHZlcnkgc21hbGwuICBBZnRl
cgpjb25zdWx0YXRpb24gSSBoYXZlIGRlY2lkZWQgdG8gZHJvcCByYXRoZXIgdGhhbiBiYWNrcG9y
dCB0aGF0IGNoYW5nZQp0byB0aGUgZGVmaW5pdGlvbiBvZiBzZXRfaW5zbi4KCkNDOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+CkNDOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVy
M0BjaXRyaXguY29tPgpDQzogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KU2lnbmVkLW9m
Zi1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Ci0tLQogdG9vbHMv
dGVzdHMveDg2X2VtdWxhdG9yL3Rlc3RfeDg2X2VtdWxhdG9yLmMgfCAxMCArKysrKy0tLS0tCiAx
IGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL3Rvb2xzL3Rlc3RzL3g4Nl9lbXVsYXRvci90ZXN0X3g4Nl9lbXVsYXRvci5jIGIvdG9vbHMv
dGVzdHMveDg2X2VtdWxhdG9yL3Rlc3RfeDg2X2VtdWxhdG9yLmMKaW5kZXggN2I0NjdmZTAyMS4u
ZjkwMmQwYjk5YiAxMDA2NDQKLS0tIGEvdG9vbHMvdGVzdHMveDg2X2VtdWxhdG9yL3Rlc3RfeDg2
X2VtdWxhdG9yLmMKKysrIGIvdG9vbHMvdGVzdHMveDg2X2VtdWxhdG9yL3Rlc3RfeDg2X2VtdWxh
dG9yLmMKQEAgLTc2NiwxNSArNzY2LDE1IEBAIGludCBtYWluKGludCBhcmdjLCBjaGFyICoqYXJn
dikKICAgICAgICAgZ290byBmYWlsOwogICAgIHByaW50Zigib2theVxuIik7CiAKLSNkZWZpbmUg
ZGVjbF9pbnNuKHdoaWNoKSBleHRlcm4gY29uc3QgdW5zaWduZWQgY2hhciB3aGljaFtdLCB3aGlj
aCMjX2xlbltdCisjZGVmaW5lIGRlY2xfaW5zbih3aGljaCkgZXh0ZXJuIGNvbnN0IHVuc2lnbmVk
IGNoYXIgd2hpY2hbXSwgXAorICAgICAgICAgICAgICAgICAgICAgICAgIHdoaWNoIyNfZW5kW10g
YXNtICggIi5MIiAjd2hpY2ggIl9lbmQiICkKICNkZWZpbmUgcHV0X2luc24od2hpY2gsIGluc24p
ICIucHVzaHNlY3Rpb24gLnRlc3QsIFwiYXhcIiwgQHByb2diaXRzXG4iIFwKICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICN3aGljaCAiOiAiIGluc24gIlxuIiAgICAgICAgICAgICAgICAg
ICAgIFwKLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICIuZXF1ICIgI3doaWNoICJfbGVu
LCAuLSIgI3doaWNoICJcbiIgICAgIFwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICIu
TCIgI3doaWNoICJfZW5kOlxuIiAgICAgICAgICAgICAgICAgICAgIFwKICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICIucG9wc2VjdGlvbiIKICNkZWZpbmUgc2V0X2luc24od2hpY2gpIChy
ZWdzLmVpcCA9ICh1bnNpZ25lZCBsb25nKW1lbWNweShpbnN0ciwgd2hpY2gsIFwKLSAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICh1bnNpZ25lZCBsb25nKXdoaWNo
IyNfbGVuKSkKLSNkZWZpbmUgY2hlY2tfZWlwKHdoaWNoKSAocmVncy5laXAgPT0gKHVuc2lnbmVk
IGxvbmcpaW5zdHIgKyBcCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICh1
bnNpZ25lZCBsb25nKXdoaWNoIyNfbGVuKQorICAgICAgICAgICAgICAgICAgICAgKHVuc2lnbmVk
IGxvbmcpd2hpY2gjI19lbmQgLSAodW5zaWduZWQgbG9uZykod2hpY2gpKSkKKyNkZWZpbmUgY2hl
Y2tfZWlwKHdoaWNoKSAocmVncy5laXAgPT0gKHVuc2lnbmVkIGxvbmcpd2hpY2gjI19lbmQpCiAK
ICAgICBwcmludGYoIiUtNDBzIiwgIlRlc3RpbmcgbW92cSAlbW0zLCglZWN4KS4uLiIpOwogICAg
IGlmICggc3RhY2tfZXhlYyAmJiBjcHVfaGFzX21teCApCi0tIAoyLjExLjAKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
