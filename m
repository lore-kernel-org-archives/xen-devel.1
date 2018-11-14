From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH V5 1/3] x86/altp2m: propagate ept.ad changes
 to all active altp2ms
Date: Wed, 14 Nov 2018 09:14:27 +0200
Message-ID: <7678eb1f-8917-66ce-8f39-2d3b988c204e@bitdefender.com>
References: <1541945224-23075-1-git-send-email-rcojocaru@bitdefender.com>
 <1541945224-23075-2-git-send-email-rcojocaru@bitdefender.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19BE49E19@SHSMSX101.ccr.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=mavx=nz=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1gMpNo-00055A-DN
 for xen-devel@lists.xenproject.org; Wed, 14 Nov 2018 07:14:40 +0000
In-Reply-To: <AADFC41AFE54684AB9EE6CBC0274A5D19BE49E19@SHSMSX101.ccr.corp.intel.com>
Content-Language: en-US-large
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "Tian, Kevin" <kevin.tian@intel.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, "Nakajima, Jun" <jun.nakajima@intel.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTEvMTQvMTggNzo0NCBBTSwgVGlhbiwgS2V2aW4gd3JvdGU6Cj4+IEZyb206IFJhenZhbiBD
b2pvY2FydSBbbWFpbHRvOnJjb2pvY2FydUBiaXRkZWZlbmRlci5jb21dCj4+IFNlbnQ6IFN1bmRh
eSwgTm92ZW1iZXIgMTEsIDIwMTggMTA6MDcgUE0KPj4KPj4gVGhpcyBwYXRjaCBpcyBhIHByZS1y
ZXF1aXNpdGUgZm9yIGZpeGluZyB0aGUgbG9nZGlydHkgVkdBIGlzc3VlCj4+IChkaXNwbGF5IGZy
ZWV6ZXMgd2hlbiBzd2l0Y2hpbmcgdG8gYSBuZXcgYWx0cDJtIHZpZXcgZWFybHkgaW4gYQo+PiBk
b21haW4ncyBsaWZldGltZSksIGJ1dCBzZW50IHNlcGFyYXRlbHkgZm9yIGVhc2llciByZXZpZXcu
Cj4gCj4gaXQncyBpbiB0aGUgc2VyaWVzIG5vdywgaW5zdGVhZCBvZiBzZW5kaW5nIHNlcGFyYXRl
bHkuCgpSaWdodCwgc29ycnkgZm9yIHRoYXQgb21pc3Npb24gLSBhbHRob3VnaCBub3cgd2l0aCB5
b3VyIFJldmlld2VkLWJ5IGl0CmNhbiBiZSBhcHBsaWVkIG5vdyBhbmQgZXNjYXBlIHRoZSBzZXJp
ZXMuIDopCgo+PiBUaGUgbmV3IGVwdF9zZXRfYWRfc3luYygpIGZ1bmN0aW9uIGhhcyBiZWVuIGFk
ZGVkIHRvIHVwZGF0ZSBhbGwKPj4gYWN0aXZlIGFsdHAybXMnIGVwdC5hZC4gTmV3IGFsdHAybXMg
d2lsbCBpbmhlcml0IHRoZSBob3N0cDJtJ3MKPj4gZXB0LmFkIHZhbHVlLgo+Pgo+PiBUaGUgcDJt
X3tlbixkaXN9YWJsZV9oYXJkd2FyZV9sb2dfZGlydHkoKSBob3N0cDJtIGxvY2tpbmcgaGFzCj4+
IGJlZW4gbW92ZWQgdG8gdGhlIG5ldyBlcHRfe2VuLGRpc31hYmxlX2hhcmR3YXJlX2xvZ19kaXJ0
eSgpCj4+IGZ1bmN0aW9ucyBhcyBwYXJ0IG9mIHRoZSBjb2RlIHJlZmFjdG9yaW5nLCB3aGlsZSBs
b2NrcyBmb3IgdGhlCj4+IGluZGl2aWR1YWwgYWx0cDJtcyBhcmUgdGFrZW4gaW4gZXB0X3NldF9h
ZF9zeW5jKCkgKGNhbGxlZCBieQo+PiBlcHRfe2VuLGRpc31hYmxlX3BtbCgpKS4KPj4KPj4gU2ln
bmVkLW9mZi1ieTogUmF6dmFuIENvam9jYXJ1IDxyY29qb2NhcnVAYml0ZGVmZW5kZXIuY29tPgo+
PiBTdWdnZXN0ZWQtYnk6IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT4K
Pj4gVGVzdGVkLWJ5OiBUYW1hcyBLIExlbmd5ZWwgPHRhbWFzQHRrbGVuZ3llbC5jb20+Cj4+IEFj
a2VkLWJ5OiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+Cj4gCj4gUmV2
aWV3ZWQtYnk6IEtldmluIFRpYW4gPGtldmluLnRpYW5AaW50ZWwuY29tPgoKClRoYW5rcywKUmF6
dmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
