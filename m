From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 4/8] cr-publish-flight-logs: Refactor
 rsync -e option construction
Date: Wed, 11 Jul 2018 15:14:16 +0100
Message-ID: <1531318460-4509-5-git-send-email-ian.jackson@eu.citrix.com>
References: <1531318460-4509-1-git-send-email-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ygtr=j3=citrix.com=prvs=723fa8a25=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fdFt3-0006A0-93
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

UHJldmlvdXNseSB0aGlzIHdhcyBoYXJkY29kZWQuICBOb3cgd2UgbWFrZSBhIHZhcmlhYmxlIEBz
c2gsIGFuZCB1c2UKcnN5bmMncyBxdW90aW5nIHNjaGVtZSB0byB0cmFuc2Zvcm0gaXQgaW50byBh
IHZhbHVlIHN1aXRhYmxlIGZvciAtZS4KCk5vIG92ZXJhbGwgZnVuY3Rpb25hbCBjaGFuZ2UsIGFs
dGhvdWdoIG5vdyB0aGUgcnN5bmMgY29tbWFuZCBjb250YWlucwphZGRpdGlvbmFsIHF1b3RlcyBp
biB0aGUgLWUgb3B0aW9uLgoKU2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPElhbi5KYWNrc29u
QGV1LmNpdHJpeC5jb20+Ci0tLQogY3ItcHVibGlzaC1mbGlnaHQtbG9ncyB8IDMgKystCiAxIGZp
bGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEv
Y3ItcHVibGlzaC1mbGlnaHQtbG9ncyBiL2NyLXB1Ymxpc2gtZmxpZ2h0LWxvZ3MKaW5kZXggNTM5
MzE4ZC4uOWUxMzY1MiAxMDA3NTUKLS0tIGEvY3ItcHVibGlzaC1mbGlnaHQtbG9ncworKysgYi9j
ci1wdWJsaXNoLWZsaWdodC1sb2dzCkBAIC02MSw4ICs2MSw5IEBAIHN1YiBjb3B5ZGlyICgkJCkg
ewogICAgIHJldHVybiB1bmxlc3MgJGN7IiR7Y2ZnYmFzZX1QdWJsaXNoIn07CiAgICAgbXkgJHNy
YyA9ICRjeyRjZmdiYXNlfS4kc3ViZGlyLiIvIjsKICAgICBteSAkZHN0ID0gJGN7IiR7Y2ZnYmFz
ZX1QdWJsaXNoIn0uJHN1YmRpcjsKKyAgICBteSBAc3NoID0gcXcoc3NoIC1vIGJhdGNobW9kZT15
ZXMpOwogICAgIG15IEBjbWQ9IHF3KHJzeW5jIC0tY29tcHJlc3MgLS1jb21wcmVzcy1sZXZlbD05
IC0tc3RhdHMgLS1kZWxldGUgLWF1SCk7Ci0gICAgcHVzaCBAY21kLCAnLWUnLCAnc3NoIC1vIGJh
dGNobW9kZT15ZXMnOworICAgIHB1c2ggQGNtZCwgJy1lJywgam9pbignICcsIG1hcCB7IHMvXCcv
JycvZzsgIickXyciOyB9IEBzc2gpOwogICAgICMtLWJ3bGltaXQ9NTAKICAgICBwdXNoIEBjbWQs
ICRzcmMsICRkc3Q7CiAgICAgcHJpbnQgIisgQGNtZFxuIjsKLS0gCjIuMS40CgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
