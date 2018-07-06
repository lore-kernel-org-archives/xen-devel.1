From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] xen: Port the array_index_nospec()
 infrastructure from Linux
Date: Fri, 6 Jul 2018 16:30:51 +0100
Message-ID: <41302a9e-3046-72eb-1e10-1028ef5c6cd7@citrix.com>
References: <1530880660-868-1-git-send-email-andrew.cooper3@citrix.com>
 <5B3F8AE102000078001D1EE1@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5B3F8AE102000078001D1EE1@prv1-mh.provo.novell.com>
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
Cc: Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDYvMDcvMTggMTY6MjksIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDA2LjA3LjE4IGF0
IDE0OjM3LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4+IFRoaXMgaXMgYXMg
dGhlIGluZnJhc3RydWN0dXJlIGFwcGVhcmVkIGluIExpbnV4IDQuMTcsIGFkYXB0ZWQgc2xpZ2h0
bHkgZm9yCj4+IFhlbi4gIFRoZSBhcmNoaXRlY3R1cmUgaW5kZXBlbmRlbnQgYXJyYXlfaW5kZXhf
bWFza19ub3NwZWMoKSBpcyBwb3J0ZWQgZm9yCj4+IEFSTXMgYmVuZWZpdCwgYXMgaXQgY3VycmVu
dGx5IGxhY2tzIHRoZSBvcHRpbWlzZWQgdmVyc2lvbi4KPj4KPj4gU2lnbmVkLW9mZi1ieTogQW5k
cmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KPiBBY2tlZC1ieTogSmFuIEJl
dWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+Cj4gd2l0aCBvbmUgcXVlc3Rpb24gdGhvdWdoOgo+
Cj4+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9jb21waWxlci5oCj4+ICsrKyBiL3hlbi9pbmNsdWRl
L3hlbi9jb21waWxlci5oCj4+IEBAIC04MSw2ICs4MSwxMCBAQAo+PiAgI3ByYWdtYSBHQ0Mgdmlz
aWJpbGl0eSBwdXNoKGhpZGRlbikKPj4gICNlbmRpZgo+PiAgCj4+ICsvKiBNYWtlIHRoZSBvcHRp
bWl6ZXIgYmVsaWV2ZSB0aGUgdmFyaWFibGUgY2FuIGJlIG1hbmlwdWxhdGVkIGFyYml0cmFyaWx5
LiAKPj4gKi8KPj4gKyNkZWZpbmUgT1BUSU1JWkVSX0hJREVfVkFSKHZhcikgICAgICAgICAgICAg
ICAgIFwKPj4gKyAgICBfX2FzbV9fICgiIiA6ICI9ZyIgKHZhcikgOiAiMCIgKHZhcikpCj4gV2h5
IG5vdCBhIHNpbXBsZSAiK2ciIG91dHB1dD8KPgo+IEFsc28gSSB0aGluayB5b3Ugd2FudCB0byBh
ZGQgYmxhbmtzIGluc2lkZSB0aGUgcGFyZW50aGVzZXMuCgpPb3BzIC0gdGhhdCB3YXMgaW5zdWZm
aWNpZW50IHRob3VnaHQgd2hlbiBmaXhpbmcgTGludXgncyBpbmVmZmljaWVudAp2ZXJzaW9uLsKg
IFdpbGwgZG8gYm90aCBvZiB0aG9zZSwgYW5kIGZvbGQgaW4gSnVsaWVuJ3MgQVJNIGNoYW5nZXMu
Cgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
