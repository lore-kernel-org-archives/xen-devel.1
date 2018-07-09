From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH v2 4/4] automation: build more stuff on x86 with
 docker
Date: Mon, 9 Jul 2018 16:32:16 +0100
Message-ID: <20180709153216.15892-5-wei.liu2@citrix.com>
References: <20180709153216.15892-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=pzs8=jz=citrix.com=prvs=72153cbb0=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fcY9G-0005Um-Gi
 for xen-devel@lists.xenproject.org; Mon, 09 Jul 2018 15:32:22 +0000
In-Reply-To: <20180709153216.15892-1-wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wei.liu2@citrix.com>, Doug Goldstein <cardoe@cardoe.com>
List-Id: xen-devel@lists.xenproject.org

U2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KLS0tClVudGVzdGVk
Ci0tLQogYXV0b21hdGlvbi9zY3JpcHRzL2J1aWxkIHwgNiArLS0tLS0KIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hdXRvbWF0aW9u
L3NjcmlwdHMvYnVpbGQgYi9hdXRvbWF0aW9uL3NjcmlwdHMvYnVpbGQKaW5kZXggYjkwZmM0M2Qy
Ni4uYjllNGMxZTMyOSAxMDA3NTUKLS0tIGEvYXV0b21hdGlvbi9zY3JpcHRzL2J1aWxkCisrKyBi
L2F1dG9tYXRpb24vc2NyaXB0cy9idWlsZApAQCAtMTEsOCArMTEsNiBAQCBmaQogCiAjIGJ1aWxk
IHVwIG91ciBjb25maWd1cmUgb3B0aW9ucwogY2ZnYXJncz0oKQotY2ZnYXJncys9KCItLWRpc2Fi
bGUtc3R1YmRvbSIpICMgbW9yZSB3b3JrIG5lZWRlZCBpbnRvIGJ1aWxkaW5nIHRoaXMKLWNmZ2Fy
Z3MrPSgiLS1kaXNhYmxlLXJvbWJpb3MiKQogY2ZnYXJncys9KCItLWVuYWJsZS1kb2NzIikKIAog
IyBTZWFCSU9TIGNhbm5vdCBiZSBidWlsdCB3aXRoIGNsYW5nCkBAIC0yMCw5ICsxOCw3IEBAIGlm
IFtbICIke0NDfSIgPT0gImNsYW5nIiBdXTsgdGhlbgogICAgIGNmZ2FyZ3MrPSgiLS13aXRoLXN5
c3RlbS1zZWFiaW9zPS91c3Ivc2hhcmUvc2VhYmlvcy9iaW9zLmJpbiIpCiBmaQogCi1pZiBbWyAi
JHtYRU5fVEFSR0VUX0FSQ0h9IiA9PSAieDg2XzY0IiBdXTsgdGhlbgotICAgIGNmZ2FyZ3MrPSgi
LS1lbmFibGUtdG9vbHMiKQotZWxzZQoraWYgW1sgIiR7WEVOX1RBUkdFVF9BUkNIfSIgPT0gImFy
bTY0IiB8fCAiJHtYRU5fVEFSR0VUX0FSQ0h9IiA9PSAiYXJtMzIiIF1dOyB0aGVuCiAgICAgY2Zn
YXJncys9KCItLWRpc2FibGUtdG9vbHMiKSAjIHdlIGRvbid0IGhhdmUgdGhlIGNyb3NzIGRlcGVu
ZHMgaW5zdGFsbGVkCiBmaQogCi0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
