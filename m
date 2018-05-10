From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: migration regression in xen-4.11 and qemu-2.11 and
 qcow2
Date: Thu, 10 May 2018 09:03:30 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1805100901170.9199@sstabellini-ThinkPad-X260>
References: <20180507151940.GA31926@aepfle.de>
 <20180508133143.77e209f2.olaf@aepfle.de>
 <20180508184026.4f0af76a.olaf@aepfle.de>
 <20180509142316.66171ffd.olaf@aepfle.de>
 <alpine.DEB.2.10.1805091405040.9199@sstabellini-ThinkPad-X260>
 <20180509231336.7f962d11.olaf@aepfle.de>
 <alpine.DEB.2.10.1805091416310.9199@sstabellini-ThinkPad-X260>
 <20180510080411.1c7845b5.olaf@aepfle.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180510080411.1c7845b5.olaf@aepfle.de>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Olaf Hering <olaf@aepfle.de>
Cc: anthony.perard@citrix.com, jgross@suse.com, boris.ostrovsky@oracle.com, Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCAxMCBNYXkgMjAxOCwgT2xhZiBIZXJpbmcgd3JvdGU6Cj4gQW0gV2VkLCA5IE1heSAy
MDE4IDE0OjQzOjE3IC0wNzAwIChQRFQpCj4gc2NocmllYiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNz
dGFiZWxsaW5pQGtlcm5lbC5vcmc+Ogo+IAo+ID4gNTEyYjEwOWVjOTYyIGlzIGEgdmVyeSBvbGQg
Y29tbWl0OiB3aHkgaXMgaXQgY2F1c2luZyBwcm9ibGVtcyB0byBYZW4KPiA+IDQuMTAgYW5kIFhl
biA0LjExIEhWTSBtaWdyYXRpb24/IFdoYXQgaXMgdGhlIGVycm9yIGV4YWN0bHk/IFNvcnJ5LCBJ
Cj4gPiBtaWdodCBiZSBtaXNzaW5nIHNvbWUgY29udGV4dC4KPiAKPiBJdCBpcyBwYXBlcmluZyBv
dmVyIHRoZSByZWFsIGlzc3VlLCB0aGF0cyB3aHkgb25lIGNhbiBzdGlsbCBtaWdyYXRlIGEKPiBw
dm9wcyBIVk0gZG9tVSB3aXRoIGN1cnJlbnQgdG9vbHN0YWNrLiBVcHN0cmVhbSBrZXJuZWwgc2lt
cGx5IGRvZXMgdGhlCj4gd29yayB0aGF0IGlzIHN1cHBvc2VkIHRvIGJlIGRvbmUgYnkgcWVtdSBp
dHNlbGYuIFNpbmNlIHRoZSB4ZW5saW51eCBiYXNlZAo+IGtlcm5lbCBkb2VzIG5vdCBkbyB0aGF0
IHdvcmsgKGl0IG5ldmVyIGhhZCBhIG5lZWQgdG8gZG8gdGhlIHVucGx1ZyB0d2ljZSksCj4gbWln
cmF0aW9uIGZhaWxzLgo+IAo+IHFlbXUgaGFzIHRvIGNhcnJ5IHRoZSB1bnBsdWcgc3RhdGUgZnJv
bSBvbmUgZG9tMCB0byBhbm90aGVyIGRvbTAgZHVyaW5nCj4gbWlncmF0aW9uLCBzaW1wbHkgYmVj
YXVzZSB1bnBsdWcgaXMgYSBvbmUtdGltZSBvcGVyYXRpb24gdGhhdCBjYW4gbm90IAo+IGJlIHVu
ZG9uZS4gSSB3b25kZXIgaG93IHRvIGRvIHRoYXQsIGlmIHFlbXUgYWxyZWFkeSBoYXMgY29kZSB0
byBjYXJyeSBpdHMKPiBzdGF0ZS4KCllvdSBjb3VsZCBhZGQgYSBwcm9wZXJ0eSB0byB2bXN0YXRl
X3hlbl9wbGF0Zm9ybSBvZiB4ZW5fcGxhdGZvcm0uYywgYnV0CnlvdSBuZWVkIHRvIHBheSBhdHRl
bnRpb24gdG8gbGVnYWN5IGNvbXBhdGliaWxpdHkuIEluZXZpdGFibHksIHRoZXJlCndpbGwgYmUg
b2xkZXIgdmVyc2lvbnMgdGhhdCBkbyBub3QgaGF2ZSB0aGUgbmV3IHZtc3RhdGVfeGVuX3BsYXRm
b3JtCmZpZWxkIG9yIGRvIG5vdCBzZXQgaXQgcHJvcGVybHkuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
