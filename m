From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2 2/6] x86/xpti: don't flush TLB twice when
 switching to 64-bit pv context
Date: Tue, 6 Mar 2018 08:02:23 +0100
Message-ID: <0d0b9c62-6375-6575-813d-974206e5925e@suse.com>
References: <20180302081403.16953-1-jgross@suse.com>
 <20180302081403.16953-3-jgross@suse.com> <5A9D831F02000078001AEB7E@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=xqmt=f4=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1et6cE-0003fR-Ua
 for xen-devel@lists.xenproject.org; Tue, 06 Mar 2018 07:02:26 +0000
In-Reply-To: <5A9D831F02000078001AEB7E@suse.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: andrew.cooper3@citrix.com, wei.liu2@citrix.com, xen-devel@lists.xenproject.org, Dario Faggioli <dfaggioli@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDUvMDMvMTggMTc6NDksIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDAyLjAzLjE4IGF0
IDA5OjEzLCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPj4gQEAgLTUwOSw5ICs1MTAsMTYgQEAg
dm9pZCBtYWtlX2NyMyhzdHJ1Y3QgdmNwdSAqdiwgbWZuX3QgbWZuKQo+PiAgCj4+ICB2b2lkIHdy
aXRlX3B0YmFzZShzdHJ1Y3QgdmNwdSAqdikKPj4gIHsKPj4gLSAgICBnZXRfY3B1X2luZm8oKS0+
cm9vdF9wZ3RfY2hhbmdlZCA9IHRoaXNfY3B1KHJvb3RfcGd0KSAmJiBpc19wdl92Y3B1KHYpICYm
Cj4+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAhaXNfcHZfMzJiaXRf
dmNwdSh2KTsKPj4gLSAgICB3cml0ZV9jcjModi0+YXJjaC5jcjMpOwo+PiArICAgIGlmICggdGhp
c19jcHUocm9vdF9wZ3QpICYmIGlzX3B2X3ZjcHUodikgJiYgIWlzX3B2XzMyYml0X3ZjcHUodikg
KQo+PiArICAgIHsKPj4gKyAgICAgICAgZ2V0X2NwdV9pbmZvKCktPnJvb3RfcGd0X2NoYW5nZWQg
PSB0cnVlOwo+PiArICAgICAgICBhc20gdm9sYXRpbGUgKCAibW92ICUwLCAlJWNyMyIgOiA6ICJy
IiAodi0+YXJjaC5jcjMpIDogIm1lbW9yeSIgKTsKPj4gKyAgICB9Cj4+ICsgICAgZWxzZQo+PiAr
ICAgIHsKPj4gKyAgICAgICAgZ2V0X2NwdV9pbmZvKCktPnJvb3RfcGd0X2NoYW5nZWQgPSBmYWxz
ZTsKPiAKPiBJcyB0aGlzIHdyaXRlIHJlYWxseSBuZWNlc3Nhcnk/CgpQcm9iYWJseSBub3QuIEkn
bGwgZHJvcCBpdC4KCgpKdWVyZ2VuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
