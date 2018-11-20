From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 4/4] x86/pv: Expose RDTSCP to PV guests
Date: Tue, 20 Nov 2018 08:14:28 -0700
Message-ID: <5BF424D402000078001FE18A@prv1-mh.provo.novell.com>
References: <1542318438-20319-1-git-send-email-andrew.cooper3@citrix.com>
 <1542318438-20319-5-git-send-email-andrew.cooper3@citrix.com>
 <5BF3EABE02000078001FDEC8@prv1-mh.provo.novell.com>
 <4e260daf-07fb-bbb1-8435-4f8312232253@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <4e260daf-07fb-bbb1-8435-4f8312232253@citrix.com>
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
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>, Xen-devel <xen-devel@lists.xen.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIwLjExLjE4IGF0IDEyOjI5LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMjAvMTEvMjAxOCAxMTowNiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDE1
LjExLjE4IGF0IDIyOjQ3LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4+PiBU
aGUgZmluYWwgcmVtbmFuYXQgb2YgUFZSRFRTQ1AgaXMgdGhhdCB3ZSB3b3VsZCBlbXVsYXRlIFJE
VFNDUCBldmVuIG9uCj4+PiBoYXJkd2FyZSB3aGljaCBsYWNrZWQgdGhlIGluc3RydWN0aW9uLiAg
UkRUU0NQIGlzIGF2YWlsYWJsZSBvbiBhbG1vc3QgYWxsCj4+PiA2NC1iaXQgeDg2IGhhcmR3YXJl
Lgo+Pj4KPj4+IFJlbW92ZSB0aGlzIGVtdWxhdGlvbiwgZHJvcCB0aGUgVFNDX01PREVfUFZSRFRT
Q1AgY29uc3RhbnQsIGFuZCBhbGxvdyBSRFRTQ1AKPj4+IGluIGEgUFYgZ3Vlc3QncyBDUFVJRCBw
b2xpY3kuCj4+IFdoeSB3b3VsZCB3ZSBub3Qgd2FudCB0byBlbXVsYXRlIHRoZSBpbnNuIHdoZW4g
dW5hdmFpbGFibGUsIHdoZW4KPj4gaXQncyBnZW5lcmFsbHkgdXNlZnVsIHRvIGd1ZXN0cz8KPiAK
PiBGb3IgZXhhY3RseSB0aGUgc2FtZSBraW5kIG9mIHNhZmV0eSByZWFzb25zIGFzIGZvciB3aHkg
d2UgZG9uJ3QgdG9sZXJhdGUKPiBkb2luZyB0aGlzIGluIEhWTSBndWVzdHMgaW4gZ2VuZXJhbC4K
CkJ1dCBpbW8gd2Ugc2hvdWxkIHN0YXJ0IGRvaW5nIHNvIGZvciBjZXJ0YWluIGZlYXR1cmVzLiBJ
biBwYXJ0aWN1bGFyCkkgdGhpbmsgd2UgaGFkIGFncmVlZCB0byB0cnkgdG8gc3VwcG9ydCBVTUlQ
IGV2ZW4gb24gaW5jYXBhYmxlCmhhcmR3YXJlLiBZb3UgaGFkIG1lcmVseSBhc2tlZCB0byBwb3N0
cG9uZSBteSBwYXRjaCB0byB0aGlzCmVmZmVjdCB1bnRpbCBtb3JlIG9mIHRoZSBDUFVJRCBpbmZy
YXN0cnVjdHVyZSB3YXMgaW4gcGxhY2UgKHdoaWNoCmFmYWljdCBpdCBzdGlsbCBpc24ndCkuCgo+
IEFzIGl0IHN0YW5kcywgaXQgaXMgYW4gdW5uZWNlc3NhcnkgYXR0YWNrIHN1cmZhY2UsIGFuZCBp
ZiB3ZSB3ZXJlIHRvCj4gcmUtaW50cm9kdWNlIHRoZSBmdW5jdGlvbmFsaXR5IChub3QgdGhhdCBJ
IGNhbiBzZWUgYSB2YWxpZCByZWFzb24gdG8pLAo+IGl0IHNob3VsZCB1c2UgeDg2X2VtdWxhdGUo
KSByYXRoZXIgdGhhbiBvcGVuY29kaW5nIHRoZSBsb2dpYy4KCkhvdyBtdWNoIGxhcmdlciBpcyB0
aGUgYXR0YWNrIHN1cmZhY2Ugb2YgZW11bGF0ZV9pbnZhbGlkX3JkdHNjcCgpCmNvbXBhcmVkIHRv
IGVtdWxhdGVfZm9yY2VkX2ludmFsaWRfb3AoKT8KCkphbgoKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
