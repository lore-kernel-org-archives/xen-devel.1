From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 1/8] cr-ensure-disk-space: With -D,
 print check_space command
Date: Wed, 11 Jul 2018 15:14:13 +0100
Message-ID: <1531318460-4509-2-git-send-email-ian.jackson@eu.citrix.com>
References: <1531318460-4509-1-git-send-email-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ygtr=j3=citrix.com=prvs=723fa8a25=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fdFt3-00069y-43
 for xen-devel@lists.xenproject.org; Wed, 11 Jul 2018 14:14:33 +0000
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

U2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPElhbi5KYWNrc29uQGV1LmNpdHJpeC5jb20+Ci0t
LQogY3ItZW5zdXJlLWRpc2stc3BhY2UgfCA1ICsrKystCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNl
cnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvY3ItZW5zdXJlLWRpc2stc3Bh
Y2UgYi9jci1lbnN1cmUtZGlzay1zcGFjZQppbmRleCA3MDkxMzE0Li4zZTAyODhmIDEwMDc1NQot
LS0gYS9jci1lbnN1cmUtZGlzay1zcGFjZQorKysgYi9jci1lbnN1cmUtZGlzay1zcGFjZQpAQCAt
MjUsNiArMjUsNyBAQCBCRUdJTiB7IHVuc2hpZnQgQElOQywgcXcoLik7IH0KIHVzZSBPc3N0ZXN0
OwogdXNlIE9zc3Rlc3Q6Ok1hbmFnZW1lbnQgcXcoOmxvZ3MpOwogdXNlIEZjbnRsIHF3KDpmbG9j
ayk7Cit1c2UgRGF0YTo6RHVtcGVyOwogCiBvdXIgJGRyeXJ1bj0gMDsKIG91ciAkZm9yY2U7CkBA
IC01Niw3ICs1Nyw5IEBAIGNzcmVhZGNvbmZpZygpOwogbG9nc19zZWxlY3QgJGNmZ2Jhc2Ugb3Ig
ZXhpdCAwOwogCiBzdWIgY2hlY2tfc3BhY2UgKCkgewotICAgIG9wZW4gUCwgIi18Iiwgb25sb2do
b3N0ICJkZiAtLWJsb2NrLXNpemU9MU0gLVAgJGxvZ2RpciIgb3IgZGllICQhOworICAgIG15IEBj
bWQgPSBvbmxvZ2hvc3QgImRmIC0tYmxvY2stc2l6ZT0xTSAtUCAkbG9nZGlyIjsKKyAgICBwcmlu
dCBERUJVRyAiY2hlY2tfc3BhY2U6ICIsIER1bXBlcihcQGNtZCk7CisgICAgb3BlbiBQLCAiLXwi
LCBAY21kIG9yIGRpZSAkITsKICAgICAkXz0gPFA+OwogICAgIG0vXmZpbGVzeXN0ZW0vaSBvciBk
aWUgIiRfID8iOwogICAgICRfPSA8UD47Ci0tIAoyLjEuNAoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
