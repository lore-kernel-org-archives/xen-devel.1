From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 22/62] contents_make_cpio: Include
 symlinks
Date: Wed, 10 Apr 2019 15:23:28 +0100
Message-ID: <20190410142408.22848-23-ian.jackson@eu.citrix.com>
References: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xn7x=SM=citrix.com=prvs=996f5bc6d=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hEEAO-0006aU-RI
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 14:25:32 +0000
In-Reply-To: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

V2UgYXJlIGdvaW5nIHRvIGludHJvZHVjZSBzb21lIHN5bWxpbmtzIGludG8gb25lIG9mIG91ciBw
cmVwcmVwYXJlZApvdmVybGF5cy4gIFdlIG11c3QgdGhlcmVmb3JlIGFycmFuZ2UgdG8gY29weSB0
aGVtIGFzIGFwcHJvcHJpYXRlLgoKVGhlIHN5bnRheCBgLXR5cGUgZixsJyBpcyBhbiBleHRlbnNp
b24gaW4gR05VIGZpbmQuICBJZiB0aGlzIGNhdXNlcwp0cm91YmxlIGluIHRoZSBmdXR1cmUgd2Ug
d2lsbCB0aGVuIGhhdmUgdG8gaW50cm9kdWNlIHRoZSBvYnZpb3VzCmNpcmN1bWxvY3V0aW9uIGlu
dm9sdmluZyAoICkuCgpTaWduZWQtb2ZmLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUu
Y2l0cml4LmNvbT4KLS0tCiBPc3N0ZXN0L1Rlc3RTdXBwb3J0LnBtIHwgMiArLQogMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvT3NzdGVz
dC9UZXN0U3VwcG9ydC5wbSBiL09zc3Rlc3QvVGVzdFN1cHBvcnQucG0KaW5kZXggZDM1YTc4NGIu
LjFmMDFhYzZhIDEwMDY0NAotLS0gYS9Pc3N0ZXN0L1Rlc3RTdXBwb3J0LnBtCisrKyBiL09zc3Rl
c3QvVGVzdFN1cHBvcnQucG0KQEAgLTE1MTgsNyArMTUxOCw3IEBAIHN1YiBjb250ZW50c19tYWtl
X2NwaW8gKCQkJCkgewogICAgIGlmICghJGNoaWxkKSB7CiAgICAgICAgIHBvc3Rmb3JrKCk7CiAg
ICAgICAgIGNoZGlyKCRzcmNkaXIpIG9yIGRpZSAkITsKLSAgICAgICAgb3BlbiBTVERJTiwgJ2Zp
bmQgISAtbmFtZSAiKn4iICEgLW5hbWUgIiMqIiAtdHlwZSBmIC1wcmludDAgfCcKKyAgICAgICAg
b3BlbiBTVERJTiwgJ2ZpbmQgISAtbmFtZSAiKn4iICEgLW5hbWUgIiMqIiAtdHlwZSBmLGwgLXBy
aW50MCB8JwogICAgICAgICAgICAgb3IgZGllICQhOwogICAgICAgICBvcGVuIFNURE9VVCwgJz4m
JywgJGZoIG9yIGRpZSAkITsKICAgICAgICAgc3lzdGVtICJjcGlvIC1IJGZvcm1hdCAtbyAtLXF1
aWV0IC0wIC1SIDEwMDA6MTAwMCI7Ci0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
