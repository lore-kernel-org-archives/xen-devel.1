From: "Jan Beulich" <jbeulich@suse.com>
Subject: Re: [PATCH] shim: Fix generation of compat/callback.i:
 allow redef of OBJECT vars
Date: Thu, 19 Jul 2018 12:32:34 -0600
Message-ID: <5B50D9420200007800137603@prv1-mh.provo.novell.com>
References: <1531956796-7465-1-git-send-email-christopher.w.clark@gmail.com>
 <5B5036A802000078001D5AE3@prv1-mh.provo.novell.com>
 <alpine.DEB.2.10.1807190955250.19154@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=hpq6=kd=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fgDjE-0008Ht-0f
 for xen-devel@lists.xenproject.org; Thu, 19 Jul 2018 18:32:40 +0000
In-Reply-To: <alpine.DEB.2.10.1807190955250.19154@sstabellini-ThinkPad-X260>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: sstabellini@kernel.org
Cc: wei.liu2@citrix.com, George.Dunlap@eu.citrix.com, andrew.cooper3@citrix.com, Ian.Jackson@eu.citrix.com, christopher.w.clark@gmail.com, tim@xen.org, julien.grall@arm.com, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

Cj4+PiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+IDA3LzE5LzE4
IDc6MDAgUE0gPj4+Cj5PbiBUaHUsIDE5IEp1bCAyMDE4LCBKYW4gQmV1bGljaCB3cm90ZToKPj4g
PiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGhlciBDbGFyayA8Y2hyaXN0b3BoZXIuY2xhcms2QGJh
ZXN5c3RlbXMuY29tPgo+PiA+IC0tLQo+PiA+IFBsZWFzZSB1c2UgbXkgZ21haWwgYWRkcmVzcyBm
b3IgYW55IGNvcnJlc3BvbmRlbmNlIHRvIG1lLgo+PiAKPj4gSSB0aGluayBpdCBpcyBnZW5lcmFs
bHkgY29uc2lkZXJlZCBiYWQgcHJhY3RpY2UgdG8gaGF2ZSBGcm9tOiBhbmQgUy1vLWIKPj4gZGlm
ZmVyLgo+Cj5XaHk/IFRoYXQgaXMgcGVyZmVjdGx5IGZpbmUuIFNpZ25lZC1vZmYtYnkgaXMgYWJv
dXQgY29weXJpZ2h0IG9mIHRoZQo+Y29kZSB3aGlsZSBGcm9tOiBpcyBhYm91dCBhdXRob3JzaGlw
LiAKCgpXZWxsLCBpbiB0aGlzIHBhcnRpY3VsYXIgY2FzZSBDaHJpc3RvcGhlciBoYWQgZXZlbiBh
c2tlZCB0aGF0IGNvbW11bmljYXRpb24KdG8gZ28gdG8gdGhlIG1haWwgYWRkcmVzcyBoZSBzZW50
IGZyb20uIEhvdyBpcyBhbnlvbmUgZ29pbmcgdG8ga25vdyB0aGF0IGlmCmp1ZGdpbmcganVzdCBm
cm9tIHRoZSBldmVudHVhbCBjb21taXQgaW4gZ2l0PwoKQmVzaWRlcyB0aGF0IC0gaG93IGRvZXMg
YW55b25lIGtub3cgd2hldGhlciB0aGUgdHdvIGFyZSBhY3R1YWxseSBhZGRyZXNzZXMKb2YgdGhl
IHNhbWUgcGVyc29uPwoKCkphbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
