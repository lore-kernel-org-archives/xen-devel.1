From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 0/4] libxl: use libxl__device_kind string to
	access device
Date: Wed, 24 Jan 2018 12:10:03 +0000
Message-ID: <20180124121003.vulnbz3fcuq3qe67@citrix.com>
References: <1507195848-18346-1-git-send-email-al1img@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=vftr=et=citrix.com=prvs=555ec31fe=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1eeJsZ-0004Pj-MP
 for xen-devel@lists.xenproject.org; Wed, 24 Jan 2018 12:10:11 +0000
Content-Disposition: inline
In-Reply-To: <1507195848-18346-1-git-send-email-al1img@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Oleksandr Grytsov <al1img@gmail.com>
Cc: xen-devel@lists.xenproject.org, wei.liu2@citrix.com, ian.jackson@eu.citrix.com, Oleksandr Grytsov <oleksandr_grytsov@epam.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBPY3QgMDUsIDIwMTcgYXQgMTI6MzA6NDRQTSArMDMwMCwgT2xla3NhbmRyIEdyeXRz
b3Ygd3JvdGU6Cj4gRnJvbTogT2xla3NhbmRyIEdyeXRzb3YgPG9sZWtzYW5kcl9ncnl0c292QGVw
YW0uY29tPgo+IAo+IEluIGN1cnJlbnQgaW1wbGVtZW50YXRpb24gdGhlIHBhdGggb2YgZGV2aWNl
IFhTIGVudHJ5IGlzIGNyZWF0ZWQgd2l0aAo+IHN0cmluZyBmcm9tIGxpYnhsX19kZXZpY2Vfa2lu
ZCBlbnVtLiBCdXQgYWNjZXNzIHRvIHRoZSBkZXZpY2UgZW50cnkKPiB1c3VhbGx5IGRvbmUgd2l0
aCBoYXJkY29kZWQgcGF0aC4gVGhpcyBpcyBzb3VyY2Ugb2YgcG90ZW50aWFsIGVycm9ycy4KPiBU
aGlzIHBhdGNoc2V0IGNoYW5nZXMgaGFyZGNvZGVkIGRldmljZSBuYW1lIGluIHRoZSBYUyBwYXRo
IHRvIHN0cmluZwo+IHJlcHJlc2VudGF0aW9uIG9mIGxpYnhsX19kZXZpY2Vfa2luZCBlbnVtLiBB
bHNvIGl0IGNoYW5nZXMgInR5cGUiIGZpZWxkCj4gaW4gbGlieGxfXy4uLl9kZXZ0eXBlIHN0cnVj
dHVyZSB0byBrZWVwIGxpYnhsX19kZXZpY2Vfa2luZC4gSXQgYWxsb3dzCj4gdG8gbW92ZSBzb21l
IGR1cGxpY2F0ZWQgZnVuY3Rpb25zIHRvIG1hY3Jvcy4KPiAKPiBPbGVrc2FuZHIgR3J5dHNvdiAo
NCk6Cj4gICBsaWJ4bDogdXNlIGxpYnhsX19kZXZpY2Vfa2luZCB0byBnZXQgZGV2aWNlIFhTIGVu
dHJ5Cj4gICBsaWJ4bDogdXNlIGxpYnhsX19kZXZpY2Vfa2luZCBpbiBMSUJYTF9ERUZJTkVfVVBE
QVRFX0RFVklECj4gICBsaWJ4bDogbW92ZSBsaWJ4bF9fZGV2aWNlX2Zyb21fIHRvIExJQlhMX0RF
RklORV9ERVZJQ0VfRlJPTV9UWVBFCj4gICBsaWJ4bDogbW92ZSBpYnhsX2RldmlkX3RvX2Rldmlj
ZV8uLi4gdG8gTElCWExfREVGSU5FX0RFVklEX1RPX0RFVklDRQoKU2lnaC4gSSB0cmllZCB0byBh
cHBseSB0aGlzIHNlcmllcyBidXQgaXQgZG9lc24ndCBhcHBseSBhbnltb3JlLiBTb3JyeSwKaWYg
eW91IHN0aWxsIHdhbnRzIGl0IHRvIGJlIHVwc3RlYW1lZCB5b3UgbmVlZCB0byByZWJhc2UuCgpX
ZWkuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
