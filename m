From: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH v2] x86/vmx: correctly gather gs_shadow
 value for current vCPU
Date: Sat, 11 May 2019 00:04:37 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19CA2A2D8@SHSMSX104.ccr.corp.intel.com>
References: <20190501235203.1179-1-tamas@tklengyel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=C3x+=TL=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1hPFVL-0008RS-U7
 for xen-devel@lists.xenproject.org; Sat, 11 May 2019 00:04:43 +0000
In-Reply-To: <20190501235203.1179-1-tamas@tklengyel.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Tamas K Lengyel <tamas@tklengyel.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wei.liu2@citrix.com>, "Nakajima, Jun" <jun.nakajima@intel.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

PiBGcm9tOiBUYW1hcyBLIExlbmd5ZWwgW21haWx0bzp0YW1hc0B0a2xlbmd5ZWwuY29tXQo+IFNl
bnQ6IFRodXJzZGF5LCBNYXkgMiwgMjAxOSA3OjUyIEFNCj4gCj4gQ3VycmVudGx5IHRoZSBnc19z
aGFkb3cgdmFsdWUgaXMgb25seSBjYWNoZWQgd2hlbiB0aGUgdkNQVSBpcyBiZWluZwo+IHNjaGVk
dWxlZAo+IG91dCBieSBYZW4uIFJlcG9ydGluZyB0aGlzICh1c3VhbGx5KSBzdGFsZSB2YWx1ZSB0
aHJvdWdoIHZtX2V2ZW50IGlzIGluY29ycmVjdCwKPiBzaW5jZSBpdCBkb2Vzbid0IHJlcHJlc2Vu
dCB0aGUgYWN0dWFsIHN0YXRlIG9mIHRoZSB2Q1BVIGF0IHRoZSB0aW1lIHRoZSBldmVudAo+IHdh
cyByZWNvcmRlZC4gVGhpcyBwcmV2ZW50cyB2bV9ldmVudCBzdWJzY3JpYmVycyBmcm9tIGNvcnJl
Y3RseSBmaW5kaW5nCj4ga2VybmVsCj4gc3RydWN0dXJlcyBpbiB0aGUgZ3Vlc3Qgd2hlbiBpdCBp
cyB0cmFwcGVkIHdoaWxlIGluIHJpbmczLgo+IAo+IFJlZnJlc2ggc2hhZG93X2dzIHZhbHVlIHdo
ZW4gdGhlIGNvbnRleHQgYmVpbmcgc2F2ZWQgaXMgZm9yIHRoZSBjdXJyZW50Cj4gdkNQVS4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBUYW1hcyBLIExlbmd5ZWwgPHRhbWFzQHRrbGVuZ3llbC5jb20+CgpB
Y2tlZC1ieTogS2V2aW4gVGlhbiA8a2V2aW4udGlhbkBpbnRlbC5jb20+CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
