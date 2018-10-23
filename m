From: Arun KS <arunks@codeaurora.org>
Subject: Re: [PATCH] mm: convert totalram_pages,
 totalhigh_pages and managed_pages to atomic.
Date: Tue, 23 Oct 2018 10:18:26 +0530
Message-ID: <92d3523427e45124c71e16baabceb8c5__3583.50171377442$1540270228$gmane$org@codeaurora.org>
References: <1540229092-25207-1-git-send-email-arunks@codeaurora.org>
 <c57bcc584b3700c483b0311881ec3ae8786f88b1.camel@perches.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=4umc=nd=codeaurora.org=arunks@srs-us1.protection.inumbo.net>)
 id 1gEocN-0001kZ-9v
 for xen-devel@lists.xenproject.org; Tue, 23 Oct 2018 04:48:35 +0000
In-Reply-To: <c57bcc584b3700c483b0311881ec3ae8786f88b1.camel@perches.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Joe Perches <joe@perches.com>
Cc: Mike Snitzer <snitzer@redhat.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Kemi Wang <kemi.wang@intel.com>, dri-devel@lists.freedesktop.org, "J. Bruce Fields" <bfields@fieldses.org>, linux-sctp@vger.kernel.org, Paul Mackerras <paulus@samba.org>, Pavel Machek <pavel@ucw.cz>, Christoph Lameter <cl@linux.com>, "K. Y. Srinivasan" <kys@microsoft.com>, Sumit Semwal <sumit.semwal@linaro.org>, "David (ChunMing) Zhou" <David1.Zhou@amd.com>, Petr Tesarik <ptesarik@suse.com>, Michael Ellerman <mpe@ellerman.id.au>, ceph-devel@vger.kernel.org, "James E.J. Bottomley" <jejb@parisc-linux.org>, kasan-dev@googlegroups.com, Marcos Paulo de Souza <marcos.souza.org@gmail.com>, "Steven J. Hill" <steven.hill@cavium.com>, David Rientjes <rientjes@google.com>, Anthony Yznaga <anthony.yznaga@oracle.com>, Daniel Vacek <neelx@redhat.com>, Roman Gushchin <guro@fb.com>, Len Brown <len.b>
List-Id: xen-devel@lists.xenproject.org

T24gMjAxOC0xMC0yMyAwOTo0NSwgSm9lIFBlcmNoZXMgd3JvdGU6Cj4gT24gTW9uLCAyMDE4LTEw
LTIyIGF0IDIyOjUzICswNTMwLCBBcnVuIEtTIHdyb3RlOgo+PiBSZW1vdmUgbWFuYWdlZF9wYWdl
X2NvdW50X2xvY2sgc3BpbmxvY2sgYW5kIGluc3RlYWQgdXNlIGF0b21pYwo+PiB2YXJpYWJsZXMu
Cj4gCgpIZWxsbyBKb2UsCj4gUGVyaGFwcyBiZXR0ZXIgdG8gZGVmaW5lIGFuZCB1c2UgbWFjcm9z
IGZvciB0aGUgYWNjZXNzZXMKPiBpbnN0ZWFkIG9mIHNwZWNpZmljIHVzZXMgb2YgYXRvbWljX2xv
bmdfPGluYy9kZWMvcmVhZD4KPiAKPiBTb21ldGhpbmcgbGlrZToKPiAKPiAjZGVmaW5lIHRvdGFs
cmFtX3BhZ2VzKCkJKHVuc2lnbmVkIAo+IGxvbmcpYXRvbWljX2xvbmdfcmVhZCgmX3RvdGFscmFt
X3BhZ2VzKQo+ICNkZWZpbmUgdG90YWxyYW1fcGFnZXNfaW5jKCkJKHVuc2lnbmVkIAo+IGxvbmcp
YXRvbWljX2xvbmdfaW5jKCZfdG90YWxyYW1fcGFnZXMpCj4gI2RlZmluZSB0b3RhbHJhbV9wYWdl
c19kZWMoKQkodW5zaWduZWQgCj4gbG9uZylhdG9taWNfbG9uZ19kZWMoJl90b3RhbHJhbV9wYWdl
cykKClRoYXQgc291bmRzIGxpa2UgYSBuaWNlIGlkZWEuCgpSZWdhcmRzLApBcnVuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
