From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH for-4.12] x86/svm: Fix handling of ICEBP
 intercepts
Date: Wed, 06 Feb 2019 00:45:47 -0700
Message-ID: <5C5A90AB0200007800214222@prv1-mh.provo.novell.com>
References: <1549032559-9076-1-git-send-email-andrew.cooper3@citrix.com>
 <5C546CA1020000780021335F@prv1-mh.provo.novell.com>
 <da8c1a3c-353c-93ad-8637-17d1031ccec9@citrix.com>
 <5C547A1B02000078002133E6@prv1-mh.provo.novell.com>
 <9a9b66c9-5fc4-6ed3-585d-7aa5f6d26adb@citrix.com>
 <5C5802F702000078002138E4@prv1-mh.provo.novell.com>
 <d4479211-3758-948a-9bef-ff42762cb5bd@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <d4479211-3758-948a-9bef-ff42762cb5bd@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, Xen-devel <xen-devel@lists.xen.org>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Brian Woods <brian.woods@amd.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA0LjAyLjE5IGF0IDIwOjQ0LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMDQvMDIvMjAxOSAwOToxNiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDAx
LjAyLjE5IGF0IDE4OjA5LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4+PiBB
IHN1YnNlcXVlbnQgI0RCIGdldHRpbmcgcmFpc2VkIGNhdXNlcyAjR1AgdG8gdHVybiBpbnRvICNE
Ri4KPj4gVGhlIHRhYmxlIG9uIHRoZSAjREYgcGFnZSBjbGVhcmx5IHNheXMKPj4gb3RoZXJ3aXNl
LCBhdCBsZWFzdCBhY2NvcmRpbmcgdG8gbXkgcmVhZGluZy4KPiAKPiBIbW0gLSBzbyBpdCBkb2Vz
LiAgTG9va3MgbGlrZSB3ZSd2ZSBnb3QgYSAzcmQgYnVnLCBpbiB0aGUgZ2VuZXJhbAo+IGV4Y2Vw
dGlvbiBjb21iaW5pbmcgbG9naWMuCgpJJ3ZlIHNlbnQgYSBwYXRjaC4gSSdkIGxpa2UgdG8gbm90
ZSB0aG91Z2ggdGhhdCBzdm1faW5qZWN0X2V2ZW50KCkncwpiZWhhdmlvciBpcyBwcm9ibGVtYXRp
YyBpbiB0aGlzIHJlZ2FyZCBhcyB3ZWxsOiBGaWRkbGluZyB3aXRoIFJJUCBhbmQKTkVYVFJJUCB3
aXRob3V0IGtub3dpbmcgd2hldGhlciBhIHNlY29uZCBleGNlcHRpb24gbWF5CnJlcGxhY2UgdGhl
IGZpcnN0IGlzIGF0IGxlYXN0IGEgbGF0ZW50IGlzc3VlLiBJIHRoaW5rIGFueSBzdWNoCmFkanVz
dG1lbnRzIHNob3VsZCBvbmx5IGV2ZXIgYmUgZG9uZSBhdCB0aGUgcG9pbnQgbm8gZnVydGhlcgpu
ZWVkIGZvciBleGNlcHRpb24gaW5qZWN0aW9uIGNhbiBwb3NzaWJseSBhcmlzZSwgaS5lLiBwcmVz
dW1hYmx5IGluCnN2bV92bWVudGVyX2hlbHBlcigpLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
