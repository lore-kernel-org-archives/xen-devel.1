From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH] x86/Xen: mark xen_setup_gdt() __init
Date: Wed, 15 Aug 2018 17:31:55 -0400
Message-ID: <615163b4-fbdb-d76b-2c3c-ecbe65425c40@oracle.com>
References: <5B30C51902000078001CD6F5@suse.com>
 <e46c5c38-fc8e-13a9-1dd7-8e9990196cb7@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ti2w=k6=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1fq3Na-0006ho-UY
 for xen-devel@lists.xenproject.org; Wed, 15 Aug 2018 21:30:58 +0000
In-Reply-To: <e46c5c38-fc8e-13a9-1dd7-8e9990196cb7@suse.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, Jan Beulich <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDcvMDIvMjAxOCAwOTo1NCBBTSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBPbiAyNS8wNi8x
OCAxMjozNCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IEl0cyBvbmx5IGNhbGxlciBpcyBfX2luaXQs
IHNvIHRvIGF2b2lkIHNlY3Rpb24gbWlzbWF0Y2ggd2FybmluZ3Mgd2hlbiBhCj4+IGNvbXBpbGVy
IGRlY2lkZXMgdG8gbm90IGlubGluZSB0aGUgZnVuY3Rpb24gbWFya2UgdGhpcyBmdW5jdGlvbiBz
byBhcwo+PiB3ZWxsLiBUYWtlIHRoZSBvcHBvcnR1bml0eSBhbmQgYWxzbyBtYWtlIHRoZSBmdW5j
dGlvbiBhY3R1YWxseSB1c2UgaXRzCj4+IGFyZ3VtZW50OiBUaGUgc29sZSBjYWxsZXIgcGFzc2Vz
IGluIHplcm8gYW55d2F5Lgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+Cj4gUmV2aWV3ZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNv
bT4KCgpBcHBsaWVkIHRvIGZvci1saW51cy00LjE5LgoKLWJvcmlzCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
