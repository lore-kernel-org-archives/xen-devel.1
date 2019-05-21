From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v8 21/50] x86emul: support AVX512F
 legacy-equivalent scalar int/FP conversion insns
Date: Tue, 21 May 2019 12:44:33 +0100
Message-ID: <ee381dd3-797a-b89c-d9a1-ef4e844fb2fa@citrix.com>
References: <5B6BF83602000078001DC548@prv1-mh.provo.novell.com>
 <5C8B7EC0020000780021F10B@prv1-mh.provo.novell.com>
 <5C8B83D6020000780021F208@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6u0k=TV=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hT3CF-0003rR-2P
 for xen-devel@lists.xenproject.org; Tue, 21 May 2019 11:44:43 +0000
In-Reply-To: <5C8B83D6020000780021F208@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTUvMDMvMjAxOSAxMDo1MiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gVkNWVHssVH1Te1MsRH0y
U0kgdXNlIEVWRVguVyBmb3IgdGhlaXIgZGVzdGluYXRpb24gKHJlZ2lzdGVyKSByYXRoZXIKPiB0
aGFuIHRoZWlyIChwb3NzaWJseSBtZW1vcnkpIHNvdXJjZSBvcGVyYW5kIHNpemUgYW5kIGhlbmNl
IG5lZWQgYQo+ICJtYW51YWwiIG92ZXJyaWRlIG9mIGRpc3A4c2NhbGUuCj4KPiBXaGlsZSB0aGUg
U0RNIGNsYWltcyB0aGF0IEVWRVguTCdMIG5lZWRzIHRvIGJlIHplcm8gZm9yIHRoZSAzMi1iaXQg
Zm9ybXMKPiBvZiBWQ1ZUeyxVfVNJMlNEIChleGNlcHRpb24gdHlwZSBFMTBORiksIG9ic2VydmF0
aW9ucyBvbiBteSB0ZXN0IHN5c3RlbQo+IGRvIG5vdCBjb25maXJtIHRoaXMgKGFuZCBJJ3ZlIGdv
dCBpbmZvcm1hbCBjb25maXJtYXRpb24gdGhhdCB0aGlzIGlzIGEKPiBkb2MgbWlzdGFrZSkuIE5l
dmVydGhlbGVzcywgdG8gYmUgb24gdGhlIHNhZmUgc2lkZSwgZm9yY2UgZXZleC5sciB0byBiZQo+
IHplcm8gaW4gdGhpcyBjYXNlIHRob3VnaCB3aGVuIGNvbnN0cnVjdGluZyB0aGUgc3R1Yi4KPgo+
IFNsaWdodGx5IGFkanVzdCB0aGUgc2NhbGFyIHRvX2ludCgpIGluIHRoZSB0ZXN0IGhhcm5lc3Ms
IHRvIGluY3JlYXNlIHRoZQo+IGNoYW5jZXMgb2YgdGhlIG9wZXJhbmQgZW5kaW5nIHVwIGluIG1l
bW9yeS4KPgo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4K
CkFja2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
