From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 3/9] x86/cpuid: Extend the cpuid= command
 line option to support all named features
Date: Tue, 04 Dec 2018 09:28:00 -0700
Message-ID: <5C06AB100200007800202D13@prv1-mh.provo.novell.com>
References: <1543853902-6257-1-git-send-email-andrew.cooper3@citrix.com>
 <1543853902-6257-4-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1543853902-6257-4-git-send-email-andrew.cooper3@citrix.com>
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
Cc: Xen-devel <xen-devel@lists.xen.org>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAzLjEyLjE4IGF0IDE3OjE4LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gRm9yIGdlbi1jcHVpZC5weSwgZml4IGEgY29tbWVudCBkZXNjcmliaW5nIHNlbGYubmFt
ZXMsIGFuZCBnZW5lcmF0ZSB0aGUKPiByZXZlcnNlIG1hcHBpbmcgaW4gc2VsZi52YWx1ZXMuICBX
cml0ZSBvdXQgSU5JVF9GRUFUVVJFX05BTUVTIHdoaWNoIG1hcHMgYQo+IHN0cmluZyBuYW1lIHRv
IGEgYml0IHBvc2l0aW9uLgo+IAo+IEZvciBwYXJzZV9jcHVpZCgpLCBpbnRyb2R1Y2UgYSBzbGln
aHRseSBmdXp6eSBzdHJjbXAoKSB0byBhY2NlcHQgY2hhbmdlcyBpbgo+IHB1bmN0dWF0aW9uLCBh
bmQgcGVyZm9ybSBhIGJpbmFyeSBzZWFyY2ggb3ZlciBJTklUX0ZFQVRVUkVfTkFNRVMuCj4gCj4g
U2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4K
PiAtLS0KPiBDQzogSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPgo+IENDOiBXZWkgTGl1
IDx3ZWkubGl1MkBjaXRyaXguY29tPgo+IENDOiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVA
Y2l0cml4LmNvbT4KPiAKPiBTbGlnaHRseSBSRkMsIGJlY2F1c2UgSSdtIG5vdCBlbnRpcmVseSBj
ZXJ0YWluIGlmIHRoaXMgaXMgYSBnb29kIGlkZWEgb3IgCj4gbm90LgoKSXQgaXMgYSBnb29kIGlk
ZWEsIGJ1dCBwcmVjYXV0aW9ucyBhcmUgbmVlZGVkIGFnYWluc3QgYXR0ZW1wdHMKdG8gZGlzYWJs
ZSBmZWF0dXJlcyB3ZSByZWx5IG9uIChzcGVjaWZpY2FsbHkgb25lcyBpbmZlcnJlZCBmcm9tIHVz
CnJ1bm5pbmcgaW4gNjQtYml0IG1vZGUpLCBvciBndWVzdHMgd291bGQgZXF1YWxseSByZWx5IG9u
LiBJJ20KdGhlcmVmb3JlIHVuc3VyZSB3aGV0aGVyIHRoZSBtZXJlICJuYW1lZCIgZmFjdCBmb3Ig
YSBmZWF0dXJlCmlzIGEgc3VpdGFibGUgY3JpdGVyaWEgdG8gYWxsb3cgaXRzIGRpc2FibGluZyBm
cm9tIHRoZSBjb21tYW5kIGxpbmUuClBlcmhhcHMgYSBzZWNvbmQgZm9ybSBvZiBhbm5vdGF0aW9u
IGluIHRoZSBwdWJsaWMgaGVhZGVyIGlzCm5lZWRlZD8gT3Igc29tZSBtaW5pbWFsIGZlYXR1cmUg
c2V0IHRvIGVuZm9yY2U/CgpKYW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
