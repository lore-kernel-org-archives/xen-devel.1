From: George Dunlap <dunlapg@umich.edu>
Subject: Re: [PATCH] xl/libxl: add pvcalls support
Date: Tue, 13 Mar 2018 14:33:15 +0000
Message-ID: <CAFLBxZYZHm1KBRCyusU-pPE7DPA6hTt_SvmhaQnQs-wDWU5e-A@mail.gmail.com>
References: <alpine.DEB.2.10.1802271323350.4239@sstabellini-ThinkPad-X260>
 <20180313141326.vfzb6z44xln5ccdj@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=spjw=gd=gmail.com=dunlapg@srs-us1.protection.inumbo.net>)
 id 1evkzO-0007ac-Fo
 for xen-devel@lists.xenproject.org; Tue, 13 Mar 2018 14:33:18 +0000
Received: by mail-qt0-x22a.google.com with SMTP id l25so22931876qtj.1
 for <xen-devel@lists.xenproject.org>; Tue, 13 Mar 2018 07:33:16 -0700 (PDT)
In-Reply-To: <20180313141326.vfzb6z44xln5ccdj@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBNYXIgMTMsIDIwMTggYXQgMjoxMyBQTSwgV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4
LmNvbT4gd3JvdGU6Cj4gT24gVHVlLCBGZWIgMjcsIDIwMTggYXQgMDE6Mjg6MDhQTSAtMDgwMCwg
U3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+PiBBZGQgcHZjYWxscyBzdXBwb3J0IHRvIGxpYnhs
IGFuZCB4bC4gQ3JlYXRlIHRoZSBhcHByb3ByaWF0ZSBwdmNhbGxzCj4+IGVudHJpZXMgaW4geGVu
c3RvcmUuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3RlZmFub0Bh
cG9yZXRvLmNvbT4KPgo+IFRoZSBjb2RlIGxvb2tzIGZpbmUuCj4KPiBJIG9ubHkgd2FudCB0byBo
YXZlIGEgc2Vjb25kIG9waW5pb24gb24KPgo+PiBAQCAtODI5LDYgKzgzNSw3IEBAIGxpYnhsX2Rv
bWFpbl9jb25maWcgPSBTdHJ1Y3QoImRvbWFpbl9jb25maWciLCBbCj4+ICAgICAgKCJ2a2JzIiwg
QXJyYXkobGlieGxfZGV2aWNlX3ZrYiwgIm51bV92a2JzIikpLAo+PiAgICAgICgidnRwbXMiLCBB
cnJheShsaWJ4bF9kZXZpY2VfdnRwbSwgIm51bV92dHBtcyIpKSwKPj4gICAgICAoInA5cyIsIEFy
cmF5KGxpYnhsX2RldmljZV9wOSwgIm51bV9wOXMiKSksCj4+ICsgICAgKCJwdmNhbGxzcyIsIEFy
cmF5KGxpYnhsX2RldmljZV9wdmNhbGxzLCAibnVtX3B2Y2FsbHNzIikpLAo+Cj4gdGhpcy4uLgo+
Cj4gSSB0aGluayB0aGUgdHdvIHMnZXMgbG9vayBhIGJpdCBzdHJhbmdlLiBCdXQgSSBkb24ndCBo
YXZlIGEgYmV0dGVyIGlkZWEuCgpUaGF0IGRvZXMgbG9vayBhIGJpdCBHb2xsdW0tbGlrZSwgbXkg
cHJlY2lvdXNzc3MuICBDYWxsIGluZGl2aWR1YWwKY29ubmVjdGlvbnMgYSAicHZjYWxsZGV2Iiwg
YW5kIHRoZW4gaGF2ZSBpdCAicHZjYWxsZGV2cyIgYW5kCiJudW1fcHZjYWxsZGV2cyI/CgpBbHRl
cm5hdGVseSwgb25seSBhbGxvdyBhIHNpbmdsZSBwdmNhbGwgY29ubmVjdGlvbj8KCiAtR2Vvcmdl
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
