From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH 2/2] xen-netfront: Fix race between device
 setup and open
Date: Thu, 11 Jan 2018 11:36:44 -0500 (EST)
Message-ID: <20180111.113644.936229336500292786.davem__1313.37392745099$1515688547$gmane$org@davemloft.net>
References: <f297b1a4-d287-ba66-ad44-bf6073950bdf@citrix.com>
 <20180111.110810.1332044409040498618.davem@davemloft.net>
 <0650f0ec-51ce-70ee-cd8a-6620f0c9eea8@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=93p6=eg=davemloft.net=davem@srs-us1.protection.inumbo.net>)
 id 1eZfqX-0008Q0-Nh
 for xen-devel@lists.xenproject.org; Thu, 11 Jan 2018 16:36:53 +0000
In-Reply-To: <0650f0ec-51ce-70ee-cd8a-6620f0c9eea8@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: ross.lagerwall@citrix.com
Cc: jgross@suse.com, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com, linux-kernel@vger.kernel.org, netdev@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

RnJvbTogUm9zcyBMYWdlcndhbGwgPHJvc3MubGFnZXJ3YWxsQGNpdHJpeC5jb20+CkRhdGU6IFRo
dSwgMTEgSmFuIDIwMTggMTY6Mjc6MjAgKzAwMDAKCj4gT24gMDEvMTEvMjAxOCAwNDowOCBQTSwg
RGF2aWQgTWlsbGVyIHdyb3RlOgo+PiBGcm9tOiBSb3NzIExhZ2Vyd2FsbCA8cm9zcy5sYWdlcndh
bGxAY2l0cml4LmNvbT4KPj4gRGF0ZTogVGh1LCAxMSBKYW4gMjAxOCAxNTo0OTowNyArMDAwMAo+
PiAKPj4+IEkndmUgbm93IGFkZGVkIENDJ2QgbmV0ZGV2IG9uIHRoZSBvdGhlciB0d28uCj4+IFRo
YXQgZG9lc24ndCB3b3JrLgo+PiBJZiB5b3UgZG9uJ3QgcG9zdCB0aGUgb3JpZ2luYWxzIGV4cGxp
Y2l0bHkgdG8gbmV0ZGV2IHRoZW4gaXQgd29uJ3QKPj4gZ2V0IHByb3Blcmx5IHF1ZXVlZCBpbiBw
YXRjaHdvcmsuCj4+IAo+IAo+IFRoZSBzZXJpZXMgZml4ZXMgdHdvIGNyYXNoZXMgd2hlbiB1c2lu
ZyBuZXRmcm9udC4gVGhlIGZpcnN0IGlzCj4gYWN0dWFsbHkgZml4ZWQgaW4gWGVuIGNvbW1vbiBj
b2RlLCBub3QgbmV0ZnJvbnQsIHdoaWNoIGlzIHdoeSBJIG9ubHkKPiBDQydkIG5ldGRldiBvbiB0
aGUgc2Vjb25kLiBJIGNhbiByZXNlbmQgdGhlIG9yaWdpbmFscyB0byBuZXRkZXYgaWYgeW91Cj4g
d2FudCBidXQgSU1PIGl0IGlzIG5vdCBuZWNlc3NhcnkuCgpFdmVyeW9uZSB3aG8gcmV2aWV3cyB0
aGUgbmV0d29ya2luZyBzaWRlIHdpbGwgYXBwcmVjaWF0ZSB0aGUgZnVsbApjb250ZXh0IG9mIHRo
ZSBwYXRjaCBzZXJpZXMgc28gdGhleSBjYW4gcmV2aWV3IHRoZSBuZXR3b3JraW5nIHBhcnQKaW4g
cHJvcGVyIGNvbnRleHQuCgpBbmQgaWYgaXQgaXMgZGVjaWRlZCB0aGF0IHRoZXNlIGNoYW5nZXMg
c2hvdWxkIGdvIHZpYSBteSBHSVQgdHJlZQp3b3VsZG4ndCB5b3Ugd2FudCBpdCB0byBiZSBhbGwg
c2V0dXAgcHJvcGVybHkgZm9yIHRoYXQgYWxyZWFkeSB3aXRob3V0CmhhdmluZyB0byBkbyBhbnl0
aGluZyBtb3JlIG9uIHlvdXIgcGFydD8KCkkgZG9uJ3Qgc2VlIHdoYXQgdGhlIHJlc2lzdGVuY2Ug
aXMgdG8gZ2l2aW5nIHBlb3BsZSBtb3JlIGluZm9ybWF0aW9uCmFuZCBhbGxvd2luZyBtb3JlIGZs
ZXhpYmlsaXR5IGZvciBpbnRlZ3JhdGluZyBhbmQgcmV2aWV3aW5nIHlvdXIKd29yay4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
