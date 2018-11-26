From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2] viridian: fix assertion failure
Date: Mon, 26 Nov 2018 17:01:36 +0100
Message-ID: <20181126160136.wt5foaeqf23fatb4@mac>
References: <20181126153852.2586-1-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=obox=OF=citrix.com=prvs=8619cf47e=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gRJUr-0001rG-Ma
 for xen-devel@lists.xenproject.org; Mon, 26 Nov 2018 16:12:29 +0000
Content-Disposition: inline
In-Reply-To: <20181126153852.2586-1-paul.durrant@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBOb3YgMjYsIDIwMTggYXQgMDM6Mzg6NTJQTSArMDAwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IFdoaWxzdCBhdHRlbXB0aW5nIHRvIGNyYXNoIGFuIGFwcGFyZW50bHkgd2VkZ2VkIFdp
bmRvd3MgZG9tYWluIHVzaW5nCj4gJ3hlbi1odm1jcmFzaCcgSSBtYW5hZ2VkIHRvIHRyaWdnZXIg
dGhlIGZvbGxvd2luZyBBU1NFUlQ6Cj4gCj4gKFhFTikgQXNzZXJ0aW9uICchdnAtPnB0cicgZmFp
bGVkIGF0IHZpcmlkaWFuLmM6NjA3Cj4gCj4gd2l0aCBzdGFjazoKPiAKPiAoWEVOKSAgICBbPGZm
ZmY4MmQwODAzMmM1NWQ+XSB2aXJpZGlhbl9tYXBfZ3Vlc3RfcGFnZSsweDFiNC8weDFiNgo+IChY
RU4pICAgIFs8ZmZmZjgyZDA4MDMyYjFkYj5dIHZpcmlkaWFuX3N5bmljX2xvYWRfdmNwdV9jdHh0
KzB4MzkvMHgzYgo+IChYRU4pICAgIFs8ZmZmZjgyZDA4MDMyYjkwZD5dIHZpcmlkaWFuLmMjdmly
aWRpYW5fbG9hZF92Y3B1X2N0eHQrMHg5My8weGNjCj4gKFhFTikgICAgWzxmZmZmODJkMDgwMzA5
NmQ2Pl0gaHZtX2xvYWQrMHgxMGUvMHgxOWUKPiAoWEVOKSAgICBbPGZmZmY4MmQwODAyNzRjNmQ+
XSBhcmNoX2RvX2RvbWN0bCsweGI3NC8weDI1YjQKPiAoWEVOKSAgICBbPGZmZmY4MmQwODAyMDY4
YWI+XSBkb19kb21jdGwrMHgxNmY3LzB4MTlkOAo+IAo+IFRoaXMgaGFwcGVuZWQgYmVjYXVzZSB2
aXJpZGlhbl9tYXBfZ3Vlc3RfcGFnZSgpIHdhcyBub3Qgd3JpdHRlbiB0byBjb3BlCj4gd2l0aCBi
ZWluZyBjYWxsZWQgbXVsdGlwbGUgdGltZXMsIGJ1dCB0aGlzIGlzIHVuZm9ydHVuYXRlbHkgZXhh
Y3RseSB3aGF0Cj4gaGFwcGVucyB3aGVuIHhlbi1odm1jcmFzaCByZS1sb2FkcyB0aGUgZG9tYWlu
IGNvbnRleHQgKGhhdmluZyBjbG9iYmVyZWQKPiB0aGUgdmFsdWVzIG9mIFJJUCkuCj4gCj4gVGhp
cyBwYXRjaCBzaW1wbHkgbWFrZXMgdmlyaWRpYW5fbWFwX2d1ZXN0X3BhZ2UoKSByZXR1cm4gaW1t
ZWRpYXRlbHkgaWYgaXQKPiBmaW5kcyB0aGUgcGFnZSBhbHJlYWR5IG1hcHBlZCAoaS5lLiB2cC0+
cHRyICE9IE5VTEwpLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8cGF1bC5kdXJy
YW50QGNpdHJpeC5jb20+CgpSZXZpZXdlZC1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1
QGNpdHJpeC5jb20+CgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
