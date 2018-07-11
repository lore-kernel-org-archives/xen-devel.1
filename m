From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 2/8] Publish: Default LogsPublish and
 ResultsPublish from Publish
Date: Wed, 11 Jul 2018 15:14:14 +0100
Message-ID: <1531318460-4509-3-git-send-email-ian.jackson@eu.citrix.com>
References: <1531318460-4509-1-git-send-email-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ygtr=j3=citrix.com=prvs=723fa8a25=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fdFt2-00069o-FE
 for xen-devel@lists.xenproject.org; Wed, 11 Jul 2018 14:14:32 +0000
In-Reply-To: <1531318460-4509-1-git-send-email-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <Ian.Jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

QW5kIGRlbGV0ZSB0aGUgZXhwbGljaXQgc2V0dGluZ3MgZnJvbSBwcm9kdWN0aW9uLWNvbmZpZy4K
Ck5vIGZ1bmN0aW9uYWwgY2hhbmdlLgoKU2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPElhbi5K
YWNrc29uQGV1LmNpdHJpeC5jb20+Ci0tLQogT3NzdGVzdC5wbSAgICAgICAgfCA0ICsrLS0KIHBy
b2R1Y3Rpb24tY29uZmlnIHwgMyAtLS0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
LCA1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL09zc3Rlc3QucG0gYi9Pc3N0ZXN0LnBtCmlu
ZGV4IDMzNzdlYTMuLjczOGVkNGYgMTAwNjQ0Ci0tLSBhL09zc3Rlc3QucG0KKysrIGIvT3NzdGVz
dC5wbQpAQCAtMjU1LDggKzI1NSw4IEBAIEVORAogICAgIG15ICRwdWJiYXNlcHJlZml4ID0gJGN7
UHViQmFzZURpcn0gPyAiJGN7UHViQmFzZURpcn0vIiA6ICIiOwogICAgIGZvcmVhY2ggbXkgJGwg
KHF3KGxvZ3MgcmVzdWx0cykpIHsKIAlteSAkdSA9IHVjZmlyc3QgJGw7Ci0JbmV4dCBpZiBkZWZp
bmVkICRjeyR1fTsKLQkkY3siJHt1fSJ9ID0gIiRwdWJiYXNlcHJlZml4JGwiOworCSRjeyIke3V9
In0gLy89ICIkcHViYmFzZXByZWZpeCRsIjsKKwkkY3siJHt1fVB1Ymxpc2gifSAvLz0gIiRje1B1
Ymxpc2h9LyRsIiBpZiBkZWZpbmVkICRje1B1Ymxpc2h9OwogICAgIH0KIAogICAgICRje1N0YXNo
fSAvLz0gJGN7TG9nc307CmRpZmYgLS1naXQgYS9wcm9kdWN0aW9uLWNvbmZpZyBiL3Byb2R1Y3Rp
b24tY29uZmlnCmluZGV4IDQ4YjFlOGUuLmRmMDJjZDMgMTAwNjQ0Ci0tLSBhL3Byb2R1Y3Rpb24t
Y29uZmlnCisrKyBiL3Byb2R1Y3Rpb24tY29uZmlnCkBAIC01OSw5ICs1OSw2IEBAIFJlcG9ydEh0
bWxVbnB1YkJhc2VVcmw9Imh0dHA6Ly9vc3N0ZXN0L35vc3N0ZXN0L3B1Yi9sb2dzLyIKIFB1Ymxp
c2ggb3NzdGVzdEB3d3c6L3Zhci93d3cvb3NzdGVzdAogR2xvYmFsTG9ja0RpciAvaG9tZS9vc3N0
ZXN0L3Rlc3RpbmcuZ2l0CiAKLUxvZ3NQdWJsaXNoPSAiJGN7UHVibGlzaH0vbG9ncyIKLVJlc3Vs
dHNQdWJsaXNoPSAiJGN7UHVibGlzaH0vcmVzdWx0cyIKLQogSGFybmVzc1B1Ymxpc2hHaXRVc2Vy
SG9zdCBvc3N0ZXN0QHhlbmJpdHMueGVuLm9yZwogSGFybmVzc1B1Ymxpc2hHaXRSZXBvRGlyIGV4
dC9vc3N0ZXN0LW1hc3NhY2h1c2V0dHMuZ2l0CiAKLS0gCjIuMS40CgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
