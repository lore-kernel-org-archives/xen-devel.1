From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH] shut down domain when last vCPU goes down
Date: Fri, 16 Feb 2018 15:52:48 +0000
Message-ID: <20180216155248.ni6vg3botbbwvb74@MacBook-Pro-de-Roger.local>
References: <5A87028802000078001A8759@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=c1s1=fk=citrix.com=prvs=57802d2d1=roger.pau@srs-us1.protection.inumbo.net>)
 id 1emiJr-00057p-Ty
 for xen-devel@lists.xenproject.org; Fri, 16 Feb 2018 15:53:03 +0000
Content-Disposition: inline
In-Reply-To: <5A87028802000078001A8759@prv-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBGZWIgMTYsIDIwMTggYXQgMDg6MTA6NDhBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gSSd2ZSBqdXN0IGhhZCB0byBkZWFsIHdpdGggYW4gZWFybHkgYm9vdCBjcmFzaCBvZiBM
aW51eCB3aGljaCBvY2N1cnJlZAo+IHNvIGVhcmx5IHRoYXQgZXZlbiAiZWFybHlwcmludGs9eGVu
IiBkaWQgbm90IHByb2R1Y2UgYW55IHVzZWZ1bCBvdXRwdXQuCj4gSGVuY2UgdGhlIGRvbWFpbiBh
cHBlYXJlZCB0byBoYW5nLCB3aGlsZSBpbiBmYWN0IGl0IGhhZCBicm91Z2h0IGRvd24gaXRzCj4g
b25seSB2Q1BVLiBCeSB0cmFuc2xhdGluZyB0aGlzIHRvIGEgc2h1dGRvd24sIHRoZSBzaXR1YXRp
b24gd2lsbCBiZQo+IGJldHRlciByZWNvZ25pemFibGUuCj4gCj4gU2lnbmVkLW9mZi1ieTogSmFu
IEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKUmV2aWV3ZWQtYnk6IFJvZ2VyIFBhdSBNb25u
w6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgoKSSdtIHdvbmRlcmluZywgaXMgaXQgY29tbW9uIGZv
ciBhIGRvbWFpbiB0byBzaHV0ZG93biBieSBzaHV0dGluZyBkb3duCmFsbCBpdCdzIHZDUFVzPwoK
SW4gdGhlIHNjZW5hcmlvIHRoYXQgeW91IGRlc2NyaWJlIGFib3ZlIGl0IHNlZW1zIGl0IHdvdWxk
IGJlIG1vcmUKaGVscGZ1bCB0byBpc3N1ZSBhIFNIVVRET1dOX2NyYXNoIGluc3RlYWQgbWF5YmUg
d2l0aCBhIGdkcHJpbnRrCm1lc3NhZ2UgaW4gb3JkZXIgdG8gYWlkIGRlYnVnZ2luZy4KClJvZ2Vy
LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
