From: Juergen Gross <jgross@suse.com>
Subject: [PATCH v7 16/20] grub-module-verifier: Ignore all_video
 for xenpvh
Date: Fri,  7 Dec 2018 13:11:44 +0100
Message-ID: <20181207121148.15419-17-jgross@suse.com>
References: <20181207121148.15419-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20181207121148.15419-1-jgross@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: grub-devel@gnu.org
Cc: Hans van Kranenburg <hans@knorrie.org>, phcoder@gmail.com, daniel.kiper@oracle.com, Juergen Gross <jgross@suse.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

RnJvbTogSGFucyB2YW4gS3JhbmVuYnVyZyA8aGFuc0Brbm9ycmllLm9yZz4KClRoaXMgc29sdmVz
IHRoZSBidWlsZCBmYWlsaW5nIHdpdGggIkVycm9yOiBubyBzeW1ib2wgdGFibGUgYW5kIG5vCi5t
b2RkZXBzIHNlY3Rpb24iCgpBbHNvIHNlZToKLSA2MzcxZTljMTA0MzM1NzhiYjIzNmE4Mjg0ZGRi
OWNlOWUyMDFlYjU5Ci0gaHR0cHM6Ly9zYXZhbm5haC5nbnUub3JnL2J1Z3MvPzQ5MDEyCgpTaWdu
ZWQtb2ZmLWJ5OiBIYW5zIHZhbiBLcmFuZW5idXJnIDxoYW5zQGtub3JyaWUub3JnPgpSZXZpZXdl
ZC1ieTogRGFuaWVsIEtpcGVyIDxkYW5pZWwua2lwZXJAb3JhY2xlLmNvbT4KLS0tClYyOiBuZXcg
cGF0Y2gKU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgotLS0K
IHV0aWwvZ3J1Yi1tb2R1bGUtdmVyaWZpZXIuYyB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvdXRpbC9ncnViLW1vZHVsZS12ZXJpZmllci5jIGIvdXRp
bC9ncnViLW1vZHVsZS12ZXJpZmllci5jCmluZGV4IDAzYmExYWI0My4uOTc5OTk5Y2I5IDEwMDY0
NAotLS0gYS91dGlsL2dydWItbW9kdWxlLXZlcmlmaWVyLmMKKysrIGIvdXRpbC9ncnViLW1vZHVs
ZS12ZXJpZmllci5jCkBAIC0xMjksNiArMTI5LDcgQEAgc3RydWN0IHBsYXRmb3JtX3doaXRlbGlz
dCB7CiAKIHN0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fd2hpdGVsaXN0IHdoaXRlbGlzdHNbXSA9IHsK
ICAgeyJpMzg2IiwgInhlbiIsIChjb25zdCBjaGFyICpbXSkgeyJhbGxfdmlkZW8iLCAwfX0sCisg
IHsiaTM4NiIsICJ4ZW5fcHZoIiwgKGNvbnN0IGNoYXIgKltdKSB7ImFsbF92aWRlbyIsIDB9fSwK
ICAgeyJ4ODZfNjQiLCAieGVuIiwgKGNvbnN0IGNoYXIgKltdKSB7ImFsbF92aWRlbyIsIDB9fSwK
ICAgeyJzcGFyYzY0IiwgImllZWUxMjc1IiwgKGNvbnN0IGNoYXIgKltdKSB7ImFsbF92aWRlbyIs
IDB9fSwKIAotLSAKMi4xNi40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
