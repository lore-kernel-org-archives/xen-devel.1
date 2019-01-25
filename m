From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: [PATCH v2 for-4.12] gic-vgic: fix an assert condition
Date: Fri, 25 Jan 2019 19:06:02 +0200
Message-ID: <1548435962-29797-1-git-send-email-andrii.anisov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qSih=QB=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1gn4vf-00054j-Ue
 for xen-devel@lists.xenproject.org; Fri, 25 Jan 2019 17:06:08 +0000
Received: by mail-lj1-x244.google.com with SMTP id v15-v6so8935785ljh.13
 for <xen-devel@lists.xenproject.org>; Fri, 25 Jan 2019 09:06:06 -0800 (PST)
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Andrii Anisov <andrii_anisov@epam.com>, Andre Przywara <andre.przywara@arm.com>, Stefan Nuernberger <snu@amazon.de>, Julien Grall <julien.grall@arm.com>
List-Id: xen-devel@lists.xenproject.org

RnJvbTogQW5kcmlpIEFuaXNvdiA8YW5kcmlpX2FuaXNvdkBlcGFtLmNvbT4KCkN1cnJlbnRseSwg
dGhhdCBhc3NlcnQgY29uZGl0aW9uIGRvZXMgbm90IGNvcnJlc3BvbmQgdG8gYSBjb21tZW50IGFi
b3ZlCmFuZCBtYWtlcyBhc3NlcnRpb24gZmFpbGVkIG9uIEhXIElSUSBkaXNjb25uZWN0aW9uLgpG
aXggdGhlIGNvbmRpdGlvbiBzbyBpdCBjb3JyZXNwb25kcyB0byB0aGUgY29tbWVudCBhbmQgYWxs
b3dzIElSUQpkaXNjb25uZWN0aW9uIG9uIGRlYnVnIGJ1aWxkcy4KCkZpeGVzOiBlYzJhMmYxICgi
QVJNOiBWR0lDOiBmYWN0b3Igb3V0IHZnaWNfY29ubmVjdF9od19pcnEoKSIpClNpZ25lZC1vZmYt
Ynk6IEFuZHJpaSBBbmlzb3YgPGFuZHJpaV9hbmlzb3ZAZXBhbS5jb20+ClN1Z2dlc3RlZC1ieTog
U3RlZmFuIE51ZXJuYmVyZ2VyIDxzbnVAYW1hem9uLmRlPgotLS0KaW4gdjI6CiAtIHVwZGF0ZWQg
Y29uZGl0aW9uIGFzIHN1Z2dlc3RlZCBieSBTdGVmYW4KIC0gcHJvdmlkZWQgZGV0YWlsZWQgY29t
bWl0IG1lc3NhZ2UKIC0gYWRkZWQgU3VnZ2VzdGVkLWJ5IGZyb20gU3RlZmFuCiAtIHJlZmVycmVk
IGEgY29tbWl0IGludHJvZHVjZWQgdGhlIGlzc3VlCgogeGVuL2FyY2gvYXJtL2dpYy12Z2ljLmMg
fCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRp
ZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vZ2ljLXZnaWMuYyBiL3hlbi9hcmNoL2FybS9naWMtdmdp
Yy5jCmluZGV4IDQ4OTIyZjUuLmEzYmJhODUgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL2FybS9naWMt
dmdpYy5jCisrKyBiL3hlbi9hcmNoL2FybS9naWMtdmdpYy5jCkBAIC00NDMsNyArNDQzLDcgQEAg
aW50IHZnaWNfY29ubmVjdF9od19pcnEoc3RydWN0IGRvbWFpbiAqZCwgc3RydWN0IHZjcHUgKnYs
IHVuc2lnbmVkIGludCB2aXJxLAogICAgIGludCByZXQgPSAwOwogCiAgICAgLyogImRlc2MiIGlz
IG9wdGlvbmFsIHdoZW4gd2UgZGlzY29ubmVjdCBhbiBJUlEuICovCi0gICAgQVNTRVJUKGNvbm5l
Y3QgJiYgZGVzYyk7CisgICAgQVNTRVJUKCFjb25uZWN0IHx8IGRlc2MpOwogCiAgICAgLyogV2Ug
YXJlIHRha2luZyB0byByYW5rIGxvY2sgdG8gcHJldmVudCBwYXJhbGxlbCBjb25uZWN0aW9ucy4g
Ki8KICAgICB2Z2ljX2xvY2tfcmFuayh2X3RhcmdldCwgcmFuaywgZmxhZ3MpOwotLSAKMi43LjQK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
