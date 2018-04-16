From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH for-4.11] x86/msr: Correct the emulation
 behaviour of MSR_PRED_CMD
Date: Mon, 16 Apr 2018 05:26:01 -0600
Message-ID: <5AD4884902000078001BBA0D@prv1-mh.provo.novell.com>
References: <1523876188-14872-1-git-send-email-andrew.cooper3@citrix.com>
 <5AD4851602000078001BB9D6@prv1-mh.provo.novell.com>
 <ffec6ffb-17e3-3941-1139-626acd5b7e77@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <ffec6ffb-17e3-3941-1139-626acd5b7e77@citrix.com>
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
Cc: Juergen Gross <jgross@suse.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE2LjA0LjE4IGF0IDEzOjE5LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMTYvMDQvMTggMTI6MTIsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAxNi4w
NC4xOCBhdCAxMjo1NiwgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+IHdyb3RlOgo+Pj4gVGhl
IGJlaGF2aW91ciBvZiByZXNlcnZlZCBiaXRzIGluIE1TUl9QUkVEX0NNRCBjaGFuZ2VkIGJldHdl
ZW4gYmV0YSBhbmQKPj4+IHByb2R1Y3Rpb24gbWljcm9jb2RlLCBhbmQgbm93IHJhaXNlcyBhICNH
UCBmYXVsdCBmb3Igc2V0IHJlc2VydmVkIGJpdHMuCj4+IEludGVyZXN0aW5nIC0gcXVpdGUgdW5m
b3J0dW5hdGUgYSBjaGFuZ2UuIFBsdXMgLSBJIGNhbid0IGZpbmQgd2hlcmUgdGhpcyBpcyBiZWlu
Zwo+PiBzYWlkLgo+IAo+IEl0cyBub3QsIGJ1dCB0aGUgbmV3IGJlaGF2aW91ciBjYW4gYmUgZGVt
b25zdHJhdGVkIGVhc2lseS4gIFRob3NlIHdpdGgKPiB0aGUgYmV0YSBtaWNyb2NvZGUgY2FuIGNv
bmZpcm0gdGhhdCB0aGUgb2xkIGJlaGF2aW91ciB3YXMgdG8gaWdub3JlLgo+IAo+IEZXSVcsIGln
bm9yaW5nIHJlc2VydmVkIGJpdHMgd2FzIGFsd2F5cyBkdWJpb3VzLCBhbmQgSSBvbmx5IGltcGxl
bWVudGVkCj4gaXQgbGlrZSB0aGF0IHRvIG1hdGNoIGhvdyBoYXJkd2FyZSBiZWhhdmVkLiAgVGhp
cyBuZXcgYmVoYXZpb3VyIGlzIGZhcgo+IG1vcmUgc2FuZS4KCkZ1bGx5IGFncmVlIC0gc2hvdWxk
IGhhdmUgYmVlbiB0aGF0IHdheSBmcm9tIHRoZSBiZWdpbm5pbmcuCgpKYW4KCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
