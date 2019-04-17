From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH] xen/arm64: head: Combine lsl and str
 instructions in a single one
Date: Wed, 17 Apr 2019 17:30:35 +0100
Message-ID: <c9689104-c58d-8c4f-2470-2852967f25bc@arm.com>
References: <20190319232753.26521-1-julien.grall@arm.com>
 <alpine.DEB.2.10.1904161406550.1370@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Uj5y=ST=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hGnSJ-0004nr-DL
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2019 16:30:39 +0000
In-Reply-To: <alpine.DEB.2.10.1904161406550.1370@sstabellini-ThinkPad-X260>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien.grall@linaro.org>
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiAxNi8wNC8yMDE5IDIyOjA3LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gT24g
VHVlLCAxOSBNYXIgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBGcm9tOiBKdWxpZW4gR3Jh
bGwgPGp1bGllbi5ncmFsbEBsaW5hcm8ub3JnPgo+Pgo+PiBXZSBjYW4gb3B0aW1pemUgYSBiaXQg
dGhlIGFzc2VtYmx5IGNvZGUgYnkgY29tYmluaW5nIHRoZSAyIGluc3RydWN0aW9ucwo+PiBpbiBh
IHNpbmdsZSBvbmUuIFRoaXMgbGlrZWx5IG5vdCBnb2luZyB0byBtYWtlIHRoZSBjb2RlIGZhc3Rl
ciwgYnV0Cj4+IGxpa2VseSBtYWtlIGVhc2llciB0byByZWFkIHRoZSBhc3NlbWJseS4KPj4KPj4g
U2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAbGluYXJvLm9yZz4KPiAK
PiBSZXZpZXdlZC1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3Jn
PgoKVGhhbmsgeW91ISBJIGhhdmUgcHVzaGVkIHRvIG15IGJyYW5jaCBuZXh0LTQuMTMgZm9yIG5v
dy4gSXQgd2lsbCBiZSBtZXJnZWQgb25jZSAKdGhlIGNvbW1pdCBtb3JhdG9yaXVtIGlzIGxpZnRl
ZC4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
