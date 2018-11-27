From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2] mm: make opt_bootscrub non-init
Date: Tue, 27 Nov 2018 03:13:27 -0700
Message-ID: <5BFD18C70200007800200459@prv1-mh.provo.novell.com>
References: <20181126175548.9977-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=2MkR=OG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gRaN5-0006Xx-7O
 for xen-devel@lists.xenproject.org; Tue, 27 Nov 2018 10:13:35 +0000
In-Reply-To: <20181126175548.9977-1-roger.pau@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI2LjExLjE4IGF0IDE4OjU1LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IC0tLSBhL3hlbi9jb21tb24vcGFnZV9hbGxvYy5jCj4gKysrIGIveGVuL2NvbW1vbi9wYWdlX2Fs
bG9jLmMKPiBAQCAtMTY2LDcgKzE2NiwxNCBAQCBlbnVtIGJvb3RzY3J1Yl9tb2RlIHsKPiAgICAg
IEJPT1RTQ1JVQl9PTiwKPiAgICAgIEJPT1RTQ1JVQl9JRExFLAo+ICB9Owo+IC1zdGF0aWMgZW51
bSBib290c2NydWJfbW9kZSBfX2luaXRkYXRhIG9wdF9ib290c2NydWIgPSBCT09UU0NSVUJfSURM
RTsKPiArLyoKPiArICogb3B0X2Jvb3RzY3J1YiBzaG91bGQgbGl2ZSBpbiB0aGUgaW5pdCBzZWN0
aW9uLCBzaW5jZSBpdCdzIG5vdCBhY2Nlc3NlZAo+ICsgKiBhZnRlcndhcmRzLiBIb3dldmVyIGF0
IGxlYXN0IExMVk0gYXNzdW1lcyB0aGVyZSBhcmUgbm8gc2lkZSBlZmZlY3RzIG9mCj4gKyAqIGFj
Y2Vzc2luZyB0aGUgdmFyaWFibGUsIGFuZCBvcHRpbWl6ZXMgdGhlIGNvbmRpdGlvbiBzbyBvcHRf
Ym9vdHNjcnViIGlzCgouLi4gdGhlIGNvbmRpdGlvbiBpbiBpbml0X2hlYXBfcGFnZXMoKSAuLi4K
Cih3aGljaCBJIGd1ZXNzIGNhbiBiZSBmb2xkZWQgaW4gd2hpbGUgY29tbWl0dGluZykuCgpKYW4K
Cj4gKyAqIHJlYWQgcmVnYXJkbGVzcyBvZiB0aGUgdmFsdWUgb2Ygc3lzdGVtX3N0YXRlOgo+ICsg
KiBodHRwczovL2J1Z3MubGx2bS5vcmcvc2hvd19idWcuY2dpP2lkPTM5NzA3IAo+ICsgKi8KPiAr
c3RhdGljIGVudW0gYm9vdHNjcnViX21vZGUgX19yZWFkX21vc3RseSBvcHRfYm9vdHNjcnViID0g
Qk9PVFNDUlVCX0lETEU7Cj4gIHN0YXRpYyBpbnQgX19pbml0IHBhcnNlX2Jvb3RzY3J1Yl9wYXJh
bShjb25zdCBjaGFyICpzKQo+ICB7Cj4gICAgICAvKiBJbnRlcnByZXQgJ2Jvb3RzY3J1YicgYWxv
bmUgaW4gaXRzIHBvc2l0aXZlIGJvb2xlYW4gZm9ybSAqLwoKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
