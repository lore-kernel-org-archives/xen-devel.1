From: Paul Semel <semelpaul@gmail.com>
Subject: [PATCH v3 6/7] add mspin_sleep function to time manager
Date: Mon,  9 Apr 2018 16:35:42 +0200
Message-ID: <20180409143543.4568-6-semelpaul@gmail.com>
References: <20180409143543.4568-1-semelpaul@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=he/8=g6=gmail.com=semelpaul@srs-us1.protection.inumbo.net>)
 id 1f5XWe-0004sa-GR
 for xen-devel@lists.xenproject.org; Mon, 09 Apr 2018 14:12:04 +0000
Received: by mail-wm0-x244.google.com with SMTP id 66so13154382wmd.3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Apr 2018 07:12:03 -0700 (PDT)
In-Reply-To: <20180409143543.4568-1-semelpaul@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: wipawel@amazon.de, Paul Semel <phentex@amazon.de>, roger.pau@citrix.com, andrew.cooper3@citrix.com
List-Id: xen-devel@lists.xenproject.org

RnJvbTogUGF1bCBTZW1lbCA8cGhlbnRleEBhbWF6b24uZGU+Cgp0aGlzIGZ1bmN0aW9uIHVzZXMg
bXNwaW5fc2xlZXAgdG8gc3BpbiBzbGVlcCBmb3IgdCBtaWxsaXNlY29uZHMKClNpZ25lZC1vZmYt
Ynk6IFBhdWwgU2VtZWwgPHBoZW50ZXhAYW1hem9uLmRlPgotLS0KIGNvbW1vbi90aW1lLmMgICAg
ICB8IDYgKysrKysrCiBpbmNsdWRlL3h0Zi90aW1lLmggfCAxICsKIDIgZmlsZXMgY2hhbmdlZCwg
NyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvY29tbW9uL3RpbWUuYyBiL2NvbW1vbi90aW1l
LmMKaW5kZXggZTc0NGFiMS4uOTY4NTU5MSAxMDA2NDQKLS0tIGEvY29tbW9uL3RpbWUuYworKysg
Yi9jb21tb24vdGltZS5jCkBAIC0xNTcsNiArMTU3LDEyIEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBz
cGluX3NsZWVwKHVpbnQ2NF90IHQpCiAgICAgbnNwaW5fc2xlZXAobnNlYyk7CiB9CiAKK3N0YXRp
YyBpbmxpbmUgdm9pZCBtc3Bpbl9zbGVlcCh1aW50NjRfdCB0KQoreworICAgIHVpbnQ2NF90IG5z
ZWMgPSBNU0VDX1RPX05TRUModCk7CisgICAgbnNwaW5fc2xlZXAobnNlYyk7Cit9CisKIC8qCiAg
KiBMb2NhbCB2YXJpYWJsZXM6CiAgKiBtb2RlOiBDCmRpZmYgLS1naXQgYS9pbmNsdWRlL3h0Zi90
aW1lLmggYi9pbmNsdWRlL3h0Zi90aW1lLmgKaW5kZXggNWVkODhhZC4uMTdmYjU2MSAxMDA2NDQK
LS0tIGEvaW5jbHVkZS94dGYvdGltZS5oCisrKyBiL2luY2x1ZGUveHRmL3RpbWUuaApAQCAtMjAs
NiArMjAsNyBAQCBzdHJ1Y3QgdGltZXZhbCB7CiB9CiAKICNkZWZpbmUgU0VDX1RPX05TRUMoeCkg
KCh4KSAqIDEwMDAwMDAwMDB1bCkKKyNkZWZpbmUgTVNFQ19UT19OU0VDKHgpICgoeCkgKiAxMDAw
MDAwdWwpCiAKIAogLyogVGltZSBmcm9tIGJvb3QgaW4gbmFub3NlY29uZHMgKi8KLS0gCjIuMTYu
MQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
