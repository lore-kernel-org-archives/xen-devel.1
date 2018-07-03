From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH RFC 03/15] xen/arm: extend device tree based
 multiboot protocol
Date: Tue, 3 Jul 2018 11:40:43 +0100
Message-ID: <d40e408c-79cb-1f0f-009a-71b528c397e8@arm.com>
References: <alpine.DEB.2.10.1806131457490.14695@sstabellini-ThinkPad-X260>
 <1528928118-14960-3-git-send-email-sstabellini@kernel.org>
 <30b92df4-ae73-1803-94af-14a128c59746@arm.com>
 <alpine.DEB.2.10.1807021338290.23811@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <alpine.DEB.2.10.1807021338290.23811@sstabellini-ThinkPad-X260>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: artem_mygaiev@epam.com, Stefano Stabellini <stefanos@xilinx.com>, edgari@xilinx.com, andrii_anisov@epam.com, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

SGkgU3RlZmFubywKCk9uIDAyLzA3LzE4IDIyOjMxLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6
Cj4gT24gVGh1LCAxNCBKdW4gMjAxOCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBPbiAxMy8wNi8x
OCAyMzoxNSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+Pj4gKwo+Pj4gKy0gY3B1cyAob3B0
aW9uYWwpCj4+PiArCj4+PiArICAgIEEgc3RyaW5nIHNwZWNpZnlpbmcgdGhlIG51bWJlciBvZiB2
Y3B1cyB0byBhbGxvY2F0ZSB0byB0aGUgZ3Vlc3QuIElmCj4+PiArICAgIG5vdCBzcGVjaWZpZWQg
aXQgZGVmYXVsdHMgdG8gIjEiLgo+Pgo+PiBTYW1lIHJlbWFya3MgYXMgZm9yICJtZW0iLgo+IAo+
IEkgdGhpbmsgaXQgd291bGQgYmUgbmljZXIgaWYgd2Uga2VwdCB0aGUgc2FtZSBmb3JtYXQgdXNl
ZCBmb3IgeGwgY29uZmlnCj4gZmlsZXMgZm9yIHRoZXNlIHR3byBvcHRpb25zLkVzcGVjaWFsbHkg
Z2l2ZW4gdGhhdCB3ZSBhbHJlYWR5IGhhdmUgdGhlCj4gZnVuY3Rpb25zIGluIHRoZSBoeXBlcnZp
c29yIHRvIHBhcnNlIHRoZW0gKFhlbiBrbm93cyBob3cgdG8gcGFyc2UKPiBkb20wX21heF92Y3B1
cyBhbmQgZG9tMF9tZW0gZm9yIGluc3RhbmNlKS4gSXQgaXMgZ29pbmcgdG8gYmUgZWFzaWVyIHRv
ID4gdXNlIGFuZCBpdCBkb2Vzbid0IGNvbWUgd2l0aCBhIGNvc3QgZm9yIFhlbi4KCkkgY2FuJ3Qg
c2VlIGFueSByZWFzb24gdG8ga2VlcCB0aG9zZSAyIG9wdGlvbnMgc2ltaWxhciB0byBsaWJ4bCB3
aGVuIGFsbCAKdGhlIHJlc3QgaXMgZW1icmFjaW5nIERUIGZvcm1hdC4gVGhlIHVzZXIgd291bGQg
YWxyZWFkeSBoYXZlIHRvIHNwZW5kIApzb21lIHRpbWVzIHRvIGxvb2sgYXQgdGhlIG5ldyBiaW5k
aW5ncyBhbnl3YXksIG5vdCB1c2luZyBzdHJpbmcgaXMgbm90IApnb2luZyB0byBiZSBhIGJpZyBk
aWZmaWN1bHR5LgoKV2hpbGUgSSBhZ3JlZSB0aGF0IFhlbiBrbm93cyBob3cgdG8gcGFyc2UgZG9t
MF9tZW0sIGRvbTBfbWF4X3ZjcHVzLCBYZW4gCmFsc28ga25vd3MgaG93IHRvIHJlYWQgbnVtYmVy
cyBmcm9tIGNlbGxzIHdoaWNoIGlzIHdpZGVseSB1c2VkIHdpdGhpbiAKdGhlIGh5cGVydmlzb3Iu
IFNvIGJvdGggc29sdXRpb24gYXJlIGdvaW5nIHRvIGJlIGVhc3kgdG8gdXNlIGluIHRoZSAKaHlw
ZXJ2aXNvci4gSG93ZXZlciwgdGhlIGZvcm1lciBpcyBhbHdheXMgZ29pbmcgdG8gYmUgZmFzdGVy
LCBsZXNzIGVycm9yIApwcm9uZSB0aGFuIHRoZSBsYXR0ZXIuCgpDaGVlcnMsCgotLSAKSnVsaWVu
IEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
