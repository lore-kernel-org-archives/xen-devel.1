From: Juergen Gross <jgross@suse.com>
Subject: [PATCH v2 15/18] grub-module-verifier: Ignore all_video
 for xenpvh
Date: Tue,  9 Oct 2018 13:03:14 +0200
Message-ID: <20181009110317.6022-16-jgross@suse.com>
References: <20181009110317.6022-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20181009110317.6022-1-jgross@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: grub-devel@gnu.org
Cc: hans@knorrie.org, phcoder@gmail.com, daniel.kiper@oracle.com, Juergen Gross <jgross@suse.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

RnJvbTogSGFucyB2YW4gS3JhbmVuYnVyZyA8aGFuc0Brbm9ycmllLm9yZz4KClRoaXMgc29sdmVz
IHRoZSBidWlsZCBmYWlsaW5nIHdpdGggIkVycm9yOiBubyBzeW1ib2wgdGFibGUgYW5kIG5vCi5t
b2RkZXBzIHNlY3Rpb24iCgpBbHNvIHNlZToKLSA2MzcxZTljMTA0MzM1NzhiYjIzNmE4Mjg0ZGRi
OWNlOWUyMDFlYjU5Ci0gaHR0cHM6Ly9zYXZhbm5haC5nbnUub3JnL2J1Z3MvPzQ5MDEyCgpTaWdu
ZWQtb2ZmLWJ5OiBIYW5zIHZhbiBLcmFuZW5idXJnIDxoYW5zQGtub3JyaWUub3JnPgotLS0KVjI6
IG5ldyBwYXRjaApTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+
Ci0tLQogdXRpbC9ncnViLW1vZHVsZS12ZXJpZmllci5jIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS91dGlsL2dydWItbW9kdWxlLXZlcmlmaWVyLmMg
Yi91dGlsL2dydWItbW9kdWxlLXZlcmlmaWVyLmMKaW5kZXggMDNiYTFhYjQzLi4zMGJhYTQzZGYg
MTAwNjQ0Ci0tLSBhL3V0aWwvZ3J1Yi1tb2R1bGUtdmVyaWZpZXIuYworKysgYi91dGlsL2dydWIt
bW9kdWxlLXZlcmlmaWVyLmMKQEAgLTEyOSw2ICsxMjksNyBAQCBzdHJ1Y3QgcGxhdGZvcm1fd2hp
dGVsaXN0IHsKIAogc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV93aGl0ZWxpc3Qgd2hpdGVsaXN0c1td
ID0gewogICB7ImkzODYiLCAieGVuIiwgKGNvbnN0IGNoYXIgKltdKSB7ImFsbF92aWRlbyIsIDB9
fSwKKyAgeyJpMzg2IiwgInhlbnB2aCIsIChjb25zdCBjaGFyICpbXSkgeyJhbGxfdmlkZW8iLCAw
fX0sCiAgIHsieDg2XzY0IiwgInhlbiIsIChjb25zdCBjaGFyICpbXSkgeyJhbGxfdmlkZW8iLCAw
fX0sCiAgIHsic3BhcmM2NCIsICJpZWVlMTI3NSIsIChjb25zdCBjaGFyICpbXSkgeyJhbGxfdmlk
ZW8iLCAwfX0sCiAKLS0gCjIuMTYuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
