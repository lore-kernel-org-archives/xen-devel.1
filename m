From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v6 2/4] xen/arm: use SYMBOL when required
Date: Fri, 11 Jan 2019 08:58:26 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1901110855210.27759@sstabellini-ThinkPad-X260>
References: <alpine.DEB.2.10.1901091537100.15373@sstabellini-ThinkPad-X260>
 <1547077324-9705-2-git-send-email-sstabellini@kernel.org>
 <5C370549020000780020C1A5@prv1-mh.provo.novell.com>
 <alpine.DEB.2.10.1901100940260.27759@sstabellini-ThinkPad-X260>
 <5C38756E020000780020C9B9@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bhUh=PT=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1gi08b-0001Ea-0R
 for xen-devel@lists.xenproject.org; Fri, 11 Jan 2019 16:58:29 +0000
In-Reply-To: <5C38756E020000780020C9B9@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Stefano Stabellini <stefanos@xilinx.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCAxMSBKYW4gMjAxOSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gPj4gPiAtLS0gYS94ZW4v
YXJjaC9hcm0vc2V0dXAuYwo+ID4+ID4gKysrIGIveGVuL2FyY2gvYXJtL3NldHVwLmMKPiA+PiA+
IEBAIC03NzIsOCArNzcyLDEwIEBAIHZvaWQgX19pbml0IHN0YXJ0X3hlbih1bnNpZ25lZCBsb25n
IGJvb3RfcGh5c19vZmZzZXQsCj4gPj4gPiAgCj4gPj4gPiAgICAgIC8qIFJlZ2lzdGVyIFhlbidz
IGxvYWQgYWRkcmVzcyBhcyBhIGJvb3QgbW9kdWxlLiAqLwo+ID4+ID4gICAgICB4ZW5fYm9vdG1v
ZHVsZSA9IGFkZF9ib290X21vZHVsZShCT09UTU9EX1hFTiwKPiA+PiA+IC0gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIChwYWRkcl90KSh1aW50cHRyX3QpKF9zdGFydCArIGJvb3RfcGh5c19v
ZmZzZXQpLAo+ID4+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKHBhZGRyX3QpKHVp
bnRwdHJfdCkoX2VuZCAtIF9zdGFydCArIDEpLCBmYWxzZSk7Cj4gPj4gPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAocGFkZHJfdCkodWludHB0cl90KShTWU1CT0woX3N0YXJ0KSArCj4g
Pj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBi
b290X3BoeXNfb2Zmc2V0KSwKPiA+PiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIChw
YWRkcl90KSh1aW50cHRyX3QpKFNZTUJPTChfZW5kKSAtCj4gPj4gPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBTWU1CT0woX3N0YXJ0KSArIDEpLCBm
YWxzZSk7Cj4gPj4gCj4gPj4gV2h5IHlvdSBuZWVkIHRoZSBkb3VibGUgY2FzdHMsIGkuZS4gd2h5
IGRvZXMgKHVpbnRwdHJfdCkgYWxvbmUgbm90Cj4gPj4gc3VmZmljZT8KPiA+IAo+ID4gVGhlIG9y
aWdpbmFsIHJlYXNvbiB3YXMganVzdCBub3QgdG8gY2hhbmdlIHRoZSBleGlzdGluZyBjb2RlIG91
dHNpZGUgb2YKPiA+IGFkZGluZyBTWU1CT0wgOi0pCj4gPiAKPiA+IEJ1dCB0byBhbnN3ZXIgeW91
ciBxdWVzdGlvbiwgdWludHB0cl90IGlzIHRoZSBzYW1lIHNpemUgb2YgY2hhciosIHdoaWxlCj4g
PiBwYWRkcl90IGlzIGFsd2F5cyA2NGJpdC4gdWludHB0cl90IGNhc3RzIHRvIGludGVnZXIgdHlw
ZSwgcGFkZHJfdCBjYXN0cwo+ID4gdG8gdGhlIHJpZ2h0IHNpemUuIEkgZG9uJ3QgdGhpbmsgaXQg
aXMgYWxsb3dlZCB0byBjaGFuZ2UgZnJvbSBwb2ludGVyIHRvCj4gPiBpbnRlZ2VyIGFuZCBjaGFu
Z2UgaW50ZWdlciBzaXplIGluIGEgc2luZ2xlIGNhc3QuCj4gCj4gQ29ycmVjdCwgYnV0IHRoYXQn
cyBub3Qgd2hhdCBJJ3ZlIGJlZW4gYXNraW5nIGZvci4gSW5zdGVhZCBJJ2QgbGlrZQo+IHRvIHNl
ZSB0aGUgKHBhZGRyX3QpIGNhc3RzIGRyb3BwZWQsIGF0IGxlYXN0IGlmIHRoaXMgd2FzIGluIGNv
ZGUgSSdtCj4gdGhlIG1haW50YWluZXIgZm9yLgoKQnV0IGFkZF9ib290X21vZHVsZSB0YWtlcyBw
YWRkcl90IGFzIGFyZ3VtZW50cy4gV2h5IHdvdWxkIHlvdSB3YW50IHRoZQpleHBsaWNpdCBjYXN0
IGRyb3BwZWQ/IEp1c3QgdG8gcmVseSBvbiB0aGUgaW1wbGljaXQgY2FzdD8gVGhpcyB3YXkgaXMK
Y2xlYXJlciwgYnV0IGVpdGhlciB3YXkgaXMgZmluZSBieSBtZSBCVFcuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
