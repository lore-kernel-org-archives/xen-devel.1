From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [RFC PATCH 0/4] Add missing default labels to
 switch statements
Date: Mon, 25 Feb 2019 04:40:11 -0700
Message-ID: <5C73D41B0200007800219C82@prv1-mh.provo.novell.com>
References: <20190222095721.24764-1-andr2000@gmail.com>
 <6e297f93-0c34-18df-63bb-6ef77b0615f3@citrix.com>
 <a30ca582-0993-9652-112e-467f49605405@arm.com>
 <f3438c56-1e7c-88fa-fb0e-b770eccf6d88@gmail.com>
 <bbc8f1bc-c8dd-6784-fbe4-0667127d37af@arm.com>
 <63101f28-a1ad-bffd-158a-c7e1380f6e18@gmail.com>
 <547c3711-02a3-9071-5bb1-494ca45eb4a6@arm.com>
 <alpine.DEB.2.10.1902221253050.30151@sstabellini-ThinkPad-X260>
 <b405a7ae-174f-c8d9-41cc-ec511fb69c77@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=E5lv=RA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gyEeH-0003wx-Mi
 for xen-devel@lists.xenproject.org; Mon, 25 Feb 2019 11:42:17 +0000
In-Reply-To: <b405a7ae-174f-c8d9-41cc-ec511fb69c77@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Artem Mygaiev <artem_mygaiev@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, "andrii_anisov@epam.com" <andrii_anisov@epam.com>, oleksandr_andrushchenko@epam.com, Oleksandr Andrushchenko <andr2000@gmail.com>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIyLjAyLjE5IGF0IDIyOjMzLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gUC5TLiBUaGVyZSBpcyBhIHNvbHV0aW9uIGhlcmUgd2hpY2ggY291bGQgd29yaywgYnV0
IElNTyBhIGJldHRlciB1c2Ugb2YKPiB0aW1lIGFuZCBlbmVyZ3kgd291bGQgYmUgdG8gZ2V0IE1J
U1JBIHRvIHVwZGF0ZSB0aGVpciBydWxlcyB0byBtYXRjaAo+IHRoaXMgY2VudHVyeSwgYW5kIHN0
b3AgZ2V0dGluZyBpbiB0aGUgd2F5IG9mIGNvbXBpbGVyIGZlYXR1cmVzIGludGVuZGVkCj4gdG8g
aGVscCB0aGUgcHJvZ3JhbW1lciBhdm9pZCBidWdzLgoKQXMgbXVjaCBhcyBJJ20gd2l0aCB5b3Ug
aW4gZGVzaXJpbmcgdGhlIGNvbXBpbGVyIGFpZCBnaXZlbiB0byBub3QgZ2V0CnVuZGVybWluZWQs
IEkgdGhpbmsgdGhpcyBNSVNSQSBydWxlIGlzbid0IGluIG5lZWQgb2YgbW9kZXJuaXppbmc6IEl0
J3MKb25lIHRoaW5nIGZvciB0aGUgY29tcGlsZXIgdG8gaGVscCB3aXRoIGluLXJhbmdlIGVudW1l
cmF0b3JzLCBhbmQgaXQncwphbm90aGVyIHRvIGRlbWFuZCB0aGF0IHVuaW50ZW50aW9uYWwgb3V0
LW9mLXJhbmdlIG9uZXMgZG9uJ3QgY2F1c2UKYWN0dWFsIGhhcm0gKGxpa2UgY3Jhc2hpbmcgeW91
ciBjYXIgaW50byB0aGUgbmV4dCB0cmVlKS4gVGhpcyBpcyBldmVuCm1vcmUgc28gdGhhdCBpaXJj
IHRoZXJlJ3Mgbm8gd2FybmluZyBpZiB5b3UgcGFzcyBhIHBsYWluIGludGVnZXIgaW50byBhCmZ1
bmN0aW9uIHdob3NlIHBhcmFtZXRlciBzcGVjaWZpZXMgYW4gZW51bSwgb3IgaWYgeW91IGFzc2ln
biBhIHBsYWluCmludGVnZXIgdG8gYW4gZW51bSB0eXBlcyB2YXJpYWJsZS4KCkFtb25nc3Qgb3Vy
IHBsYW5uZWQgaGFyZGVuaW5nIEtjb25maWctZXJ5IEkgdGhpbmsgd2UgbWF5IHdhbnQgdG8KYWRk
IGFuIG9wdGlvbiBjb250cm9sbGluZyB3aGV0aGVyIHRvIGhhdmUgc29tZXRoaW5nIGxpa2UKCiNk
ZWZpbmUgREVGQVVMVF9VTlJFQUNIQUJMRShjb2RlKSBkZWZhdWx0OiBBU1NFUlRfVU5SRUFDSEFC
TEUoKTsgY29kZTsKCm9yIGluc3RlYWQgKGJ5IGRlZmF1bHQpIGV4cGFuZGluZyB0byBub3RoaW5n
LgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
