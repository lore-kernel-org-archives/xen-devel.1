From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] lzma: fix hypervisor build
Date: Fri, 20 Jul 2018 11:17:18 +0200
Message-ID: <56c535f2-2a0f-ad5f-8a30-1b77be67a0b7@suse.com>
References: <20180720083242.34004-1-roger.pau@citrix.com>
 <20180720090032.a43u6tvqooozuyq2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=uszy=ke=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fgRXO-0003zS-W7
 for xen-devel@lists.xenproject.org; Fri, 20 Jul 2018 09:17:23 +0000
In-Reply-To: <20180720090032.a43u6tvqooozuyq2@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gMjAvMDcvMTggMTE6MDAsIFdlaSBMaXUgd3JvdGU6Cj4gT24gRnJpLCBKdWwgMjAsIDIwMTgg
YXQgMTA6MzI6NDJBTSArMDIwMCwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+PiBSZW1vdmUgbG9j
YWwgZGVmaW5pdGlvbiBvZiBNSU4gYW5kIGluc3RlYWQgaW5jbHVkZSB0aGUga2VybmVsLmggaGVh
ZGVyCj4+IGZvciB0aGUgaHlwZXJ2aXNvciBidWlsZC4gRml4ZXMgdGhlIGZvbGxvd2luZyBlcnJv
ciBvbiB0aGUgdG9vbHMgYnVpbGQ6Cj4+Cj4+IEluIGZpbGUgaW5jbHVkZWQgZnJvbSB4Y19kb21f
ZGVjb21wcmVzc191bnNhZmVfbHptYS5jOjg6MDoKPj4gLi4vLi4veGVuL2NvbW1vbi91bmx6bWEu
YzozMzowOiBlcnJvcjogIk1JTiIgcmVkZWZpbmVkIFstV2Vycm9yXQo+PiAgI2RlZmluZSBNSU4o
YSwgYikgKCgoYSkgPCAoYikpID8gKGEpIDogKGIpKQo+PiAgXgo+PiBJbiBmaWxlIGluY2x1ZGVk
IGZyb20geGNfcHJpdmF0ZS5oOjQzOjAsCj4+ICAgICAgICAgICAgICAgICAgZnJvbSB4Z19wcml2
YXRlLmg6MjksCj4+ICAgICAgICAgICAgICAgICAgZnJvbSB4Y19kb21fZGVjb21wcmVzc191bnNh
ZmVfbHptYS5jOjU6Cj4+IC9ob21lL29zc3Rlc3QvYnVpbGQuMTI1NDU4LmJ1aWxkLWFtZDY0L3hl
bi9zdHViZG9tL2xpYnhjLXg4Nl82NC8uLi8uLi90b29scy9pbmNsdWRlL3hlbi10b29scy9saWJz
Lmg6MjE6MDogbm90ZTogdGhpcyBpcyB0aGUgbG9jYXRpb24gb2YgdGhlIHByZXZpb3VzIGRlZmlu
aXRpb24KPj4gICNkZWZpbmUgTUlOKHgsIHkpICgoeCkgPCAoeSkgPyAoeCkgOiAoeSkpCj4+ICBe
Cj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXgu
Y29tPgo+IAo+IEFja2VkLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgo+IAo+IFN0
cmFuZ2VseSBJIG5ldmVyIHNhdyB0aGlzIGR1cmluZyBteSBidWlsZC4KCldoYXQgZGlkIHlvdXIg
Li9jb25maWd1cmUgcnVuIHNheSBhYm91dCBsem1hIHN1cHBvcnQ/CgoKSnVlcmdlbgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
