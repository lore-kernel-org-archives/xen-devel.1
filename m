From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: How to deal with hypercalls returning -EFAULT
Date: Wed, 13 Jun 2018 17:06:01 +0100
Message-ID: <23329.16617.604592.50651@mariner.uk.xensource.com>
References: <ad5db530-fea5-7f28-2c7f-4244fc006583@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=9ytt=i7=citrix.com=prvs=695a74e14=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fT8I9-0003ZO-RV
 for xen-devel@lists.xenproject.org; Wed, 13 Jun 2018 16:06:37 +0000
In-Reply-To: <ad5db530-fea5-7f28-2c7f-4244fc006583@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, "committers@xenproject.org" <committers@xenproject.org>, Lars Kurth <lars.kurth@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SnVlcmdlbiBHcm9zcyB3cml0ZXMgKCJIb3cgdG8gZGVhbCB3aXRoIGh5cGVyY2FsbHMgcmV0dXJu
aW5nIC1FRkFVTFQiKToKPiAzLiBNb2RpZnkgdGhlIGludGVyZmFjZSB0byB0aGUgcHJpdmNtZCBk
cml2ZXIgdG8gcGFzcyBpbmZvcm1hdGlvbiBhYm91dAo+ICAgIHVzZWQgYnVmZmVycyB0byB0aGUg
a2VybmVsIGluIG9yZGVyIHRvIGxvY2sgdGhlbSB0aGVyZS4gRWl0aGVyIGFkZCBhCj4gICAgbmV3
IGludGVyZmFjZSBmb3IgaHlwZXJjYWxsIGJ1ZmZlciBtYW5hZ2VtZW50IG9yIGFkZCB0aGUgbGlz
dCBvZgo+ICAgIGJ1ZmZlcnMgdG8gdGhlIHByaXZjbWQgaW9jdGwgZGF0YSBzdHJ1Y3R1cmUuCj4g
ICAgUHJvczogLSBwcm9ibGVtIGlzIHJlYWxseSBzb2x2ZWQKPiAgICBDb25zOiAtIHNwbGl0IHNv
bHV0aW9uIGJldHdlZW4ga2VybmVsIGFuZCBYZW4sIGJvdGggbXVzdCBiZSBjaGFuZ2VkCgpJIHRo
aW5rIHRoaXMgaXMgdGhlIGJlc3QgYXBwcm9hY2guICBUaGVyZSBhcmUgcHJlc3VtYWJseSBhbHJl
YWR5CmludGVybmFsIGtlcm5lbCBpbnRlcmZhY2VzIHdoaWNoIGNvdWxkIGJlIHVzZWQgYnkgcHJp
dmNtZCB0byBpbXBsZW1lbnQKdGhpcy4gIEFsbCB0aGF0J3MgbmVlZGVkIGlzIHRvIGRlY2lkZSB3
aGF0IHRoZSBrZXJuZWwgQVBJIHNob3VsZCBsb29rCmxpa2UgYW5kIGltcGxlbWVudCBpdC4gIGxp
YnhjIGRvZXNuJ3QgcmVhbGx5IGNhcmUgdmVyeSBtdWNoIHdoYXQgdGhhdAppbnRlcmZhY2UgbG9v
a3MgbGlrZSwgc28gaXQgY2FuIGJlIHdoYXRldmVyIGlzIGNvbnZlbmllbnQgZm9yIHRoZQprZXJu
ZWwuCgo+IDIuIEFkZCBhIGJhbmRhaWQgdG8gWGVuIHRvb2xzIGJ5IHJldHJ5aW5nIGh5cGVyY2Fs
bHMgd2hpY2ggaGF2ZSBmYWlsZWQKPiAgICB3aXRoIC1FRkFVTFQgKGVpdGhlciBmb3IgYWxsIG9y
IG9ubHkgZm9yIHNvbWUgaHlwZXJjYWxscykKPiAgICBQcm9zOiAtIG5vIGludGVyZmFjZSBjaGFu
Z2UgbmVjZXNzYXJ5Cj4gICAgQ29uczogLSBub3QgYWxsIGh5cGVyY2FsbHMgbWlnaHQgYmUganVz
dCByZXBlYXRhYmxlCj4gICAgICAgICAgLSBwcm9ibGVtIGlzbid0IHNvbHZlZCBidXQganVzdCB3
b3JrZWQgYXJvdW5kCgpUaGlzIG1heSBhbGxvdyB1cyB0byBtYWtlIHNvbWUga2luZCBvZiBwcm9n
cmVzcyBpbiBzeXN0ZW1zIHdoaWNoIGFyZQpmdW5kYW1lbnRhbGx5IGJyb2tlbiwgYnV0IEkgZG9u
J3QgdGhpbmsgaXQgaXMgYSB0b2xlcmFibGUgbG9uZyB0ZXJtCmFwcHJvYWNoLgoKSWYgd2UgZG8g
dGhpcywgd2Ugc2hvdWxkIGFsc28gZG8geW91ciBvcHRpb24gKDMpLCBhbmQgdGhlIHdvcmthcm91
bmQKc2hvdWxkIG9ubHkgYmUgZW5hYmxlZCBpZiB0aGUgcHJvcGVyIGludGVyZmFjZSBpcyBub3Qg
YXZhaWxhYmxlLgoKVGhhbmtzLApJYW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
