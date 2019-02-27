From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 1/6] xen: extend XEN_DOMCTL_memory_mapping
 to handle cacheability
Date: Wed, 27 Feb 2019 03:34:01 -0700
Message-ID: <5C766799020000780021AA28@prv1-mh.provo.novell.com>
References: <alpine.DEB.2.10.1902261501020.20689@sstabellini-ThinkPad-X260>
 <1551222427-21749-1-git-send-email-sstabellini@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zqed=RC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gywXN-0004Ut-T4
 for xen-devel@lists.xenproject.org; Wed, 27 Feb 2019 10:34:05 +0000
In-Reply-To: <1551222427-21749-1-git-send-email-sstabellini@kernel.org>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>, Stefano Stabellini <stefanos@xilinx.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI3LjAyLjE5IGF0IDAwOjA3LCA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6
Cj4gLS0tIGEveGVuL2luY2x1ZGUvcHVibGljL2RvbWN0bC5oCj4gKysrIGIveGVuL2luY2x1ZGUv
cHVibGljL2RvbWN0bC5oCj4gQEAgLTU3MSwxMiArNTcxLDE0IEBAIHN0cnVjdCB4ZW5fZG9tY3Rs
X2JpbmRfcHRfaXJxIHsKPiAgKi8KPiAgI2RlZmluZSBEUENJX0FERF9NQVBQSU5HICAgICAgICAg
MQo+ICAjZGVmaW5lIERQQ0lfUkVNT1ZFX01BUFBJTkcgICAgICAwCj4gKyNkZWZpbmUgQ0FDSEVB
QklMSVRZX0RFVk1FTSAgICAgIDAgLyogZGV2aWNlIG1lbW9yeSwgdGhlIGRlZmF1bHQgKi8KPiAr
I2RlZmluZSBDQUNIRUFCSUxJVFlfTUVNT1JZICAgICAgMSAvKiBub3JtYWwgbWVtb3J5ICovCj4g
IHN0cnVjdCB4ZW5fZG9tY3RsX21lbW9yeV9tYXBwaW5nIHsKPiAgICAgIHVpbnQ2NF9hbGlnbmVk
X3QgZmlyc3RfZ2ZuOyAvKiBmaXJzdCBwYWdlIChodm0gZ3Vlc3QgcGh5cyBwYWdlKSBpbiByYW5n
ZSAqLwo+ICAgICAgdWludDY0X2FsaWduZWRfdCBmaXJzdF9tZm47IC8qIGZpcnN0IHBhZ2UgKG1h
Y2hpbmUgcGFnZSkgaW4gcmFuZ2UgKi8KPiAgICAgIHVpbnQ2NF9hbGlnbmVkX3QgbnJfbWZuczsg
ICAvKiBudW1iZXIgb2YgcGFnZXMgaW4gcmFuZ2UgKD4wKSAqLwo+ICAgICAgdWludDMyX3QgYWRk
X21hcHBpbmc7ICAgICAgIC8qIGFkZCBvciByZW1vdmUgbWFwcGluZyAqLwo+IC0gICAgdWludDMy
X3QgcGFkZGluZzsgICAgICAgICAgIC8qIHBhZGRpbmcgZm9yIDY0LWJpdCBhbGlnbmVkIHN0cnVj
dHVyZSAqLwo+ICsgICAgdWludDMyX3QgY2FjaGVfcG9saWN5OyAgICAgIC8qIGNhY2hlYWJpbGl0
eSBvZiB0aGUgbWVtb3J5IG1hcHBpbmcgKi8KPiAgfTsKCkkgZG9uJ3QgdGhpbmsgREVWTUVNIGFu
ZCBNRU1PUlkgYXJlIGFueXdoZXJlIG5lYXIgZGVzY3JpcHRpdmUKZW5vdWdoLCBub3IgLSBpZiB3
ZSB3YW50IHN1Y2ggY29udHJvbCBhbnl3YXkgLSBmbGV4aWJsZSBlbm91Z2guIEkKdGhpbmsgd2hh
dCB5b3Ugd2FudCBpcyB0byBhY3R1YWxseSBzcGVjaWZ5IGNhY2hhYmlsaXR5LCBhbGxvd2luZyBv
bgp4ODYgdG8gZS5nLiBtYXAgZnJhbWUgYnVmZmVycyBvciBhbGlrZSBXQy4gVGhlIGF0dHJpYnV0
ZSB0aGVuCndvdWxkIChvYnZpb3VzbHkgYW5kIG5lY2Vzc2FyaWx5KSBiZSBhcmNoaXRlY3R1cmUg
c3BlY2lmaWMuCgpJbiB2UENJIGNvZGUgdGhlIHF1ZXN0aW9uIHRoZW4gd2lsbCBiZWNvbWUgd2hl
dGhlciBwcmVmZXRjaGFibGUKQkFScyBzaG91bGRuJ3QgYmUgbWFwcGVkIGUuZy4gV1QgaW5zdGVh
ZCBvZiBVQyAoYW5kIHdoYXRldmVyCnRoZSBBcm0gZXF1aXZhbGVudCBpcywgYXNzdW1pbmcgUENJ
IHN1cHBvcnQgd2lsbCBldmVudHVhbGx5IGdldAphZGRlZCB0byBBcm02NCwgYXMgaXQgc2VlbXMg
aXQgaGFzIGJlZW4gdGhlIGludGVudGlvbiBmb3IgcXVpdGUKc29tZSB0aW1lKS4KCkphbgoKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
