From: Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: Re: [PATCH v4 0/6] Add dmops to allow use of VGA with
 restricted QEMU
Date: Mon, 5 Mar 2018 15:13:06 +0000
Message-ID: <d58f5085-3e30-d571-934c-96fac61553c7@citrix.com>
References: <20180123152246.22031-1-ross.lagerwall@citrix.com>
 <20180305144020.GA2395@perard.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180305144020.GA2395@perard.uk.xensource.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Paul Durrant <paul.durrant@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

T24gMDMvMDUvMjAxOCAwMjo0MCBQTSwgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4gT24gVHVlLCBK
YW4gMjMsIDIwMTggYXQgMDM6MjI6NDBQTSArMDAwMCwgUm9zcyBMYWdlcndhbGwgd3JvdGU6Cj4+
IFRoZSByZWNlbnRseSBhZGRlZCBzdXBwb3J0IGZvciByZXN0cmljdGluZyBRRU1VIHByZXZlbnRz
IHVzZSBvZiB0aGUgVkdBCj4+IGNvbnNvbGUuIFRoaXMgc2VyaWVzIGFkZHJlc3NlcyB0aGF0IGJ5
IGFkZGluZyBhIGNvdXBsZSBvZiBuZXcgZG1vcHMuCj4+IEEgY29ycmVzcG9uZGluZyBwYXRjaCBm
b3IgUUVNVSBpcyBuZWVkZWQgdG8gbWFrZSB1c2Ugb2YgdGhlIG5ldyBkbW9wcy4KPiAKPiBIaSBS
b3NzLAo+IAo+IElzIHRoZXJlIGEgcGF0Y2ggZm9yIFFFTVUgc29tZXdoZXJlIGZvciB0aGUgbmV3
IGRtb3BzPyBSaWdodCBub3csIFFFTVUKPiBjYW4gbm90IGJlIGJ1aWxkIHdpdGhvdXQgbWFnaWMg
KC1EWENfV0FOVF9DT01QQVRfREVWSUNFTU9ERUxfQVBJKSwgdGhlcmUKPiBpcyB0aGlzIGVycm9y
Ogo+IGh3L2kzODYveGVuL3hlbi1odm0uYzo0MTE6NTogZXJyb3I6IGltcGxpY2l0IGRlY2xhcmF0
aW9uIG9mIGZ1bmN0aW9uIOKAmHhjX2RvbWFpbl9waW5fbWVtb3J5X2NhY2hlYXR0cuKAmQo+IAoK
VGhhdCBtYWdpYyBpcyBwYXNzZWQgd2hlbiBidWlsZGluZyBRRU1VIHdpdGhpbiB0aGUgWGVuIHRy
ZWUgKEkgZG9uJ3QgCmtub3cgd2h5LCBpdCdzIHVnbHkpIHNvIHRoaXMgaXMgcHJlc3VtYWJseSB3
aGVuIGJ1aWxkaW5nIFFFTVUgYnkgaGFuZCAKb3V0c2lkZSBvZiB0aGUgWGVuIGJ1aWxkIHN5c3Rl
bT8KClRoZSBwYXRjaCB0byBtYWtlIFFFTVUgdXNlIHRoZSBuZXcgZG1vcHMgd2lsbCBiZSBwYXJ0
IG9mIHRoZSBuZXh0IAp2ZXJzaW9uIG9mIElhbidzICJ4ZW46IHhlbi1kb21pZC1yZXN0cmljdCBp
bXByb3ZlbWVudHMiIHBhdGNoIHNlcmllcy4gSW4gCnRoZSBtZWFudGltZSwgeW91IGNhbiBmaW5k
IHRoZSBwYXRjaCBoZXJlOgoKaHR0cHM6Ly9naXRodWIuY29tL3Jvc3NsYWdlcndhbGwvcWVtdS9j
b21taXQvMzdkNThlMGM4ZTljNmRmN2Y3ZTI0NjRhMzdkMWRlMjY3NWRhN2U4MQoKQ2hlZXJzLAot
LSAKUm9zcyBMYWdlcndhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
