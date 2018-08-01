From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/5] x86/cpuidle: replace a pointless NULL
 check
Date: Wed, 1 Aug 2018 15:33:36 +0100
Message-ID: <f4387b24-f0c3-7d58-391c-94720183e141@citrix.com>
References: <5B61C21202000078001D9F2D@prv1-mh.provo.novell.com>
 <5B61C43802000078001D9F5F@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=bzmx=kq=citrix.com=prvs=744b97e16=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fksOF-0001Xg-1V
 for xen-devel@lists.xenproject.org; Wed, 01 Aug 2018 14:46:15 +0000
In-Reply-To: <5B61C43802000078001D9F5F@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDEvMDgvMTggMTU6MzEsIEphbiBCZXVsaWNoIHdyb3RlOgo+IFRoZSBhZGRyZXNzIG9mIGFu
IGFycmF5IHNsb3QgY2FuJ3QgYmUgTlVMTC4gSW5zdGVhZCBhZGQgYSBib3VuZHMgY2hlY2sKPiB0
byBtYWtlIHN1cmUgdGhlIGFycmF5IGluZGV4aW5nIGlzIHZhbGlkICh0aGUgY2hlY2sgaXMgYWdh
aW5zdCAyIHNpbmNlCj4gc2xvdCB6ZXJvIG9mIHRoZSBhcnJheSAtIGNvcnJlc3BvbmRpbmcgdG8g
QzAgLSBpcyBvZiBubyBpbnRlcmVzdCBoZXJlKS4KPgo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCldvdWxkbid0IGFuIGV4cHJlc3Npb24gaW52b2x2aW5n
IEFSUkFZX1NJWkUoKSBiZSBtb3JlIGFwcHJvcHJpYXRlPwoKRWl0aGVyIHdheSwgQWNrZWQtYnk6
IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
