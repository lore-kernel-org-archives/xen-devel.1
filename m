From: Jia-Ju Bai <baijiaju1990@gmail.com>
Subject: [PATCH] xen: xenbus: Fix a possible data race in
 xs_request_enter
Date: Tue,  8 May 2018 11:34:29 +0800
Message-ID: <20180508033429.12749-1-baijiaju1990__17957.4772985236$1525750421$gmane$org@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=3we0=h3=gmail.com=baijiaju1990@srs-us1.protection.inumbo.net>)
 id 1fFtOh-0003RI-Vc
 for xen-devel@lists.xenproject.org; Tue, 08 May 2018 03:34:40 +0000
Received: by mail-pl0-x244.google.com with SMTP id ay10-v6so1364023plb.1
 for <xen-devel@lists.xenproject.org>; Mon, 07 May 2018 20:34:37 -0700 (PDT)
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: boris.ostrovsky@oracle.com, jgross@suse.com, simon@invisiblethingslab.com, joao.m.martins@oracle.com
Cc: xen-devel@lists.xenproject.org, Jia-Ju Bai <baijiaju1990@gmail.com>, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

VGhlIHJlYWQgb3BlcmF0aW9uIHRvICJyZXEtPnR5cGUiIGlzIHByb3RlY3RlZCBieQp0aGUgbG9j
ayBvbiBsaW5lIDEyOCwgYnV0IHRoZSB3cml0ZSBvcGVyYXRpb24gdG8KdGhpcyBkYXRhIG9uIGxp
bmUgMTE4IGlzIG5vdCBwcm90ZWN0ZWQgYnkgdGhlIGxvY2suClRodXMsIHRoZXJlIG1heSBleGlz
dCBhIGRhdGEgcmFjZSBmb3IgInJlcS0+dHlwZSIuCgpUbyBmaXggdGhpcyBkYXRhIHJhY2UsIHRo
ZSB3cml0ZSBvcGVyYXRpb24gdG8gInJlcS0+dHlwZSIgCnNob3VsZCBiZSBhbHNvIHByb3RlY3Rl
ZCBieSB0aGUgbG9jay4KClNpZ25lZC1vZmYtYnk6IEppYS1KdSBCYWkgPGJhaWppYWp1MTk5MEBn
bWFpbC5jb20+Ci0tLQogZHJpdmVycy94ZW4veGVuYnVzL3hlbmJ1c194cy5jIHwgNCArKy0tCiAx
IGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMveGVuL3hlbmJ1cy94ZW5idXNfeHMuYyBiL2RyaXZlcnMveGVuL3hlbmJ1cy94
ZW5idXNfeHMuYwppbmRleCA0OWEzODc0YWU2YmIuLjI3NGNkZmVlMDhiMSAxMDA2NDQKLS0tIGEv
ZHJpdmVycy94ZW4veGVuYnVzL3hlbmJ1c194cy5jCisrKyBiL2RyaXZlcnMveGVuL3hlbmJ1cy94
ZW5idXNfeHMuYwpAQCAtMTE1LDEwICsxMTUsMTAgQEAgc3RhdGljIHVpbnQzMl90IHhzX3JlcXVl
c3RfZW50ZXIoc3RydWN0IHhiX3JlcV9kYXRhICpyZXEpCiB7CiAJdWludDMyX3QgcnFfaWQ7CiAK
LQlyZXEtPnR5cGUgPSByZXEtPm1zZy50eXBlOwotCiAJc3Bpbl9sb2NrKCZ4c19zdGF0ZV9sb2Nr
KTsKIAorCXJlcS0+dHlwZSA9IHJlcS0+bXNnLnR5cGU7CisKIAl3aGlsZSAoIXhzX3N0YXRlX3Vz
ZXJzICYmIHhzX3N1c3BlbmRfYWN0aXZlKSB7CiAJCXNwaW5fdW5sb2NrKCZ4c19zdGF0ZV9sb2Nr
KTsKIAkJd2FpdF9ldmVudCh4c19zdGF0ZV9lbnRlcl93cSwgeHNfc3VzcGVuZF9hY3RpdmUgPT0g
MCk7Ci0tIAoyLjE3LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
