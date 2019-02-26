From: Igor Druzhinin <igor.druzhinin@citrix.com>
Subject: Re: [PATCH v2] x86/nmi: correctly check MSB of P6
 performance counter MSR in watchdog
Date: Tue, 26 Feb 2019 13:36:32 +0000
Message-ID: <6c77cefc-4c33-4fe5-ae8c-e3563832c684@citrix.com>
References: <1551186774-30858-1-git-send-email-igor.druzhinin@citrix.com>
 <1a60c5da-2a43-114f-5b13-41ed65fba094@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=AghO=RB=citrix.com=prvs=9532012e5=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1gycuV-0008TA-FH
 for xen-devel@lists.xenproject.org; Tue, 26 Feb 2019 13:36:39 +0000
In-Reply-To: <1a60c5da-2a43-114f-5b13-41ed65fba094@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: wei.liu2@citrix.com, jbeulich@suse.com, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gMjYvMDIvMjAxOSAxMzoyNSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAyNi8wMi8yMDE5
IDEzOjEyLCBJZ29yIERydXpoaW5pbiB3cm90ZToKPiAKPj4gQEAgLTMyMyw2ICszMjcsMTAgQEAg
c3RhdGljIHZvaWQgc2V0dXBfcDZfd2F0Y2hkb2codW5zaWduZWQgY291bnRlcikKPj4gICAgICB1
bnNpZ25lZCBpbnQgZXZudHNlbDsKPj4gIAo+PiAgICAgIG5taV9wZXJmY3RyX21zciA9IE1TUl9Q
Nl9QRVJGQ1RSKDApOwo+PiArICAgIGlmICggY3VycmVudF9jcHVfZGF0YS5jcHVpZF9sZXZlbCA+
PSAweGEgKQo+PiArICAgICAgICBubWlfcDZfZXZlbnRfd2lkdGggPSBNQVNLX0VYVFIoY3B1aWRf
ZWF4KDB4YSksIFA2X0VWRU5UX1dJRFRIX01BU0spOwo+PiArICAgIGlmICggIW5taV9wNl9ldmVu
dF93aWR0aCApCj4+ICsgICAgICAgIG5taV9wNl9ldmVudF93aWR0aCA9IFA2X0VWRU5UX1dJRFRI
X0RFRkFVTFQ7Cj4gCj4gVGhpcyBpcyBjYWxsZWQgb24gZWFjaCBjcHUsIGJ1dCB3cml0ZXMgdG8g
YSBzaGFyZWQgdmFyaWFibGUuwqAgVGhpcwo+IGVudGlyZSBibG9jayB3YW50cyB0byBiZSBzb21l
dGhpbmcgbGlrZToKPiAKPiBpZiAoICFubWlfcDZfZXZlbnRfd2lkdGggKQo+IMKgwqDCoCBubWlf
cDZfZXZlbnRfd2lkdGggPSAoY3VycmVudF9jcHVfZGF0YS5jcHVpZF9sZXZlbCA+PSAweGEpID8K
PiBNQVNLX0VYVFIoY3B1aWRfZWF4KDB4YSksIFA2X0VWRU5UX1dJRFRIX01BU0spIDogUDZfRVZF
TlRfV0lEVEhfREVGQVVMVDsKPiAKPiAoc3VpdGFibHkgd3JhcHBlZCkgc28gaXQgZ2V0cyBmaWxs
ZWQgb25seSBvbmNlLgo+IAoKVGhpcyBwYXR0ZXJuIHNlZW1zIHRvIHBlcnNpc3Qgb3ZlciB0aGUg
d2hvbGUgZmlsZSAtIHNlZSBubWlfcGVyZmN0cl9tc3IKYWJvdmUgb3Igc2V0dXBfcDRfd2F0Y2hk
b2csIGV0Yy4gSSBlaXRoZXIgbmVlZCB0byBmaXggYWxsIG9mIHRoZW0gb3IKbGVhdmUgaXQgbGlr
ZSB0aGF0IGFzIGl0J3Mgbm90IGhhcm1mdWwgb3IgYW55dGhpbmcuCgpJZ29yCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
