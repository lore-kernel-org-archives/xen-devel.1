From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH v4] x86/mm: Aggregate get entry and populate
 into common funcs
Date: Mon, 15 Apr 2019 14:46:50 +0100
Message-ID: <433510a4-36fc-1121-6bf1-a14c0da2d84b@citrix.com>
References: <20190415092243.3349-1-aisaila@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/xrN=SR=citrix.com=prvs=001d99114=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1hG1y5-0002G0-K6
 for xen-devel@lists.xenproject.org; Mon, 15 Apr 2019 13:48:17 +0000
In-Reply-To: <20190415092243.3349-1-aisaila@bitdefender.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Alexandru Stefan ISAILA <aisaila@bitdefender.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "tamas@tklengyel.com" <tamas@tklengyel.com>, "wei.liu2@citrix.com" <wei.liu2@citrix.com>, "rcojocaru@bitdefender.com" <rcojocaru@bitdefender.com>, "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>, "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, "jbeulich@suse.com" <jbeulich@suse.com>, "roger.pau@citrix.com" <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gNC8xNS8xOSAxMDoyMiBBTSwgQWxleGFuZHJ1IFN0ZWZhbiBJU0FJTEEgd3JvdGU6Cj4gVGhl
IGNvZGUgZm9yIGdldHRpbmcgdGhlIGVudHJ5IGFuZCB0aGVuIHBvcHVsYXRpbmcgd2FzIHJlcGVh
dGVkIGluCj4gcDJtX2NoYW5nZV9hbHRwMm1fZ2ZuKCkgYW5kIGluIHAybV9zZXRfYWx0cDJtX21l
bV9hY2Nlc3MoKS4KPiAKPiBUaGUgY29kZSBpcyBub3cgaW4gb25lIHBsYWNlIHdpdGggYSBib29s
IHBhcmFtIHRoYXQgbGV0cyB0aGUgY2FsbGVyIGNob29zZQo+IGlmIGl0IHBvcHVsYXRlcyBhZnRl
ciBnZXRfZW50cnkoKS4KPiAKPiBJZiByZW1hcHBpbmcgaXMgYmVpbmcgZG9uZSB0aGVuIGJvdGgg
dGhlIG9sZCBhbmQgbmV3IGdmbidzIHNob3VsZCBiZQo+IHVuc2hhcmVkIGluIHRoZSBob3N0cDJt
IGZvciBrZWVwaW5nIHRoaW5ncyBjb25zaXN0ZW50LiBUaGUgcGFnZSB0eXBlCj4gb2Ygb2xkX2dm
biB3YXMgYWxyZWFkeSBjaGVja2VkIHdoZXRoZXIgaXQncyBwMm1fcmFtX3J3IGFuZCBiYWlsIGlm
IGl0Cj4gd2Fzbid0IHNvIGZ1bmN0aW9uYWxpdHktd2lzZSB0aGlzIGp1c3Qgc2ltcGxpZmllcyB0
aGluZ3MgYXMgYSB1c2VyCj4gZG9lc24ndCBoYXZlIHRvIHJlcXVlc3QgdW5zaGFyaW5nIG1hbnVh
bGx5IGJlZm9yZSByZW1hcHBpbmcuCj4gTm93LCBpZiB0aGUgbmV3X2dmbiBpcyBpbnZhbGlkIGl0
IHNob3VsZG4ndCBxdWVyeSB0aGUgaG9zdHAybSBhcwo+IHRoYXQgaXMgZWZmZWN0aXZlbHkgYSBy
ZXF1ZXN0IHRvIHJlbW92ZSB0aGUgZW50cnkgZnJvbSB0aGUgYWx0cDJtLgo+IEJ1dCBwcm92aWRl
ZCB0aGF0IHNjZW5hcmlvIGlzIHVzZWQgb25seSB3aGVuIHJlbW92aW5nIGVudHJpZXMgdGhhdAo+
IHdlcmUgcHJldmlvdXNseSByZW1hcHBlZC9jb3BpZWQgdG8gdGhlIGFsdHAybSwgdGhvc2UgZW50
cmllcyBhbHJlYWR5Cj4gd2VudCB0aHJvdWdoIFAyTV9BTExPQyB8IFAyTV9VTlNIQVJFIGJlZm9y
ZSwgc28gaXQgd29uJ3QgaGF2ZSBhbgo+IGFmZmVjdCBzbyB0aGUgY29yZSBmdW5jdGlvbiBnZXRf
YWx0cDJtX2VudHJ5KCkgaXMgY2FsbGluZwo+IF9fZ2V0X2dmbl90eXBlX2FjY2VzcygpIHdpdGgg
UDJNX0FMTE9DIHwgUDJNX1VOU0hBUkUuCj4gCj4gYWx0cDJtX2dldF9lbnRyeV9kaXJlY3QoKSBp
cyBhbHNvIGNhbGxlZCBpbiBwMm1fc2V0X3N1cHByZXNzX3ZlKCkKPiBiZWNhdXNlIG9uIGEgbmV3
IGFsdHAybSB2aWV3IHRoZSBmdW5jdGlvbiB3aWxsIGZhaWwgd2l0aCBpbnZhbGlkIG1mbiBpZgo+
IHAybS0+c2V0X2VudHJ5KCkgd2FzIG5vdCBjYWxsZWQgYmVmb3JlLgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IEFsZXhhbmRydSBJc2FpbGEgPGFpc2FpbGFAYml0ZGVmZW5kZXIuY29tPgo+IFNpZ25lZC1v
ZmYtYnk6IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT4KClRoYW5rcyBm
b3IgZG9pbmcgdGhlIGV4cGFuZGVkIGRlc2NyaXB0aW9uOyBtdWNoIGJldHRlci4KClRoZSBvbmx5
IGNvbW1lbnQgaGF2ZSBpcyB0aGF0IHdlIHNob3VsZCBzcGVjaWZ5ICdhbHRwMm0nIHNvbWVwbGFj
ZQplYXJsaWVyOyBJJ2Qgc3VnZ2VzdCBtYWtpbmcgdGhlIHRhZyAieDg2L2FsdHAybSIgaW5zdGVh
ZCBvZiAieDg2L21tIi4KVGhpcyBjYW4gYmUgY2hhbmdlZCBvbiBjaGVjay1pbi4KClJldmlld2Vk
LWJ5OiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
