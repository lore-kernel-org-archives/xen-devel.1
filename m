From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v8 2/8] libxl: introduce a new structure to
 represent static shared memory regions
Date: Tue, 30 Oct 2018 19:32:04 +0000
Message-ID: <53cb9027-e255-bf83-5d65-e54b10002950@arm.com>
References: <alpine.DEB.2.10.1810081606390.28877@sstabellini-ThinkPad-X260>
 <1539041841-17655-2-git-send-email-sstabellini@kernel.org>
 <23512.30399.545072.317904@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <23512.30399.545072.317904@mariner.uk.xensource.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Cc: ian.jackson@eu.citrix.com, Stefano Stabellini <stefanos@xilinx.com>, wei.liu2@citrix.com, blackskygg@gmail.com, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

SGkgSWFuLAoKT24gMTAvMzAvMTggMzoyMCBQTSwgSWFuIEphY2tzb24gd3JvdGU6Cj4gU3RlZmFu
byBTdGFiZWxsaW5pIHdyaXRlcyAoIltQQVRDSCB2OCAyLzhdIGxpYnhsOiBpbnRyb2R1Y2UgYSBu
ZXcgc3RydWN0dXJlIHRvIHJlcHJlc2VudCBzdGF0aWMgc2hhcmVkIG1lbW9yeSByZWdpb25zIik6
Cj4+IEZyb206IFpob25nemUgTGl1IDxibGFja3NreWdnQGdtYWlsLmNvbT4KPj4KPj4gQXV0aG9y
OiBaaG9uZ3plIExpdSA8YmxhY2tza3lnZ0BnbWFpbC5jb20+Cj4+Cj4+IEFkZCBhIG5ldyBzdHJ1
Y3R1cmUgdG8gdGhlIElETCBmYW1pbHkgdG8gcmVwcmVzZW50IHN0YXRpYyBzaGFyZWQgbWVtb3J5
IHJlZ2lvbnMKPj4gYXMgcHJvcG9zZWQgaW4gdGhlIHByb3Bvc2FsICJBbGxvdyBzZXR0aW5nIHVw
IHNoYXJlZCBtZW1vcnkgYXJlYXMgYmV0d2VlbiBWTXMKPj4gZnJvbSB4bCBjb25maWcgZmlsZSIg
KHNlZSBbMV0pLgo+Pgo+PiBBbmQgZGVsZXRlZCBzb21lIHRyYWlsaW5nIHdoaXRlIHNwYWNlcy4K
PiAKPiBDYW4geW91IHBsZWFzZSBub3QgYWRkIHVucmVsYXRlZCBjaGFuZ2VzLCBldmVuIGlmIHRo
ZXkgYXJlIG9ubHkgd2hpdGUKPiBzcGFjZSBjaGFuZ2VzID8gIFlvdSBjYW4gcHV0IHRoZW0gaW4g
YSBwcmUtcGF0Y2ggYW5kIGlmIHlvdSBkbyB0aGF0Cj4gcGxlYXNlIHB1dCBteSBhY2sgb24gdGhl
IHByZS1wYXRjaCA6LSkuCj4gCj4+ICtsaWJ4bF9zc2htX2NhY2hlcG9saWN5ID0gRW51bWVyYXRp
b24oInNzaG1fY2FjaGVwb2xpY3kiLCBbCj4+ICsgICAgKC0xLCAiVU5LTk9XTiIpLAo+PiArICAg
ICgwLCAgIkFSTV9OT1JNQUwiKSwgICMgQVJNIHBvbGljaWVzIHNob3VsZCBiZSA8IDMyCj4+ICsg
ICAgKDMyLCAgIlg4Nl9OT1JNQUwiKSwgIyBYODYgcG9saWNpZXMgc2hvdWxkIGJlID49IDMyCj4+
ICsgICAgXSwgaW5pdF92YWwgPSAiTElCWExfU1NITV9DQUNIRV9QT0xJQ1lfVU5LTk9XTiIpCj4g
Cj4gV2hhdCA/ICBXaHkgZG8gdGhlc2UgbmVlZCBzZXBhcmF0aW5nIGxpa2UgdGhhdCA/ICBUaGlz
IGlzIHF1aXRlIG9kZC4KCkNhY2hpbmcgYXR0cmlidXRlcyBhcmUgZGlmZmVyZW50IGJldHdlZW4g
QXJtIGFuZCB4ODYuIFNvIHdlIG5lZWQgdG8gCnByb3ZpZGUgZGlmZmVyZW50IHZhbHVlcyBmb3Ig
dGhlbS4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
