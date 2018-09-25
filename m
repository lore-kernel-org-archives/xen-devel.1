From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH v2 6/6] RFC: tools/dm_restrict: Enable QEMU
 sandboxing
Date: Tue, 25 Sep 2018 11:46:13 +0100
Message-ID: <23466.4597.293762.526994@mariner.uk.xensource.com>
References: <20180921170428.13771-1-george.dunlap@citrix.com>
 <20180921170428.13771-6-george.dunlap@citrix.com>
 <23464.49451.531992.450514@mariner.uk.xensource.com>
 <e8886878-a7d8-3cc5-3396-69215716fe78@citrix.com>
 <23464.57587.641742.948316@mariner.uk.xensource.com>
 <dedc9e35-984f-ef21-d508-e411ef2a4a66@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=xnan=mh=citrix.com=prvs=7991b2fa6=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1g4krB-0007kw-N7
 for xen-devel@lists.xenproject.org; Tue, 25 Sep 2018 10:46:17 +0000
In-Reply-To: <dedc9e35-984f-ef21-d508-e411ef2a4a66@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>
Cc: Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

R2VvcmdlIER1bmxhcCB3cml0ZXMgKCJSZTogW1BBVENIIHYyIDYvNl0gUkZDOiB0b29scy9kbV9y
ZXN0cmljdDogRW5hYmxlIFFFTVUgc2FuZGJveGluZyIpOgo+IE9uIDA5LzI0LzIwMTggMDI6MDQg
UE0sIElhbiBKYWNrc29uIHdyb3RlOgo+ID4gV2hhdCBhYm91dCBjYXBhYmlsaXRpZXMgbm90IGtu
b3duIHRvIHRoZSBxZW11IHNvdXJjZSBjb2RlID8KPiAKPiBIcm0gLS0gaXQgbG9va3MgbGlrZSB0
aGUgc2FuZGJveGluZyBzdHVmZiBpcyBiYXNlZCBvbiBhIGJsYWNrbGlzdCwKPiByYXRoZXIgdGhh
biBhIHdoaXRlbGlzdC4gIFdoaWNoIG1heSBiZSBpbmV2aXRhYmxlLCBnaXZlbiB0aGF0IHNlY2Nv
bXAyCj4gb3BlcmF0ZXMgb24gc3lzdGVtIGNhbGxzIGJ1dCBxZW11IG1ha2VzIGxpYnJhcnkgY2Fs
bHMgKGFuZCB0aHVzIGRvZXNuJ3QKPiBhY3R1YWxseSBrbm93IHdoaWNoIHN5c3RlbSBjYWxscyBh
cmUgbmVlZCBhbmQgd2hpY2ggYXJlIG5vdCAtLSBzZWUgWzFdKS4KPiAgQnV0IGl0IGRvZXMgcmF0
aGVyIHVuZGVybWluZSB0aGUgdXNlZnVsbmVzcyBvZiB0aGlzIGFzIGEgc2VjdXJpdHkKPiBmZWF0
dXJlIC0tIHRoZXJlIGFyZSBsaXRlcmFsbHkgaHVuZHJlZHMgb2Ygc3lzdGVtIGNhbGxzIGF2YWls
YWJsZSBvbgo+IExpbnV4LCBvZiB3aGljaCBvbmx5IDUwIG9yIHNvIGFyZSBsaXN0ZWQgaGVyZS4K
CkhvdyBhbm5veWluZy4KCj4gTHVja2lseSBgLXNhbmRib3hgIHdhcyBqdXN0IG9uZSBvZiB0aGUg
InN1cmUgd2h5IG5vdCIgbGF5ZXJzIG9mIGV4dHJhCj4gc2VjdXJpdHksIG5vdCBzb21ldGhpbmcg
d2UgcmVseSBvbi4KClJpZ2h0LgoKPiBXZSBjb3VsZCBhZGQgYSB0ZXN0IHRvIG91ciB0ZXN0aW5n
IHNjcmlwdCB0byBwYXJzZSBgLWhlbHBgIG91dHB1dCBmb3IKPiB1bmtub3duLXRvLWxpYnhsIG9w
dGlvbnMgYW5kIHRocm93IGFuIGVycm9yLCBzbyB0aGF0IHRoZXkgZ2V0IGFkZGVkIGluLAo+IGlm
IHdlIHdhbnQuCgpUaGF0IHNvdW5kcyBsaWtlIGEgZ29vZCBpZGVhLgoKSWFuLgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
