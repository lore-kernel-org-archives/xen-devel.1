From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH 03/15] xen/arm: Introduce helpers to
 clear/flags flags in HCR_EL2
Date: Tue, 14 Aug 2018 22:23:18 +0100
Message-ID: <4c0f6e56-7d17-8e3d-3146-1c043d489eb8@arm.com>
References: <20180716172712.20294-1-julien.grall@arm.com>
 <20180716172712.20294-4-julien.grall@arm.com>
 <alpine.DEB.2.10.1808141345410.15066@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=+6mo=k5=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1fpgmh-0000vz-AK
 for xen-devel@lists.xenproject.org; Tue, 14 Aug 2018 21:23:23 +0000
In-Reply-To: <alpine.DEB.2.10.1808141345410.15066@sstabellini-ThinkPad-X260>
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

SGkgU3RlZmFubywKCk9uIDA4LzE0LzIwMTggMDk6NDYgUE0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3
cm90ZToKPiBPbiBNb24sIDE2IEp1bCAyMDE4LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IEEgY291
cGxlIG9mIHBsYWNlcyBpbiB0aGUgY29kZSB3aWxsIG5lZWQgdG8gY2xlYXIvc2V0IGZsYWdzIGlu
IEhDUl9FTDIKPj4gZm9yIGEgZ2l2ZW4gdkNQVSBhbmQgdGhlbiByZXBsaWNhdGUgaW50byB0aGUg
aGFyZHdhcmUuIEludHJvZHVjZQo+PiBoZWxwZXJzIGFuZCByZXBsYWNlIG9wZW4tY29kZWQgdmVy
c2lvbi4KPj4KPj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAbGlu
YXJvLm9yZz4KPiAKPiBUaGUgbWFjcm9zIGxvb2sgZ29vZCwgYnV0IEkgZ3JlcHBlZCBmb3IgdGhl
bSBpbiB5b3VyIHNlcmllcyBhbmQgdGhlcmUKPiBhcmUgbm8gbW9yZSBjYWxsZXJzLiBXaGF0IHBs
YWNlcyBhcmUgeW91IHJlZmVycmluZyB0byB0aGF0IHRoZXkgd2lsbAo+IG5lZWQgdGhlbT8KCkkg
c3BsaXQgc29tZSBvZiBteSB3b3JrIGluIDIgcGFydCB0byByZWR1Y2UgdGhlIHNpemUgb2YgdGhl
IHNlcmllcy4gVGhpcyAKd2lsbCBiZSB1c2VkIGluIGFub3RoZXIgc2VyaWVzIHdoZXJlIHVwZGF0
aW5nIEhDUiBmb3IgdHJhcHBpbmcgClRUQlIvU0NUTFIqIHdpbGwgYmUgZHluYW1pYy4KCkFsdGhv
dWdoIGluIGdlbmVyYWwsIHRoaXMgaXMgYW4gaW1wcm92ZW1lbnQgY29tcGFyZSB0byB0aGUgY3Vy
cmVudCBjb2RlIAphcyBpdCBtYWtlcyBjbGVhciB3aGF0IG5lZWRzIHRvIGJlIHVwZGF0ZWQgd2hl
biBtb2RpZnlpbmcgSENSLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
