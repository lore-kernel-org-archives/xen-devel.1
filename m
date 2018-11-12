From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 2/3 Xen-4.9] x86/dom0: Fix shadowing of PV
 guests with 2M superpages
Date: Mon, 12 Nov 2018 03:10:18 -0700
Message-ID: <5BE9518A02000078001FABD7@prv1-mh.provo.novell.com>
References: <1541777178-3844-1-git-send-email-andrew.cooper3@citrix.com>
 <1541777178-3844-3-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1541777178-3844-3-git-send-email-andrew.cooper3@citrix.com>
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
Cc: Wei Liu <wei.liu2@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA5LjExLjE4IGF0IDE2OjI2LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gVGhpcyBpcyBhIHN0cmFpZ2h0IGJhY2twb3J0IG9mIGMvcyAyOGQ5YTlhMmQ0MTc1OWI5
ZTUxNjMwMzdiNzU5YWM1NTdhZWE3NjdjCj4gYnV0IHdpdGggYSBkaWZmZXJlbnQganVzdGlmaWNh
dGlvbi4KPiAKPiBEb20wIG1heSBoYXZlIHN1cGVycGFnZXMgKGUuZy4gaW5pdGlhbCBQMk0pLCBh
bmQgbWF5IGJlIHNoYWRvd2VkCj4gKGUuZy4gUFYtTDFURikuICBCZWNhdXNlIG9mIHRoaXMgaW5j
b3JyZWN0IGNoZWNrLCB3aGVuIFBWIHN1cGVycGFnZXMgYXJlCj4gZGlzYWxsb3dlZCAod2hpY2gg
aXMgdGhlIHNlY3VyaXR5IHN1cHBvcnRlZCBjb25maWd1cmF0aW9uKSwgYXR0ZW1wdGluZyB0bwo+
IHNoYWRvdyB0aGUgUDJNIHdpdGggaXRzIHN1cGVycGFnZXMgc3RpbGwgaW50YWN0IHdpbGwgZmFp
bC4gIEEgI1BGIHdpbGwgYmUKPiBoYW5kZWQgYmFjayB0byB0aGUga2VybmVsLCByYXRoZXIgdGhh
biB0aGUgc3VwZXJwYWdlIGJlaW5nIHNwbGludGVyZWQgYW5kCj4gc2hhZG93ZWQuCj4gCj4gU2ln
bmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KCkFj
a2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpJdCBiZWluZyBhIHN0cmFp
Z2h0IGJhY2twb3J0LCB0YWdzIGZyb20gdGhlIG9yaWdpbmFsIGNvbW1pdCBzaG91bGQKcGVyaGFw
cyBiZSByZXRhaW5lZD8KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
