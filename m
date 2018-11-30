From: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
Subject: [PATCH v3 20/21] xen_backend: remove xen_sysdev_init()
 function
Date: Fri, 30 Nov 2018 17:38:51 +0800
Message-ID: <20181130093852.20739-21-maozhongyi@cmss.chinamobile.com>
References: <20181130093852.20739-1-maozhongyi@cmss.chinamobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Wdhc=OJ=cmss.chinamobile.com=maozhongyi@srs-us1.protection.inumbo.net>)
 id 1gSfGu-0004ZS-8a
 for xen-devel@lists.xenproject.org; Fri, 30 Nov 2018 09:39:40 +0000
In-Reply-To: <20181130093852.20739-1-maozhongyi@cmss.chinamobile.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, sstabellini@kernel.org, Mao Zhongyi <maozhongyi@cmss.chinamobile.com>, anthony.perard@citrix.com, xen-devel@lists.xenproject.org, Zhang Shengju <zhangshengju@cmss.chinamobile.com>
List-Id: xen-devel@lists.xenproject.org

VGhlIGluaXQgZnVuY3Rpb24gZG9lc24ndCBkbyBhbnl0aGluZyBhdCBhbGwsIHNvIHdlCmp1c3Qg
b21pdCBpdC4KCkNjOiBzc3RhYmVsbGluaUBrZXJuZWwub3JnCkNjOiBhbnRob255LnBlcmFyZEBj
aXRyaXguY29tCkNjOiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKQ2M6IHBldGVyLm1h
eWRlbGxAbGluYXJvLm9yZwoKU2lnbmVkLW9mZi1ieTogTWFvIFpob25neWkgPG1hb3pob25neWlA
Y21zcy5jaGluYW1vYmlsZS5jb20+ClNpZ25lZC1vZmYtYnk6IFpoYW5nIFNoZW5nanUgPHpoYW5n
c2hlbmdqdUBjbXNzLmNoaW5hbW9iaWxlLmNvbT4KQWNrZWQtYnk6IEFudGhvbnkgUEVSQVJEIDxh
bnRob255LnBlcmFyZEBjaXRyaXguY29tPgotLS0KIGh3L3hlbi94ZW5fYmFja2VuZC5jIHwgNyAt
LS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9ody94
ZW4veGVuX2JhY2tlbmQuYyBiL2h3L3hlbi94ZW5fYmFja2VuZC5jCmluZGV4IDlhOGU4NzcxZWMu
LjBiYzZiMWRlNjAgMTAwNjQ0Ci0tLSBhL2h3L3hlbi94ZW5fYmFja2VuZC5jCisrKyBiL2h3L3hl
bi94ZW5fYmFja2VuZC5jCkBAIC04MDksMTEgKzgwOSw2IEBAIHN0YXRpYyBjb25zdCBUeXBlSW5m
byB4ZW5zeXNidXNfaW5mbyA9IHsKICAgICB9CiB9OwogCi1zdGF0aWMgaW50IHhlbl9zeXNkZXZf
aW5pdChTeXNCdXNEZXZpY2UgKmRldikKLXsKLSAgICByZXR1cm4gMDsKLX0KLQogc3RhdGljIFBy
b3BlcnR5IHhlbl9zeXNkZXZfcHJvcGVydGllc1tdID0gewogICAgIHsvKiBlbmQgb2YgcHJvcGVy
dHkgbGlzdCAqL30sCiB9OwpAQCAtODIxLDkgKzgxNiw3IEBAIHN0YXRpYyBQcm9wZXJ0eSB4ZW5f
c3lzZGV2X3Byb3BlcnRpZXNbXSA9IHsKIHN0YXRpYyB2b2lkIHhlbl9zeXNkZXZfY2xhc3NfaW5p
dChPYmplY3RDbGFzcyAqa2xhc3MsIHZvaWQgKmRhdGEpCiB7CiAgICAgRGV2aWNlQ2xhc3MgKmRj
ID0gREVWSUNFX0NMQVNTKGtsYXNzKTsKLSAgICBTeXNCdXNEZXZpY2VDbGFzcyAqayA9IFNZU19C
VVNfREVWSUNFX0NMQVNTKGtsYXNzKTsKIAotICAgIGstPmluaXQgPSB4ZW5fc3lzZGV2X2luaXQ7
CiAgICAgZGMtPnByb3BzID0geGVuX3N5c2Rldl9wcm9wZXJ0aWVzOwogICAgIGRjLT5idXNfdHlw
ZSA9IFRZUEVfWEVOU1lTQlVTOwogfQotLSAKMi4xNy4xCgoKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
