From: Dario Faggioli <dfaggioli@suse.com>
Subject: [PATCH 2/2] automation: build on openSUSE Leap.
Date: Fri, 16 Nov 2018 19:31:10 +0100
Message-ID: <154239307020.10244.149878067287347106.stgit@wayrath>
References: <154239232312.10244.2674246603103909622.stgit@wayrath>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=gvoj=n3=gmail.com=raistlin.df@srs-us1.protection.inumbo.net>)
 id 1gNitN-00011r-F0
 for xen-devel@lists.xenproject.org; Fri, 16 Nov 2018 18:30:57 +0000
Received: by mail-wm1-f67.google.com with SMTP id p2-v6so21848013wmc.2
 for <xen-devel@lists.xenproject.org>; Fri, 16 Nov 2018 10:30:55 -0800 (PST)
In-Reply-To: <154239232312.10244.2674246603103909622.stgit@wayrath>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wei.liu2@citrix.com>, Doug Goldstein <cardoe@cardoe.com>
List-Id: xen-devel@lists.xenproject.org

U2lnbmVkLW9mZi1ieTogRGFyaW8gRmFnZ2lvbGkgPGRmYWdnaW9saUBzdXNlLmNvbT4KLS0tCkNj
OiBEb3VnIEdvbGRzdGVpbiA8Y2FyZG9lQGNhcmRvZS5jb20+CkNjOiBXZWkgTGl1IDx3ZWkubGl1
MkBjaXRyaXguY29tPgotLS0KIC5naXRsYWItY2kueW1sIHwgICAzMiArKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDMyIGluc2VydGlvbnMoKykKCmRpZmYg
LS1naXQgYS8uZ2l0bGFiLWNpLnltbCBiLy5naXRsYWItY2kueW1sCmluZGV4IGEzYjM5M2ZhZGUu
LjgxNWU2MjYyOTEgMTAwNjQ0Ci0tLSBhLy5naXRsYWItY2kueW1sCisrKyBiLy5naXRsYWItY2ku
eW1sCkBAIC0zMjMsMyArMzIzLDM1IEBAIGRlYmlhbi11bnN0YWJsZS1nY2MtZGVidWctYXJtNjQ6
CiAgICAgWEVOX1RBUkdFVF9BUkNIOiBhcm02NAogICB0YWdzOgogICAgIC0gYXJtNjQKKworb3Bl
bnN1c2UtbGVhcC1jbGFuZzoKKyAgPDw6ICpidWlsZAorICB2YXJpYWJsZXM6CisgICAgPDw6ICpj
bGFuZworICAgIENPTlRBSU5FUjogc3VzZTpvcGVuc3VzZS1sZWFwCisgICAgZGVidWc6IG4KKyAg
ICBYRU5fVEFSR0VUX0FSQ0g6IHg4Nl82NAorCitvcGVuc3VzZS1sZWFwLWNsYW5nLWRlYnVnOgor
ICA8PDogKmJ1aWxkCisgIHZhcmlhYmxlczoKKyAgICA8PDogKmNsYW5nCisgICAgQ09OVEFJTkVS
OiBzdXNlOm9wZW5zdXNlLWxlYXAKKyAgICBkZWJ1ZzogeQorICAgIFhFTl9UQVJHRVRfQVJDSDog
eDg2XzY0CisKK29wZW5zdXNlLWxlYXAtZ2NjOgorICA8PDogKmJ1aWxkCisgIHZhcmlhYmxlczoK
KyAgICA8PDogKmdjYworICAgIENPTlRBSU5FUjogc3VzZTpvcGVuc3VzZS1sZWFwCisgICAgZGVi
dWc6IG4KKyAgICBYRU5fVEFSR0VUX0FSQ0g6IHg4Nl82NAorCitvcGVuc3VzZS1sZWFwLWdjYy1k
ZWJ1ZzoKKyAgPDw6ICpidWlsZAorICB2YXJpYWJsZXM6CisgICAgPDw6ICpnY2MKKyAgICBDT05U
QUlORVI6IHN1c2U6b3BlbnN1c2UtbGVhcAorICAgIGRlYnVnOiB5CisgICAgWEVOX1RBUkdFVF9B
UkNIOiB4ODZfNjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
