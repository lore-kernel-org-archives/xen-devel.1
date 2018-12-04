From: Zhao Yan <yan.y.zhao@intel.com>
Subject: Re: [PATCH v2] xen/pt: Fix a xen passthrough failure
Date: Tue, 4 Dec 2018 02:36:18 -0500
Message-ID: <20181204073618.GB8671@joy-OptiPlex-7040>
References: <20181203050438.6034-1-yan.y.zhao@intel.com>
 <f056b5d1-02c2-2ee7-3e37-bc5e4869f0cb@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=z+b2=on=intel.com=yan.y.zhao@srs-us1.protection.inumbo.net>)
 id 1gU5K0-00010b-Uy
 for xen-devel@lists.xenproject.org; Tue, 04 Dec 2018 07:40:44 +0000
Content-Disposition: inline
In-Reply-To: <f056b5d1-02c2-2ee7-3e37-bc5e4869f0cb@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: sstabellini@kernel.org, qemu-devel@nongnu.org, JBeulich@suse.com, anthony.perard@citrix.com, xen-devel@lists.xenproject.org, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

aGkgQW5kcmV3LAoKSXQncyBhIHBjaSBkZXZpY2UgdGhhdCBkb2VzIG5vdCBzdXBwb3J0IGxlZ2Fj
eSBpbnR4IG1vZGUsIGJ1dCBpdCBhY2NpZGVudGx5CnJlcG9ydHMgUENJX0lOVEVSUlVQVF9QSU4g
YXMgMSwgd2hpY2ggc2hvdWxkIGJlIDAgaW5zdGVhZC4KU28sIGluIGRvbTAsIHRoZSBtYWNoaW5l
IGlycSBpcyAwLCB3aGljaCB3aWxsIGNhdXNlIGxhdGVyCnhjX3BoeXNkZXZfbWFwX3BpcnEoKSBm
YWlsIGFuZCBwYXNzdGhyb3VnaCBmYWlsdXJlLgoKVGhlcmVmb3JlLCB3ZSB0cmVhdCB0aGlzIGNh
c2UgYXMgUENJX0lOVEVSUlVQVF9QSU4gaXMgMCBhbmQgcmVwb3J0IHRvIGd1ZXN0CnRoZSByaWdo
dCB2YWx1ZSAoMCkgb2YgUENJX0lOVEVSUlVQVF9QSU4uClRoZW4gaW4gZ3Vlc3QsIGl0J3MgYWJs
ZSB0byB1c2UgbXNpIG1vZGUgYW5kIGZ1bmN0aW9uIG5vcm1hbGx5LgoKT24gTW9uLCBEZWMgMDMs
IDIwMTggYXQgMDI6MTI6NThQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAwMy8x
Mi8yMDE4IDA1OjA0LCBaaGFvIFlhbiB3cm90ZToKPiA+IEZvciBzb21lIHBjaSBkZXZpY2UsIGV2
ZW4gaXRzIFBDSV9JTlRFUlJVUFRfUElOIGlzIG5vdCAwLCBpdCBhY3R1YWxseQo+ID4gZG9lc24n
dCBzdXBwb3J0IElOVHggbW9kZSwgc28gaXRzIG1hY2hpbmUgaXJxIHJlYWQgZnJvbSBob3N0IHN5
c2ZzIGlzIDAuCj4gPiBJbiB0aGF0IGNhc2UsIHJlcG9ydCBQQ0lfSU5URVJSVVBUX1BJTiBhcyAw
IHRvIGd1ZXN0IGFuZCBsZXQgcGFzc3Rocm91Z2gKPiA+IGNvbnRpbnVlLgo+IAo+IFdoYXQgY2F1
c2VzIHRoaXMgcHJvYmxlbT/CoCBJdCBpdCBhIG5vbi1QQ0kgY29tcGxpYW50IGRldmljZT/CoCBJ
cyBpdCBhCj4gZGV2aWNlIHdoaWNoIGhhcyBsZWdhY3kgbGluZXMgcHJvaGliaXRlZD8KPiAKPiB+
QW5kcmV3CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
