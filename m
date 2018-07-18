From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/cpuid: Adjust the policies based on the
 boot time vPMU setting
Date: Wed, 18 Jul 2018 10:51:12 +0100
Message-ID: <f6d14077-6696-a9cc-99dc-5f14a391b6b0@citrix.com>
References: <1531848199-12734-1-git-send-email-andrew.cooper3@citrix.com>
 <5B4EEC3F02000078001D5369@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5B4EEC3F02000078001D5369@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Xen-devel <xen-devel@lists.xen.org>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTgvMDcvMTggMDg6MjksIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDE3LjA3LjE4IGF0
IDE5OjIzLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4+IFRoZSB2UE1VIGxv
Z2ljIGlzbid0IGludGVncmF0ZWQgaW50byB0aGUgQ1BVSUQgcG9saWN5IGxvZ2ljIChhbmQgc3Rp
bGwKPj4gcmVxdWlyZXMgYSBmYWlyIGFtb3VudCBvZiB3b3JrIGJlZm9yZSBpdCBjYW4gYmUpLgo+
Pgo+PiBUaGUgQVJDSF9QRVJGTU9OIGxlYWYgd2FzIHByZXZpb3VzbHkgY29waWVkIGludG8gYWxs
IHBvbGljaWVzLCB1bmlsYXRlcmFsbHkKPj4gb3ZlcnJpZGRlbiAodG8gdGhlIHNhbWUgdmFsdWUg
aW4gdGhlIGdlbmVyYWwgY2FzZSkgYnkgdGhlIHRvb2xzdGFjayB1c2luZwo+PiBET01DVExfc2V0
X2NwdWlkLCB0aGVuIHVuaWxhdGVyYWxseSBvdmVycmlkZGVuIGFnYWluIGJ5IFhlbidzIHJ1bnRp
bWUKPj4gbG9naWMgKGJhc2VkIG9uIHRoZSBib290IHRpbWUgc2V0dGluZ3MpLgo+Pgo+PiBUaGUg
cG9saWN5IHJldHJpZXZlZCB3aXRoIERPTUNUTF9nZXRfY3B1X3BvbGljeSBuZWVkcyB0byBiZSBh
Y2N1cmF0ZSwgc28gdGFrZQo+PiB0aGUgYm9vdCB0aW1lIHNldHRpbmdzIGludG8gYWNjb3VudCB3
aGVuIGNyZWF0aW5nIGFuZCBjbGlwcGluZyB0aGUgdG9vbHN0YWNrCj4+IHBvbGljeS4gIFRoZSBy
dW50aW1lIGxvZ2ljIGlzIHN0aWxsIHJlcXVpcmVkIGZvciBub3csIHRvIGNsaXAgdGhlIG1heGlt
dW0KPj4gcmVwb3J0ZWQgdmVyc2lvbiB3aGVuIG5lY2Vzc2FyeS4KPj4KPj4gU2lnbmVkLW9mZi1i
eTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KPiBSZXZpZXdlZC1i
eTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+Cj4gSSBndWVzcyB5b3Ugd2lsbCB3
YW50IHRoaXMgYmFja3BvcnRlZD8KCkl0IGlzbid0IGFjdHVhbGx5IGEgcHJvYmxlbSB1bnRpbCB7
U1lTQ1RMLERPTUNUTH1fe2dldCxzZXR9X2NwdV9wb2xpY3kKYXJlIGluIHVzZS4KCn5BbmRyZXcK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
