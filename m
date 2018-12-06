From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH v8 1/7] xen/pvh: Split CONFIG_XEN_PVH into
 CONFIG_PVH and CONFIG_XEN_PVH
Date: Thu, 6 Dec 2018 18:11:44 -0500
Message-ID: <becd5f82-0cca-f74b-93bd-6b4f13bc8bf0__45009.2803607278$1544137860$gmane$org@oracle.com>
References: <1544076152-21637-1-git-send-email-maran.wilson@oracle.com>
 <1544076257-21792-1-git-send-email-maran.wilson@oracle.com>
 <d532f023-85f9-62b9-ca56-53a619fdcd1e@redhat.com>
 <3b4fdddd-67d8-30d3-2a5d-c4d07b6f31c9@oracle.com>
 <e76da394-c721-87ae-c721-1f6efdc93a50@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PAb1=OP=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1gV2oe-00041F-QG
 for xen-devel@lists.xenproject.org; Thu, 06 Dec 2018 23:12:20 +0000
In-Reply-To: <e76da394-c721-87ae-c721-1f6efdc93a50@redhat.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paolo Bonzini <pbonzini@redhat.com>, Maran Wilson <maran.wilson@oracle.com>, x86@kernel.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, kvm@vger.kernel.org, jgross@suse.com
Cc: thomas.lendacky@amd.com, dave.hansen@linux.intel.com, rkrcmar@redhat.com, hpa@zytor.com, mingo@redhat.com, rdunlap@infradead.org, luto@kernel.org, jpoimboe@redhat.com, tglx@linutronix.de, bp@suse.de, kirill.shutemov@linux.intel.com, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gMTIvNi8xOCA1OjQ5IFBNLCBQYW9sbyBCb256aW5pIHdyb3RlOgo+IE9uIDA2LzEyLzE4IDIz
OjM0LCBCb3JpcyBPc3Ryb3Zza3kgd3JvdGU6Cj4+IE9uIDEyLzYvMTggNToxMSBQTSwgUGFvbG8g
Qm9uemluaSB3cm90ZToKPj4KPj4+IGFuZCBhbHNvCj4+Pgo+Pj4gCWRlcGVuZHMgb24gIUVGSQo+
Pj4KPj4+IGJlY2F1c2UgZXZlbiB0aG91Z2ggaW4gcHJpbmNpcGxlIGl0IHdvdWxkIGJlIHBvc3Np
YmxlIHRvIHdyaXRlIGEgUFZICj4+PiBsb2FkZXIgZm9yIFVFRkksIFBWSCdzIHN0YXJ0IGluZm8g
ZG9lcyBub3Qgc3VwcG9ydCB0aGUgRUZJIGhhbmRvdmVyCj4+PiBwcm90b2NvbC4KPj4gQnV0IHdl
IHNob3VsZCBiZSBhYmxlIHRvIGJ1aWxkIHRoZSBiaW5hcnkgd2l0aCBib3RoIEVGSSBhbmQgUFZI
Pwo+IENhbiB5b3U/ICBJdCdzIGEgY29tcGxldGVseSBkaWZmZXJlbnQgYmluYXJ5IGZvcm1hdCwg
dGhlIEVGSSBoYW5kb3Zlcgo+IHByb3RvY29sIGlzIGludm9rZWQgdmlhIGEgc3BlY2lhbCBlbnRy
eSBwb2ludCBhbmQgbmVlZHMgdGhlIExpbnV4IGhlYWRlcgo+IGZvcm1hdCwgbm90IEVMRi4KClJp
Z2h0LCBidXQgSSB0aGluayBpdCBpcyBkZXNpcmFibGUgdG8gYmUgYWJsZSB0byBidWlsZCBib3Ro
IGZyb20gdGhlCnNhbWUgY29uZmlnIGZpbGUuCgotYm9yaXMKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
