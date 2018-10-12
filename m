From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] x86: deal with firmware setting bogus
 TSC_ADJUST values
Date: Fri, 12 Oct 2018 17:29:02 +0100
Message-ID: <20181012162902.jejwgf5x77lpk7k3@zion.uk.xensource.com>
References: <5BB2243402000078001ED45C@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=zta5=my=citrix.com=prvs=8166c57ff=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gB0JH-00035g-0X
 for xen-devel@lists.xenproject.org; Fri, 12 Oct 2018 16:29:07 +0000
Content-Disposition: inline
In-Reply-To: <5BB2243402000078001ED45C@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBPY3QgMDEsIDIwMTggYXQgMDc6NDI6MTJBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gVGhlIHN5c3RlbSBJbnRlbCBoYXZlIGhhbmRlZCBtZSBmb3IgQVZYNTEyIGVtdWxhdG9y
IHdvcmsgKCJHaWdhYnl0ZQo+IFRlY2hub2xvZ3kgQ28uLCBMdGQuIFgyOTkgQU9SVVMgR2FtaW5n
IDMgUHJvL1gyOTkgQU9SVVMgR2FtaW5nIDMKPiBQcm8tQ0YsIEJJT1MgRjMgMTIvMjgvMjAxNyIp
IHdvdWxkIG5vdCBjb21lIHVwIHVuZGVyIFhlbiAtIGl0IGh1bmcgaW4KPiB0aGUgbWlkZGxlIG9m
IERvbTAgUENJIGluaXRpYWxpemF0aW9uLiBBcyBpdCB0dXJuZWQgb3V0LCBYZW4ncyB0aW1lCj4g
bWFuYWdlbWVudCBkaWQgbm90IHdvcmsgYmVjYXVzZSBvZiB0aGUgZmlybXdhcmUgc2V0dGluZyAo
b25seSkgdGhlIGJvb3QKPiBDUFUncyBUU0NfQURKVVNUIE1TUiB0byBhIGxhcmdlIG5lZ2F0aXZl
IHZhbHVlIChvbiB0aGUgb3JkZXIgb2YgLTJeNTApLgo+IAo+IEZvbGxvdyBMaW51eCAoYWxzbyBz
aGFtZWxlc3NseSBzdGVhbGluZyB0aGVpciBjb21tZW50cykgaW4KCklzIHRoZXJlIGEgc3BlY2lm
aWMgY29tbWl0IG9yIGEgcmFuZ2Ugb2YgY29tbWl0cyBpbiBMaW51eCB0aGF0IHlvdSBjYW4KcHV0
IGhlcmU/Cgo+IC0gY2xlYXJpbmcgdGhlIHJlZ2lzdGVyIGZvciB0aGUgYm9vdCBDUFUgKHdlIGRv
bid0IGhhdmUgYSBuZWVkIGZvcgo+ICAgZXhjZXB0aW9ucyBoZXJlIHlldCwgYXMgdGhlIG9ubHkg
ZXhjZXB0aW9uIGluIExpbnV4IGlzIGEgY2xhc3Mgb2YKPiAgIHN5c3RlbXMgWGVuIGRvZXNuJ3Qg
d29yayBvbiBhbnl3YXkgYXMgZmFyIGFzIEknbSBhd2FyZSksCj4gLSBmb3JjaW5nIG5vbi1uZWdh
dGl2ZSB2YWx1ZXMgdW5pZm9ybWx5LAo+IC0gc3luY2luZyB0aGUgcmVnaXN0ZXJzIHdpdGhpbiBz
b2NrZXRzLgo+IExpbnV4IGNhcHMgYXQgMHg3ZmZmZmZmZiBhcyB3ZWxsLCBidXQgdGhlaXIgY29t
bWVudCBzYXlpbmcgImFzIHRob3NlCj4gd3JlY2thZ2UgdGhlIHRpbWVyIGFzIHdlbGwiIGRvZXMs
IHRvIG1lIGF0IGxlYXN0LCBuZWl0aGVyIHJlYWxseSBleHBsYWluCgpJIHRyaWVkIHRvIHBpbiBk
b3duIHdoYXQgTGludXggZG9lcyBieSBzZWFyY2hpbmcgdGhlIGNvbW1lbnQgaGVyZSBidXQKbm90
aGluZyBzaG93ZWQgdXAgLS0gc2VhcmNoaW5nICJ3cmVja2FnZSIgb24gTGludXggbWFzdGVyIG9u
bHkgeWllbGRlZAp0aHJlZSByZXN1bHRzLCBub25lIG9mIHdoaWNoIG1hdGNoZWQgdGhlIG9uZSB5
b3Ugd3JvdGUgaGVyZS4KCldlaS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
