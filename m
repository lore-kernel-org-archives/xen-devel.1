From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 01/11] x86/svm Fixes and cleanup to
 svm_inject_event()
Date: Mon, 16 Jul 2018 14:33:32 +0100
Message-ID: <9ba7b376-37af-49db-83fc-184b44f146fe@citrix.com>
References: <1528120755-17455-1-git-send-email-andrew.cooper3@citrix.com>
 <1528120755-17455-2-git-send-email-andrew.cooper3@citrix.com>
 <5B17E3B002000078001C8BEF@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5B17E3B002000078001C8BEF@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>, brian.woods@amd.com, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDYvMDYvMTggMTQ6MzcsIEphbiBCZXVsaWNoIHdyb3RlOgo+ICA+Pj4gT24gMDQuMDYuMTgg
YXQgMTU6NTksIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToKPj4gKiBTdGF0ZSBh
ZGp1c3RtZW50cyAoYW5kIGRlYnVnIHRyYWNpbmcpIGZvciAjREIvI0JQLyNQRiBzaG91bGQgbm90
IGJlIGRvbmUKPj4gICAgZm9yIGBpbnQgJG5gIGluc3RydWN0aW9ucy4gIFVwZGF0ZXMgdG8gJWNy
MiBvY2N1ciBldmVuIGlmIHRoZSBleGNlcHRpb24KPj4gICAgY29tYmluZXMgdG8gI0RGLgo+PiAg
KiBEb24ndCBvcGVuY29kZSBEUl9TVEVQIHdoZW4gdXBkYXRpbmcgJWRyNi4KPj4gICogU2ltcGxp
ZnkgdGhlIGxvZ2ljIGZvciBjYWxsaW5nIHN2bV9lbXVsX3N3aW50X2luamVjdGlvbigpIGFzIGlu
IHRoZSBjb21tb24KPj4gICAgY2FzZSwgZXZlcnkgY29uZGl0aW9uIG5lZWRzIGNoZWNraW5nLgo+
PiAgKiBGaXggY29tbWVudHMgd2hpY2ggaGF2ZSBiZWNvbWUgc3RhbGUgYXMgY29kZSBoYXMgbW92
ZWQgYmV0d2VlbiBjb21wb25lbnRzLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVy
IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+IFJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8
amJldWxpY2hAc3VzZS5jb20+Cj4KPgoKUGluZyBTVk0/CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
