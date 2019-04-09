From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v4 1/4] x86: stop handling MSR_IA32_BNDCFGS
 save/restore in implementation code
Date: Tue, 9 Apr 2019 15:38:35 +0100
Message-ID: <e211a166-d1d7-344f-6f46-22e10c67c63f@citrix.com>
References: <20190314135125.1958-1-paul.durrant@citrix.com>
 <20190314135125.1958-2-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rl/Z=SL=citrix.com=prvs=995435944=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hDs0B-0005ki-Pf
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 14:45:31 +0000
In-Reply-To: <20190314135125.1958-2-paul.durrant@citrix.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>, xen-devel@lists.xenproject.org
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTQvMDMvMjAxOSAxMzo1MSwgUGF1bCBEdXJyYW50IHdyb3RlOgo+IEBAIC0xMjE1LDggKzEx
OTYsMTEgQEAgc3RhdGljIGJvb2wgdm14X3NldF9ndWVzdF9ibmRjZmdzKHN0cnVjdCB2Y3B1ICp2
LCB1NjQgdmFsKQo+ICAgICAgcmV0dXJuIHRydWU7Cj4gIH0KPiAgCj4gLXN0YXRpYyBib29sIHZt
eF9nZXRfZ3Vlc3RfYm5kY2ZncyhzdHJ1Y3QgdmNwdSAqdiwgdTY0ICp2YWwpCj4gK3N0YXRpYyBi
b29sIHZteF9nZXRfZ3Vlc3RfYm5kY2Zncyhjb25zdCBzdHJ1Y3QgdmNwdSAqY3YsIHU2NCAqdmFs
KQo+ICB7Cj4gKyAgICAvKiBHZXQgYSBub24tY29uc3QgcG9pbnRlciBmb3Igdm14X3ZtY3NfZW50
ZXIoKSAqLwo+ICsgICAgc3RydWN0IHZjcHUgKnYgPSBjdi0+ZG9tYWluLT52Y3B1W2N2LT52Y3B1
X2lkXTsKPiArCgpJJ20gc29ycnkgbm90IGhhdmluZyBnb3QgYXJvdW5kIHRvIHJldmlld2luZyB0
aGlzIHNlcmllcyBpbiBhIHRpbWVseQpmYXNoaW9uLCBidXQgSSBhbSBnb2luZyB0byBzcGVjaWZp
Y2FsbHkgbmFjayBkZS1jb25zdGluZyBnYW1lcyBsaWtlCnRoaXMuwqAgVGhlcmUgaXMgbm93IHZj
cHUgc3RhdGUgY29ycnVwdGlvbiB3aGVuIHRoZSBNU1IgaXMgYWNjZXNzZWQKcmVtb3RlbHkgLSB0
aGlzIGhvb2sgKm11c3QqIHJlbWFpbiBhIG11dGFibGUgdmNwdSBwb2ludGVyLgoKVGhlcmUgYXJl
IGFsc28gbXVsdGlwbGUgb3RoZXIgZnVuY3Rpb25hbCBpc3N1ZXMgYW5kIHJlZ3Jlc3Npb25zCmlu
dHJvZHVjZWQgYnkgdGhpcyBzZXJpZXMuwqAgSSdtIHRyeWluZyB0byBwdXQgdG9nZXRoZXIgYSBw
YXRjaCB0byBmaXgKYWxsIG9mIHRoZSBmYWxsb3V0LCBidXQgSSBhbHNvIG1pZ2h0IHJldmVydCB0
aGUgc2VyaWVzIHdob2xlc2FsZQpkZXBlbmRpbmcgb24gdGhlIGV2ZW50dWFsIGNvbXBsZXhpdHku
Cgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
