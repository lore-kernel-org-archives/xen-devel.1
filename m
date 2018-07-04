From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 2/3] resource allocation: PropEq,
 PropMinVer: Honour HostProp_...
Date: Wed, 4 Jul 2018 11:56:30 +0100
Message-ID: <1530701791-32462-2-git-send-email-ian.jackson@eu.citrix.com>
References: <23356.42924.671628.339753@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=8qzb=ju=citrix.com=prvs=716786cb2=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fafSk-00018p-J1
 for xen-devel@lists.xenproject.org; Wed, 04 Jul 2018 10:56:42 +0000
In-Reply-To: <23356.42924.671628.339753@mariner.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <royger@FreeBSD.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

V2UgbmVlZCB0byB0YWtlIHRoZXNlIGZyb20gdGhlIGNvbmZpZyB0b28uCgpTaWduZWQtb2ZmLWJ5
OiBJYW4gSmFja3NvbiA8SWFuLkphY2tzb25AZXUuY2l0cml4LmNvbT4KQ0M6IFJvZ2VyIFBhdSBN
b25uw6kgPHJveWdlckBGcmVlQlNELm9yZz4KLS0tCiBPc3N0ZXN0L1Jlc291cmNlQ29uZGl0aW9u
L1Byb3BDb21wYXJlQmFzZS5wbSB8IDUgKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlv
bnMoKykKCmRpZmYgLS1naXQgYS9Pc3N0ZXN0L1Jlc291cmNlQ29uZGl0aW9uL1Byb3BDb21wYXJl
QmFzZS5wbSBiL09zc3Rlc3QvUmVzb3VyY2VDb25kaXRpb24vUHJvcENvbXBhcmVCYXNlLnBtCmlu
ZGV4IDFlM2FhODUuLmUxZWZlNWYgMTAwNjQ0Ci0tLSBhL09zc3Rlc3QvUmVzb3VyY2VDb25kaXRp
b24vUHJvcENvbXBhcmVCYXNlLnBtCisrKyBiL09zc3Rlc3QvUmVzb3VyY2VDb25kaXRpb24vUHJv
cENvbXBhcmVCYXNlLnBtCkBAIC00Nyw2ICs0NywxMSBAQCBzdWIgbmV3IHsKIHN1YiBfZ2V0X3Zh
bCAoJCQkKSB7CiAgICAgbXkgKCRwYywgJHJlc3R5cGUsICRyZXNuYW1lKSA9IEBfOwogCisgICAg
aWYgKCRyZXN0eXBlIGVxICdob3N0JykgeworCW15ICR2ID0gJGN7Ikhvc3RQcm9wXyR7cmVzbmFt
ZX0ifTsKKwlyZXR1cm4gJHYgaWYgZGVmaW5lZCAkdjsKKyAgICB9CisKICAgICAjIFVzaW5nIF9j
YWNoZWQgYXZvaWRzIG5lZWRpbmcgdG8gd29ycnkgYWJvdXQgJGRiaF90ZXN0cyBiZWluZwogICAg
ICMgY2xvc2VkL3Jlb3BlbmVkIGJldHdlZW4gaW52b2NhdGlvbnMKICAgICBteSAkaHByb3BxID0g
JGRiaF90ZXN0cy0+cHJlcGFyZV9jYWNoZWQoPDxFTkQpOwotLSAKMi4xLjQKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
