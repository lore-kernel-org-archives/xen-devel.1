From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 2/2] x86/xen: dont add memory above max
 allowed allocation
Date: Tue, 22 Jan 2019 10:09:05 +0100
Message-ID: <8872a401-46e1-ae81-e84e-0e70bdde2cce__34916.6352929146$1548148197$gmane$org@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=mEf3=P6=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1gls3R-0002nr-LK
 for xen-devel@lists.xenproject.org; Tue, 22 Jan 2019 09:09:09 +0000
References: =?UTF-8?B?PDIwMTkwMTIyMDgwNjI4LjcyMzjvv70x77+9amdyb3NzQHN1c2Uu?=
 =?UTF-8?Q?com=3e_=3c20190122080628=2e7238-3-jgross=40suse=2ecom=3e_=3c5C46D?=
 =?UTF-8?Q?9D00200007800210007=40suse=2ecom=3e?=
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, the arch/x86 maintainers <x86@kernel.org>, lkml <linux-kernel@vger.kernel.org>, linux-mm@kvack.org, mingo@redhat.com, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, xen-devel <xen-devel@lists.xenproject.org>, Thomas Gleixner <tglx@linutronix.de>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjIvMDEvMjAxOSAwOTo1MiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMjIuMDEuMTkg
YXQgMDk6MDYsIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+PiBEb24ndCBhbGxvdyBtZW1vcnkg
dG8gYmUgYWRkZWQgYWJvdmUgdGhlIGFsbG93ZWQgbWF4aW11bSBhbGxvY2F0aW9uCj4+IGxpbWl0
IHNldCBieSBYZW4uCj4gCj4gVGhpcyByZWFkcyBhcyBpZiB0aGUgaHlwZXJ2aXNvciB3YXMgaW1w
b3NpbmcgYSBsaW1pdCBoZXJlLCBidXQgbG9va2luZyBhdAo+IHhlbl9nZXRfbWF4X3BhZ2VzKCks
IHhlbl9mb3JlYWNoX3JlbWFwX2FyZWEoKSwgYW5kCj4geGVuX2NvdW50X3JlbWFwX3BhZ2VzKCkg
SSB0YWtlIGl0IHRoYXQgaXQncyBhIHJlc3RyaWN0aW9uIGVuZm9yY2VkIGJ5Cj4gdGhlIFhlbiBz
dWJzeXN0ZW0gaW4gTGludXguIEZ1cnRoZXJtb3JlIGZyb20gdGhlIGNvdmVyIGxldHRlciBJIGlt
cGx5Cj4gdGhhdCB0aGUgb2JzZXJ2ZWQgaXNzdWUgd2FzIG9uIGEgRG9tMCwgeWV0IHhlbl9nZXRf
bWF4X3BhZ2VzKCkncwo+IHVzZSBvZiBYRU5NRU1fbWF4aW11bV9yZXNlcnZhdGlvbiB3b3VsZG4n
dCBpbXBvc2UgYW55IGxpbWl0IHRoZXJlCj4gYXQgYWxsICh3aXRob3V0IHVzZSBvZiB0aGUgaHlw
ZXJ2aXNvciBvcHRpb24gImRvbTBfbWVtPW1heDouLi4iKSwKPiB3b3VsZCBpdD8KCk9oIHllcywg
eW91IGFyZSByaWdodCwgb2YgY291cnNlIQoKSSBuZWVkIHRvIGNoZWNrIHRoZSBjdXJyZW50IHJl
c2VydmF0aW9uIGFuZCBhZGp1c3QgdGhlIGFsbG93ZWQgbGltaXQKaW4gY2FzZSBvZiBiYWxsb29u
aW5nIGFuZC9vciBtZW1vcnkgaG90cGx1Zy4KClRoYW5rcyBmb3Igbm90aWNpbmcgdGhhdCEKCgpK
dWVyZ2VuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
