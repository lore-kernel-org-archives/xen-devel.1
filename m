From: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v6 16/18] xen: automatically create
 XenBlockDevice-s
Date: Wed, 19 Dec 2018 14:01:18 +0000
Message-ID: <20181219140118.GC1288@perard.uk.xensource.com>
References: <20181217133011.31433-1-paul.durrant@citrix.com>
 <20181217133011.31433-17-paul.durrant@citrix.com>
 <20181219123926.GA1288@perard.uk.xensource.com>
 <40bdef2962864ca8bc364249196bf9b3@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9bs/=O4=citrix.com=prvs=884673768=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1gZcPi-0006ae-3S
 for xen-devel@lists.xenproject.org; Wed, 19 Dec 2018 14:01:30 +0000
Content-Disposition: inline
In-Reply-To: <40bdef2962864ca8bc364249196bf9b3@AMSPEX02CL03.citrite.net>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <Paul.Durrant@citrix.com>
Cc: Kevin Wolf <kwolf@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, "qemu-block@nongnu.org" <qemu-block@nongnu.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBEZWMgMTksIDIwMTggYXQgMTI6NDM6MjRQTSArMDAwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+ID4gS2V2aW4gc2VlbXMgdG8gc2F5IHRoYXQgdGhpcyBjb3VsZCBiZSBkb25lIHdpdGhv
dXQgdGhlIF9mbGF0X2NvbmZ1c2VkCj4gPiB2ZXJzaW9uLiBUaGUgZmxhdF9jb25mdXNlZCB2ZXJz
aW9uIHNlZW1zIHRvIGJlIHVzZWZ1bCBqdXN0IGJlY2F1c2UKPiA+IHRoZSBrZXkgImNhY2hlLmRp
cmVjdCIgaXMgdXNlZCBlYXJsaWVyLCBhbmQgYmVjYXVzZSBldmVyeXRoaW5nIGluIHFkaWN0Cj4g
PiBpcyBhIHN0cmluZy4KPiAKPiBJdCBjb3VsZCBiZSwgYnV0IHRoZXJlJ3MgYSBnb29kIHJlYXNv
biBmb3Igd2FudGluZyBldmVyeXRoaW5nIGFzIGEgc3RyaW5nLCBhbmQgdGhhdCBpcyBzbyB0aGF0
IEkgY2FuIGRvIGEgcWRpY3RfaXRlciB0byBnZW5lcmF0ZSBteSB0cmFjZSBtZXNzYWdlLiBBbHNv
IEkgcmVhbGx5IGRvbid0IHdhbnQgdG8gZ2V0IHRvbyBlbGFib3JhdGUgaGVyZS4uLiB0aGlzIGlz
IHN1cHBvc2VkIHRvIGJlIG1pbWlja2luZyB3aGF0IHdvdWxkIG5vcm1hbGx5IGNvbWUgdmlhIGEg
anNvbiBibG9iLCBhbmQgdGhhdCB3b3VsZCBzdGFydCBvdXQgYXMgc3RyaW5ncy4KCk1pbWljIEpT
T04gPyBOb3QgcmVhbGx5LiBKU09OIGhhcyB0eXBlcy4gSWYgdGhlIHRvb2xzdGFjayB3YW50ZWQK
Y2FjaGUuZGlyZWN0IG9yIHJlYWQtb25seSBvcHRpb24gb24gYSBibG9ja2RldiwgaXQgd2lsbCBu
ZWVkIHRvIHVzZSB0aGUKYm9vbCB0eXBlIGFzIHN0cmluZyB0eXBlIHdpbGwgYmUgcmVqZWN0ZWQu
ICBUaGUgZXhwZWN0ZWQgdHlwZXMgd2hlbgppc3N1aW5nIGEgUU1QIHJlcXVlc3QgY2FuIGJlIGZv
dW5kIGluICJxYXBpL2Jsb2NrLWNvcmUuanNvbiIsIGZvciB0aGUKY29tbWFuZCAiYmxvY2tkZXYt
YWRkIi4KCkFsc28sIHRoZXJlIGlzIGEgY29tbWVudCBvbiB0aGUgcW9iamVjdF9pbnB1dF92aXNp
dG9yX25ld19mbGF0X2NvbmZ1c2VkCmZ1bmN0aW9uLCBpdCByZWFkczoKICAgIFRoZSBibG9jayBz
dWJzeXN0ZW0gdXNlcyB0aGlzIGZ1bmN0aW9uIHRvIHZpc2l0IGl0cyBmbGF0IFFEaWN0IHdpdGgK
ICAgIHBvc3NpYmx5IGNvbmZ1c2VkIHNjYWxhciB0eXBlcy4gIEl0IHNob3VsZCBub3QgYmUgdXNl
ZCBmb3IgYW55dGhpbmcKICAgIGVsc2UsIGFuZCBpdCBzaG91bGQgZ28gYXdheSBvbmNlIHRoZSBi
bG9jayBzdWJzeXN0ZW0gaGFzIGJlZW4KICAgIGNsZWFuZWQgdXAuCgpXZSBtaWdodCBhcyB3ZWxs
IGF2b2lkIHVzaW5nIGl0IHJpZ2h0IG5vdywgYXMgaXQncyBlYXN5IHRvIGRvIHNvLgoKLS0gCkFu
dGhvbnkgUEVSQVJECgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
