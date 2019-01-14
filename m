From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/cpuid: correct dependencies of post-SSE
 ISA extensions
Date: Mon, 14 Jan 2019 12:00:35 +0000
Message-ID: <f90fec5f-4c14-4ce5-93d5-c43c9f9ff60b@citrix.com>
References: <5C3C74E1020000780020D2AE@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=E1pU=PW=citrix.com=prvs=910aa9826=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gj0v1-0007IV-Pj
 for xen-devel@lists.xenproject.org; Mon, 14 Jan 2019 12:00:39 +0000
In-Reply-To: <5C3C74E1020000780020D2AE@prv1-mh.provo.novell.com>
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
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTQvMDEvMjAxOSAxMTozOSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gRmlyc3Qgb2YgYWxsIGEg
UENMTVVMUURRIGRlcGVuZGVuY3kgd2FzIG1pc3NpbmcgZW50aXJlbHkuIEFkZCBpdCBhcyB3ZWxs
Cj4gYXMgQUVTTkkgYW5kIFNIQSB0byBTU0UyLCBhcyBhbGwgb2YgdGhlbSBhY3Qgb24gdmVjdG9y
cyBvZiBpbnRlZ2VycywKPiB3aGVyZWFzIHBsYWluIFNTRSBzdXBwb3J0cyB2ZWN0b3JzIG9mIHNp
bmdsZSBwcmVjaXNpb24gZmxvYXRzIG9ubHkuIFRoaXMKPiBpcyBpbiBsaW5lIHdpdGggaG93IGUu
Zy4gYmludXRpbHMgYW5kIGdjYyB0cmVhdCB0aGVtLgo+Cj4gU2lnbmVkLW9mZi1ieTogSmFuIEJl
dWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+IC0tLQo+IFRCRDogT24gdGhlIHNhbWUgYmFzaXMs
IFNTRTMsIFNTU0UzIGFuZCBTU0U0QSBzaG91bGQgcHJvYmFibHkgYWxzbwo+IGRlcGVuZCBvbiBT
U0UyIHJhdGhlciB0aGFuIFNTRS4gSW4gZmFjdCBtYWtpbmcgdGhpcyBhIGNoYWluIFNTRSAtPiBT
U0UyCj4gLT4gU1NFMyAtPiB7IFNTU0UzLCBTU0U0QSB9IHdvdWxkIHByb2JhYmx5IGJlIGJlc3Qs
IGFuZCBnZXQgdXMgaW4gbGluZQo+IHdpdGggYm90aCBiaW51dGlscyBhbmQgZ2NjLiBCdXQgSSB0
aGluayBJIGRpZCBzdWdnZXN0IHNvIHdoZW4gdGhlCj4gZGVwZW5kZW5jaWVzIHdlcmUgaW50cm9k
dWNlZCwgYW5kIHRoaXMgd2Fzbid0IGxpa2VkIGZvciBhIHJlYXNvbiBJCj4gZm9yZ290LgoKV2hp
bGUgYWxsIG9mIHRoaXMgaXMgdHJ1ZSwgdGhlcmUgaXMgYSBjb21tZW50IGluIGNvbnRleHQgd2hp
Y2ggZXhwbGFpbnMKd2h5IHRoZSBkZXBlbmRlbmNlcyBhcmUgdGhleSB3YXkgdGhleSBhcmUuCgpQ
cm92aWRpbmcgYSBndWVzdCB3aXRoIFNTRSwgbm8gU1NFMiwgYW5kIFBDTE1VTERRL0FFU05JL1NI
QSB3aWxsIGFsbG93CnRoZXNlIGxhdHRlciBpbnN0cnVjdGlvbiBncm91cHMgdG8gZnVuY3Rpb24g
Y29ycmVjdGx5LgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
