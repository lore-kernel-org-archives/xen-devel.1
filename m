From: Brian Woods <brian.woods@amd.com>
Subject: Re: [PATCH 2/2] x86/svm: Add checks for nested HW
	features
Date: Fri, 5 Jan 2018 09:27:30 -0600
Message-ID: <20180105152730.GA11036@amd.com>
References: <20171221152619.38079-1-brian.woods@amd.com>
 <20171221152619.38079-3-brian.woods@amd.com>
 <8eb9d4df-e911-c213-4c32-dd20a54d0728@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <8eb9d4df-e911-c213-4c32-dd20a54d0728@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>, Brian Woods <brian.woods@amd.com>, Jan Beulich <jbeulich@suse.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBEZWMgMjIsIDIwMTcgYXQgMDM6MTU6NDhQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBVbmZvcnR1bmF0ZWx5LCBuZXN0ZWRodm1fZW5hYmxlZCgpIGlzIGd1YXJhbnRlZWQg
dG8gYmUgZmFsc2UgYXQgdGhlCj4gcG9pbnQgdGhhdCBjb25zdHJ1Y3Rfdm1jYigpIGlzIGNhbGxl
ZCAoZHVlIHRoZSBvcmRlciBpbiB3aGljaAo+IGluZm9ybWF0aW9uIGFwcGVhcnMgd2hpbGUgY29u
c3RydWN0aW5nIHRoZSBWTSksIHdoaWNoIG1lYW5zIHdlIHdpbGwKPiBuZXZlciBlbmFibGUgdGhl
c2Ugb3B0aW1pc2F0aW9ucy4KPiAKPiBDb21iaW5lZCB3aXRoIHRoZSBvYnNlcnZhdGlvbiBvZiBF
RkVSIGluIHRoZSBwaXBlbGluZSwgdGhlIGxvZ2ljIHRvCj4gZW5hYmxlL2Rpc2FibGUgdGhlc2Ug
b3B0aW1pc2F0aW9ucyBuZWVkcyB0byBiZSBpbgo+IHN2bV91cGRhdGVfZ3Vlc3RfZWZlcigpLCBh
bmQgbmVlZCB0byB0cmlnZ2VyIHdoZW4gRUZFUi5TVk1FIGNoYW5nZXMuCj4gCj4gfkFuZHJldwoK
U29ycnkgZm9yIHRoZSBsYXRlIHJlcGx5LiAgSSB0aXJlZCB3b3JraW5nIHRoaXMgYmVmb3JlIHZh
Y2F0aW9uIGJ1dCBpdAp0dXJuZWQgb3V0IHRvIGJlIGEgbGl0dGxlIGJpdCBsb25nZXIgdGhhbiB0
aGF0Li4uIEkgaGF2ZSBhIHNldCBvZgpwYXRjaGVzIHRoYXQgX3Nob3VsZF8gd29yaywgYnV0IHRo
ZXJlIGFyZSBvdGhlciBpc3N1ZXMuICBUdXJucyBvdXQgdGhlcmUKYXJlIGludGVycnVwdCBpc3N1
ZXMgd2l0aCBuZXN0dGVkIFNWTSBIVk0gYW5kIEknbSB0cnlpbmcgdG8gaHVudCB0aG9zZQpkb3du
IGFuZCBmaXggdGhlbSBzbyBJIGNhbiBwcm9wZXJseSB0ZXN0IHRoZSBwYXRjaGVzIEkndmUgZG9u
ZS4gIE9kZGx5CmVub3VnaCB5b3UgY2FuIGF0IGxlYXN0IGdldCBhIHN5c3RlbSBib290ZWQgb24g
MTdoIGZhbWlseSBzeXN0ZW1zIGV2ZW4KaWYgaXQncyBmcmFnaWxlIGJ1dCAxNWgganVzdCBmYWls
cyB0byBldmVuIGJvb3QuICBOb3Qgc3VyZSBob3cgaXQgZXZlbgp3b3JrZWQgd2hlbiBJIHRlc3Rl
ZCBwcmV2aW91cyBwYXRjaGVzIG9uIHRoZSAxNWggc3lzdGVtLiAKCi0tIApCcmlhbiBXb29kcwoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
