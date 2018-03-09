From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86/VMX: don't risk corrupting host CR4
Date: Fri, 09 Mar 2018 07:40:27 -0700
Message-ID: <5AA2AAEB02000078001B04B3@prv-mh.provo.novell.com>
References: <5AA2A5D202000078001B0490@prv-mh.provo.novell.com>
 <c5deba36-5af1-cbed-8fef-407f8cc97476@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=ibp0=f7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1euJCG-0002eQ-1F
 for xen-devel@lists.xenproject.org; Fri, 09 Mar 2018 14:40:36 +0000
In-Reply-To: <c5deba36-5af1-cbed-8fef-407f8cc97476@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA5LjAzLjE4IGF0IDE1OjM1LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMDkvMDMvMTggMTQ6MTgsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBJbnN0ZWFkIG9m
ICJzeW5jaW5nIiB0aGUgbGl2ZSB2YWx1ZSB0byB3aGF0IG1tdV9jcjRfZmVhdHVyZXMgaGFzLCBt
YWtlCj4+IHN1cmUgdkNQVS1zIHJ1biB3aXRoIHRoZSB2YWx1ZSBtb3N0IHJlY2VudGx5IGxvYWRl
ZCBpbnRvICVjcjQsIHN1Y2ggdGhhdAo+PiBhZnRlciB0aGUgbmV4dCBWTSBleGl0IHdlIGNvbnRp
bnVlIHRvIHJ1biB3aXRoIHRoZSBpbnRlbmRlZCB2YWx1ZSByYXRoZXIKPj4gdGhhbiBhIHBvc3Np
Ymx5IHN0YWxlIG9uZS4KPj4KPj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNo
QHN1c2UuY29tPgo+PiAtLS0KPj4gVEJEOiBJcyB0aGUgY29uZGl0aW9uYWwgcmVhbGx5IHdvcnRo
d2hpbGUsIGkuZS4gaXMgdGhlIFZNV1JJVEUgcGVyaGFwcwo+PiAgICAgIG5vdCBtZWFuaW5nZnVs
bHkgbW9yZSBleHBlbnNpdmUgdGhhbiB0aGUgVk1SRUFEPwo+IAo+IFdoaWNoIGJpdHMgYXJlIHlv
dSB3b3JyaWVkIGFib3V0IGhlcmU/ICBXZSBwbGF5IHdpdGggJWNyNCBxdWl0ZSBhIGJpdCBpbgo+
IFBWIGNvbnRleHQsIGJ1dCB3ZSBzaG91bGRuJ3QgYmUgY2hhbmdpbmcgYWZ0ZXIgYm9vdCBpbiBI
Vk0gY29udGV4dC4KClNlZSB0aGUgZGlzY3Vzc2lvbiBvbiBKw7xyZ2VuJ3Mgc2VyaWVzLCBwbGF5
aW5nIHdpdGggQ1I0LlBHRS4gQnkKZG9pbmcgd2hhdCBJIGRvIGhlcmUsIFZNWCBhbmQgU1ZNIHdp
bGwgbm8gbG9uZ2VyIGJlaGF2ZQpkaWZmZXJlbnRseSBpbiByZWdhcmQgdG8gQ1I0LCB3aGljaCBJ
IHRoaW5rIGlzIHF1aXRlIGRlc2lyYWJsZS4gQnV0CmV2ZW4gYmV5b25kIHRoYXQgaXQgaXMgYSBy
ZWNpcGUgZm9yIHByb2JsZW1zIHRvIGZvcmNlIGEgY29udHJvbApyZWdpc3RlciB0byBzb21lIGZp
eGVkIHZhbHVlLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
