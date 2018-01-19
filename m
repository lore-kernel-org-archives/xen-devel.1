From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH v2 7/7] libxl: lower shim related message to
	level DEBUG
Date: Fri, 19 Jan 2018 15:34:58 +0000
Message-ID: <20180119153458.22535-8-wei.liu2@citrix.com>
References: <20180119153458.22535-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=pswu=eo=citrix.com=prvs=5505d9d7e=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1ecYk8-0002cP-Mv
 for xen-devel@lists.xenproject.org; Fri, 19 Jan 2018 15:38:12 +0000
In-Reply-To: <20180119153458.22535-1-wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

U2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KUmV2aWV3ZWQtYnk6
IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgotLS0KIHRvb2xzL2xpYnhs
L2xpYnhsX2RvbS5jIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAy
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhsL2xpYnhsX2RvbS5jIGIvdG9v
bHMvbGlieGwvbGlieGxfZG9tLmMKaW5kZXggZTFhM2U3NDdmYy4uMjlmZDJmNWQ2YSAxMDA2NDQK
LS0tIGEvdG9vbHMvbGlieGwvbGlieGxfZG9tLmMKKysrIGIvdG9vbHMvbGlieGwvbGlieGxfZG9t
LmMKQEAgLTEwMzUsNyArMTAzNSw3IEBAIHN0YXRpYyBpbnQgbGlieGxfX2RvbWFpbl9maXJtd2Fy
ZShsaWJ4bF9fZ2MgKmdjLAogCiAgICAgICAgICAgICAvKiBXZSd2ZSBsb2FkZWQgdGhlIHNoaW0s
IHNvIGxvYWQgdGhlIGtlcm5lbCBhcyBhIHNlY29uZGFyeSBtb2R1bGUgKi8KICAgICAgICAgICAg
IGlmIChzdGF0ZS0+cHZfa2VybmVsLm1hcHBlZCkgewotICAgICAgICAgICAgICAgIExPRyhXQVJO
LCAieGNfZG9tX21vZHVsZV9tZW0sIGNtZGxpbmUgJXMiLAorICAgICAgICAgICAgICAgIExPRyhE
RUJVRywgInhjX2RvbV9tb2R1bGVfbWVtLCBjbWRsaW5lICVzIiwKICAgICAgICAgICAgICAgICAg
ICAgc3RhdGUtPnB2X2NtZGxpbmUpOwogICAgICAgICAgICAgICAgIHJjID0geGNfZG9tX21vZHVs
ZV9tZW0oZG9tLCBzdGF0ZS0+cHZfa2VybmVsLmRhdGEsCiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBzdGF0ZS0+cHZfa2VybmVsLnNpemUsIHN0YXRlLT5wdl9jbWRsaW5l
KTsKQEAgLTEwNDQsNyArMTA0NCw3IEBAIHN0YXRpYyBpbnQgbGlieGxfX2RvbWFpbl9maXJtd2Fy
ZShsaWJ4bF9fZ2MgKmdjLAogICAgICAgICAgICAgICAgICAgICBnb3RvIG91dDsKICAgICAgICAg
ICAgICAgICB9CiAgICAgICAgICAgICB9IGVsc2UgewotICAgICAgICAgICAgICAgIExPRyhXQVJO
LCAieGNfZG9tX21vZHVsZV9maWxlLCBwYXRoICVzIGNtZGxpbmUgJXMiLAorICAgICAgICAgICAg
ICAgIExPRyhERUJVRywgInhjX2RvbV9tb2R1bGVfZmlsZSwgcGF0aCAlcyBjbWRsaW5lICVzIiwK
ICAgICAgICAgICAgICAgICAgICAgc3RhdGUtPnB2X2tlcm5lbC5wYXRoLCBzdGF0ZS0+cHZfY21k
bGluZSk7CiAgICAgICAgICAgICAgICAgcmMgPSB4Y19kb21fbW9kdWxlX2ZpbGUoZG9tLCBzdGF0
ZS0+cHZfa2VybmVsLnBhdGgsIHN0YXRlLT5wdl9jbWRsaW5lKTsKICAgICAgICAgICAgICAgICBp
ZiAocmMpIHsKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
