From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2] x86/nmi: correctly check MSB of P6
 performance counter MSR in watchdog
Date: Tue, 26 Feb 2019 13:25:04 +0000
Message-ID: <1a60c5da-2a43-114f-5b13-41ed65fba094@citrix.com>
References: <1551186774-30858-1-git-send-email-igor.druzhinin@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pxUo=RB=citrix.com=prvs=953b1d86f=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gycjM-0006yp-Uz
 for xen-devel@lists.xenproject.org; Tue, 26 Feb 2019 13:25:08 +0000
In-Reply-To: <1551186774-30858-1-git-send-email-igor.druzhinin@citrix.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Igor Druzhinin <igor.druzhinin@citrix.com>, xen-devel@lists.xenproject.org
Cc: wei.liu2@citrix.com, jbeulich@suse.com, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gMjYvMDIvMjAxOSAxMzoxMiwgSWdvciBEcnV6aGluaW4gd3JvdGU6Cgo+IEBAIC0zMjMsNiAr
MzI3LDEwIEBAIHN0YXRpYyB2b2lkIHNldHVwX3A2X3dhdGNoZG9nKHVuc2lnbmVkIGNvdW50ZXIp
Cj4gICAgICB1bnNpZ25lZCBpbnQgZXZudHNlbDsKPiAgCj4gICAgICBubWlfcGVyZmN0cl9tc3Ig
PSBNU1JfUDZfUEVSRkNUUigwKTsKPiArICAgIGlmICggY3VycmVudF9jcHVfZGF0YS5jcHVpZF9s
ZXZlbCA+PSAweGEgKQo+ICsgICAgICAgIG5taV9wNl9ldmVudF93aWR0aCA9IE1BU0tfRVhUUihj
cHVpZF9lYXgoMHhhKSwgUDZfRVZFTlRfV0lEVEhfTUFTSyk7Cj4gKyAgICBpZiAoICFubWlfcDZf
ZXZlbnRfd2lkdGggKQo+ICsgICAgICAgIG5taV9wNl9ldmVudF93aWR0aCA9IFA2X0VWRU5UX1dJ
RFRIX0RFRkFVTFQ7CgpUaGlzIGlzIGNhbGxlZCBvbiBlYWNoIGNwdSwgYnV0IHdyaXRlcyB0byBh
IHNoYXJlZCB2YXJpYWJsZS7CoCBUaGlzCmVudGlyZSBibG9jayB3YW50cyB0byBiZSBzb21ldGhp
bmcgbGlrZToKCmlmICggIW5taV9wNl9ldmVudF93aWR0aCApCsKgwqDCoCBubWlfcDZfZXZlbnRf
d2lkdGggPSAoY3VycmVudF9jcHVfZGF0YS5jcHVpZF9sZXZlbCA+PSAweGEpID8KTUFTS19FWFRS
KGNwdWlkX2VheCgweGEpLCBQNl9FVkVOVF9XSURUSF9NQVNLKSA6IFA2X0VWRU5UX1dJRFRIX0RF
RkFVTFQ7Cgooc3VpdGFibHkgd3JhcHBlZCkgc28gaXQgZ2V0cyBmaWxsZWQgb25seSBvbmNlLgoK
fkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
