From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 20/62] ts-guests-nbd-mirror: use
 target_{get, put}file_root to transfter cfg
Date: Wed, 10 Apr 2019 15:23:26 +0100
Message-ID: <20190410142408.22848-21-ian.jackson@eu.citrix.com>
References: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xn7x=SM=citrix.com=prvs=996f5bc6d=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hEEAE-0006FL-8J
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 14:25:22 +0000
In-Reply-To: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

RnJvbTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KClRoZSBvcmlnaW5hbCBjb2RlIHVz
ZWQgdGFyZ2V0X2NtZF9vdXRwdXRfcm9vdCB3aGljaCBjYXVzZWQgYSB0cmFpbGluZwpuZXcgbGlu
ZSB0byBiZSBkZWxldGVkLCB3aGljaCBjYXVzZWQgbGlidmlydCBjb252ZXJ0ZXIgdG8gZmFpbC4K
Ckl0IHdhc24ndCBkaXNjb3ZlcmVkIHVudGlsIG5vdyBiZWNhdXNlIHdlIGFwcGVuZGVkIHRvbyBt
YW55ICJcbiIuCgpVc2UgdGFyZ2V0X3tnZXQscHV0fWZpbGVfcm9vdCB0byBkbyB0aGUgam9iLgoK
U2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KLS0tCiB0cy1ndWVz
dHMtbmJkLW1pcnJvciB8IDcgKysrKystLQogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygr
KSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90cy1ndWVzdHMtbmJkLW1pcnJvciBiL3Rz
LWd1ZXN0cy1uYmQtbWlycm9yCmluZGV4IDdlYTMxZjdjLi4wNjkwM2FhYSAxMDA3NTUKLS0tIGEv
dHMtZ3Vlc3RzLW5iZC1taXJyb3IKKysrIGIvdHMtZ3Vlc3RzLW5iZC1taXJyb3IKQEAgLTE1NCw4
ICsxNTQsMTEgQEAgc3ViIHNodWZmbGVjb25maWdzICgpIHsKIAlteSAkZ249ICRnbnNbJGldOwog
CW15ICRnaG89ICRnaG9zWyRpXTsKIAlteSAkY2ZncGF0aD0gJHJ7ICIkZ2hvLT57R3Vlc3R9X2Nm
Z3BhdGgiIH07Ci0JbXkgJGNmZ2RhdGE9IHRhcmdldF9jbWRfb3V0cHV0X3Jvb3QoJHNobywiY2F0
ICRjZmdwYXRoIik7Ci0JdGFyZ2V0X3B1dGZpbGVjb250ZW50c19yb290X3N0YXNoKCRjaG8sMTAs
JGNmZ2RhdGEsJGNmZ3BhdGgpOworCW15ICRmaWxlPSAkY2ZncGF0aDsKKwkkZmlsZT1+IHMsLywt
LGc7CisJJGZpbGU9ICIkc3Rhc2gvIi5ob3N0bmFtZXBhdGgoJGNobykuIi0tJGZpbGUiOworCXRh
cmdldF9nZXRmaWxlX3Jvb3QoJHNobywgNjAsICRjZmdwYXRoLCAkZmlsZSk7CisJdGFyZ2V0X3B1
dGZpbGVfcm9vdCgkY2hvLCA2MCwgJGZpbGUsICRjZmdwYXRoKTsKICAgICB9CiB9CiAKLS0gCjIu
MTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
