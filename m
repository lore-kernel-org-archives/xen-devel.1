From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 02/45] ARM: Implement vcpu_kick()
Date: Tue, 20 Mar 2018 04:35:01 -0600
Message-ID: <5AB0F1E502000078001B3DD8@prv-mh.provo.novell.com>
References: <20180315203050.19791-1-andre.przywara@linaro.org>
 <20180315203050.19791-3-andre.przywara@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=3grj=gk=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1eyEbh-0001m6-6h
 for xen-devel@lists.xenproject.org; Tue, 20 Mar 2018 10:35:05 +0000
In-Reply-To: <20180315203050.19791-3-andre.przywara@linaro.org>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Andre Przywara <andre.przywara@linaro.org>
Cc: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE1LjAzLjE4IGF0IDIxOjMwLCA8YW5kcmUucHJ6eXdhcmFAbGluYXJvLm9yZz4gd3Jv
dGU6Cj4gSWYgd2UgY2hhbmdlIHNvbWV0aGluZyBpbiBhIHZDUFUgdGhhdCBhZmZlY3RzIGl0cyBy
dW5uYWJpbGl0eSBvcgo+IG90aGVyd2lzZSBuZWVkcyB0aGUgdkNQVSdzIGF0dGVudGlvbiwgd2Ug
bWlnaHQgbmVlZCB0byB0ZWxsIHRoZSBzY2hlZHVsZXIKPiBhYm91dCBpdC4KPiBXZSBhcmUgdXNp
bmcgdGhpcyBpbiBvbmUgcGxhY2UgKHZJUlEgaW5qZWN0aW9uKSBhdCB0aGUgbW9tZW50LCBidXQg
d2lsbAo+IG5lZWQgdGhpcyBhdCBtb3JlIHBsYWNlcyBzb29uLgo+IFNvIGxldCdzIGZhY3RvciBv
dXQgdGhpcyBmdW5jdGlvbmFsaXR5LCB1c2luZyB0aGUgYWxyZWFkeSBleGlzdGluZwo+IHZjcHVf
a2ljaygpIHByb3RvdHlwZSAodXNlZCBpbiB4ODYgb25seSBzbyBmYXIpLCB0byBtYWtlIHRoaXMg
YXZhaWxhYmxlCj4gdG8gdGhlIHJlc3Qgb2YgdGhlIFhlbiBjb2RlLgoKSGF2aW5nIGp1c3Qgc2Vl
biB0aGlzIGFtb25nIHRoZSBjb21taXRzIGhhdmluZyBnb25lIGluIHJlY2VudGx5IC0Kd2FzIGl0
IGNvbnNpZGVyZWQgdG8gbWFrZSB0aGlzIGEgY29tbW9uIGZ1bmN0aW9uPyBUaGUKaW1wbGVtZW50
YXRpb25zIGN1cnJlbnRseSBkaWZmZXIsIGJ1dCBJJ20gbm90IHN1cmUgSSBzZWUgd2h5IHRoYXQK
bmVlZHMgdG8gYmUuIFdpdGggeDg2J3MgdmNwdV9raWNrX3NvZnRpcnEoKSBoYW5kbGVyIGRvaW5n
IG5vdGhpbmcKSSBjb3VsZCBzZWUgdGhlIEFSTSBpbXBsZW1lbnRhdGlvbiBiZSBzdWl0YWJsZSBm
b3IgeDg2LCBqdXN0IGxpa2UKSSBjb3VsZCBzZWUgdGhlIHg4NiBpbXBsZW1lbnRhdGlvbiBiZSBz
dWl0YWJsZSBmb3IgQVJNLgoKSmFuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
