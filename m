From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH for-4.12 5/8] xen/arm: p2m: Only use isb()
 when it is necessary
Date: Thu, 24 Jan 2019 11:29:33 +0000
Message-ID: <749a7f5d-f47b-fdc6-4c77-fe36dd8dce30@arm.com>
References: <20181128164939.8329-1-julien.grall@arm.com>
 <20181128164939.8329-6-julien.grall@arm.com>
 <alpine.DEB.2.10.1901231533060.17936@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=w3Qo=QA=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gmdCT-0004wx-Hd
 for xen-devel@lists.xenproject.org; Thu, 24 Jan 2019 11:29:37 +0000
In-Reply-To: <alpine.DEB.2.10.1901231533060.17936@sstabellini-ThinkPad-X260>
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
Cc: xen-devel@lists.xenproject.org, andre.przywara@arm.com
List-Id: xen-devel@lists.xenproject.org

SGkgU3RlZmFubywKCk9uIDIzLzAxLzIwMTkgMjM6NDIsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90
ZToKPiBPbiBXZWQsIDI4IE5vdiAyMDE4LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+ICsgICAgLyoK
Pj4gICAgICAgICogRmx1c2ggbG9jYWwgVExCIGZvciB0aGUgZG9tYWluIHRvIHByZXZlbnQgd3Jv
bmcgVExCIHRyYW5zbGF0aW9uCj4+ICAgICAgICAqIHdoZW4gcnVubmluZyBtdWx0aXBsZSB2Q1BV
IG9mIHRoZSBzYW1lIGRvbWFpbiBvbiBhIHNpbmdsZSBwQ1BVLgo+PiAgICAgICAgKi8KPj4gICAg
ICAgaWYgKCAqbGFzdF92Y3B1X3JhbiAhPSBJTlZBTElEX1ZDUFVfSUQgJiYgKmxhc3RfdmNwdV9y
YW4gIT0gbi0+dmNwdV9pZCApCj4+ICsgICAgewo+PiAgICAgICAgICAgZmx1c2hfdGxiX2xvY2Fs
KCk7Cj4+ICsgICAgfQo+IAo+IFNwdXJpb3VzIGNoYW5nZT8KClllcywgdGhpcyB3YXMgYSBsZWZ0
LW92ZXIgZnJvbSBhIHByZXZpb3VzIHRyeS4gSSB3aWxsIGRyb3AgdGhlbS4KCkNoZWVycywKCi0t
IApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
