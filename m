Return-Path: <SRS0=7ods=SL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8791BC10F0E
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 11:28:03 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6257D2084C
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 11:28:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6257D2084C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDouw-0000Ni-AD; Tue, 09 Apr 2019 11:27:54 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+Yc4=SL=citrix.com=prvs=99536ed25=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hDouu-0000LX-PE
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 11:27:52 +0000
X-Inumbo-ID: 82be89b6-5aba-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 82be89b6-5aba-11e9-92d7-bc764e045a96;
 Tue, 09 Apr 2019 11:27:51 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,329,1549929600"; d="scan'208";a="83096424"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <devel@edk2.groups.io>
Date: Tue, 9 Apr 2019 12:08:31 +0100
Message-ID: <20190409110844.14746-19-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190409110844.14746-1-anthony.perard@citrix.com>
References: <20190409110844.14746-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 18/31] OvmfPkg/XenPlatformPei: Setup
 HyperPages earlier
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
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Jordan Justen <jordan.l.justen@intel.com>, Julien Grall <julien.grall@arm.com>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Laszlo Ersek <lersek@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190409110831.qC6cYTbDkK0R9LgiCIK0MRC5AxUawZKuINi8Bp3kMQ8@z>

V2UgYXJlIGdvaW5nIHRvIG5lZWQgdG8gbWFrZSBhbiBoeXBlcmNhbGwgaW4gb3JkZXIgdG8gcmV0
cmVpdmUgdGhlIEU4MjAKdGFibGUgZnJvbSB0aGUgaHlwZXJ2aXNvciBiZWZvcmUgYmVlbiBhYmxl
IHRvIHNldHVwIHRoZSBtZW1vcnkuCgpDYWxsaW5nIFhlbkNvbm5lY3QgZWFybGllciB3aWxsIGFs
bG93IHRvIHNldHVwIHRoZSBYZW5IeXBlcmNhbGxMaWIKZWFybGllciB0byBhbGxvdyB0byBtYWtl
IGh5cGVyY2FsbHMuCgpXaGlsZSBoZXJlLCBhZGQgc29tZSBjb21tZW50cyBpbiBYZW5Db25uZWN0
KCkuCgpDb250cmlidXRlZC11bmRlcjogVGlhbm9Db3JlIENvbnRyaWJ1dGlvbiBBZ3JlZW1lbnQg
MS4xClNpZ25lZC1vZmYtYnk6IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXgu
Y29tPgotLS0KIE92bWZQa2cvWGVuUGxhdGZvcm1QZWkvUGxhdGZvcm0uaCB8ICA1ICsrKysrCiBP
dm1mUGtnL1hlblBsYXRmb3JtUGVpL1BsYXRmb3JtLmMgfCAgMiArKwogT3ZtZlBrZy9YZW5QbGF0
Zm9ybVBlaS9YZW4uYyAgICAgIHwgMjMgKysrKysrKysrKy0tLS0tLS0tLS0KIDMgZmlsZXMgY2hh
bmdlZCwgMTkgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvT3Zt
ZlBrZy9YZW5QbGF0Zm9ybVBlaS9QbGF0Zm9ybS5oIGIvT3ZtZlBrZy9YZW5QbGF0Zm9ybVBlaS9Q
bGF0Zm9ybS5oCmluZGV4IDU1NjVkNDdlMzQuLmE1MjRjMjNhNDMgMTAwNjQ0Ci0tLSBhL092bWZQ
a2cvWGVuUGxhdGZvcm1QZWkvUGxhdGZvcm0uaAorKysgYi9Pdm1mUGtnL1hlblBsYXRmb3JtUGVp
L1BsYXRmb3JtLmgKQEAgLTg1LDYgKzg1LDExIEBAIEluc3RhbGxDbGVhckNhY2hlQ2FsbGJhY2sg
KAogICBWT0lECiAgICk7CiAKK0VGSV9TVEFUVVMKK1hlbkNvbm5lY3QgKAorICBWT0lECisgICk7
CisKIEVGSV9TVEFUVVMKIEluaXRpYWxpemVYZW4gKAogICBWT0lECmRpZmYgLS1naXQgYS9Pdm1m
UGtnL1hlblBsYXRmb3JtUGVpL1BsYXRmb3JtLmMgYi9Pdm1mUGtnL1hlblBsYXRmb3JtUGVpL1Bs
YXRmb3JtLmMKaW5kZXggMmQ1NjdhNDc2MC4uNWU2ZDU1M2FkNSAxMDA2NDQKLS0tIGEvT3ZtZlBr
Zy9YZW5QbGF0Zm9ybVBlaS9QbGF0Zm9ybS5jCisrKyBiL092bWZQa2cvWGVuUGxhdGZvcm1QZWkv
UGxhdGZvcm0uYwpAQCAtNDIxLDYgKzQyMSw4IEBAIEluaXRpYWxpemVYZW5QbGF0Zm9ybSAoCiAg
ICAgQ3B1RGVhZExvb3AgKCk7CiAgIH0KIAorICBYZW5Db25uZWN0ICgpOworCiAgIEJvb3RNb2Rl
SW5pdGlhbGl6YXRpb24gKCk7CiAgIEFkZHJlc3NXaWR0aEluaXRpYWxpemF0aW9uICgpOwogCmRp
ZmYgLS1naXQgYS9Pdm1mUGtnL1hlblBsYXRmb3JtUGVpL1hlbi5jIGIvT3ZtZlBrZy9YZW5QbGF0
Zm9ybVBlaS9YZW4uYwppbmRleCAyMmM3YTIyYzg4Li5iMzZlZmY1MjRkIDEwMDY0NAotLS0gYS9P
dm1mUGtnL1hlblBsYXRmb3JtUGVpL1hlbi5jCisrKyBiL092bWZQa2cvWGVuUGxhdGZvcm1QZWkv
WGVuLmMKQEAgLTc4LDE0ICs3OCwxMSBAQCBYZW5HZXRFODIwTWFwICgKIC8qKgogICBDb25uZWN0
cyB0byB0aGUgSHlwZXJ2aXNvci4KICAKLSAgQHBhcmFtICBYZW5MZWFmICAgICBDUFVJRCBpbmRl
eCB1c2VkIHRvIGNvbm5lY3QuCi0KICAgQHJldHVybiBFRklfU1RBVFVTCiAKICoqLwogRUZJX1NU
QVRVUwogWGVuQ29ubmVjdCAoCi0gIFVJTlQzMiBYZW5MZWFmCiAgICkKIHsKICAgVUlOVDMyIElu
ZGV4OwpAQCAtOTYsNyArOTMsMTMgQEAgWGVuQ29ubmVjdCAoCiAgIENIQVI4IFNpZ1tzaXplb2Yg
KEluZm8tPlNpZ25hdHVyZSkgKyAxXTsKICAgVUlOVDMyICpQVkhSZXNldFZlY3RvckRhdGE7CiAK
LSAgQXNtQ3B1aWQgKFhlbkxlYWYgKyAyLCAmVHJhbnNmZXJQYWdlcywgJlRyYW5zZmVyUmVnLCBO
VUxMLCBOVUxMKTsKKyAgQVNTRVJUIChtWGVuTGVhZiAhPSAwKTsKKworICAvLworICAvLyBQcmVw
YXJlIEh5cGVyUGFnZXMgdG8gYmUgYWJsZSB0byBtYWtlIGh5cGVyY2FsbHMKKyAgLy8KKworICBB
c21DcHVpZCAobVhlbkxlYWYgKyAyLCAmVHJhbnNmZXJQYWdlcywgJlRyYW5zZmVyUmVnLCBOVUxM
LCBOVUxMKTsKICAgbVhlbkluZm8uSHlwZXJQYWdlcyA9IEFsbG9jYXRlUGFnZXMgKFRyYW5zZmVy
UGFnZXMpOwogICBpZiAoIW1YZW5JbmZvLkh5cGVyUGFnZXMpIHsKICAgICByZXR1cm4gRUZJX09V
VF9PRl9SRVNPVVJDRVM7CkBAIC0xMDgsNyArMTExLDExIEBAIFhlbkNvbm5lY3QgKAogICAgICAg
ICAgICAgICAgICAgIChJbmRleCA8PCBFRklfUEFHRV9TSElGVCkgKyBJbmRleCk7CiAgIH0KIAot
ICBBc21DcHVpZCAoWGVuTGVhZiArIDEsICZYZW5WZXJzaW9uLCBOVUxMLCBOVUxMLCBOVUxMKTsK
KyAgLy8KKyAgLy8gRmluZCBvdXQgdGhlIFhlbiB2ZXJzaW9uCisgIC8vCisKKyAgQXNtQ3B1aWQg
KG1YZW5MZWFmICsgMSwgJlhlblZlcnNpb24sIE5VTEwsIE5VTEwsIE5VTEwpOwogICBERUJVRyAo
KEVGSV9EX0VSUk9SLCAiRGV0ZWN0ZWQgWGVuIHZlcnNpb24gJWQuJWRcbiIsCiAgICAgICAgICAg
WGVuVmVyc2lvbiA+PiAxNiwgWGVuVmVyc2lvbiAmIDB4RkZGRikpOwogICBtWGVuSW5mby5WZXJz
aW9uTWFqb3IgPSAoVUlOVDE2KShYZW5WZXJzaW9uID4+IDE2KTsKQEAgLTI2NSwxMiArMjcyLDYg
QEAgSW5pdGlhbGl6ZVhlbiAoCiB7CiAgIFJFVFVSTl9TVEFUVVMgUGNkU3RhdHVzOwogCi0gIGlm
IChtWGVuTGVhZiA9PSAwKSB7Ci0gICAgcmV0dXJuIEVGSV9OT1RfRk9VTkQ7Ci0gIH0KLQotICBY
ZW5Db25uZWN0IChtWGVuTGVhZik7Ci0KICAgLy8KICAgLy8gUmVzZXJ2ZSBhd2F5IEhWTUxPQURF
UiByZXNlcnZlZCBtZW1vcnkgWzB4RkMwMDAwMDAsMHhGRDAwMDAwMCkuCiAgIC8vIFRoaXMgbmVl
ZHMgdG8gbWF0Y2ggSFZNTE9BREVSIFJFU0VSVkVEX01FTUJBU0UvUkVTRVJWRURfTUVNU0laRS4K
LS0gCkFudGhvbnkgUEVSQVJECgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
