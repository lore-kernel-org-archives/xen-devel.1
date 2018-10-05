From: Ian Jackson <ian.jackson@citrix.com>
Subject: [PATCH 15/18] libfsimage: Honour general LDFLAGS
Date: Fri,  5 Oct 2018 18:29:14 +0100
Message-ID: <20181005172917.11963-16-ian.jackson@citrix.com>
References: <20181005172917.11963-1-ian.jackson@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=lvwj=mr=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1g8U3A-0005sS-Ic
 for xen-devel@lists.xenproject.org; Fri, 05 Oct 2018 17:38:04 +0000
In-Reply-To: <20181005172917.11963-1-ian.jackson@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Hans van Kranenburg <hans@knorrie.org>, Ian Jackson <ian.jackson@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

RG8gbm90IHJlc2V0IExERkxBR1MgdG8gZW1wdHkuICBJbnN0ZWFkLCBhcHBlbmQgdGhlIGZzaW1h
Z2Utc3BlY2lhbApMREZMQUdTLgoKU2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNr
c29uQGNpdHJpeC5jb20+Ci0tLQogdG9vbHMvbGliZnNpbWFnZS9jb21tb24vTWFrZWZpbGUgfCAy
ICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYg
LS1naXQgYS90b29scy9saWJmc2ltYWdlL2NvbW1vbi9NYWtlZmlsZSBiL3Rvb2xzL2xpYmZzaW1h
Z2UvY29tbW9uL01ha2VmaWxlCmluZGV4IDA3OTFmYzk5MjMuLmE0NjU1YzQyMWMgMTAwNjQ0Ci0t
LSBhL3Rvb2xzL2xpYmZzaW1hZ2UvY29tbW9uL01ha2VmaWxlCisrKyBiL3Rvb2xzL2xpYmZzaW1h
Z2UvY29tbW9uL01ha2VmaWxlCkBAIC02LDcgKzYsNyBAQCBNSU5PUiA9IDAKIAogTERGTEFHUy0k
KENPTkZJR19TdW5PUykgPSAtV2wsLU0gLVdsLG1hcGZpbGUtU3VuT1MKIExERkxBR1MtJChDT05G
SUdfTGludXgpID0gLVdsLG1hcGZpbGUtR05VCi1MREZMQUdTID0gJChMREZMQUdTLXkpCitMREZM
QUdTICs9ICQoTERGTEFHUy15KQogCiBDRkxBR1MgKz0gJChQVEhSRUFEX0NGTEFHUykKIExERkxB
R1MgKz0gJChQVEhSRUFEX0xERkxBR1MpCi0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
