From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3 11/25] x86emul: place test blobs in
	executable section
Date: Mon, 5 Feb 2018 13:11:31 +0000
Message-ID: <2b6f79b0-b0d7-1330-6eed-e4501cbd0120@citrix.com>
References: <5A29550C020000780019585B@prv-mh.provo.novell.com>
 <5A29590902000078001958FA@prv-mh.provo.novell.com>
 <27be5e70-fc92-d4de-f6f8-890f8545e38b@citrix.com>
 <5A74916002000078001A4A41@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=xio2=e7=citrix.com=prvs=567de97ac=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1eigYd-0006UZ-Eb
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2018 13:11:39 +0000
In-Reply-To: <5A74916002000078001A4A41@prv-mh.provo.novell.com>
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDIvMDIvMTggMTU6MjcsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDAyLjAyLjE4IGF0
IDE0OjAzLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4+IE9uIDA3LzEyLzE3
IDE0OjA2LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+IFRoaXMgYWxsb3dzIHRoZSBzZWN0aW9uIGNv
bnRlbnRzIHRvIGJlIGRpc2Fzc2VtYmxlZCB3aXRob3V0IGdvaW5nCj4+PiB0aHJvdWdoIGFueSBl
eHRyYSBob29wcywgc2ltcGxpZnlpbmcgdGhlIGFuYWx5c2lzIG9mIHByb2JsZW1zIGluIHRlc3QK
Pj4+IGFuZC9vciBlbXVsYXRpb24gY29kZS4KPj4+Cj4+PiBUaGUgYmxvYnMgYmVpbmcgZW1pdHRl
ZCBhcyAoci9vKSBkYXRhIG1lYW5zIHdlIG5lZWQgdG8gYWNjZXB0IGFuCj4+PiBhc3NlbWJsZXIg
d2FybmluZyBoZXJlIChhYm91dCB0aGUgZGlmZmVyaW5nIHNlY3Rpb24gYXR0cmlidXRlcykuCj4+
Pgo+Pj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+PiBX
aGF0IGFib3V0IGp1c3QgZ2l2aW5nIHVwIHRoZWlyIGNvbnN0bmVzcz8gIFRoaXMgaXMgYSB0ZXN0
IHByb2dyYW0gYWZ0ZXIKPj4gYWxsLgo+IFRoZW4gdGhlIGNvbmZsaWN0IHdvdWxkIGJlIGluIHR3
byBhdHRyaWJ1dGVzICh3cml0YWJsZSBhbmQKPiBleGVjdXRhYmxlKSByYXRoZXIgdGhhbiBqdXN0
IG9uZS4gVGhlIGlzc3VlIGlzIHRoYXQgd2UgZW1pdCB0aGVtCj4gYXMgZGF0YSwgYnV0IHdhbnQg
dGhlbSB0byBiZSBpbiBhbiBleGVjdXRhYmxlIHNlY3Rpb24uIElmIGFueXRoaW5nCj4gd2UnZCBo
YXZlIHRvIHJlLWRvIGhvdyB0aGV5J3JlIGVtaXR0ZWQgKGUuZy4gYnkgdXNpbmcgYXNtKCkpLCBi
dXQKPiB0aGF0IHNlZW1zIG92ZXJraWxsIHRvIG1lLgoKT2suwqAgSW5zdGVhZCwgaG93IGFib3V0
IGhhdmluZyBhIHNlY29uZCAudGVzdC5jb25zdD8gd291bGRuJ3QgdGhhdApyZXNvbHZlIHRoZSB3
YXJuaW5ncywgYnV0IHN0aWxsIGxlYXZlIHRoZSBpbnN0cnVjdGlvbnMgaW4gYW4gZXhlY3V0YWJs
ZQpzZWN0aW9uPwoKRWl0aGVyIHdheSwgdGhpcyBpcyBqdXN0IGEgZGV2ZWxvcGVyIHV0aWxpdHks
IHNvIEFja2VkLWJ5OiBBbmRyZXcgQ29vcGVyCjxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
