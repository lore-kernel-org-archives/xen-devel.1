From: kbuild test robot <lkp@intel.com>
Subject: [RFC PATCH tip] x86/xen: xen_reservation_lock can be
 static
Date: Tue, 4 Sep 2018 23:25:12 +0800
Message-ID: <20180904152512.GV17047__30460.2108234123$1536073912$gmane$org@intel.com>
References: <201809040116.CNt3UQy0%fengguang.wu@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=t7fa=ls=intel.com=lkp@srs-us1.protection.inumbo.net>)
 id 1fxD11-0006BH-IC
 for xen-devel@lists.xenproject.org; Tue, 04 Sep 2018 15:13:15 +0000
Content-Disposition: inline
In-Reply-To: <201809040116.CNt3UQy0%fengguang.wu@intel.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, kbuild-all@01.org, "H. Peter Anvin" <hpa@zytor.com>, tipbuild@zytor.com, xen-devel@lists.xenproject.org, Thomas Gleixner <tglx@linutronix.de>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

CkZpeGVzOiBmMDMwYWFkZTkxNjUgKCJ4ODYveGVuOiBNb3ZlIHB2IHNwZWNpZmljIHBhcnRzIG9m
IGFyY2gveDg2L3hlbi9tbXUuYyB0byBtbXVfcHYuYyIpClNpZ25lZC1vZmYtYnk6IGtidWlsZCB0
ZXN0IHJvYm90IDxmZW5nZ3Vhbmcud3VAaW50ZWwuY29tPgotLS0KIG1tdV9wdi5jIHwgICAgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0t
Z2l0IGEvYXJjaC94ODYveGVuL21tdV9wdi5jIGIvYXJjaC94ODYveGVuL21tdV9wdi5jCmluZGV4
IGJmMzBmYTAuLjdhZGE5ZTQgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L3hlbi9tbXVfcHYuYworKysg
Yi9hcmNoL3g4Ni94ZW4vbW11X3B2LmMKQEAgLTEwNCw3ICsxMDQsNyBAQCBzdGF0aWMgcHVkX3Qg
bGV2ZWwzX3VzZXJfdnN5c2NhbGxbUFRSU19QRVJfUFVEXSBfX3BhZ2VfYWxpZ25lZF9ic3M7CiAg
KiBQcm90ZWN0cyBhdG9taWMgcmVzZXJ2YXRpb24gZGVjcmVhc2UvaW5jcmVhc2UgYWdhaW5zdCBj
b25jdXJyZW50IGluY3JlYXNlcy4KICAqIEFsc28gcHJvdGVjdHMgbm9uLWF0b21pYyB1cGRhdGVz
IG9mIGN1cnJlbnRfcGFnZXMgYW5kIGJhbGxvb24gbGlzdHMuCiAgKi8KLURFRklORV9TUElOTE9D
Syh4ZW5fcmVzZXJ2YXRpb25fbG9jayk7CitzdGF0aWMgREVGSU5FX1NQSU5MT0NLKHhlbl9yZXNl
cnZhdGlvbl9sb2NrKTsKIAogLyoKICAqIE5vdGUgYWJvdXQgY3IzIChwYWdldGFibGUgYmFzZSkg
dmFsdWVzOgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
