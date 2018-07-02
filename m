From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] xen: Plumb an is_priv boolean into
 domain_create()
Date: Mon, 2 Jul 2018 11:11:44 +0100
Message-ID: <20180702101144.22f2nk6tri7ziusa@citrix.com>
References: <1530524687-23679-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <1530524687-23679-1-git-send-email-andrew.cooper3@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Xen-devel <xen-devel@lists.xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>, Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBKdWwgMDIsIDIwMTggYXQgMTA6NDQ6NDdBTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBUaGUgY3VycmVudCBtZWNoYW5pc20gb2Ygc2V0dGluZyBkb20wLT5pc19wcml2aWxl
Z2VkIGFmdGVyIGNvbnN0cnVjdGlvbiBtZWFucwo+IHRoYXQgdGhlIGlzX2NvbnRyb2xfZG9tYWlu
KCkgcHJlZGljYXRlIHJldHVybnMgZmFsc2UgZHVyaW5nIGNvbnN0cnVjdGlvbi4KPiAKPiBJbiBw
YXJ0aWN1bGFyLCB0aGlzIG1lYW5zIHRoYXQgdGhlIENQVUlEIEZhdWx0aW5nIHNwZWNpYWwgY2Fz
ZSBpbgo+IGluaXRfZG9tYWluX21zcl9wb2xpY3koKSBmYWlscyB0byB0YWtlIGVmZmVjdC4gIChJ
biBhY3R1YWwgZmFjdCwgZmF1bHRpbmcKPiBzdXBwb3J0IGlzIGFkdmVydGlzZWQgdG8gZG9tMCwg
YnV0IGF0dGVtcHRpbmcgdG8gY29uZmlndXJlIGl0IGlzIHNpbGVudGx5Cj4gaWdub3JlZCBiZWNh
dXNlIG9mIHRoZSBkb20wIHNwZWNpYWwgY2FzZSBpbiBjdHh0X3N3aXRjaF9sZXZlbGxpbmcoKS4p
Cj4gCj4gVGhpcyBjb3VsZCBiZSBpbXBsZW1lbnRlZCB1c2luZyBhIGZsYWcgaW4geGVuX2RvbWN0
bF9jcmVhdGVkb21haW4sIGJ1dCB1c2luZwo+IGFuIGV4dHJhIGJvb2xlYW4gcGFyYW1ldGVyIGxp
a2UgdGhpcyBtZWFucyB0aGF0IHdlIGNhbid0IGFjY2lkZW50YWxseSBhbGxvdwo+IGRvbWFpbl9j
cmVhdGUoKSB0byBjcmVhdGUgYSBzZWNvbmQgZG9tMCBkdWUgdG8gcGFyYW1ldGVyIG1pcy1hdWRp
dGluZy4KPiAKPiBXaGlsZSBhZGp1c3RpbmcgdGhlIHNldHRpbmcgb2YgZG9tMC0+aXNfcHJpdmls
ZWdlZCwgZHJvcCB0aGUgcmVkdW5kYW50IHplcm9pbmcKPiBvZiBkb20wLT50YXJnZXQuCj4gCj4g
U2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4K
ClJldmlld2VkLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
