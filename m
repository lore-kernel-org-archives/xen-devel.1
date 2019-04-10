From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 23/62] contents_make_cpio: Make files
 owned by root
Date: Wed, 10 Apr 2019 15:23:29 +0100
Message-ID: <20190410142408.22848-24-ian.jackson@eu.citrix.com>
References: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xn7x=SM=citrix.com=prvs=996f5bc6d=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hEEAF-0006Hu-MD
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 14:25:23 +0000
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

VGhpcyBmdW5jdGlvbiBpcyBjYWxsZWQgdG8gZ2VuZXJhdGUgb3ZlcmxheXMgZm9yIHVzZSwgbWFp
bmx5LCBieSB0aGUKaW5pdHJhbWZzLgoKV2UgYXJlIGdvaW5nIHRvIHVzZSBpdCB0byBzaGlwIHVk
ZXYgcnVsZXMuICBBbm5veWluZ2x5LCB1ZGV2IGhhdGVzCmZpbGVzIHdoaWNoIGFyZW4ndCBvd25l
ZCBieSByb290IC0gaXQgc2ltcGx5IGlnbm9yZXMgdGhlbS4KClNpZ25lZC1vZmYtYnk6IElhbiBK
YWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgotLS0KIE9zc3Rlc3QvVGVzdFN1cHBv
cnQucG0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkKCmRpZmYgLS1naXQgYS9Pc3N0ZXN0L1Rlc3RTdXBwb3J0LnBtIGIvT3NzdGVzdC9UZXN0U3Vw
cG9ydC5wbQppbmRleCAxZjAxYWM2YS4uNDFmNmY1ZjggMTAwNjQ0Ci0tLSBhL09zc3Rlc3QvVGVz
dFN1cHBvcnQucG0KKysrIGIvT3NzdGVzdC9UZXN0U3VwcG9ydC5wbQpAQCAtMTUyMSw3ICsxNTIx
LDcgQEAgc3ViIGNvbnRlbnRzX21ha2VfY3BpbyAoJCQkKSB7CiAgICAgICAgIG9wZW4gU1RESU4s
ICdmaW5kICEgLW5hbWUgIip+IiAhIC1uYW1lICIjKiIgLXR5cGUgZixsIC1wcmludDAgfCcKICAg
ICAgICAgICAgIG9yIGRpZSAkITsKICAgICAgICAgb3BlbiBTVERPVVQsICc+JicsICRmaCBvciBk
aWUgJCE7Ci0gICAgICAgIHN5c3RlbSAiY3BpbyAtSCRmb3JtYXQgLW8gLS1xdWlldCAtMCAtUiAx
MDAwOjEwMDAiOworICAgICAgICBzeXN0ZW0gImNwaW8gLUgkZm9ybWF0IC1vIC0tcXVpZXQgLTAg
LVIgMDowIjsKICAgICAgICAgJD8gYW5kIGRpZSAkPzsKICAgICAgICAgJCE9MDsgY2xvc2UgU1RE
SU47IGRpZSAiJCEgJD8iIGlmICQhIG9yICQ/OwogICAgICAgICBleGl0IDA7Ci0tIAoyLjExLjAK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
