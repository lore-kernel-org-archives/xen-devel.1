From: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH] sched/null: skip vCPUs on the waitqueue that
	are blocked
Date: Tue, 19 Dec 2017 14:16:55 +0000
Message-ID: <20171219141655.80982-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=u91z=dp=citrix.com=prvs=519ad8697=roger.pau@srs-us1.protection.inumbo.net>)
 id 1eRIiN-0005Qz-Rt
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2017 14:17:51 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@eu.citrix.com>, Dario Faggioli <raistlin@linux.it>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

QXZvaWQgc2NoZWR1bGluZyB2Q1BVcyB0aGF0IGFyZSBibG9ja2VkLCB0aGVyZSdzIG5vIHBvaW50
IGluIGFzc2lnbmluZwp0aGVtIHRvIGEgcENQVSBiZWNhdXNlIHRoZXkgYXJlIG5vdCBnb2luZyB0
byBydW4gYW55d2F5IGFuZCBtaWdodApwcmV2ZW50IGEgbm9uLWJsb2NrZWQgdkNQVSBmcm9tIGFj
dHVhbGx5IHJ1bm5pbmcuCgpTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5w
YXVAY2l0cml4LmNvbT4KLS0tCkNjOiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGV1LmNp
dHJpeC5jb20+CkNjOiBEYXJpbyBGYWdnaW9saSA8cmFpc3RsaW5AbGludXguaXQ+Ci0tLQogeGVu
L2NvbW1vbi9zY2hlZF9udWxsLmMgfCA0ICsrKysKIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlv
bnMoKykKCmRpZmYgLS1naXQgYS94ZW4vY29tbW9uL3NjaGVkX251bGwuYyBiL3hlbi9jb21tb24v
c2NoZWRfbnVsbC5jCmluZGV4IGI0YTI0YmFmOGUuLjc4YTNiMTI4NDUgMTAwNjQ0Ci0tLSBhL3hl
bi9jb21tb24vc2NoZWRfbnVsbC5jCisrKyBiL3hlbi9jb21tb24vc2NoZWRfbnVsbC5jCkBAIC03
ODEsNiArNzgxLDEwIEBAIHN0YXRpYyBzdHJ1Y3QgdGFza19zbGljZSBudWxsX3NjaGVkdWxlKGNv
bnN0IHN0cnVjdCBzY2hlZHVsZXIgKm9wcywKICAgICAgICAgewogICAgICAgICAgICAgbGlzdF9m
b3JfZWFjaF9lbnRyeSggd3ZjLCAmcHJ2LT53YWl0cSwgd2FpdHFfZWxlbSApCiAgICAgICAgICAg
ICB7CisgICAgICAgICAgICAgICAgaWYgKCB0ZXN0X2JpdChfVlBGX2Rvd24sICZ3dmMtPnZjcHUt
PnBhdXNlX2ZsYWdzKSApCisgICAgICAgICAgICAgICAgICAgIC8qIFNraXAgdkNQVXMgdGhhdCBh
cmUgZG93bi4gKi8KKyAgICAgICAgICAgICAgICAgICAgY29udGludWU7CisKICAgICAgICAgICAg
ICAgICBpZiAoIGJzID09IEJBTEFOQ0VfU09GVF9BRkZJTklUWSAmJgogICAgICAgICAgICAgICAg
ICAgICAgIWhhc19zb2Z0X2FmZmluaXR5KHd2Yy0+dmNwdSwgd3ZjLT52Y3B1LT5jcHVfaGFyZF9h
ZmZpbml0eSkgKQogICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsKLS0gCjIuMTQuMyAoQXBw
bGUgR2l0LTk4KQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
