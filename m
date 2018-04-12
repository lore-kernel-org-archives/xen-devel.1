From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [PATCH 07/11] docs/Makefile: Format SUPPORT.md into the
 toplevel
Date: Thu, 12 Apr 2018 13:28:32 +0100
Message-ID: <1523536116-31316-8-git-send-email-ian.jackson@eu.citrix.com>
References: <1523536116-31316-1-git-send-email-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=9+jx=hb=citrix.com=prvs=633689d9b=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1f6bLN-0006O5-Ge
 for xen-devel@lists.xenproject.org; Thu, 12 Apr 2018 12:28:49 +0000
In-Reply-To: <1523536116-31316-1-git-send-email-ian.jackson@eu.citrix.com>
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
bGVhc2UtYWNrZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KQWNrZWQtYnk6
IExhcnMgS3VydGggPGxhcnMua3VydGhAY2l0cml4LmNvbT4KLS0tCiBkb2NzL01ha2VmaWxlIHwg
NSArKysrLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoK
ZGlmZiAtLWdpdCBhL2RvY3MvTWFrZWZpbGUgYi9kb2NzL01ha2VmaWxlCmluZGV4IGQ4MjQ2M2Yu
LmIzMDBiYjYgMTAwNjQ0Ci0tLSBhL2RvY3MvTWFrZWZpbGUKKysrIGIvZG9jcy9NYWtlZmlsZQpA
QCAtMjgsNyArMjgsOCBAQCBET0NfTUFONyA6PSAkKHBhdHN1YnN0IG1hbi8lLnBvZC43LG1hbjcv
JS43LCQoTUFON1NSQy15KSkgXAogCSAgICAgICAgJChwYXRzdWJzdCBtYW4vJS5tYXJrZG93bi43
LG1hbjcvJS43LCQoTUFON1NSQy15KSkKIERPQ19NQU44IDo9ICQocGF0c3Vic3QgbWFuLyUucG9k
LjgsbWFuOC8lLjgsJChNQU44U1JDLXkpKSBcCiAJICAgICAgICAkKHBhdHN1YnN0IG1hbi8lLm1h
cmtkb3duLjgsbWFuOC8lLjgsJChNQU44U1JDLXkpKQotRE9DX0hUTUwgOj0gJChwYXRzdWJzdCAl
Lm1hcmtkb3duLGh0bWwvJS5odG1sLCQoTUFSS0RPV05TUkMteSkpIFwKK0RPQ19IVE1MIDo9IGh0
bWwvU1VQUE9SVC5odG1sIFwKKyAgICAgICAgICAgICQocGF0c3Vic3QgJS5tYXJrZG93bixodG1s
LyUuaHRtbCwkKE1BUktET1dOU1JDLXkpKSBcCiAgICAgICAgICAgICAkKHBhdHN1YnN0ICUucGFu
ZG9jLGh0bWwvJS5odG1sLCQoUEFORE9DU1JDLXkpKSBcCiAgICAgICAgICAgICAkKHBhdHN1YnN0
IG1hbi8lLm1hcmtkb3duLjEsaHRtbC9tYW4vJS4xLmh0bWwsJChNQU4xU1JDLXkpKSBcCiAgICAg
ICAgICAgICAkKHBhdHN1YnN0IG1hbi8lLm1hcmtkb3duLjUsaHRtbC9tYW4vJS41Lmh0bWwsJChN
QU41U1JDLXkpKSBcCkBAIC0yNTUsNiArMjU2LDggQEAgJChldmFsICQoY2FsbCBHRU5FUkFURV9Q
QU5ET0NfUlVMRSx0eHQscGFuZG9jKSkgICAjIHR4dC8lLnR4dDogJS5wYW5kb2MKICQoZXZhbCAk
KGNhbGwgR0VORVJBVEVfUEFORE9DX1JVTEUsaHRtbCxwYW5kb2MpKSAgIyBodG1sLyUuaHRtbDog
JS5wYW5kb2MKICQoZXZhbCAkKGNhbGwgR0VORVJBVEVfUEFORE9DX1JVTEUscGRmLG1hcmtkb3du
KSkgIyBwZGYvJS5wZGY6ICUubWFya2Rvd24KIAorJChldmFsICQoY2FsbCBHRU5FUkFURV9QQU5E
T0NfUlVMRV9SQVcsaHRtbC9TVVBQT1JULmh0bWwsJChYRU5fUk9PVCkvU1VQUE9SVC5tZCkpICMg
cGRmLyUucGRmOiAlLm1hcmtkb3duCisKIGlmZXEgKCwkKGZpbmRzdHJpbmcgY2xlYW4sJChNQUtF
Q01ER09BTFMpKSkKICQoWEVOX1JPT1QpL2NvbmZpZy9Eb2NzLm1rOgogCSQoZXJyb3IgWW91IGhh
dmUgdG8gcnVuIC4vY29uZmlndXJlIGJlZm9yZSBidWlsZGluZyBkb2NzKQotLSAKMi4xLjQKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
