From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH for-next 5/5] automation: introduce a test to
 build each commit
Date: Thu, 28 Feb 2019 13:44:48 +0000
Message-ID: <20190228134448.6097-6-wei.liu2@citrix.com>
References: <20190228134448.6097-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0So3=RD=citrix.com=prvs=955226cfb=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gzM03-000731-NM
 for xen-devel@lists.xenproject.org; Thu, 28 Feb 2019 13:45:23 +0000
In-Reply-To: <20190228134448.6097-1-wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Doug Goldstein <cardoe@cardoe.com>
List-Id: xen-devel@lists.xenproject.org

VGhpcyBpcyBhZGRlZCB0byB0aGUgdGVzdCBzdGFnZSBzbyB0aGF0IGl0cyBmYWlsdXJlIHdvbid0
IGJsb2NrIG90aGVyCnRoaW5ncy4KClNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNp
dHJpeC5jb20+Ci0tLQpOb3RlOiB0aGlzIHBhdGNoIHdpbGwgbG9vayBkaWZmZXJlbnQgd2hlbiBp
dCBpcyBhcHBsaWVkIHRvIHN0YWdpbmcsCmJ1dCB5b3UgY2FuIHNlZSB0aGUgY29yZSBpZGVhIGhl
cmUuCi0tLQogYXV0b21hdGlvbi9naXRsYWItY2kvdGVzdC55YW1sIHwgNyArKysrLS0tCiAxIGZp
bGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2F1dG9tYXRpb24vZ2l0bGFiLWNpL3Rlc3QueWFtbCBiL2F1dG9tYXRpb24vZ2l0bGFiLWNpL3Rl
c3QueWFtbAppbmRleCAxNDBiMTFiODkyLi5iOTU2M2ZlZDFjIDEwMDY0NAotLS0gYS9hdXRvbWF0
aW9uL2dpdGxhYi1jaS90ZXN0LnlhbWwKKysrIGIvYXV0b21hdGlvbi9naXRsYWItY2kvdGVzdC55
YW1sCkBAIC0xLDE0ICsxLDE1IEBACiAjIFRlc3Qgam9icwotcWVtdS1zbW9rZS14ODYtNjQtZ2Nj
OgorYnVpbGQtZWFjaC1jb21taXQtZ2NjOgogICBzdGFnZTogdGVzdAogICBpbWFnZTogcmVnaXN0
cnkuZ2l0bGFiLmNvbS94ZW4tcHJvamVjdC94ZW4vJHtDT05UQUlORVJ9CiAgIHZhcmlhYmxlczoK
ICAgICBDT05UQUlORVI6IGRlYmlhbjpzdHJldGNoCisgICAgWEVOX1RBUkdFVF9BUkNIOiB4ODZf
NjQKKyAgICBDQzogZ2NjCiAgIHNjcmlwdDoKLSAgICAtIC4vYXV0b21hdGlvbi9zY3JpcHRzL3Fl
bXUtc21va2UteDg2LTY0LnNoIHB2IDI+JjEgfCB0ZWUgcWVtdS1zbW9rZS14ODYtNjQubG9nCisg
ICAgLSAuL2F1dG9tYXRpb24vZ2l0bGFiLWNpL2J1aWxkLWVhY2gtY29tbWl0LnNoIDI+JjEgfCB0
ZWUgYnVpbGQtZWFjaC1jb21taXQtZ2NjLmxvZwogICBhcnRpZmFjdHM6CiAgICAgcGF0aHM6Ci0g
ICAgICAtIHNtb2tlLnNlcmlhbAogICAgICAgLSAnKi5sb2cnCiAgICAgd2hlbjogYWx3YXlzCiAg
IHRhZ3M6Ci0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
