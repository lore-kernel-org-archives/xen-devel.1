From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH 4/4] x86/vmx: Properly flush the TLB when an
 altp2m is modified
Date: Wed, 20 Feb 2019 01:20:56 +0200
Message-ID: <65a38fcf-69a9-63ad-bafc-6aad4c5c3d3c@bitdefender.com>
References: <1550614715-21161-1-git-send-email-andrew.cooper3@citrix.com>
 <1550614715-21161-5-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1550614715-21161-5-git-send-email-andrew.cooper3@citrix.com>
Content-Language: en-US-large
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
Cc: Juergen Gross <jgross@suse.com>, Kevin Tian <kevin.tian@intel.com>, Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, Jun Nakajima <jun.nakajima@intel.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMi8yMC8xOSAxMjoxOCBBTSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBNb2RpZmljYWl0b25z
IHRvIGFuIGFsdHAybSBtYXJrIHRoZSBwMm0gYXMgbmVlZGluZyBmbHVzaGluZywgYnV0IHRoaXMg
d2FzCj4gbmV2ZXIgd2lyZWQgdXAgaW4gdGhlIHJldHVybi10by1ndWVzdCBwYXRoLiAgQXMgYSBy
ZXN1bHQsIHN0YWxlIFRMQiBlbnRyaWVzCj4gY2FuIHJlbWFpbiBhZnRlciByZXN1bWluZyB0aGUg
Z3Vlc3QuCj4gCj4gSW4gcHJhY3RpY2UsIHRoaXMgbWFuaWZlc3RzIGFzIGEgbWlzc2luZyBFUFRf
VklPTEFUSU9OIG9yICNWRSBleGNlcHRpb24gd2hlbgo+IHRoZSBndWVzdCBzdWJzZXF1ZW50bHkg
YWNjZXNzZXMgYSBwYWdlIHdoaWNoIGhhcyBoYWQgaXRzIHBlcm1pc3Npb25zIHJlZHVjZWQuCj4g
Cj4gdm14X3ZtZW50ZXJfaGVscGVyKCkgbm93IGhhcyAxMSBwMm1zIHRvIHBvdGVudGlhbGx5IGlu
dmFsaWRhdGUsIGJ1dCBpc3N1aW5nIDExCj4gSU5WRVBUIGluc3RydWN0aW9ucyBpc24ndCBjbGV2
ZXIuICBJbnN0ZWFkLCBjb3VudCBob3cgbWFueSBjb250ZXh0cyBuZWVkCj4gaW52YWxpZGF0aW5n
LCBhbmQgdXNlIElOVkVQVF9BTExfQ09OVEVYVCBpZiB0d28gb3IgbW9yZSBhcmUgaW4gbmVlZCBv
Zgo+IGZsdXNoaW5nLgo+IAo+IFRoaXMgZG9lc24ndCBoYXZlIGFuIFhTQSBiZWNhdXNlIGFsdHAy
bSBpcyBub3QgeWV0IGEgc2VjdXJpdHktc3VwcG9ydGVkCj4gZmVhdHVyZS4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgpSZXZpZXdl
ZC1ieTogUmF6dmFuIENvam9jYXJ1IDxyY29qb2NhcnVAYml0ZGVmZW5kZXIuY29tPgoKClRoYW5r
cywKUmF6dmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
