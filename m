From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH RFC for-4.12] x86: put CONFIG_{HVM,
 PV} under EXPERT
Date: Fri, 1 Feb 2019 15:43:46 +0000
Message-ID: <20190201154346.22919-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=u0/j=QI=citrix.com=prvs=928b35cd2=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gpazK-0007mF-CZ
 for xen-devel@lists.xenproject.org; Fri, 01 Feb 2019 15:44:18 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

RW5hYmxpbmcgYW5kIGRpc2FibGluZyBvbmUgb2YgdGhlIHR3byBpc24ndCB0ZXN0ZWQgaW4gT1NT
VGVzdCB5ZXQuCgpTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgot
LS0KV2UgbmVlZCB0byBzb3J0IHRoaXMgb3V0IGZvciA0LjEyIHJlbGVhc2UuCgpPbiB0aGUgb25l
IGhhbmQsIGV4cG9zaW5nIHRoZW0gc2VlbXMgcmlza3kuCgpPbiB0aGUgb3RoZXIgaGFuZCwgaWYg
dGhlcmUgYXJlIGJ1Z3Mgd2hpY2ggY2F1c2UgeGVuIHRvIHdhbmRlciBpbnRvIGEKcGF0aCB3aGlj
aCBoaXRzIEJVRyBvciBBU1NFUlQsIHRoZXkgYXJlIHByb2JsZW1zIHdpdGggb2xkZXIgcmVsZWFz
ZXMKYXMgd2VsbC4gQW5kIHdlIGRlZmluaXRlbHkgd2FudCB0byBtYWtlIGVhY2ggb2YgdGhlIHR3
byBzZWN1cml0eQpzdXBwb3J0ZWQgaW4gdGhlIGxvbmcgcnVuLgotLS0KIHhlbi9hcmNoL3g4Ni9L
Y29uZmlnIHwgNSArKystLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvS2NvbmZpZyBiL3hlbi9hcmNoL3g4
Ni9LY29uZmlnCmluZGV4IDVjMmQxMDcwYjYuLjNlMDIwZGM2MjkgMTAwNjQ0Ci0tLSBhL3hlbi9h
cmNoL3g4Ni9LY29uZmlnCisrKyBiL3hlbi9hcmNoL3g4Ni9LY29uZmlnCkBAIC0zNyw3ICszNyw4
IEBAIHNvdXJjZSAiYXJjaC9LY29uZmlnIgogCiBjb25maWcgUFYKIAlkZWZfYm9vbCB5Ci0JcHJv
bXB0ICJQViBzdXBwb3J0IgorCXByb21wdCAiUFYgc3VwcG9ydCIgaWYgRVhQRVJUID0gInkiCisJ
ZGVmYXVsdCB5CiAJLS0taGVscC0tLQogCSAgSW50ZXJmYWNlcyB0byBzdXBwb3J0IFBWIGRvbWFp
bnMuIFRoZXNlIHJlcXVpcmUgZ3Vlc3Qga2VybmVsIHN1cHBvcnQKIAkgIHRvIHJ1biBhcyBhIFBW
IGd1ZXN0LCBidXQgZG9uJ3QgcmVxdWlyZSBhbnkgc3BlY2lmaWMgaGFyZHdhcmUgc3VwcG9ydC4K
QEAgLTY4LDcgKzY5LDcgQEAgY29uZmlnIFBWX0xJTkVBUl9QVAogCiBjb25maWcgSFZNCiAJZGVm
X2Jvb2wgIVBWX1NISU1fRVhDTFVTSVZFCi0JcHJvbXB0ICJIVk0gc3VwcG9ydCIKKwlwcm9tcHQg
IkhWTSBzdXBwb3J0IiBpZiBFWFBFUlQgPSAieSIKIAktLS1oZWxwLS0tCiAJICBJbnRlcmZhY2Vz
IHRvIHN1cHBvcnQgSFZNIGRvbWFpbnMuICBIVk0gZG9tYWlucyByZXF1aXJlIGhhcmR3YXJlCiAJ
ICB2aXJ0dWFsaXNhdGlvbiBleHRlbnNpb25zIChlLmcuIEludGVsIFZULXgsIEFNRCBTVk0pLCBi
dXQgY2FuIGJvb3QKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
