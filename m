From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH] mkdeb: use compression level 0
Date: Fri, 7 Sep 2018 11:41:31 +0100
Message-ID: <20180907104131.1555-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=c06c=lv=citrix.com=prvs=7819b22f9=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fyECl-0006hk-BF
 for xen-devel@lists.xenproject.org; Fri, 07 Sep 2018 10:41:35 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhpcyByZXF1aXJlcyBjYWxsaW5nIGRwa2ctZGViIGRpcmVjdGx5IGFuZCBwYXNzIGl0IC16MC4K
Ckl0IHJlZHVjZXMgdGhlIHRpbWUgdG8gcnVuIHRoZSBta2RlYiBzY3JpcHQgZnJvbSAxNCBzZWNv
bmRzIHRvIDMKc2Vjb25kcyBvbiBteSB3b3Jrc3RhdGlvbiB3aXRoIFNTRCwgZnJvbSA4N3MgdG8g
MTVzIG9uIGEgbWFjaGluZQp3aXRoIEhERC4gVGhlIGRlYiBmaWxlIGdyb3dzIGZyb20gNDlNIHRv
IDU4TS4KClNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Ci0tLQog
dG9vbHMvbWlzYy9ta2RlYiB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL21pc2MvbWtkZWIgYi90b29scy9taXNj
L21rZGViCmluZGV4IDY3YjkxY2MxZTUuLmY0YmVmY2NjNDIgMTAwNjQ0Ci0tLSBhL3Rvb2xzL21p
c2MvbWtkZWIKKysrIGIvdG9vbHMvbWlzYy9ta2RlYgpAQCAtNTksNyArNTksNyBAQCBmaW5kIGRl
Yi9ldGMgLXR5cGUgZiAtcHJpbnRmIC9ldGMvJVBcXG4gPmRlYi9ERUJJQU4vY29uZmZpbGVzCiAK
ICMgUGFja2FnZSBpdCB1cAogY2hvd24gLVIgcm9vdDpyb290IGRlYgotZHBrZyAtLWJ1aWxkIGRl
YiB4ZW4tdXBzdHJlYW0tJHZlcnNpb24uZGViCitkcGtnLWRlYiAtLWJ1aWxkIC16MCBkZWIgeGVu
LXVwc3RyZWFtLSR2ZXJzaW9uLmRlYgogCiAjIFRpZHkgdXAgYWZ0ZXIgb3Vyc2VsdmVzCiBybSAt
cmYgZGViCi0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
