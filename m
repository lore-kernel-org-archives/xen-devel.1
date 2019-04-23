From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH 5/6] xen/arm: map reserved-memory regions as
 normal memory in dom0
Date: Tue, 23 Apr 2019 09:09:06 +0100
Message-ID: <811a9368-c6c6-a4ae-1101-f4aac16adc7b@arm.com>
References: <alpine.DEB.2.10.1902261501020.20689@sstabellini-ThinkPad-X260>
 <1551222427-21749-5-git-send-email-sstabellini@kernel.org>
 <96e6defa-5c7b-81e2-a85e-f02884f339fb@arm.com>
 <alpine.DEB.2.10.1904221531470.1370@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pRHB=SZ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hIqUJ-0001C3-0k
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2019 08:09:11 +0000
In-Reply-To: <alpine.DEB.2.10.1904221531470.1370@sstabellini-ThinkPad-X260>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, nd <nd@arm.com>, Stefano Stabellini <stefanos@xilinx.com>
List-Id: xen-devel@lists.xenproject.org

SGkgU3RlZmFubywKCk9uIDQvMjIvMTkgMTE6NDIgUE0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90
ZToKPiBPbiBUdWUsIDI2IEZlYiAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSSBhbSBub3Qg
c3VyZSBhYm91dCB0aGUgc3VnZ2VzdGlvbiBvZiByZS11c2luZyB0aGUgbGliZmR0IGNvbmNlcHQg
b2YKPiAibWVtX3JzdiIsIHdoaWNoIGlzIG1lYW50IHRvIGJlIGZvciB0aGUgb2xkIC9tZW1yZXNl
cnZlLy4gVG9kYXksIGxpYmZkdAo+IChhdCBsZWFzdCBvdXIgdmVyc2lvbiBvZiBpdCkgaXMgbm90
IGFibGUgdG8gcGFyc2UgdGhlIG5ldwo+IHJlc2VydmVkLW1lbW9yeSBiaW5kaW5ncy4gSSBkb24n
dCB0aGluayBpdCBpcyBhIGdvb2QgaWRlYSB0byBtb2RpZnkKPiBsaWJmZHQgZm9yIHRoYXQuIEFs
c28sIHRoZSB3YXkgd2Ugd2FudCB0byBoYW5kbGUgdGhlIG9sZCBtZW1yZXNlcnZlCj4gcmVnaW9u
cyBpcyBxdWl0ZSBkaWZmZXJlbnQgZnJvbSB0aGUgd2F5IHdlIHdhbnQgdG8gaGFuZGxlCj4gcmVz
ZXJ2ZWQtbWVtb3J5LCByaWdodD8gSSBjYW5ub3Qgc2VlIGEgd2F5IHRvIGltcHJvdmUgdGhpcyBj
b2RlIHVzaW5nCj4gbWVtX3JzdiBhdCB0aGUgbW9tZW50LgoKSSBkaWRuJ3QgbWVhbiB0byBleHRl
bmQgbWVtX3JzdiBpbiBsaWJmZHQgYnV0IGV4dGVuZCBjb25zaWRlcl9tb2R1bGVzIAphbmQgZHRf
dW5yZXNlcnZlZF9yZWdpb25zIHRvIGRlYWwgd2l0aCAvcmVzZXJ2ZWQtbWVtb3J5LiBPdGhlcndp
c2UgeW91Cm1heSBtaXNzIHNvbWUgY2FzZXMgKGZvciBpbnN0YW5jZSB5b3UgbGVmdCBvdXQgZGlz
Y2FyZF9pbml0aWFsX21vZHVsZXMpLgoKQnkgZXh0ZW5kaW5nIHRob3NlIHR3byBmdW5jdGlvbnMg
eW91IGRvbid0IGhhdmUgdG8gdGVhY2ggZXZlcnlvbmUgaG93IHRvIApza2lwIC9yZXNlcnZlZC1t
ZW1vcnkuCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
