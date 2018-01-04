From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH RFC v1 74/74] libxl: pvshim: Set video_memkb to
	~0
Date: Thu, 4 Jan 2018 13:06:25 +0000
Message-ID: <20180104130625.28605-75-wei.liu2@citrix.com>
References: <20180104130625.28605-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=/p+y=d7=citrix.com=prvs=535dfbe76=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1eX5ZK-0003dH-OS
 for xen-devel@lists.xenproject.org; Thu, 04 Jan 2018 13:28:26 +0000
In-Reply-To: <20180104130625.28605-1-wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: wei.liu2@citrix.com
List-Id: xen-devel@lists.xenproject.org

RnJvbTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+CgpUaGlzIGlzIGhv
dyBvcmRpbmFyeSBwdmggZ3Vlc3RzIGdldCBjcmVhdGVkIHJpZ2h0IG5vdy4gIFRoaXMgaXMKcHJv
YmFibHkgYSBidWcuICBCdXQgSSB3YW50IHRoaXMgcHYgc2hpbSBtb2RlIHRvIGJ1aWxkIHRoZSBn
dWVzdCBsaWtlCnB2aCBkb2VzLgoKU2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPElhbi5KYWNr
c29uQGV1LmNpdHJpeC5jb20+Ci0tLQogdG9vbHMvbGlieGwvbGlieGxfY3JlYXRlLmMgfCAxICsK
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhs
L2xpYnhsX2NyZWF0ZS5jIGIvdG9vbHMvbGlieGwvbGlieGxfY3JlYXRlLmMKaW5kZXggOTRiMmM5
MGM1ZS4uYTFmOWM5OTU3YiAxMDA2NDQKLS0tIGEvdG9vbHMvbGlieGwvbGlieGxfY3JlYXRlLmMK
KysrIGIvdG9vbHMvbGlieGwvbGlieGxfY3JlYXRlLmMKQEAgLTUxNyw2ICs1MTcsNyBAQCBpbnQg
bGlieGxfX2RvbWFpbl9idWlsZChsaWJ4bF9fZ2MgKmdjLAogICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIExJQlhMX0RPTUFJTl9UWVBFX1BWSCk7CiAgICAgICAg
ICAgICByZXQgPSBsaWJ4bF9fZG9tYWluX2J1aWxkX2luZm9fc2V0ZGVmYXVsdF9wdmhodm0oZ2Ms
ICZzaGltX2luZm8pOwogICAgICAgICAgICAgaWYgKHJldCkgZ290byBvdXQ7CisgICAgICAgICAg
ICBzaGltX2luZm8udmlkZW9fbWVta2IgPSB+KHVpbnQ2NF90KTA7IC8qIGJvZGdlID8hICovCiAK
ICAgICAgICAgICAgIHN0YXRlLT5zaGltX3BhdGggPSBpbmZvLT51LnB2LnB2aHNoaW1fcGF0aDsK
ICAgICAgICAgICAgIHN0YXRlLT5zaGltX2NtZGxpbmUgPSBHQ1NQUklOVEYoIiVzJXMlcyIsCi0t
IAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
