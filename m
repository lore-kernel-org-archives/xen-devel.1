From: Sameer Goel <sameer.goel@linaro.org>
Subject: [PATCH 2/7] xen/bitops: Rename LOG_2 to ilog2
Date: Thu,  8 Feb 2018 20:10:50 -0700
Message-ID: <20180209031055.21926-3-sameer.goel@linaro.org>
References: <20180209031055.21926-1-sameer.goel@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=qm9x=fd=linaro.org=sameer.goel@srs-us1.protection.inumbo.net>)
 id 1ejz5r-0004zZ-Sp
 for xen-devel@lists.xenproject.org; Fri, 09 Feb 2018 03:11:19 +0000
Received: by mail-pg0-x243.google.com with SMTP id m28so2741278pgc.9
 for <xen-devel@lists.xenproject.org>; Thu, 08 Feb 2018 19:11:17 -0800 (PST)
In-Reply-To: <20180209031055.21926-1-sameer.goel@linaro.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org, julien.grall@arm.com, mjaggi@caviumnetworks.com
Cc: sstabellini@kernel.org, wei.liu2@citrix.com, george.dunlap@eu.citrix.com, Andrew.Cooper3@citrix.com, jbeulich@suse.com, Sameer Goel <sameer.goel@linaro.org>, Ian.Jackson@citrix.com, nd@arm.com, shankerd@codeaurora.org, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

Q2hhbmdpbmcgdGhlIG5hbWUgb2YgdGhlIG1hY3JvIGZyb20gTE9HXzIgdG8gaWxvZzIuVGhpcyBt
YWtlcyB0aGUgZnVuY3Rpb24gbmFtZQpzaW1pbGFyIHRvIGl0cyBMaW51eCBjb3VudGVycGFydC4g
U2luY2UsIHRoaXMgaXMgbm90IHVzZWQgaW4gbXVsdGlwbGUgcGxhY2VzLAp0aGUgY29kZSBjaHVy
biBpcyBtaW5pbWFsLgoKVGhpcyBjaGFuZ2UgaGVscHMgaW4gcG9ydGluZyB1bmNoYW5nZWQgY29k
ZSBmcm9tIExpbnV4LgoKU2lnbmVkLW9mZi1ieTogU2FtZWVyIEdvZWwgPHNhbWVlci5nb2VsQGxp
bmFyby5vcmc+Ci0tLQogeGVuL2FyY2gveDg2L3g4Nl82NC9hc20tb2Zmc2V0cy5jIHwgMiArLQog
eGVuL2luY2x1ZGUveGVuL2JpdG9wcy5oICAgICAgICAgIHwgMiArLQogMiBmaWxlcyBjaGFuZ2Vk
LCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gv
eDg2L3g4Nl82NC9hc20tb2Zmc2V0cy5jIGIveGVuL2FyY2gveDg2L3g4Nl82NC9hc20tb2Zmc2V0
cy5jCmluZGV4IDUxYmU1MjhmODkuLmU2ZDQxNDc1MjUgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4
Ni94ODZfNjQvYXNtLW9mZnNldHMuYworKysgYi94ZW4vYXJjaC94ODYveDg2XzY0L2FzbS1vZmZz
ZXRzLmMKQEAgLTE2Niw3ICsxNjYsNyBAQCB2b2lkIF9fZHVtbXlfXyh2b2lkKQogICAgIEJMQU5L
KCk7CiAjZW5kaWYKIAotICAgIERFRklORShJUlFTVEFUX3NoaWZ0LCBMT0dfMihzaXplb2YoaXJx
X2NwdXN0YXRfdCkpKTsKKyAgICBERUZJTkUoSVJRU1RBVF9zaGlmdCwgaWxvZzIoc2l6ZW9mKGly
cV9jcHVzdGF0X3QpKSk7CiAgICAgT0ZGU0VUKElSUVNUQVRfc29mdGlycV9wZW5kaW5nLCBpcnFf
Y3B1c3RhdF90LCBfX3NvZnRpcnFfcGVuZGluZyk7CiAgICAgQkxBTksoKTsKIApkaWZmIC0tZ2l0
IGEveGVuL2luY2x1ZGUveGVuL2JpdG9wcy5oIGIveGVuL2luY2x1ZGUveGVuL2JpdG9wcy5oCmlu
ZGV4IGUyMDE5YjAyYTMuLmExMDNlNDkwODkgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL3hlbi9i
aXRvcHMuaAorKysgYi94ZW4vaW5jbHVkZS94ZW4vYml0b3BzLmgKQEAgLTIyMyw3ICsyMjMsNyBA
QCBzdGF0aWMgaW5saW5lIF9fdTMyIHJvcjMyKF9fdTMyIHdvcmQsIHVuc2lnbmVkIGludCBzaGlm
dCkKICNkZWZpbmUgX19MNChfeCkgICgoKF94KSAmIDB4MDAwMDAwMGMpID8gKCAyICsgX19MMigg
KF94KT4+IDIpKSA6IF9fTDIoIF94KSkKICNkZWZpbmUgX19MOChfeCkgICgoKF94KSAmIDB4MDAw
MDAwZjApID8gKCA0ICsgX19MNCggKF94KT4+IDQpKSA6IF9fTDQoIF94KSkKICNkZWZpbmUgX19M
MTYoX3gpICgoKF94KSAmIDB4MDAwMGZmMDApID8gKCA4ICsgX19MOCggKF94KT4+IDgpKSA6IF9f
TDgoIF94KSkKLSNkZWZpbmUgTE9HXzIoX3gpICgoKF94KSAmIDB4ZmZmZjAwMDApID8gKDE2ICsg
X19MMTYoKF94KT4+MTYpKSA6IF9fTDE2KF94KSkKKyNkZWZpbmUgaWxvZzIoX3gpICgoKF94KSAm
IDB4ZmZmZjAwMDApID8gKDE2ICsgX19MMTYoKF94KT4+MTYpKSA6IF9fTDE2KF94KSkKIAogLyoq
CiAgKiBmb3JfZWFjaF9zZXRfYml0IC0gaXRlcmF0ZSBvdmVyIGV2ZXJ5IHNldCBiaXQgaW4gYSBt
ZW1vcnkgcmVnaW9uCi0tIAoyLjE0LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
