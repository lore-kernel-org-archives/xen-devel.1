From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 01/14] x86/soft-reset: Drop gfn reference
 after calling get_gfn_query()
Date: Thu, 22 Nov 2018 07:45:19 -0700
Message-ID: <5BF6C0FF02000078001FEF80@prv1-mh.provo.novell.com>
References: <1542806482-24030-1-git-send-email-andrew.cooper3@citrix.com>
 <1542806482-24030-2-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1542806482-24030-2-git-send-email-andrew.cooper3@citrix.com>
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

Pj4+IE9uIDIxLjExLjE4IGF0IDE0OjIxLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gZ2V0X2dmbl9xdWVyeSgpIGludGVybmFsbHkgdGFrZXMgdGhlIHAybSBsb2NrLCBhbmQg
dGhpcyBlcnJvciBwYXRoIGxlYXZlcyBpdAo+IGxvY2tlZC4KPiAKPiBUaGlzIHdhc24ndCBpbmNs
dWRlZCBpbiBYU0EtMjc3IGJlY2F1c2UgdGhlIGVycm9yIHBhdGggY2FuIG9ubHkgYmUgdHJpZ2dl
cmVkCj4gYnkgYSBjYXJlZnVsbHkgdGltZWQgcGh5bWFwIG9wZXJhdGlvbiBjb25jdXJyZW50IHdp
dGggdGhlIGRvbWFpbiBiZWluZyBwYXVzZWQKPiBhbmQgdGhlIHRvb2xzdGFjayBpc3N1aW5nIERP
TUNUTF9zb2Z0X3Jlc2V0Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJl
dy5jb29wZXIzQGNpdHJpeC5jb20+CgpZb3UgY291bGQgaGF2ZSByZXRhaW5lZCBteQpSZXZpZXdl
ZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpmcm9tIHdoZW4gdGhpcyB3YXMg
c3RpbGwgcGFydCBvZiB0aGUgWFNBLTI3NyBwYXRjaCBpdHNlbGYuCgpKYW4KCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
