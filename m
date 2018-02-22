From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH] x86/HVM: don't give the wrong impression of
 WRMSR succeeding
Date: Thu, 22 Feb 2018 06:44:46 -0700
Message-ID: <5A8ED75E02000078001AA6A4@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=x7kc=fq=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1eorB7-0003Cd-S1
 for xen-devel@lists.xenproject.org; Thu, 22 Feb 2018 13:44:53 +0000
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
List-Id: xen-devel@lists.xenproject.org

Li4uIGZvciB1bmtub3duIE1TUnM6IHdybXNyX2h5cGVydmlzb3JfcmVncygpJ3MgY29tbWVudCBj
bGVhcmx5IHNheXMKdGhhdCB0aGUgZnVuY3Rpb24gcmV0dXJucyAwIGZvciB1bnJlY29nbml6ZWQg
TVNScywgc28Ke3N2bSx2bXh9X21zcl93cml0ZV9pbnRlcmNlcHQoKSBzaG91bGQgbm90IGNvbnZl
cnQgdGhpcyBpbnRvIHN1Y2Nlc3MuCgpBdCB0aGUgdGltZSBpdCB3ZW50IGluLCBjb21taXQgMDEz
ZTM0ZjVhNiAoIng4NjogaGFuZGxlIHBhZ2VkIGdmbiBpbgp3cm1zcl9oeXBlcnZpc29yX3JlZ3Mi
KSB3YXMgcHJvYmFibHkgb2theSwgc2luY2UgcHJpb3IgdG8gdGhhdCB0aGUKcmV0dXJuIHZhbHVl
IHdhc24ndCBjaGVja2VkIGF0IGFsbC4gQnV0IHRoYXQncyBub3QgaG93IHdlIHdhbnQgdGhpbmdz
CnRvIGJlIGhhbmRsZWQgbm93YWRheXMuCgpTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJl
dWxpY2hAc3VzZS5jb20+CgotLS0gYS94ZW4vYXJjaC94ODYvaHZtL3N2bS9zdm0uYworKysgYi94
ZW4vYXJjaC94ODYvaHZtL3N2bS9zdm0uYwpAQCAtMjEyNCw3ICsyMTI0LDYgQEAgc3RhdGljIGlu
dCBzdm1fbXNyX3dyaXRlX2ludGVyY2VwdCh1bnNpZwogICAgICAgICBjYXNlIC1FUkVTVEFSVDoK
ICAgICAgICAgICAgIHJlc3VsdCA9IFg4NkVNVUxfUkVUUlk7CiAgICAgICAgICAgICBicmVhazsK
LSAgICAgICAgY2FzZSAwOgogICAgICAgICBjYXNlIDE6CiAgICAgICAgICAgICBicmVhazsKICAg
ICAgICAgZGVmYXVsdDoKLS0tIGEveGVuL2FyY2gveDg2L2h2bS92bXgvdm14LmMKKysrIGIveGVu
L2FyY2gveDg2L2h2bS92bXgvdm14LmMKQEAgLTMxNjAsNyArMzE2MCw2IEBAIHN0YXRpYyBpbnQg
dm14X21zcl93cml0ZV9pbnRlcmNlcHQodW5zaWcKICAgICAgICAgICAgICAgICB7CiAgICAgICAg
ICAgICAgICAgY2FzZSAtRVJFU1RBUlQ6CiAgICAgICAgICAgICAgICAgICAgIHJldHVybiBYODZF
TVVMX1JFVFJZOwotICAgICAgICAgICAgICAgIGNhc2UgMDoKICAgICAgICAgICAgICAgICBjYXNl
IDE6CiAgICAgICAgICAgICAgICAgICAgIGJyZWFrOwogICAgICAgICAgICAgICAgIGRlZmF1bHQ6
CgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
