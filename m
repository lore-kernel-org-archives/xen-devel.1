From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH] x86/mm/p2m: don't needlessly limit MMIO
 mapping order to 4k
Date: Tue, 16 Oct 2018 17:07:32 +0100
Message-ID: <5c8db7ec-8a71-c745-c875-514ff42a464f@citrix.com>
References: <20181016144155.24646-1-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=g0qr=m4=citrix.com=prvs=820502905=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1gCRse-0002Mf-Jh
 for xen-devel@lists.xenproject.org; Tue, 16 Oct 2018 16:07:36 +0000
In-Reply-To: <20181016144155.24646-1-paul.durrant@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>, xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTAvMTYvMjAxOCAwMzo0MSBQTSwgUGF1bCBEdXJyYW50IHdyb3RlOgo+IFRoZSBQMk0gY29t
bW9uIGNvZGUgY3VycmVudGx5IHJlc3RyaWN0cyB0aGUgTU1JTyBtYXBwaW5nIG9yZGVyIG9mIGFu
eQo+IGRvbWFpbiB3aXRoIElPTU1VIG1hcHBpbmdzLCBidXQgdGhhdCBpcyBub3QgdXNpbmcgc2hh
cmVkIHRhYmxlcywgdG8gNGsuCj4gVGhpcyBoYXMgYmVlbiBzaG93biB0byBoYXZlIGEgaHVnZSBw
ZXJmb3JtYW5jZSBjb3N0IHdoZW4gcGFzc2luZyB0aHJvdWdoCj4gYSBQQ0kgZGV2aWNlIHdpdGgg
YSB2ZXJ5IGxhcmdlIEJBUiAoZS5nLiBOVklESUEgUDQwKSwgaW5jcmVhc2luZyB0aGUgZ3Vlc3QK
PiBib290IHRpbWUgZnJvbSB+MjBzIHRvIHNldmVyYWwgbWludXRlcyB3aGVuIGlvbW11PW5vLXNo
YXJlcHQgaXMgc3BlY2lmaWVkCj4gb24gdGhlIFhlbiBjb21tYW5kIGxpbmUuCj4gCj4gVGhlIGxp
bWl0YXRpb24gd2FzIGFkZGVkIGJ5IGNvbW1pdCBjM2M3NTZiZCAieDg2L3AybTogdXNlIGxhcmdl
IHBhZ2VzCj4gZm9yIE1NSU8gbWFwcGluZ3MiIGhvd2V2ZXIgdGhlIHVuZGVybHlpbmcgaW1wbGVt
ZW50YXRpb25zIG9mIHAybS0+c2V0X2VudHJ5Cj4gZm9yIEludGVsIGFuZCBBTUQgYXJlIGNvZGVk
IHRvIGNvcGUgd2l0aCBtYXBwaW5nIG9yZGVycyBoaWdoZXIgdGhhbiA0aywKPiBldmVuIHRob3Vn
aCB0aGUgSU9NTVUgbWFwcGluZyBmdW5jdGlvbiBpcyBpdHNlbGYgY3VycmVudGx5IGxpbWl0ZWQg
dG8gNGssCj4gc28gdGhlcmUgaXMgbm8gcmVhbCBuZWVkIHRvIGxpbWl0IHRoZSBvcmRlciBwYXNz
ZWQgaW50byB0aGUgbWV0aG9kLgo+IAo+IFdpdGggdGhpcyBwYXRjaCBhcHBsaWVkIHRoZSBWTSBi
b290IHRpbWUgaXMgcmVzdG9yZWQgdG8gc29tZXRoaW5nCj4gcmVhc29uYWJsZS4gTm90IGFzIGZh
c3QgYXMgd2l0aG91dCBpb21tdT1uby1zaGFyZXB0LCBidXQgd2l0aGluIGEgZmV3Cj4gc2Vjb25k
cyBvZiBpdC4KPiAKPiBOT1RFOiBUaGlzIHBhdGNoIHRha2VzIHRoZSBvcHBvcnR1bml0eSB0byBz
aG9ydGVuIGEgY291cGxlIG9mID4gODAKPiAgICAgICBjaGFyYWN0ZXIgbGluZXMgaW4gdGhlIGNv
ZGUuCj4gCj4gU2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRAY2l0cml4
LmNvbT4KClRoaXMgbG9va3MgY29ycmVjdCB0byBtZToKCkFja2VkLWJ5OiBHZW9yZ2UgRHVubGFw
IDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+CgouLi5idXQgSSdkIGxpa2UgdG8gaGVhciBKYW4n
cyBvcGluaW9uIChzaW5jZSBoZSB3YXMgdGhlIGF1dGhvciBvZgpjM2M3NTZiZCkgYmVmb3JlIGl0
IGdldHMgY2hlY2tlZCBpbiBpZiBwb3NzaWJsZS4KCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
