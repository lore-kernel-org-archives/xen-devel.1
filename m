From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH RESEND] compat-ioctl/Xen: support at least some
 IOCTLs of evtchn and privcmd
Date: Wed, 15 Aug 2018 00:19:00 -0600
Message-ID: <5B73C5D402000078001DE189@prv1-mh.provo.novell.com>
References: <5B30C6E202000078001CD724@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=e0/s=k6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fpp96-0000rX-0d
 for xen-devel@lists.xenproject.org; Wed, 15 Aug 2018 06:19:04 +0000
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>, viro@zeniv.linux.org.uk
Cc: linux-fsdevel@vger.kernel.org, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

V2hpbGUgdGhpcyBpcyBvbmx5IGEgc3RhcnQgKElPQ1RMX1BSSVZDTURfTU1BUCogYW5kIElPQ1RM
X1BSSVZDTURfRE1fT1AKcmVxdWlyZSBtb3JlIHdvcmspLCBpdCBhdCBsZWFzdCBhbGxvd3Mgc29t
ZSBzaW1wbGUgb3BlcmF0aW9ucyAobGlrZQoieGwgZG1lc2ciKSB3aGljaCBoYXZlIGFsd2F5cyBi
ZWVuIGF2YWlsYWJsZSBvbiBYZW5vTGludXggdG8gd29yayBhZ2Fpbgp3aXRoIGEgNjQtYml0IGtl
cm5lbCB1bmRlcm5lYXRoIGEgMzItYml0IGRpc3Ryby4KClNpZ25lZC1vZmYtYnk6IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KQWNrZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0Bz
dXNlLmNvbT4KLS0tClJlc2VuZCBkdWUgdG8gcHJpb3Igb21pc3Npb24gb2YgZmlsZSBzeXN0ZW0g
cmVsYXRlZCBhZGRyZXNzZWVzLgotLS0KIGZzL2NvbXBhdF9pb2N0bC5jIHwgICAxNyArKysrKysr
KysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKykKCi0tLSA0LjE4L2Zz
L2NvbXBhdF9pb2N0bC5jCisrKyA0LjE4LXhlbi1wcml2Y21kLWNvbXBhdC1pb2N0bHMvZnMvY29t
cGF0X2lvY3RsLmMKQEAgLTExNSw2ICsxMTUsMTIgQEAKICNpbmNsdWRlIDxhc20vZmJpby5oPgog
I2VuZGlmCiAKKyNpZmRlZiBDT05GSUdfWEVOCisjaW5jbHVkZSA8eGVuL2ludGVyZmFjZS94ZW4u
aD4KKyNpbmNsdWRlIDx4ZW4vZXZ0Y2huLmg+CisjaW5jbHVkZSA8eGVuL3ByaXZjbWQuaD4KKyNl
bmRpZgorCiAjZGVmaW5lIGNvbnZlcnRfaW5fdXNlcihzcmNwdHIsIGRzdHB0cikJCQlcCiAoewkJ
CQkJCQlcCiAJdHlwZW9mKCpzcmNwdHIpIHZhbDsJCQkJXApAQCAtMTMwMCw2ICsxMzA2LDE3IEBA
IElHTk9SRV9JT0NUTChGQklPR0VUQ01BUDMyKQogSUdOT1JFX0lPQ1RMKEZCSU9TQ1VSU09SMzIp
CiBJR05PUkVfSU9DVEwoRkJJT0dDVVJTT1IzMikKICNlbmRpZgorCisjaWZkZWYgQ09ORklHX1hF
TgorQ09NUEFUSUJMRV9JT0NUTChJT0NUTF9QUklWQ01EX0hZUEVSQ0FMTCkKK0NPTVBBVElCTEVf
SU9DVEwoSU9DVExfUFJJVkNNRF9SRVNUUklDVCkKK0NPTVBBVElCTEVfSU9DVEwoSU9DVExfRVZU
Q0hOX0JJTkRfVklSUSkKK0NPTVBBVElCTEVfSU9DVEwoSU9DVExfRVZUQ0hOX0JJTkRfSU5URVJE
T01BSU4pCitDT01QQVRJQkxFX0lPQ1RMKElPQ1RMX0VWVENITl9CSU5EX1VOQk9VTkRfUE9SVCkK
K0NPTVBBVElCTEVfSU9DVEwoSU9DVExfRVZUQ0hOX1VOQklORCkKK0NPTVBBVElCTEVfSU9DVEwo
SU9DVExfRVZUQ0hOX05PVElGWSkKK0NPTVBBVElCTEVfSU9DVEwoSU9DVExfRVZUQ0hOX1JFU0VU
KQorI2VuZGlmCiB9OwogCiAvKgoKCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
