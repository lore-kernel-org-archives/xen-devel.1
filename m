From: Jintack Lim <jintack@cs.columbia.edu>
Subject: How to use PV drivers with fully virtualized HVM on x86?
Date: Wed, 24 Oct 2018 10:16:07 -0400
Message-ID: <CAHyh4xgK11VZjgwPKoAwNTx0rD4z+gk+oakY9JrCM426Ekqq0g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=pirj=ne=columbia.edu=jl4312@srs-us1.protection.inumbo.net>)
 id 1gFJxP-0004ub-97
 for xen-devel@lists.xenproject.org; Wed, 24 Oct 2018 14:16:23 +0000
Received: from hazelnut (hazelnut.cc.columbia.edu [128.59.213.250])
 by outprodmail01.cc.columbia.edu (8.14.4/8.14.4) with ESMTP id w9OEBovq033194
 for <xen-devel@lists.xenproject.org>; Wed, 24 Oct 2018 10:16:21 -0400
Received: from hazelnut (localhost.localdomain [127.0.0.1])
 by hazelnut (Postfix) with ESMTP id 8A81E6D
 for <xen-devel@lists.xenproject.org>; Wed, 24 Oct 2018 10:16:21 -0400 (EDT)
Received: from sendprodmail03.cc.columbia.edu (sendprodmail03.cc.columbia.edu
 [128.59.72.15]) by hazelnut (Postfix) with ESMTP id 756266D
 for <xen-devel@lists.xenproject.org>; Wed, 24 Oct 2018 10:16:21 -0400 (EDT)
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72])
 by sendprodmail03.cc.columbia.edu (8.14.4/8.14.4) with ESMTP id w9OEGKu1022729
 (version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 24 Oct 2018 10:16:21 -0400
Received: by mail-ed1-f72.google.com with SMTP id d17-v6so2112632edv.4
 for <xen-devel@lists.xenproject.org>; Wed, 24 Oct 2018 07:16:21 -0700 (PDT)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com.
 [209.85.221.47])
 by smtp.gmail.com with ESMTPSA id d10-v6sm1025689ejb.35.2018.10.24.07.16.18
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 24 Oct 2018 07:16:18 -0700 (PDT)
Received: by mail-wr1-f47.google.com with SMTP id y15-v6so1402624wru.9
 for <xen-devel@lists.xenproject.org>; Wed, 24 Oct 2018 07:16:18 -0700 (PDT)
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org, xen-users@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

SGksCgpJJ20gaW50ZXJlc3RlZCBydW5uaW5nIEhWTSBEb21VIG9ubHkgd2l0aCBQViBkcml2ZXJz
IChuZXR3b3JrIGFuZApkaXNrKS4gRW5hYmxpbmcgQ09ORklHX1hFTl9ORVRERVZfRlJPTlRFTkQg
YW5kIHN0dWZmIGRpZG4ndCBtYWtlIERvbVUKc2VlIHRoZSBQViBkZXZpY2VzIHVudGlsIEkgZW5h
YmxlZCBDT05GSUdfWEVOX1BWSFZNLgoKQnV0IGJ5IGxvb2tpbmcgYXQgdGhlIHZpcnR1YWxpemF0
aW9uIHNwZWN0cnVtWzFdLCBpdCBzZWVtcyBwb3NzaWJsZSB0bwpkbyAiSFZNIHdpdGggUFYgZHJp
dmVycyIsIGJ1dCBJIGNvdWxkbid0IGZpbmQgYW55IGd1aWRlIChpLmUuCmtlcm5lbC94ZW4gY29u
ZmlndXJhdGlvbikgdG8gZG8gdGhhdC4gQ291bGQgYW55b25lIHNoZWQgc29tZSBsaWdodCBvbgp0
aGlzPwoKSSdtIGN1cnJlbnRseSB1c2luZyBMaW51eCBrZXJuZWwgNC4xNSwgYW5kIFhlbiA0LjEw
LjEuCgpUaGFua3MsCkppbnRhY2sKClsxXSBodHRwczovL3dpa2kueGVucHJvamVjdC5vcmcvd2lr
aS9VbmRlcnN0YW5kaW5nX3RoZV9WaXJ0dWFsaXphdGlvbl9TcGVjdHJ1bQoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
