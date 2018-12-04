From: Oleksandr Tyshchenko <olekstysh@gmail.com>
Subject: [PATCH 1/2] xen/link: Link proc_info_list in .data
 instead of .init.data
Date: Tue,  4 Dec 2018 13:42:24 +0200
Message-ID: <1543923745-29877-2-git-send-email-olekstysh@gmail.com>
References: <1543923745-29877-1-git-send-email-olekstysh@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=es3t=on=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1gU96G-0005jL-EF
 for xen-devel@lists.xenproject.org; Tue, 04 Dec 2018 11:42:48 +0000
Received: by mail-lj1-x244.google.com with SMTP id e5-v6so14615580lja.4
 for <xen-devel@lists.xenproject.org>; Tue, 04 Dec 2018 03:42:46 -0800 (PST)
In-Reply-To: <1543923745-29877-1-git-send-email-olekstysh@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, julien.grall@arm.com, sstabellini@kernel.org, mirela.simonovic@aggios.com
List-Id: xen-devel@lists.xenproject.org

RnJvbTogT2xla3NhbmRyIFR5c2hjaGVua28gPG9sZWtzYW5kcl90eXNoY2hlbmtvQGVwYW0uY29t
PgoKVG8gYmUgYWJsZSB0byB1c2UgaXQgZm9yIHRoZSBob3QgcGx1Z2VkIENQVXMgYXMgd2VsbC4K
ClNpZ25lZC1vZmYtYnk6IE9sZWtzYW5kciBUeXNoY2hlbmtvIDxvbGVrc2FuZHJfdHlzaGNoZW5r
b0BlcGFtLmNvbT4KLS0tCiB4ZW4vYXJjaC9hcm0veGVuLmxkcy5TIHwgMTAgKysrKysrLS0tLQog
MSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS94ZW4vYXJjaC9hcm0veGVuLmxkcy5TIGIveGVuL2FyY2gvYXJtL3hlbi5sZHMuUwppbmRl
eCAyNDVhMGUwLi4wMDMzMDFhIDEwMDY0NAotLS0gYS94ZW4vYXJjaC9hcm0veGVuLmxkcy5TCisr
KyBiL3hlbi9hcmNoL2FybS94ZW4ubGRzLlMKQEAgLTg4LDYgKzg4LDEyIEBAIFNFQ1RJT05TCiAg
ICAgICAgLiA9IEFMSUdOKFBBR0VfU0laRSk7CiAgICAgICAgKiguZGF0YS5wYWdlX2FsaWduZWQp
CiAgICAgICAgKiguZGF0YSkKKworICAgICAgIC4gPSBBTElHTihQT0lOVEVSX0FMSUdOKTsKKyAg
ICAgICBfX3Byb2NfaW5mb19zdGFydCA9IC47CisgICAgICAgKiguaW5pdC5wcm9jLmluZm8pCisg
ICAgICAgX19wcm9jX2luZm9fZW5kID0gLjsKKwogICAgICAgIC4gPSBBTElHTig4KTsKICAgICAg
ICBfX3N0YXJ0X3NjaGVkdWxlcnNfYXJyYXkgPSAuOwogICAgICAgICooLmRhdGEuc2NoZWR1bGVy
cykKQEAgLTE1MSwxMCArMTU3LDYgQEAgU0VDVElPTlMKICAgICAgICAqKC5pbml0LnNldHVwKQog
ICAgICAgIF9fc2V0dXBfZW5kID0gLjsKIAotICAgICAgIF9fcHJvY19pbmZvX3N0YXJ0ID0gLjsK
LSAgICAgICAqKC5pbml0LnByb2MuaW5mbykKLSAgICAgICBfX3Byb2NfaW5mb19lbmQgPSAuOwot
CiAgICAgICAgX19pbml0Y2FsbF9zdGFydCA9IC47CiAgICAgICAgKiguaW5pdGNhbGxwcmVzbXAu
aW5pdCkKICAgICAgICBfX3ByZXNtcF9pbml0Y2FsbF9lbmQgPSAuOwotLSAKMi43LjQKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
