From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH v3] xen/balloon: add runtime control for
 scrubbing ballooned out pages
Date: Tue, 11 Sep 2018 15:37:19 -0400
Message-ID: <a7e4153b-4998-342f-af85-c84a5f4d9e0b__38517.9472891197$1536694511$gmane$org@oracle.com>
References: <5B92A01D02000078001E67CE@prv1-mh.provo.novell.com>
 <20180907164912.21075-1-marmarek@invisiblethingslab.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=y368=lz=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1fzoST-0005hG-IK
 for xen-devel@lists.xenproject.org; Tue, 11 Sep 2018 19:36:21 +0000
In-Reply-To: <20180907164912.21075-1-marmarek@invisiblethingslab.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, David Rientjes <rientjes@google.com>, Jonathan Corbet <corbet@lwn.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Frederic Weisbecker <frederic@kernel.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, Kai-Heng Feng <kai.heng.feng@canonical.com>, Jiri Kosina <jkosina@suse.cz>, Bjorn Helgaas <bhelgaas@google.com>, Thymo van Beers <thymovanbeers@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>
List-Id: xen-devel@lists.xenproject.org

T24gOS83LzE4IDEyOjQ5IFBNLCBNYXJlayBNYXJjenlrb3dza2ktR8OzcmVja2kgd3JvdGU6Cj4g
U2NydWJiaW5nIHBhZ2VzIG9uIGluaXRpYWwgYmFsbG9vbiBkb3duIGNhbiB0YWtlIHNvbWUgdGlt
ZSwgZXNwZWNpYWxseQo+IGluIG5lc3RlZCB2aXJ0dWFsaXphdGlvbiBjYXNlIChuZXN0ZWQgRVBU
IGlzIHNsb3cpLiBXaGVuIEhWTS9QVkggZ3Vlc3QgaXMKPiBzdGFydGVkIHdpdGggbWVtb3J5PSBz
aWduaWZpY2FudGx5IGxvd2VyIHRoYW4gbWF4bWVtPSwgYWxsIHRoZSBleHRyYQo+IHBhZ2VzIHdp
bGwgYmUgc2NydWJiZWQgYmVmb3JlIHJldHVybmluZyB0byBYZW4uIEJ1dCBzaW5jZSBtb3N0IG9m
IHRoZW0KPiB3ZXJlbid0IHVzZWQgYXQgYWxsIGF0IHRoYXQgcG9pbnQsIFhlbiBuZWVkcyB0byBw
b3B1bGF0ZSB0aGVtIGZpcnN0Cj4gKGZyb20gcG9wdWxhdGUtb24tZGVtYW5kIHBvb2wpLiBJbiBu
ZXN0ZWQgdmlydCBjYXNlIChYZW4gaW5zaWRlIEtWTSkKPiB0aGlzIHNsb3dzIGRvd24gdGhlIGd1
ZXN0IGJvb3QgYnkgMTUtMzBzIHdpdGgganVzdCAxLjVHQiBuZWVkZWQgdG8gYmUKPiByZXR1cm5l
ZCB0byBYZW4uCj4KPiBBZGQgcnVudGltZSBwYXJhbWV0ZXIgdG8gZW5hYmxlL2Rpc2FibGUgaXQs
IHRvIGFsbG93IGluaXRpYWxseSBkaXNhYmxpbmcKPiBzY3J1YmJpbmcsIHRoZW4gZW5hYmxlIGl0
IGJhY2sgZHVyaW5nIGJvb3QgKGZvciBleGFtcGxlIGluIGluaXRyYW1mcykuCj4gU3VjaCB1c2Fn
ZSByZWxpZXMgb24gYXNzdW1wdGlvbiB0aGF0IGEpIG1vc3QgcGFnZXMgYmFsbG9vbmVkIG91dCBk
dXJpbmcKPiBpbml0aWFsIGJvb3Qgd2VyZW4ndCB1c2VkIGF0IGFsbCwgYW5kIGIpIGV2ZW4gaWYg
dGhleSB3ZXJlLCB2ZXJ5IGZldwo+IHNlY3JldHMgYXJlIGluIHRoZSBndWVzdCBhdCB0aGF0IHRp
bWUgKGJlZm9yZSBhbnkgc2VyaW91cyB1c2Vyc3BhY2UKPiBraWNrcyBpbikuCj4gQ29udmVydCBD
T05GSUdfWEVOX1NDUlVCX1BBR0VTIHRvIENPTkZJR19YRU5fU0NSVUJfUEFHRVNfREVGQVVMVCAo
YWxzbwo+IGVuYWJsZWQgYnkgZGVmYXVsdCksIGNvbnRyb2xsaW5nIGRlZmF1bHQgdmFsdWUgZm9y
IHRoZSBuZXcgcnVudGltZQo+IHN3aXRjaC4KPgo+IFNpZ25lZC1vZmYtYnk6IE1hcmVrIE1hcmN6
eWtvd3NraS1Hw7NyZWNraSA8bWFybWFyZWtAaW52aXNpYmxldGhpbmdzbGFiLmNvbT4KCgpBcHBs
aWVkIHRvIGZvci1saW51eC00LjE5Yi4KCi1ib3JpcwoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
