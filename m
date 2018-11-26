From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH] xen: only clobber multicall elements
 without error
Date: Mon, 26 Nov 2018 15:40:13 +0000
Message-ID: <23548.5085.66289.477986@mariner.uk.xensource.com>
References: <20181123132516.28681-1-jgross@suse.com>
 <5BFBD1C602000078001FFE09@prv1-mh.provo.novell.com>
 <23548.2354.97061.49099@mariner.uk.xensource.com>
 <b8bc03f0-d305-951d-b11d-d44caa9b61f9@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xEEY=OF=citrix.com=prvs=86143bd3e=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1gRJA1-0007Gz-MP
 for xen-devel@lists.xenproject.org; Mon, 26 Nov 2018 15:50:57 +0000
In-Reply-To: <b8bc03f0-d305-951d-b11d-d44caa9b61f9@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

SnVlcmdlbiBHcm9zcyB3cml0ZXMgKCJSZTogW1BBVENIXSB4ZW46IG9ubHkgY2xvYmJlciBtdWx0
aWNhbGwgZWxlbWVudHMgd2l0aG91dCBlcnJvciIpOgo+IE9uIDI2LzExLzIwMTggMTU6NTQsIElh
biBKYWNrc29uIHdyb3RlOgo+ID4gTWF5YmUgdGhleSBjb3VsZCBiZSBjbG9iYmVyZWQgbG9zc2xl
c3NseSA/ICBFZywgYnkgeG9yaW5nIHdpdGggMHhhYSBvcgo+ID4gc29tZXRoaW5nLgo+IAo+IFRo
aXMgd291bGQgYmUgcmF0aGVyIGhhY2t5OiBJJ2QgbmVlZCB0byBmaW5kIG91dCBpZiBjbG9iYmVy
aW5nIHdhcwo+IHBlcmZvcm1lZCBvciBub3QgYW5kIHRoZSB3YXkgb2YgY2xvYmJlcmluZyB3b3Vs
ZCBiZSBraW5kIG9mIGFuIGludGVyZmFjZQo+IHdoaWNoIEkgZ3Vlc3Mgd2UnZCBsaWtlIHRvIGF2
b2lkLgoKWW91IGNhbiBiYWtlIHRoZSBwcmVjaXNlIG1ldGhvZCBvZiBjbG9iYmVyaW5nIGludG8g
eW91ciBrZXJuZWwKZGVidWdnaW5nIGR1bXAgc3R1ZmYsIGFsb25nIHdpdGggYSBtZWNoYW5pc20g
d2hpY2ggZ3Vlc3NlcyB3aGV0aGVyCnRoaW5ncyBoYXZlIGJlZW4gY2xvYmJlcmVkLCBzbyBsb25n
IGFzIHlvdSBkb24ndCBnbyB1dHRlcmx5IHdyb25nIGlmCnlvdXIgZ3Vlc3NlcyBhcmUgd3Jvbmcu
CgpTaW5jZSBhZnRlciBhbGwgWGVuIGRvZXNuJ3QgZ3VhcmFudGVlIHRvIHByZXNlcnZlIHRoZSBh
cmd1bWVudHMgYXQKYWxsLCBhbmQgdGhlcmVmb3JlIHlvdSBtdXN0bid0IHJlbHkgb24gaXQgYW55
d2F5LgoKVGhpcyBzZWVtcyBmaW5lIGZvciBhIGRlYnVnIGR1bXAgbWVjaGFuaXNtIC0gZGVidWcg
ZHVtcCBtZWNoYW5pc21zIGFyZQpnZW5lcmFsbHkgYmVzdCBlZmZvcnQgYW55d2F5LgoKSWFuLgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
