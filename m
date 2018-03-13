From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 2/2] x86: use invpcid to do global flushing
Date: Tue, 13 Mar 2018 03:35:35 -0600
Message-ID: <5AA7A97702000078001B0D63@prv-mh.provo.novell.com>
References: <20180305095032.30062-1-wei.liu2@citrix.com>
 <20180305095032.30062-3-wei.liu2@citrix.com>
 <5AA2B67302000078001B0567@suse.com>
 <4fb72f31-683d-1de3-db90-4788a379b0bd@suse.com>
 <5AA679BD0200007800129C56@prv-mh.provo.novell.com>
 <4c0abb8c-7c16-6a89-29c1-d20e4c16e4c2@suse.com>
 <5AA794B402000078001B0CC7@suse.com>
 <a84911d5-cbf0-0c6f-8c9f-c479aa1e54ee@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=c4be=gd=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1evgLS-0002iA-Jf
 for xen-devel@lists.xenproject.org; Tue, 13 Mar 2018 09:35:46 +0000
In-Reply-To: <a84911d5-cbf0-0c6f-8c9f-c479aa1e54ee@suse.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: andrew.cooper3@citrix.com, wei.liu2@citrix.com, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEzLjAzLjE4IGF0IDEwOjI3LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBPbiAx
My8wMy8xOCAwOTowNywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDEyLjAzLjE4IGF0IDE0
OjEwLCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPj4+IEJUVzogYXJlIHlvdSBhbHJlYWR5IHdv
cmtpbmcgb24gcmViYXNpbmcgeW91ciBYUFRJIHNwZWVkIHVwIHNlcmllcyB0bwo+Pj4gY3VycmVu
dCBzdGFnaW5nPyBJJ2QgbGlrZSBteSBzZXJpZXMgdG8gdXNlIHlvdXIgc2VyaWVzIGFzIGEgYmFz
ZSB1bmxlc3MKPj4+IHlvdSBhcmUgdGVsbGluZyBtZSB5b3Ugd29uJ3QgYmUgYWJsZSB0byByZXNl
bmQgeW91ciBzZXJpZXMgc29vbi4KPj4gCj4+IENvbWluZyBiYWNrIHRvIG15IHJlcGx5IGhlcmUg
eWVzdGVyZGF5IC0gdGhlbiBhZ2FpbiBJJ20gYSBsaXR0bGUKPj4gcmVsdWN0YW50IHRvIHNlbmQg
b3V0IGEgbmV3IHZlcnNpb24gdGhhdCBoYXMgbm8gY2hhbmdlcyBvdGhlcgo+PiB0aGFuIGJlaW5n
IHJlLWJhc2VkLCB3aGVuIHRoZXJlIHdlcmUgbm8gY29tbWVudHMgYnkgQW5kcmV3Cj4+IG9uIG1v
c3Qgb2YgdGhlIHJlbWFpbmluZyBwYXRjaGVzIHlldCAoYW5kIGluIHRoZSBvbmUgY2FzZQo+PiB3
aGVyZSB0aGVyZSB3ZXJlIGNvbW1lbnRzLCBJJ20gYWZyYWlkIEkgY29udGludWUgdG8gZGlzYWdy
ZWUsCj4+IGJ1dCBJJ2xsIHNlZSBhYm91dCBtb3ZpbmcgdGhhdCBwYXRjaCBsYXN0IGluIHRoZSBz
ZXJpZXMpLgo+IAo+IEluIG9yZGVyIHRvIG1vdmUgZm9yd2FyZCwgd291bGQgeW91IHByZWZlciBt
ZSB0byBiYXNlIG15IHBhdGNoZXMgb24KPiBjdXJyZW50IHN0YWdpbmcgYW5kIHB1dCB5b3VyIHBh
dGNoZXMgb24gdG9wIG9mIG15IHNlcmllcyBsYXRlcj8gSSBqdXN0Cj4gZG9uJ3Qgd2FudCB0byBy
ZWJhc2UgbXkgc2VyaWVzIG9uIGEgbW92aW5nIHRhcmdldC4uLgoKV2VsbCwgSSdtIHNpbWlsYXJs
eSBub3QgaW50ZW5kaW5nIHRvIHJlLWJhc2Ugb250byBhIHNlcmllcyBzdGlsbCB1bmRlcgpkZXZl
bG9wbWVudCAvIHJldmlldy4gVGhhdCdzIHJlYWxseSB0aGUgYmFkIHRoaW5nIHdpdGggZGVhZGxp
bmVzOgpJZiB3ZSBkaWRuJ3QgZnJlZXplIHRoZSB0cmVlIGF0IGEgZ2l2ZW4gdGltZSwgYnV0IGF0
IHRoZSBwb2ludCB3aGVyZQpwcmV2aW91c2x5IGFncmVlZCBmZWF0dXJlcyBhbmQgb3RoZXIgbm9u
LWJ1Zy1maXggY2hhbmdlcyBoYXZlCmxhbmRlZCwgd2Ugd291bGRuJ3QgaGF2ZSBzdWNoIGFuIG9y
ZGVyaW5nIHByb2JsZW0gcmlnaHQgbm93IChvcgp0byBiZSBwcmVjaXNlIHRoZSBvcmRlcmluZyBp
c3N1ZSB3b3VsZCBzdGlsbCBiZSB0aGVyZSwgYnV0IG5laXRoZXIKb2YgdXMgd291bGQgYmUgYXQg
cmlzayBvZiB0aGVpciBjaGFuZ2VzIG5vdCBtYWtpbmcgaXQpLgoKSmFuCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
