From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: Question about MDS mitigation
Date: Thu, 16 May 2019 08:58:54 +0100
Message-ID: <67885e5e-d67c-8067-eded-69290429714b@citrix.com>
References: <6bca3b07-c2aa-124f-e77e-59d5eb7bbd5c@huawei.com>
 <5cdbd5ec-3ee9-04ff-5ce8-73c542b8b752@citrix.com>
 <e30d844e-72e6-8ec5-354c-e61ef5c82093@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/Nh3=TQ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hRBIC-0006hl-GB
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 07:59:08 +0000
In-Reply-To: <e30d844e-72e6-8ec5-354c-e61ef5c82093@huawei.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "wencongyang (A)" <wencongyang2@huawei.com>, xen-devel@lists.xenproject.org
Cc: gaowanlong <gaowanlong@huawei.com>, "Liujinsong (Paul)" <liu.jinsong@huawei.com>, Huangzhichao <huangzhichao@huawei.com>, "Chentao
 (Boby)" <boby.chen@huawei.com>, guijianfeng <guijianfeng@huawei.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTYvMDUvMjAxOSAwODo1Niwgd2VuY29uZ3lhbmcgKEEpIHdyb3RlOgo+Cj4gT24gMjAxOS81
LzE2IDE1OjM4LCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+PiBPbiAxNi8wNS8yMDE5IDAzOjQ2LCB3
ZW5jb25neWFuZyAoQSkgd3JvdGU6Cj4+PiBIaSBhbGwKPj4+Cj4+PiBGaWxsIGJ1ZmZlcnMsIGxv
YWQgcG9ydHMgYXJlIHNoYXJlZCBiZXR3ZWVuIHRocmVhZHMgb24gdGhlIHNhbWUgcGh5c2ljYWwg
Y29yZS4KPj4+IFdlIG5lZWQgdG8gcnVuIG1vcmUgdGhhbiBvbmUgdm0gb24gdGhlIHNhbWUgcGh5
c2ljYWwgY29yZS4KPj4+IElzIHRoZXJlIGFueSBjb21wbGV0ZSBtaXRpZ2F0aW9uIGZvciBlbnZp
cm9ubWVudHMgdXRpbGl6aW5nIFNNVD8KPj4gTm8gLSBub3QgcmVhbGx5Lgo+Pgo+PiBBbiBhcHBy
b2FjaCB3aGljaCB3YXMgd29ya2VkIG9uIHdhcyB0aGF0IG9mIHN5bmNocm9uaXNlZCBzY2hlZHVs
aW5nLAo+PiB3aGVyZWJ5IHByaXZpbGVnZSB0cmFuc2l0aW9ucyBhcmUgc3luY3Job25pc2VkIHRv
IGVuc3VyZSB0aGF0IHdlJ3JlCj4+IG5ldmVyIHJ1bm5pbmcgY29kZSBmcm9tIGRpZmZlcmVudCBw
cml2aWxlZ2UgbGV2ZWxzIGNvbmN1cnJlbnRseSBvbgo+PiBhZGphY2VudCB0aHJlYWRzLiAgKFRo
aXMgaXMgdGhlIG1pdGlnYXRpb24gZGVzY3JpYmVkIGFzIEdyb3VwIFNjaGVkdWxpbmcKPj4gaW4K
Pj4gaHR0cHM6Ly9zb2Z0d2FyZS5pbnRlbC5jb20vc2VjdXJpdHktc29mdHdhcmUtZ3VpZGFuY2Uv
aW5zaWdodHMvZGVlcC1kaXZlLWludGVsLWFuYWx5c2lzLW1pY3JvYXJjaGl0ZWN0dXJhbC1kYXRh
LXNhbXBsaW5nCj4+ICkKPiBzeW5jaHJvbmlzZWQgc2NoZWR1bGluZyBpcyBub3QgYSBjb21wbGV0
ZSBtaXRpZ2F0aW9uLiBHdWVzdCBBIGFuZCBHdWVzdCBCCj4gcnVuIG9uIHRoZSBzYW1lIHBoeXNp
Y2FsIGNvcmUsIGFuZCB0aGUgcHJpdmlsZWdlIGxldmVsIGlzIHRoZSBzYW1lLiBTbwo+IEd1ZXN0
IEEgY2FuIGluZmVyIGRhdGEgZnJvbSBHdWVzdCBCLiBHdWVzdCBBIGNhbm5vdCBpbmZlciBkYXRh
IGZyb20gaHlwZXJ2aXNvcgo+IGJlY2F1c2UgdGhleSBhcmUgaW4gZGlmZmVyZW50IHByaXZpbGVn
ZSBsZXZlbHMuCgpUaGlzIGlzIChvbmUgb2YgdGhlIHJlYXNvbnMpIHdoeSBjb3JlIHNjaGVkdWxp
bmcgaXMgYSBwcmVyZXF1aXNpdGUgdG8Kc3luY2hyb25pc2VkIHNjaGVkdWxpbmcuCgpXaXRoIGNv
cmUgc2NoZWR1bGluZyBhY3RpdmUsIHlvdSB3aWxsIG5ldmVyIGhhdmUgZ3Vlc3QgQSBhbmQgQgpj
b25jdXJyZW50bHkgcnVubmluZyBvbiBhZGphY2VudCB0aHJlYWRzIG9mIHRoZSBzYW1lIGNvcmUu
Cgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
