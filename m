From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [PATCH 7/9] docs/Makefile: Format SUPPORT.md into the
 toplevel
Date: Wed, 11 Apr 2018 16:35:37 +0100
Message-ID: <1523460939-15013-8-git-send-email-ian.jackson@eu.citrix.com>
References: <1523460939-15013-1-git-send-email-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=97mu=ha=citrix.com=prvs=63276c6f0=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1f6HnA-0001sd-5H
 for xen-devel@lists.xenproject.org; Wed, 11 Apr 2018 15:36:12 +0000
In-Reply-To: <1523460939-15013-1-git-send-email-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Lars Kurth <lars.kurth@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <george.dunlap@citrix.com>
List-Id: xen-devel@lists.xenproject.org

U2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPElhbi5KYWNrc29uQGV1LmNpdHJpeC5jb20+ClJl
bGVhc2UtYWNrZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KLS0tCiBkb2Nz
L01ha2VmaWxlIHwgNSArKysrLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RvY3MvTWFrZWZpbGUgYi9kb2NzL01ha2VmaWxlCmlu
ZGV4IGQ4MjQ2M2YuLmIzMDBiYjYgMTAwNjQ0Ci0tLSBhL2RvY3MvTWFrZWZpbGUKKysrIGIvZG9j
cy9NYWtlZmlsZQpAQCAtMjgsNyArMjgsOCBAQCBET0NfTUFONyA6PSAkKHBhdHN1YnN0IG1hbi8l
LnBvZC43LG1hbjcvJS43LCQoTUFON1NSQy15KSkgXAogCSAgICAgICAgJChwYXRzdWJzdCBtYW4v
JS5tYXJrZG93bi43LG1hbjcvJS43LCQoTUFON1NSQy15KSkKIERPQ19NQU44IDo9ICQocGF0c3Vi
c3QgbWFuLyUucG9kLjgsbWFuOC8lLjgsJChNQU44U1JDLXkpKSBcCiAJICAgICAgICAkKHBhdHN1
YnN0IG1hbi8lLm1hcmtkb3duLjgsbWFuOC8lLjgsJChNQU44U1JDLXkpKQotRE9DX0hUTUwgOj0g
JChwYXRzdWJzdCAlLm1hcmtkb3duLGh0bWwvJS5odG1sLCQoTUFSS0RPV05TUkMteSkpIFwKK0RP
Q19IVE1MIDo9IGh0bWwvU1VQUE9SVC5odG1sIFwKKyAgICAgICAgICAgICQocGF0c3Vic3QgJS5t
YXJrZG93bixodG1sLyUuaHRtbCwkKE1BUktET1dOU1JDLXkpKSBcCiAgICAgICAgICAgICAkKHBh
dHN1YnN0ICUucGFuZG9jLGh0bWwvJS5odG1sLCQoUEFORE9DU1JDLXkpKSBcCiAgICAgICAgICAg
ICAkKHBhdHN1YnN0IG1hbi8lLm1hcmtkb3duLjEsaHRtbC9tYW4vJS4xLmh0bWwsJChNQU4xU1JD
LXkpKSBcCiAgICAgICAgICAgICAkKHBhdHN1YnN0IG1hbi8lLm1hcmtkb3duLjUsaHRtbC9tYW4v
JS41Lmh0bWwsJChNQU41U1JDLXkpKSBcCkBAIC0yNTUsNiArMjU2LDggQEAgJChldmFsICQoY2Fs
bCBHRU5FUkFURV9QQU5ET0NfUlVMRSx0eHQscGFuZG9jKSkgICAjIHR4dC8lLnR4dDogJS5wYW5k
b2MKICQoZXZhbCAkKGNhbGwgR0VORVJBVEVfUEFORE9DX1JVTEUsaHRtbCxwYW5kb2MpKSAgIyBo
dG1sLyUuaHRtbDogJS5wYW5kb2MKICQoZXZhbCAkKGNhbGwgR0VORVJBVEVfUEFORE9DX1JVTEUs
cGRmLG1hcmtkb3duKSkgIyBwZGYvJS5wZGY6ICUubWFya2Rvd24KIAorJChldmFsICQoY2FsbCBH
RU5FUkFURV9QQU5ET0NfUlVMRV9SQVcsaHRtbC9TVVBQT1JULmh0bWwsJChYRU5fUk9PVCkvU1VQ
UE9SVC5tZCkpICMgcGRmLyUucGRmOiAlLm1hcmtkb3duCisKIGlmZXEgKCwkKGZpbmRzdHJpbmcg
Y2xlYW4sJChNQUtFQ01ER09BTFMpKSkKICQoWEVOX1JPT1QpL2NvbmZpZy9Eb2NzLm1rOgogCSQo
ZXJyb3IgWW91IGhhdmUgdG8gcnVuIC4vY29uZmlndXJlIGJlZm9yZSBidWlsZGluZyBkb2NzKQot
LSAKMi4xLjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
