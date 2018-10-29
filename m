From: Juergen Gross <jgross@suse.com>
Subject: [PATCH] x86/paravirt: pv_ops isn't GPL only
Date: Mon, 29 Oct 2018 16:01:16 +0100
Message-ID: <20181029150116.25372-1-jgross__29058.5914663554$1540825204$gmane$org@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=jung=nj=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1gH92f-0000Xq-HT
 for xen-devel@lists.xenproject.org; Mon, 29 Oct 2018 15:01:21 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org, virtualization@lists.linux-foundation.org
Cc: Juergen Gross <jgross@suse.com>, boris.ostrovsky@oracle.com, rusty@rustcorp.com.au, mingo@redhat.com, hpa@zytor.com, akataria@vmware.com, tglx@linutronix.de
List-Id: xen-devel@lists.xenproject.org

Q29tbWl0IDVjODM1MTFiZGI5ODMyICgieDg2L3BhcmF2aXJ0OiBVc2UgYSBzaW5nbGUgb3BzIHN0
cnVjdHVyZSIpCmludHJvZHVjZWQgYSByZWdyZXNzaW9uIGZvciBvdXQtb2YtdHJlZSBtb2R1bGVz
IHVzaW5nIHNwaW5sb2NrcywgYXMKcHZfbG9ja19vcHMgd2FzIGV4cG9ydGVkIHZpYSBFWFBPUlRf
U1lNQk9MKCksIHdoaWxlIHRoZSBuZXcgcHZfb3BzCnN0cnVjdHVyZSBub3cgY29udGFpbmluZyB0
aGUgcHYgbG9jayBvcGVyYXRpb25zIGlzIGV4cG9ydGVkIHZpYQpFWFBPUlRfU1lNQk9MX0dQTCgp
LgoKQ2hhbmdlIHRoYXQgYnkgdXNpbmcgRVhQT1JUX1NZTUJPTChwdl9vcHMpLgoKRml4ZXM6IDVj
ODM1MTFiZGI5ODMyICgieDg2L3BhcmF2aXJ0OiBVc2UgYSBzaW5nbGUgb3BzIHN0cnVjdHVyZSIp
ClNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KLS0tCiBhcmNo
L3g4Ni9rZXJuZWwvcGFyYXZpcnQuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2FyY2gveDg2L2tlcm5lbC9wYXJhdmly
dC5jIGIvYXJjaC94ODYva2VybmVsL3BhcmF2aXJ0LmMKaW5kZXggZTRkNGRmMzc5MjJhLi40NTEy
M2IxMTZjMDUgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2tlcm5lbC9wYXJhdmlydC5jCisrKyBiL2Fy
Y2gveDg2L2tlcm5lbC9wYXJhdmlydC5jCkBAIC00ODMsNSArNDgzLDUgQEAgTk9LUFJPQkVfU1lN
Qk9MKG5hdGl2ZV9zZXRfZGVidWdyZWcpOwogTk9LUFJPQkVfU1lNQk9MKG5hdGl2ZV9sb2FkX2lk
dCk7CiAjZW5kaWYKIAotRVhQT1JUX1NZTUJPTF9HUEwocHZfb3BzKTsKK0VYUE9SVF9TWU1CT0wo
cHZfb3BzKTsKIEVYUE9SVF9TWU1CT0xfR1BMKHB2X2luZm8pOwotLSAKMi4xNi40CgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
