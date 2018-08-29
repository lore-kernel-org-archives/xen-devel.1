From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] x86/alt: Fix build when CONFIG_LIVEPATCH is
 disabled
Date: Wed, 29 Aug 2018 14:15:12 +0100
Message-ID: <20180829131512.wt7wngejcrfs52tb@citrix.com>
References: <1535540222-11439-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <1535540222-11439-1-git-send-email-andrew.cooper3@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Xen-devel <xen-devel@lists.xen.org>, Ross Lagerwall <ross.lagerwall@citrix.com>, Jan Beulich <JBeulich@suse.com>, Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBBdWcgMjksIDIwMTggYXQgMTE6NTc6MDJBTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBjL3MgYjI4Y2QyMWMzNjI4ICJ4ODYvYnVpbGQ6IFVzZSBuZXcgLm5vcHMgZGlyZWN0
aXZlIHdoZW4gYXZhaWxhYmxlIgo+IGludHJvZHVjZWQgYSBfX3JlYWRfbW9zdGx5IGJvb2xlYW4g
d2hpY2ggaXMgaW5jbHVkZWQgaWYgdGhlIHRvb2xjaGFpbiBzdXBwb3J0cwo+IHRoZSAubm9wcyBk
aXJlY3RpdmUuCj4gCj4gV2hlbiBDT05GSUdfTElWRVBBVENIIGlzIGNvbXBpbGVkIG91dCwgYWx0
ZXJuYXRpdmUubyBpcyBleHBlY3RlZCB0byBiZSBhIGZ1bGx5Cj4gaW5pdCBtb2R1bGUsIGFuZCB0
b29sY2hhaW5fbm9wc19hcmVfaWRlYWwgdHJpcHMgdGhlIGJ1aWxkIHN5c3RlbSBjaGVjazoKPiAK
PiAgIEVycm9yOiBzaXplIG9mIGFsdGVybmF0aXZlLm86LmRhdGEucmVhZF9tb3N0bHkgaXMgMHgw
MQo+ICAgL2xvY2FsL3hlbi5naXQveGVuL1J1bGVzLm1rOjIwNjogcmVjaXBlIGZvciB0YXJnZXQg
J2FsdGVybmF0aXZlLmluaXQubycgZmFpbGVkCj4gICBtYWtlWzNdOiAqKiogW2FsdGVybmF0aXZl
LmluaXQub10gRXJyb3IgMTIKPiAKPiBJbnRyb2R1Y2UgaW5pdF9vcl9saXZlcGF0Y2hfcmVhZF9t
b3N0bHkgYW5kIHN3aXRjaCB0aGUgYW5ub3RhdGlvbiBmb3IKPiB0b29sY2hhaW5fbm9wc19hcmVf
aWRlYWwuCj4gCj4gUmVwb3J0ZWQtYnk6IE9sYWYgSGVyaW5nIDxvbGFmQGFlcGZsZS5kZT4KPiBT
aWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoK
UmV2aWV3ZWQtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
