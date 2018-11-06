From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 6/6] x86/emul: dedup hvmemul_cpuid() and
 pv_emul_cpuid()
Date: Tue, 06 Nov 2018 08:38:52 -0700
Message-ID: <5BE1B58C02000078001F8BB8@prv1-mh.provo.novell.com>
References: <1541416867-30253-1-git-send-email-andrew.cooper3@citrix.com>
 <1541416867-30253-7-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1541416867-30253-7-git-send-email-andrew.cooper3@citrix.com>
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

Pj4+IE9uIDA1LjExLjE4IGF0IDEyOjIxLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gVGhleSBhcmUgaWRlbnRpY2FsLCBzbyBwcm92aWRlIGEgc2luZ2xlIHg4NmVtdWxfY3B1
aWQoKSBpbnN0ZWFkLgo+IAo+IEFzIHg4Nl9lbXVsYXRlKCkgbm93IG9ubHkgdXNlcyB0aGUgLT5j
cHVpZCgpIGhvb2sgZm9yIHJlYWwgQ1BVSUQgaW5zdHJ1Y3Rpb25zLAo+IHRoZSBob29rIGNhbiBi
ZSBvbWl0dGVkIGZyb20gYWxsIHNwZWNpYWwtcHVycG9zZSBlbXVsYXRpb24gb3BzLgoKU28gSSB3
YXMgZXhwZWN0aW5nIHRoZSBob29rIHRvIGdvIGF3YXkgYWx0b2dldGhlciwgYnV0IEkKbm93IHJl
YWxpemUgdGhhdCBpdCBjYW4ndCBiZWNhdXNlIG9mIHNvbWUgb2YgdGhlIGN1c3RvbWl6YXRpb24K
dGhhdCdzIG5lZWRlZC4gVGhhdCwgaW4gdHVybiwgbWVhbnMgdGhhdCB0aGUgcmVtb3ZhbCBvZiB0
aGUKaG9vayBzcGVjaWZpY2F0aW9uIGFzIHBlciBhYm92ZSB3aWxsIGdldCB1cyBpbnRvIHByb2Js
ZW1zIHRoZQptb21lbnQgd2UgbmVlZCB0byBjaGVjayBhIGZlYXR1cmUgdGhhdCBjYW4ndCBiZSB0
YWtlbgpzdHJhaWdodCBmcm9tIHRoZSBwb2xpY3kgb2JqZWN0LiBJJ20gdGhlcmVmb3JlIHVuY29u
dmluY2VkIHdlCmFjdHVhbGx5IHdhbnQgdG8gZ28gdGhpcyBmYXIuIEl0J2xsIHJlcXVpcmUgZW5v
dWdoIGNhcmUgYWxyZWFkeQp0byBub3QgYmxpbmRseSBjbG9uZSBhIG5ldyB2Y3B1X2hhc18uLi4o
KSB3cm9uZ2x5IGZyb20gdGhlCm1hbnkgcHJlLWV4aXN0aW5nIGV4YW1wbGVzIGluIHN1Y2ggYSBj
YXNlLiBUaG91Z2h0cz8KCkZvbGRpbmcgdGhlIHR3byBpZGVudGljYWwgaW1wbGVtZW50YXRpb25z
LCBvdG9oLCBpcyBmaW5lIHdpdGggbWUuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
